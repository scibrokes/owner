
/* font: google import [OPTIONAL] */
  /* @import url("//fonts.googleapis.com/css?family=Roboto"); */
  
  /* font */
  body, label, input, button, select, box,
.h1, .h2, .h3, .h4, .h5, h1, h2, h3, h4, h5 {
  font-family: "Arial";
  color: rgb(0,0,0);
}

/* font: fix for h6 */
  /* messes up sidebar user section if included above */
  .h6, h6 {
    font-family: "Arial";
  }

/* sidebar: logo */
  .skin-blue .main-header .logo {
    background: rgb(23,103,124);
  }

/* sidebar: logo hover */
  .skin-blue .main-header .logo:hover {
    background: rgb(23,103,124);
  }

/* sidebar: collapse button  */
  .skin-blue .main-header .navbar .sidebar-toggle {
    background: rgb(238,238,238);
    color:rgb(75,75,75);
  }

/* sidebar: collapse button hover */
  .skin-blue .main-header .navbar .sidebar-toggle:hover {
    background: rgb(210,210,210);
    color:rgb(0,0,0);
  }

/* header */
  .skin-blue .main-header .navbar {
    background: rgb(238,238,238);
    box-shadow: 2px 2px 2px #aaaaaa;
  }

/* sidebar*/
  .skin-blue .main-sidebar {
    background: rgb(20,97,117);
    
    background: -moz-linear-gradient(
      top, rgb(20,97,117) 0%, rgb(56,161,187) 50%,rgb(3,22,56) 100%
    );
    
    background: -webkit-gradient(
      left top
      ,left bottom
      ,color-stop(
        0%,  rgb(20,97,117)
      )
      ,color-stop(
        50%, rgb(56,161,187)
      )
      ,color-stop(
        100%
        ,rgb(3,22,56)
      )
    );
    
    background: -webkit-linear-gradient(
      top,  rgb(20,97,117)0%, rgb(56,161,187) 50%, rgb(3,22,56) 100%
    );
    
    background: -o-linear-gradient(
      top,  rgb(20,97,117)0%, rgb(56,161,187) 50%, rgb(3,22,56) 100%
    );
    
    background: -ms-linear-gradient(
      top,  rgb(20,97,117)0%, rgb(56,161,187) 50%, rgb(3,22,56) 100%
    );
    
    background: linear-gradient(
      to bottom,  rgb(20,97,117)0%, rgb(56,161,187) 50%, rgb(3,22,56) 100%
    )
    ;
    box-shadow: 3px 5px 5px #aaaaaa;
    padding-left: 0px;
    padding-right: 0px;
    /* padding-top: 60px; */
  }

/* sidebar menu */
  .main-sidebar .user-panel, .sidebar-menu, .sidebar-menu>li.header {
    white-space: nowrap;
    background: transparent;
    padding: 0px;
    border-radius: 0px;
  }

/* fix for user panel */
  .user-panel>.info>p, .skin-blue .user-panel>.info {
    color: rgb(255,255,255);
    font-size: 12px;
    font-weight: normal;
  }
section.sidebar .user-panel {
  padding: 10px;
}

/* sidebar: tabs */
  .skin-blue .main-sidebar .sidebar .sidebar-menu a {
    color: rgb(255,255,255);
    font-size: 13px;
    border-style: none none solid none;
    border-color: rgb(35,106,135);
    border-width: 1px;
  }

/* sidebar: tab selected */
  .skin-blue .main-sidebar .sidebar .sidebar-menu .active a {
    color: rgb(0,0,0);
    font-size: 13px;
    border-radius: 0px 20px 20px 0px;
    border-style: none none solid none;
    border-color: rgb(75,126,151);
    border-width: 1px;
  }
.skin-blue .sidebar-menu > li:hover > a,
.skin-blue .sidebar-menu > li.active > a {
  color: rgb(0,0,0);
  background: rgba(44,222,235,1);
  
  background: -moz-linear-gradient(
    left, rgba(44,222,235,1) 0%, rgba(44,222,235,1) 30%,rgba(0,255,213,1) 100%
  );
  
  background: -webkit-gradient(
    left top
    ,right top
    ,color-stop(
      0%,  rgba(44,222,235,1)
    )
    ,color-stop(
      30%, rgba(44,222,235,1)
    )
    ,color-stop(
      100%
      ,rgba(0,255,213,1)
    )
  );
  
  background: -webkit-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: -o-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: -ms-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: linear-gradient(
    to right,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  )
  ;
  border-radius: 0px 20px 20px 0px;
}

