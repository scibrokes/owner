public static async Task<string> PostWebAsync(string url, string idata) {
  var request = (HttpWebRequest)WebRequest.Create(url);
  var data = Encoding.ASCII.GetBytes(idata);
  
  request.Method = "POST";
  request.ContentType = "application/x-www-form-urlencoded";
  request.ContentLength = data.Length;
  
  using (var stream = await request.GetRequestStreamAsync()) {
    await stream.WriteAsync(data, 0, data.Length);
  }
  
  var response = (HttpWebResponse)await request.GetResponseAsync();
  var r = new StreamReader(response.GetResponseStream());
  //    System.Windows.MessageBox.Show(await r.ReadToEndAsync());
  return await r.ReadToEndAsync();
}

// string data = PostWebAsync("http://fanyi.baidu.com/v2transapi","from=auto&to={Translated Language}&query={Contents of Translation}&transtype=realtime&simple_means_flag=3");

