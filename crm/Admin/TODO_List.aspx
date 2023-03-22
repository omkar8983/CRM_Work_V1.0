<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="TODO_List.aspx.cs" Inherits="CRM.Admin.TODO_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
     <style>
        .select2-container {
            z-index: 100000;
            width: 100% !important;
        }

        #filter {
            display: none;
            margin-bottom: 0;
        }

        .filterwrap {
            background: #fff;
            padding: 1.5%;
            margin-bottom: 10px;
            border-radius: 7px;
            box-shadow: rgb(100 100 111 / 20%) 0px 7px 17px 0px;
            display:none;
        }

        #filter select {
            margin-right: 10px;
            height: 35px;
            margin-bottom: 0 !important;
            background: #f1f1f1;
            border: none;
            border-radius: 20px;
            width:97%;
            padding: 10px 10px !important;
        }
        #ddindustry{
            height:35px;
        }
        .btn {
            margin:0 10px;
        }
        .btn-success {
    text-align: center;
    color: #fff;
    background-color: #198754;
    border-color: #198754;
    font-size: 1em!important;
    border-radius: 5px;
    padding: 5px 10px;
    cursor:pointer;
}
        .form-check {
    display: block;
    min-height: 1.5rem;
    padding-left: 1.5em;
    margin-bottom: 0.125rem;
    line-height: 2;
}

        label {
    display: block;
    margin-left: 0px;
    font-size: 0.8em;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <input type="hidden" id="todoval" />
            <div class="col-md-3">
                <div class="table-head">
                    <h5>To-Do List</h5>
                </div>
            </div>
            <div class="col-md-9">
                <div class="filters-wrap">
                    <div class="list-name">
                    <a id="overdue" class="btn btn-danger">Overdue</a>
                    <a id="today" class="btn btn-primary">Today</a>
                    <a id="upcoming" class="btn btn-success">Upcoming</a>
                    </div>
                    <div class="list-name">
                        <span>Total:</span>
                        <h5>&nbsp;<strong id="entries"></strong> Contacts</h5>
                    </div>
                    <div class="list-name">
                        <i id="filter-icon" class="fa-solid fa-arrow-down-wide-short"></i>
                    </div>
                    <div class="user-btn">
                        <a class="taskbtn1" style="width: 90%!important;">Add TO-DO</a>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mt-4">
                <div class="col-md-12 filterwrap">
                    <div id="filter" class="col-md-3"></div>
                </div>

                <table id="usertable" class="display" style="width: 100%;">
                    <thead>
                        <tr style="background: #fff;">
                            <th>POC</th>
                            <th>Company</th>
                            <th>Activity</th>
                            <th>Type</th>
                            <th>Category</th>
                            <th>Followup Date</th>
                            <th>Followup Time</th>
                            <th>Remark</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>

    </div>
    
    <div class="modal fade" id="addtask" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel3">Add TO-DO </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="taskform">
                            <div class="col-md-4">
                                <label for="">Select Company</label>
                                <select name="hub" id="ddcomapany" class="form-control">
                                    <option value="">select Company</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="">Select POC</label>
                                <select name="hub" id="ddpoc" class="form-control" required>
                                    <option value="">select Company</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select  Activity  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="sactivity" required>
                                    <option value="">select Activity</option>
                                    <option value="PhoneCall">Phone Call</option>
                                    <option value="Email">Email</option>
                                    <option value="Meeting">Meeting</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Type of Activity  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="atype" required>
                                    <option value="">select Type of Activity</option>
                                    <option value="Requirment">Requirment</option>
                                    <option value="Followup">Followup</option>
                                    <option value="Pitch">Pitch</option>
                                    <option value="RelationshipBuilding">Relationship Building</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Type of Categry  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="Category" required>
                                    <option value="">select Type of Category</option>
                                    <option value="Hot">Hot</option>
                                    <option value="Warm">Warm</option>
                                    <option value="Cold">Cold</option>
                                    <option value="Irrelevant">Irrelevant</option>
                                </select>
                            </div>
                            <div class="row followbox m-0 p-0">
                                 <div class="col-md-6 mb-3">
                                <label for="">Select Time</label>
                               <input class="timepicker timepicker-with-dropdown text-center form-control" id="time" name="time" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="">Select Date</label>
                                <input type="date" class="form-control" id="date" name="date" required disabled>
                            </div>
                            </div>
                           
                            <div class="col-md-12 mb-3">
                                <textarea class="form-control" name="Remark" id="Remark" placeholder="Remark *" cols="0" rows="0" required></textarea>
                            </div>

                            <input type="hidden" class="form-control" id="tcid">
                            <div class="col-md-12 mt-1 text-left">
                                <input type="submit" class="btn btn-primary btnSave" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="updatetask" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel4">Update TO-DO </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="taskformup">

                            <div class="col-md-4 mb-3 mx-1">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Completed
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-12 mb-3">
                                <textarea class="form-control" name="Remark" id="Remarkup" placeholder="Remark *" cols="0" rows="0" required></textarea>
                            </div>

                            <input type="hidden" class="form-control" id="tcid">
                            <div class="col-md-12 mt-1 text-left">
                                <input type="submit" class="btn btn-primary btnSave" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script>

      var input = document.getElementById("date");
      var today = new Date();
      var day = today.getDate();
      // Set month to string to add leading 0
      var mon = new String(today.getMonth() + 1); //January is 0!
      var yr = today.getFullYear();

      if (mon.length < 2) { mon = "0" + mon; }

      var date = new String(yr + '-' + mon + '-' + day);

      input.disabled = false;
      input.setAttribute('min', date);

      function getCookies() {
          var cookieMap = {};
          let coo = document.cookie.split(';');
          for (var value of coo.values()) {
              if (value.includes('SALESCRM=')) {
                  var cookie = value.trim().replace('SALESCRM=', '').split('&');
                  cookie.forEach(x => { cookieMap[x.split('=')[0]] = x.split('=')[1] });//x.split('='), cook[x[0] = x[1]]);console.log(x.split('=')[0]), console.log(x.split('=')[1])
                  return cookieMap;
              }
          }
         
          if (coo.values() === 'l') {
              alert('1');
          }

        }

        var role = getCookies().DESIGNATION_ID;
        var uid;
        if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
            uid="ALL"
        }

        else {
            uid = getCookies().USER_GUID;
        }

      $('.timepicker').timepicker({
          timeFormat: 'h:mm p',
          interval: 15,
          minTime: '10',
          maxTime: '6:00pm',
          defaultTime: '11',
          startTime: '10:00',
          dynamic: false,
          dropdown: true,
          scrollbar: true
      });

      $("#Type").change(function () {
          if ($("#Type").val() == "Followup") {
              $("#time").prop('required', true);
              $("#date").prop('required', true);
          }
          else {
              $("#time").prop('required', false);
              $("#date").prop('required', false);
          }

      })

      $('.taskbtn1').click(function () {
          $('#addtask').modal('show');
      });
      var obj1 = {
          "USER_GUID": "DEAC3DFE-E941-47D9-8882-6C2DBD49B13A"
      }
      $.ajax({
          url: "https://crmapi.24fd.com/Company_Master/get_company_list_by24fdUserId",
          method: "POST",
          data: JSON.stringify(obj1),
          dataType: 'json',
          contentType: "application/json",

          success: function (data) {
              var item = data.dataObject;
              console.log(data.dataObject.length);

              for (var i = 0; i < data.dataObject.length; i++) {
                  var item = data.dataObject[i];
                  div_data = "<option value=" + item.id + ">" + item.text + "</option>";
                  $(div_data).appendTo('#sacomapany');
              }

          }
      });

      $("#filter-icon").click(function () {
          $(".filterwrap").slideToggle(500);
          $("#filter").css("display", "flex");
      });

      $("#ddcomapany").change(function () {
          var coid = $(this).find(":selected").val();
          poclist(coid);
          $("#ddpoc").empty();
          setTimeout(function () {
              $('#ddpoc').trigger('change');
          },500);
          
      });
      $("#ddpoc").change(function () {
          var pocid = $(this).val();
          $("#tcid").val(pocid);
      });
      

      function poclist(coid) {

      var obj = {
          "C_GUID": coid,
          "USER_GUID": uid
      }
          $.ajax({
              url: "https://crmapi.24fd.com/Company_Master/get_company_POC_mapping_bySalesPerson",
              method: "POST",
              data: JSON.stringify(obj),
              dataType: 'json',
              contentType: "application/json",

              success: function (data) {
                  var item = data.dataObject;
                  console.log(data.dataObject.length);

                  for (var i=0; i < data.dataObject.length; i++) {
                      var item = data.dataObject[i];
                      div_data = "<option value=" + item.cid + ">" + item.name + "</option>";
                      $(div_data).appendTo('#ddpoc');
                  }

              }
          });

      }

      $("#taskform").submit(function (event) {
          event.preventDefault();

          var time;
          var date;
          var Activity = $("#sactivity").val();
          var Type = $("#atype").val();
          var Category = $("#Category").val();
          var CID = $("#tcid").val();
          var Remark = $("#Remark").val();
          var time = $("#time").val();
          var date = $("#date").val();

          var dataobj = {
              "CID": CID,
              "ACTIVITY": Activity,
              "TYPE_OF_ACTIVITY": Type,
              "ACTIVITY_CATEGORY": Category,
              "REMARK": Remark,
              "USER_GUID": getCookies().USER_GUID,
              "FOLLOWUP_DATE": date,
              "FOLLOWUP_TIME": time,
              "STATUS": "PENDING",
          };

          console.log(dataobj);

          var settings = {
              "url": "https://crmapi.24fd.com/DailyActivity/post_daily_activity",
              "method": "POST",
              "timeout": 0,
              "headers": {
                  "Content-Type": "application/json"
              },
              "data": JSON.stringify(
                  dataobj
              ),
          };

          $.ajax(settings).done(function (response) {
              $("#pocupdate").modal("hide");
              console.log(response);
              if (response.message == "Daily Activity added Successfully.") {
                  $("#addtask").modal("hide");
                  toastr.success('Daily Activity added Successfully.', 'Activity Added');
                  var datef = $("#todoval").val();
                  var obj = { "USER_GUID": uid, "STATUS": "PENDING", "DATE_FILTER": datef }
                  $.ajax({
                      type: 'POST',
                      url: apiurl + '/DailyActivity/get_daily_activity',
                      dataType: "json",
                      contentType: 'application/json;charset=utf-8 ',
                      data: JSON.stringify(obj),
                      async: false,
                      processData: false,
                      success: function (response) {
                          var item = response.dataObject;
                          usertable.clear().draw();
                          usertable.rows.add(item);
                          usertable.columns.adjust().draw();
                      }
                  });

              }
              else if (response.message == 'EXISTSING Comapny-POC Mapped Successfully.') {
                  toastr.warning('Existing POC.', 'Existing POC')
              }
              else {
                  toastr.error('Something went wrong. Please try again!.', 'Error')
                  console.log(response);
              }
          });

      });
      function dateformat(date) {
          var date = date;
          var d = new Date(date.split("/").reverse().join("/"));
          var dd = d.getDate();
          var mm = d.getMonth() + 1;
          var yy = d.getFullYear();
          return (yy + "-" + mm + "-" + dd);
      }

      var obj1 = {
          "USER_GUID": uid
      }
      $.ajax({
          url: "https://crmapi.24fd.com/Company_Master/get_company_list_by24fdUserId",
          method: "POST",
          data: JSON.stringify(obj1),
          dataType: 'json',
          contentType: "application/json",

          success: function (data) {
              var item = data.dataObject;
              console.log(data.dataObject.length);

              for (var i = 0; i < data.dataObject.length; i++) {
                  var item = data.dataObject[i];
                  div_data = "<option value=" + item.id + ">" + item.text + "</option>";
                  $(div_data).appendTo('#ddcomapany');
              }

          }
      });

        var urlParams = new URLSearchParams(window.location.search);
        var useridu = urlParams.get('uid');
        var dstatus = urlParams.get('dstatus');

        function gettodo(tbldate) {
            if (dstatus == '1') {
                var obj = { "USER_GUID": useridu, "STATUS": "PENDING", "DATE_FILTER": tbldate }
            }
            else {
                var obj = { "USER_GUID": uid, "STATUS": "PENDING", "DATE_FILTER": tbldate }
            }
         
          $.ajax({
              type: 'POST',
              url: apiurl + '/DailyActivity/get_daily_activity',
              dataType: "json",
              contentType: 'application/json;charset=utf-8 ',
              data: JSON.stringify(obj),
              async: false,
              processData: false,
              success: function (response) {
                  var item = response.dataObject;
                  usertable.clear().draw();
                  usertable.rows.add(item);
                  usertable.columns.adjust().draw();
              }
          });
      }

      tblfilter('TODAY');
      $("#overdue").click(function () {
          gettodo('OVERDUE');
          $("#todoval").val('OVERDUE')
      });

      $("#today").click(function () {
          gettodo('TODAY');
          $("#todoval").val('TODAY')
      });

      $("#upcoming").click(function () {
          gettodo('UPCOMING');
          $("#todoval").val('UPCOMING')
      });

      function tblfilter(datefilter) {
          urlsales = apiurl + '/DailyActivity/get_daily_activity';

         
          if (dstatus == '1') {
              var obj = { "USER_GUID": useridu, "STATUS": "PENDING", "DATE_FILTER": datefilter }
          }
          else {
              var obj = { "USER_GUID": uid, "STATUS": "PENDING", "DATE_FILTER": datefilter }
          }
        

          $.ajax({
              type: 'POST',
              url: urlsales,
              dataType: "json",
              contentType: 'application/json;charset=utf-8 ',
              data: JSON.stringify(obj),
              async: false,
              processData: false,
              success: function (response) {

                  var tbldata = response.dataObject;
                  (usertable = $("#usertable").DataTable({
                      dom: "fltip",
                      order: [],
                      responsive: { details: { type: "column", target: "tr" } },
                      lengthMenu: [
                          [10, 25, 1e3, 500, 200, 100, 50, 25],
                          ["ALL", 1e3, 500, 200, 100, 50, 25, 10],
                      ],
                      pagingType: "full",
                      infoFiltered: !0,
                      aaData: tbldata,
                      columns: [
                          { "data": "poC_NAME" },
                          { "data": "companY_NAME" },
                          { "data": "activity" },
                          { "data": "typE_OF_ACTIVITY" },
                          { "data": "activitY_CATEGORY" },

                          {
                              "data": "followuP_DATE",
                              "mRender": function (data, type, row) {
                                  if (row.followuP_DATE == '') {
                                      return '<p>-</p>'
                                  }
                                  else {
                                      return '<p>' + row.followuP_DATE + '</p>'
                                  }
                              }
                          },
                          {
                              "data": "followuP_TIME",
                              "mRender": function (data, type, row) {
                                  if (row.followuP_TIME == '') {
                                      return '<p>-</p>'
                                  }
                                  else {
                                      return '<p>' + row.followuP_TIME + '</p>'
                                  }
                              }
                          },
                          { "data": "remark" },

                          {
                              "data": "remark",
                              "render": function (data) {
                                  return "<div class='btnmom updatetask btn-success' style='font-size:1.5em'>Update Status</div>"
                              },

                              "name": "Status", "autoWidth": true
                          },
                      ],
                      columnDefs: [
                          { className: "text-center", targets: [] },
                          { width: 100, targets: 0 },
                          { width: 100, targets: 1 },
                          { width: 100, targets: 2 },
                          { width: 60, targets: 3 },
                          { width: 60, targets: 4 },
                          {
                              targets: [0, 1],
                              render: function (data, type, row, meta) {
                                  return type === 'filter' ?
                                      data === '' ? '(Empty)' : data : data;
                              }
                          }
                      ],
                      "createdRow": function (row, data, dataIndex) {


                      },

                      initComplete: function () {
                          var info = this.api().page.info();

                          $("#entries").html(info.recordsTotal);
                          var cfiltercol = [];
                          cfiltercol = [0, 1, 2, 3];
                          this.api().columns(cfiltercol).every(function () {
                              var column = this;
                              var title = this.header();

                              var select = $('<select class="form-control col-md-3 col-sm-12 col-xs-12 filterselect mb-1 p-1" id="' + $(title).html() + '"><option>SELECT ' + $(title).html() + '</option><option value="">Show All</option></select>')
                                  .appendTo($('#filter'))
                                  //.appendTo($(column.header()))
                                  .on('change', function () {
                                      var val = $.fn.dataTable.util.escapeRegex(
                                          $(this).val()
                                      );
                                      column
                                          .search(val ? '^' + val + '$' : '', true, false)
                                      usertable.draw();

                                  });

                              column.cells('', column[0]).render('display').unique().sort().each(function (d, j) {
                                  if (d === '') {
                                      d = '(Empty)'
                                  }
                                  //str = renderdatastatus(d);
                                  select.append('<option value="' + d + '">' + d + '</option>')
                              });
                          });
                      },

                  })),


                      $('#usertable tbody').on("click", ".updatetask ", function () {
                          $("#updatetask").modal('show');
                          var obj = usertable.row($(this).parents('tr')).data();
                          AID = obj.aid;
                         
                       
                          $("#taskformup").submit(function (event) {
                              var remarkup = document.getElementById("Remarkup").value
                              event.preventDefault();
                              Swal.fire({
                                  title: 'Are you sure?',
                                  text: "You won't be able to revert this!",
                                  icon: 'warning',
                                  showCancelButton: true,
                                  confirmButtonColor: '#3085d6',
                                  cancelButtonColor: '#d33',
                                  confirmButtonText: 'Yes, Confirm it!'
                              }).then((result) => {
                                  if (result.isConfirmed) {
                                      var dataobj = {
                                          "AID": AID,
                                          "STATUS": "COMPLETED",
                                          "CREATED_BY": uid,
                                          "REMARK": remarkup
                                      };

                                      console.log(dataobj);

                                      var settings = {
                                          "url": "https://crmapi.24fd.com/DailyActivity/update_daily_activity_status",
                                          "method": "POST",
                                          "timeout": 0,
                                          "headers": {
                                              "Content-Type": "application/json"
                                          },
                                          "data": JSON.stringify(
                                              dataobj
                                          ),
                                      };

                                      $.ajax(settings).done(function (response) {
                                          $("#updatetask").modal("hide");
                                          if (response.message == "Daily Activity STATUS updated Successfully.") {
                                              $("#addtask").modal("hide");
                                              toastr.success('Daily Activity STATUS updated Successfully.', 'Activity Added');
                                             var datef = $("#todoval").val();
                                              var obj = { "USER_GUID": uid, "STATUS": "PENDING", "DATE_FILTER": datef }
                                              $.ajax({
                                                  type: 'POST',
                                                  url: apiurl + '/DailyActivity/get_daily_activity',
                                                  dataType: "json",
                                                  contentType: 'application/json;charset=utf-8 ',
                                                  data: JSON.stringify(obj),
                                                  async: false,
                                                  processData: false,
                                                  success: function (response) {
                                                      var item = response.dataObject;
                                                      usertable.clear().draw();
                                                      usertable.rows.add(item);
                                                      usertable.columns.adjust().draw();
                                                  }
                                              });

                                          }
                                          else if (response.message == 'EXISTSING Comapny-POC Mapped Successfully.') {
                                              toastr.warning('Existing POC.', 'Existing POC')
                                          }
                                          else {
                                              toastr.error('Something went wrong. Please try again!.', 'Error')
                                              console.log(response);
                                          }
                                      });
                                  }
                              });
                             

                          });
                      });


                      $('#usertable tbody').on("click", ".checkbox", function () {
                          if ($('.checkbox').is(":checked")) {
                              searchIDs = $(this).val()
                              var searchIDs = $("input:checkbox:checked").map(function () {
                                  return $(this).val();
                              }).get(); // <----
                              var remove_Item = 'test';
                              searchIDs1 = $.grep(searchIDs, function (value) {
                                  return value != remove_Item;
                              });
                              $("#pocid1").val(searchIDs1);
                          }
                          else {
                              $("#pocid1").val("");
                          }
                      });

                  $('#usertable tbody').on("click", '.editico', function (e) {
                      $("#pocupdate").modal("show");
                      var obj = usertable.row($(this).parents('tr')).data();
                      $("#pocid").val(obj.poC_ID)
                      $("#nameup").val(obj.name);
                      $("#emailup").val(obj.email);
                      $("#numberup").val(obj.contact);
                      $("#desigup").val(obj.designation);
                      $("#deptup").val(obj.department);

                      var emaillist = obj.emaiL1;
                      var emailarr = []
                      emailarr.push(obj.emaiL1);
                      emailarr = emaillist.split(",");

                      var numberlist = obj.contacT1;
                      var numarr = []
                      numarr.push(obj.contacT1);
                      numarr = numberlist.split(",");



                      var docwrap = "";
                      for (var i = 0; i < emailarr.length; i++) {
                          if (emailarr[i] == "") {

                          }
                          else {
                              docwrap = docwrap + '<input type="email" class="form-control mb-3" name="CONTACT_PERSON_EMAIL" id="txtemail' + i + '" placeholder="Email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" title="eg. example@example.com" value="' + emailarr[i] + '" >  ';
                          }

                      }
                      $('.div1').html(docwrap);

                      var docwrap = "";
                      for (var i = 0; i < numarr.length; i++) {
                          if (numarr[i] == "") {

                          }
                          else {
                              docwrap = docwrap + '<div class="col-md-6"><input type="text" class="form-control mb-3" pattern="[0-9]{10}" title="10 digits eg. 8888889999" name="number" id="txtnumber' + i + '" placeholder="Mobile No. of Contact Person" value="' + numarr[i] + '" ></div> <div class="removeRow col-md-3 mb-2 mt-1 pr-4"><a class="btnRemove">Remove</a></div>';
                          }
                      }
                      $('.div2').html(docwrap);
                  });

                  $('#assign').on('click', '.btnSave', function (event) {
                      event.preventDefault();

                      idarray = $('#pocid1').val(); //retrieve array
                      var idarray1 = idarray.replace(/[[\]"]/g, '');
                      var callerid = $("#ddsales option:selected").val();
                      //  var records = $('#bblcount').text();
                      var USER_CODE = getCookies().solitary_code;
                      console.log(idarray1);
                      var chk1 = $("#pocid1").val();
                      var USER_GUID = $("#ddsales option:selected").val();
                      var dataobj = {
                          "POC_ID": idarray1,
                          "C_GUID": companyid,
                          "USER_GUID": USER_GUID,
                          "CREATED_BY": getCookies().USER_GUID,
                      };

                      console.log(dataobj);
                      console.log(dataobj);
                      var settings = {
                          "url": "https://crmapi.24fd.com/Company_Master/post_company_POC_24fdperson_mapping",
                          "method": "POST",
                          "timeout": 0,
                          "headers": {
                              "Content-Type": "application/json"
                          },
                          "data": JSON.stringify(
                              dataobj
                          ),
                      };

                      $.ajax(settings).done(function (response) {
                          $("#assign").modal("hide");
                          console.log(response);
                          var obj = { "C_GUID": "ALL" }
                          if (response.message == 'Comapny-POC assigned to 24fd person Successfully.') {
                              toastr.success('POC Assigend Successfully.', 'POC Assigend')
                              $("#form-assign")[0].reset();

                              $.ajax({
                                  type: 'POST',
                                  url: apiurl + '/Company_Master/get_company_POC_mapping',
                                  dataType: "json",
                                  contentType: 'application/json;charset=utf-8 ',
                                  data: JSON.stringify(obj),
                                  async: false,
                                  processData: false,
                                  success: function (response) {
                                      poclist(response);
                                  }
                              });
                              $.ajax({
                                  type: 'POST',
                                  url: urlsales,
                                  dataType: "json",
                                  contentType: 'application/json;charset=utf-8 ',
                                  data: JSON.stringify(obj),
                                  async: false,
                                  processData: false,
                                  success: function (response) {
                                      var item = response.dataObject;
                                      usertable.clear().draw();
                                      usertable.rows.add(item);
                                      usertable.columns.adjust().draw();
                                  }
                              });
                          }

                          else if (response.message == 'EXISTSING Comapny-POC Mapped Successfully.') {
                              toastr.warning('Existing POC.', 'Existing POC')
                          }
                          else {
                              toastr.error('Something went wrong. Please try again!.', 'Error')
                              console.log(response);
                          }
                      });

                  });
                  $(document).on("change", "#fromdatef", function (e) {
                      e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
                      var t = $("#fromdatef").val();
                      "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), usertable.draw();
                  });
              },

          });
      }
      $(document).ready(function () {
        
      });
    </script>
</asp:Content>