/* sidebar: tab hovered */
  .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover {
    background: rgba(44,222,235,1);
    
    background: -moz-linear-gradient(
      left, rgba(44,222,235,1) 0%, rgba(44,222,235,1) 30%,rgba(0,255,213,1) 100%
    );
    
    background: -webkit-gradient(
      left top
      ,right top
      ,color-stop(
        0%,  rgba(44,222,235,1)
      )
      ,color-stop(
        30%, rgba(44,222,235,1)
      )
      ,color-stop(
        100%
        ,rgba(0,255,213,1)
      )
    );
    
    background: -webkit-linear-gradient(
      left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
    );
    
    background: -o-linear-gradient(
      left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
    );
    
    background: -ms-linear-gradient(
      left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
    );
    
    background: linear-gradient(
      to right,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
    )
    ;color: rgb(50,50,50);
    font-size: 13px;
    border-style: none none solid none;
    border-color: rgb(75,126,151);
    border-width: 1px;
    border-radius: 0px 20px 20px 0px;
  }

/* sidebar: subtab */
  .skin-blue .sidebar-menu > li > .treeview-menu {
    margin: 0px;
    background: transparent;
  }
.skin-blue .treeview-menu > li > a {
  background: transparent;
}
/* sidebar: subtab selected */
  .skin-blue .treeview-menu > li.active > a,
.skin-blue .treeview-menu > li > a:hover {
  background: rgba(44,222,235,1);
  
  background: -moz-linear-gradient(
    left, rgba(44,222,235,1) 0%, rgba(44,222,235,1) 30%,rgba(0,255,213,1) 100%
  );
  
  background: -webkit-gradient(
    left top
    ,right top
    ,color-stop(
      0%,  rgba(44,222,235,1)
    )
    ,color-stop(
      30%, rgba(44,222,235,1)
    )
    ,color-stop(
      100%
      ,rgba(0,255,213,1)
    )
  );
  
  background: -webkit-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: -o-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: -ms-linear-gradient(
    left,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  );
  
  background: linear-gradient(
    to right,  rgba(44,222,235,1)0%, rgba(44,222,235,1) 30%, rgba(0,255,213,1) 100%
  )
  ;
}

/* sidebar: search text area */
  .skin-blue .sidebar-form input[type=text] {
    background: rgb(55,72,80);
    color: rgb(0,0,0);
    border-radius: 5px 0px 0px 5px;
    border-color: rgb(55,72,80);
    border-style: solid none solid solid;
  }

/* sidebar: search button */
  .skin-blue .input-group-btn > .btn {
    background: rgb(55,72,80);
    color: rgb(153,153,153);
    border-radius: 0px 5px 5px 0px;
    border-style: solid solid solid none;
    border-color: rgb(55,72,80);
  }

/* sidebar form */
  .skin-blue .sidebar-form {
    border-radius: 0px;
    border: 0px none rgb(255,255,255);
    margin: 10px;
  }

/* body */
  .content-wrapper, .right-side {
    background: rgb(248,248,248);
  }

/* box */
  .box {
    background: rgb(255,255,255);
    border-radius: 5px;
    box-shadow: 0px 1px 1px rgba(0,0,0,.1);
  }

/* box: title */
  .box-header .box-title {
    font-size: 16px;
  }

/* tabbox: title */
  .nav-tabs-custom>.nav-tabs>li.header {
    color: rgb(0,0,0);
    font-size: 16px;
  }

/* tabbox: tab color */
  .nav-tabs-custom, .nav-tabs-custom .nav-tabs li.active:hover a, .nav-tabs-custom .nav-tabs li.active a {
    background: rgb(255,255,255);
    color: rgb(0,0,0);
    border-radius: 5px;
  }

.nav-tabs-custom {
  box-shadow: 0px 1px 1px rgba(0,0,0,.1);
}

/* tabbox: active tab bg */
  .nav-tabs-custom>.nav-tabs>li.active {
    border-radius: 5px;
    border-top-color: rgba(44,222,235,1);
    # box-shadow: 0px 1px 1px rgba(0,0,0,.1);
  }

/* tabbox: font color */
  .nav-tabs-custom>.nav-tabs>li.active:hover>a, .nav-tabs-custom>.nav-tabs>li.active>a {
    border-bottom-color: rgb(255,255,255);
    border-top-color: rgba(44,222,235,1);
    border-right-color: rgba(44,222,235,1);
    border-left-color: rgba(44,222,235,1);
    color: rgb(0,0,0);
    font-size: 14px;
    border-radius: 5px;
  }

/* tabbox: inactive tabs background */
  .nav-tabs-custom>.nav-tabs>li>a {
    color: rgb(0,0,0);
    font-size: 14px;
  }

/* tabbox: top area back color */
  .nav-tabs-custom, .nav-tabs-custom>.tab-content, .nav-tabs-custom>.nav-tabs {
    border-bottom-color: rgba(44,222,235,1);
    background: rgb(255,255,255);
  }

/* tabbox: top area rounded corners */
  .nav-tabs-custom>.nav-tabs {
    margin: 0;
    border-radius: 5px;
  }

/* infobox */
  .info-box {
    background: rgb(255,255,255);
    border-radius: 5px;
    box-shadow: 0px 1px 1px rgba(0,0,0,.1);
  }

/* valuebox */
  .small-box {
    border-radius: 5px;
    box-shadow: 0px 1px 1px rgba(0,0,0,.1);
  }

/* valuebox: main font color */
  .small-box h3, .small-box p {
    color: rgb(255,255,255)
  }

/* box: default color */
  .box.box-solid>.box-header, .box>.box-header {
    color: rgb(0,0,0);
  }
.box.box-solid>.box-header {
  border-radius: 5px;
}
.box.box-solid, .box {
  border-radius: 5px;
  border-top-color: rgb(210,214,220);
}

/* box: primary color */
  .box.box-solid.box-primary>.box-header, .box.box-primary>.box-header {
    color: rgb(0,0,0);
  }
.box.box-solid.box-primary>.box-header {
  background: rgba(44,222,235,1);
  border-radius: 5px;
}
.box.box-solid.box-primary, .box.box-primary {
  border-color: rgba(44,222,235,1);
  border-left-color: rgba(44,222,235,1);
  border-right-color: rgba(44,222,235,1);
  border-top-color: rgba(44,222,235,1);
  border-radius: 5px;
}

/* box: success color */
  .box.box-solid.box-success>.box-header, .box.box-success>.box-header {
    color: rgb(0,0,0);
  }
.box.box-solid.box-success>.box-header {
  background: rgba(0,255,213,1);
  border-radius: 5px;
}
.box.box-solid.box-success, .box.box-success {
  border-color: rgba(0,255,213,1);
  border-left-color: rgba(0,255,213,1);
  border-right-color: rgba(0,255,213,1);
  border-top-color: rgba(0,255,213,1);
  border-radius: 5px;
}

/* box: warning color */
  .box.box-solid.box-warning>.box-header, .box.box-warning>.box-header {
    color: rgb(0,0,0);
  }
.box.box-solid.box-warning>.box-header {
  background: rgb(244,156,104);
  border-radius: 5px;
}
.box.box-solid.box-warning, .box.box-warning {
  border-color: rgb(244,156,104);
  border-left-color: rgb(244,156,104);
  border-right-color: rgb(244,156,104);
  border-top-color: rgb(244,156,104);
  border-radius: 5px;
}

/* box: danger color */
  .box.box-solid.box-danger>.box-header, .box.box-danger>.box-header {
    color: rgb(0,0,0);
  }
.box.box-solid.box-danger>.box-header {
  background: rgb(255,88,55);
  border-radius: 5px;
}
.box.box-solid.box-danger, .box.box-danger {
  border-color: rgb(255,88,55);
  border-left-color: rgb(255,88,55);
  border-right-color: rgb(255,88,55);
  border-top-color: rgb(255,88,55);
  border-radius: 5px;
}

/* button */
  .btn-default {
    background: rgb(245,245,245);
    color: rgb(0,0,0);
    border-color: rgb(200,200,200);
    border-radius: 5px;
    height: 34px;
    padding: 6px 12px;
  }

/* button: hover */
  .btn-default:hover {
    background: rgb(235,235,235);
    color: rgb(100,100,100);
    border-color: rgb(200,200,200);
  }

/* button: focus */
  .btn-default:focus, .action-button:focus {
    background: rgb(245,245,245);
    color: rgb(0,0,0);
    border-color: rgb(200,200,200);
  }

/* button: active */
  .btn-default:active, .action-button:active {
    background: rgb(245,245,245);
    color: rgb(0,0,0);
    border-color: rgb(200,200,200);
  }

/* button: visited */
  .btn-default:visited {
    background: rgb(245,245,245);
    color: rgb(0,0,0);
    border-color: rgb(200,200,200);
  }

/* textbox */
  .form-control, .selectize-input, .selectize-control.single .selectize-input {
    background: rgb(255,255,255);
    color: rgb(0,0,0);
    border-color: rgb(200,200,200);
    border-radius: 5px;
    height: 34px;
    min-height: 34px;
    padding: 6px 12px;
  }

/* textbox: selected */
  .form-control:focus, .selectize-input.focus {
    color: rgb(0,0,0);
    background: rgb(245,245,245);
    border-color: rgb(200,200,200);
    -webkit-box-shadow: inset 0px 0px 0px, 0px 0px 0px;
    box-shadow: inset 0px 0px 0px, 0px 0px 0px;
  }

/* verbatim text output */
  .qt pre, .qt code {
    font-family: Arial !important;
  }
pre {
  color: rgb(0,0,0);
  background-color: rgb(255,255,255);
  border: 1px solid rgb(200,200,200);
  border-radius: 5px;
}

/* drop-down menu */
  .selectize-dropdown, .selectize-dropdown.form-control {
    background: rgb(255,255,255);
    border-radius: 4px;
  }

/* table */
  .table {
    background: rgb(255,255,255);
    border-radius: 5px;
  }

/* table: row border color*/
  .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    border-top: 1px solid rgb(240,240,240);
  }

/* table: top border color*/
  .table>thead>tr>th {
    border-bottom: 1px solid rgb(240,240,240);
  }

/* table: hover row */
  .table-hover>tbody>tr:hover {
    background-color: rgb(240,240,240);
  }

/* table: stripe row */
  .table-striped>tbody>tr:nth-of-type(odd) {
    background-color: rgb(240,240,240);
  }

/* table: body colour */
  table.dataTable tbody tr {
    background-color: rgb(255,255,255) !important;
  }

/* table: footer border colour */
  table.dataTable {
    border: 0px !important;
  }

/* datatable: selected row */
  table.dataTable tr.selected td, table.dataTable td.selected {
    background-color: rgba(0,255,213,1) !important;
    color: rgb(0,0,0) !important;
  }

/* datatable: hover row */
  table.dataTable tr.hover td, table.dataTable td.hover {
    background-color: rgb(240,240,240) !important;
  }
table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {
  background-color: rgb(240,240,240) !important;
}
table.dataTable.row-border tbody th, table.dataTable.row-border tbody td,
table.dataTable.display tbody th, table.dataTable.display tbody td {
  border-top: 1px solid rgb(240,240,240) !important;
}

/* datatable: stripe row */
  table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd {
    background-color: rgb(240,240,240) !important;
  }

/* datatable: page control */
  .dataTables_wrapper .dataTables_paginate .paginate_button {
    color: rgb(0,0,0) !important;
  }

/* datatable: table info */
  .dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
  color: rgb(0,0,0) !important;
}
.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
.dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
.dataTables_wrapper .dataTables_paginate {
  color: rgb(0,0,0) !important;
}
.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
.dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
.dataTables_wrapper .dataTables_paginate {
  color: rgb(0,0,0) !important;
}

/* datatable search box */
  .dataTables_wrapper .dataTables_filter input {
    background-color: rgb(255,255,255);
    border: 1px solid rgb(200,200,200);
    border-radius: 5px;
  }

/* notification and progress bar */
  .progress-bar {
    background-color: rgba(0,255,213,1);
  }
.shiny-notification {
  height: 80px;
  font-family: Arial;
  font-size: 15px;
  color: rgb(0,0,0);
  background-color: rgb(225,225,225);
  border-color: rgb(205,205,205);
  border-radius: 10px;
  margin-left: -450px !important;
}

/* horizontal divider line */
  hr {
    border-top: 1px solid rgb(215,215,215);
  }

/* modal */
  .modal-body {
    background-color: rgb(255,255,255);
  }

.modal-footer {
  background-color: rgb(255,255,255);
}

.modal-header {
  background-color: rgb(255,255,255);
}

