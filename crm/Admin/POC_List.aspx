<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="POC_List.aspx.cs" Inherits="CRM.Admin.POC_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   <%--<link rel="stylesheet" href="css/datetime.css">--%>
    <link rel="stylesheet" href="css/style2.css">
    <style>
        .select2-container {
            z-index: 100000;
            width: 100% !important;
        }
        .datepicker-modal{
            display:none!important;
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
            display: none;
        }

        #filter select {
            margin-right: 10px;
            height: 35px;
            margin-bottom: 0 !important;
            background: #f1f1f1;
            border: none;
            border-radius: 20px;
            padding: 10px 10px !important;
        }

        .assignbtn1 {
            width: 90% !important;
        }
        select2-container .select2-selection--single .select2-selection__rendered {
            width: 130px !important;
        }
        .btn:hover {
            color: #212529;
            border-radius: 5px!important;
        }

        .modal-dialog {
            max-width: 850px !important;
            margin: 1.75rem auto;
            margin-top: 5rem !important;
        }

        input[type="date"]{
            line-height:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" action="./user-list" id="form1"></form>
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <div class="col-md-3">
                <div class="table-head">
                    <h5>All POC List</h5>
                </div>
            </div>
            <div class="col-md-9">
                <div class="filters-wrap">
                    <div class="list-name">
                        <span>Total:</span>
                        <h5>&nbsp;<strong id="entries"></strong> Contacts</h5>
                    </div>
                    <div class="list-name">
                        <i id="filter-icon" class="fa-solid fa-arrow-down-wide-short"></i>
                    </div>
                    <div class="user-btn">
                        <a class="assignbtn1" style="width: 90%!important;">Assign POC</a>
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
                            <th>
                                <input type="checkbox" name="checkAll" id="checkAll" class="form-check-input-styled"></th>
                            <th>Name</th>
                            <th>Company</th>
                            <%--<th>Email</th>--%>
                            <th>Contact</th>
                            <th>Designation</th>
                            <th>Departmant</th>
                            <th>Linkedin</th>
                            <th>Assignd To</th>
                            <th>Action</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="pocupdate" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel1">Add POC </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="form-pocup">
                            <div class="col-md-4 mb-3">
                                <label for="">POC Name </label>
                                <input type="text" class="form-control" id="nameup" placeholder="POC Name" required>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="">Designation </label>
                                <input type="text" class="form-control" id="desigup" placeholder="Designation">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Department </label>
                                <input type="text" class="form-control" id="deptup" placeholder="Department">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Email </label>
                                <input type="Email" name="emailup" class="form-control" id="emailup" placeholder="Email">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Contact </label>
                                <input type="number" name="numberup" id="numberup" class="form-control" maxlength="10" minlength="10" placeholder="Contact Contact">
                            </div>
                            <div class="row col-md-12 input_fields_wrap_up m-0 p-0">
                                <div class="inpuWrap row m-0 p-0">
                                    <div class="col-md-4 div1">
                                    </div>
                                    <div class="col-md-8 div2 row">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <a class="btnBorder colorBlue add_field_button_up"><i class="ri-add-circle-fill"></i>&nbsp; Add more</a>
                            </div>
                            <input type="hidden" class="form-control" id="pocid" placeholder="Department">
                            <div class="col-md-12 mt-3 text-left">
                                <input type="submit" class="btn btn-primary btnSave" />
                            </div>

                            <div class="momForm mt-3">
                            
                        </div>
                        </form>

                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="assign" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel2">Assign POC </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="form-assign">
                            <div class="col-md-12 mb-3">
                                <label for="">Select Sales Person</label>
                                <select name="role" class="form-control" id="ddsales" required>
                                    <option value="">select Sales Person</option>
                                </select>
                            </div>
                            <input type="hidden" class="form-control" id="pocid1" placeholder="Department">
                            <input type="hidden" class="form-control" id="coid1" placeholder="Department">
                            <div class="col-md-12 mt-1 text-left">
                                <input type="submit" class="btn btn-primary btnSave" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addtask" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel3">Add Daily Activity </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="taskform">
                                <input type="hidden" id="chkhid"/>
                          
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
                                <label for="">Select  Type of Activity  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="stype" required>
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


                            <div class="col-md-12 mb-3">
                                <textarea class="form-control" name="Remark" id="Remark" placeholder="Remark *" cols="0" rows="0" required></textarea>
                            </div>
                             <div class="actionbtn">Followup Action
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></div>
                            <div class="row followbox1 m-0 p-0" style="display: none;">
                                <div class="col-md-6 mb-3">
                                    <label for="">Select Time</label>
                                    <input class="timepicker timepicker-with-dropdown text-center form-control" id="time" name="time">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="">Select Date</label>
                                    <input type="date" class="form-control" id="date" name="date">
                                </div>

                                 <div class="col-md-4 mb-3">
                                <label for="">Select  Activity  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="sactivitytd">
                                    <option value="">select Activity</option>
                                    <option value="PhoneCall">Phone Call</option>
                                    <option value="Email">Email</option>
                                    <option value="Meeting">Meeting</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select  Type of Activity  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="stypetd" >
                                    <option value="">select Type of Activity</option>
                                    <option value="Requirment">Requirment</option>
                                    <option value="Followup">Followup</option>
                                    <option value="Pitch">Pitch</option>
                                    <option value="RelationshipBuilding">Relationship Building</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Type of Categry  <span class="star">*</span></label>
                                <select name="role" class="form-control" id="Categorytd">
                                    <option value="">select Type of Category</option>
                                    <option value="Hot">Hot</option>
                                    <option value="Warm">Warm</option>
                                    <option value="Cold">Cold</option>
                                    <option value="Irrelevant">Irrelevant</option>
                                </select>
                            </div>
                            </div>
                            <input type="hidden" class="form-control" id="tcid">
                           
                            <div class="col-md-12 mt-1 text-left">
                                <input type="submit" class="btn btn-primary btnSave" />
                            </div>
                        </form>

                        <div class="momForm mt-3">
                            <form id="myform" autocomplete="off">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4 ">
                                        <span class="text">Date:</span>
                                        <input id="meeting-date" name="date" type="date" class="datepicker form-control" />
                                    </div>
                                    <div class="col-md-4  col-sm-4">
                                        <span class="text">Start Time</span>
                                        <input id="intime" name="time" class="timepicker form-control" type="text" />
                                    </div>
                                    <div class="col-md-4  col-sm-4">
                                        <span class="text">End Time:</span>
                                        <input id="outtime" name="time" class="timepicker form-control" type="text" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <span class="text">Meeting Type:</span>
                                        <select id="meeting-type" class="form-select form-control" aria-label="meeting">
                                            <option value="">select Type of Activity</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text">24FD Team Member:</span>
                                        <select class="fav_clr form-control" id="fav_clr" name="team" multiple="multiple" required>
                                            <option value="">select Team Members</option>
                                        </select>
                                        <input id="ddteam" type="hidden" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <span class="text">Company Name:</span>
                                        <select name="company-name" id="company-name" class="form-select form-control" aria-label="Company Name">
                                            <option value="" selected>Select company name</option>
                                        </select>
                                    </div>

                                </div>

                                <div id="client_details">
                                    <div class="row">
                                        <div class="col-md-6"><a class="addclientbtn badge">Click here to add new client</a></div>
                                    </div>
                                    <div class="form-group cdetails row">

                                        <div class="col-md-4 nopadding">
                                            <div class="form-group">
                                                <!-- <input type="name" class="form-control" id="clientName" name="tp-name[]" value="" placeholder="Client Name" /> -->
                                                <select name="clientName[]" id="clientName-0" class="clientd form-select-1 form-control" onchange="getcomdetails(0)" data-cid="0" aria-label="Default select example">
                                                    <option value="" selected>Client Name</option>
                                                </select>
                                                <input type="hidden" id="tcid1" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 nopadding">
                                            <div class="form-group">
                                                <input type="email" class="form-control clientEmail" id="clientEmail-0" name="clientEmail[]" value=""
                                                    placeholder="Email ID" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 nopadding">
                                            <div class="form-group">
                                                <input type="number" class="form-control clientcontact" id="contactNo-0" name="contactNo[]" value=""
                                                    placeholder="Contact No" />
                                            </div>
                                        </div>
                                        <div class="col-md-1 nopadding">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-success" type="button" onclick="client_details();"><i class="fa-solid fa-plus"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clear"></div>

                                <div class="third-sec">
                                    <div class="title">
                                        <h6>Third party Name</h6>
                                    </div>
                                    <div id="education_fields">
                                        <div class="form-group-1 formtp row">
                                            <div class="col-sm-3 nopadding">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="tp-name" name="NAME" value="" placeholder="Name" />
                                                </div>
                                            </div>
                                            <div class="col-sm-3 nopadding">
                                                <div class="form-group">
                                                    <input type="number" class="form-control" id="tp-number" name="NUMBER" value=""
                                                        placeholder="Number" />
                                                </div>
                                            </div>
                                            <div class="col-sm-3 nopadding">
                                                <div class="form-group">
                                                    <input type="email" class="form-control" id="tp-email" name="EMAIL" value="" placeholder="Email" />
                                                </div>
                                            </div>
                                            <div class="col-sm-3 nopadding">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <select name="TID" id="tp-date" class="form-select-1 form-control ddteam" aria-label="Default select example">
                                                            <option selected>Type of team</option>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-success btnadd" type="button" onclick="education_fields();"><i class="fa-solid fa-plus"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="Points-discussed">
                                    <div class="title">
                                        <h6>Points discussed</h6>
                                    </div>

                                    <div id="education">
                                        <div class="form-group-1 formDiscuss row">
                                            <div class="col-sm-6 nopadding-1">
                                                <div class="form-group-1">
                                                    <span class="text">Description:</span>
                                                    <textarea type="text" class="form-control" id="Description " name="DESCRIPTION" value="" placeholder="Description"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-sm-3 nopadding-1">
                                                <div class="form-group-1">
                                                    <span class="text">Due Date:</span>
                                                    <input id="date1" name="DUE_DATE" value="" placeholder="Due_date" type="date" class="datepicker form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-3 nopadding-1">
                                                <div class="form-group-1">
                                                    <span class="text">Responsible Person:</span>
                                                    <div class="input-group">

                                                        <input type="text" class="form-control" id="pd-responsible" name="RESPONSIBLE_PERSON" value=""
                                                            placeholder="Responsible_person" />
                                                        <div class="input-group-btn">

                                                            <button class="btn btn-success" type="button" onclick="education();"><i class="fa-solid fa-plus"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>

                                    <div class="btn-hero">
                                        <input class="btn-1" type="submit" value="submit" id="btn">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/main.js"></script>
    <script>


        $(function () {
            var dtToday = new Date();

            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate();
            var year = dtToday.getFullYear();
            if (month < 10)
                month = '0' + month.toString();
            if (day < 10)
                day = '0' + day.toString();

            var minDate = year + '-' + month + '-' + day;

            $('#date').attr('min', minDate);
        });


        $('#flexCheckDefault').click(function () {
            if ($(this).is(':checked')) {
                $("#chkhid").val('1');
                $("#sactivitytd").prop('required', true);
                $("#stypetd").prop('required', true);
                $("#Categorytd").prop('required', true);
                $(".followbox1").addClass("d-flex");
            }

            else {
                $("#chkhid").val('0');
                $("#sactivitytd").prop('required', false);
                $("#stypetd").prop('required', false);
                $("#Categorytd").prop('required', false);
                $(".followbox1").removeClass("d-flex");
            }

        });


   

        $(".momForm").hide();
        $("#sactivity").change(function () {
            var activity = $(this).val();
            if ($(this).val() == 'Meeting') {
                $(".momForm").show();
            }
            else {
                $(".momForm").hide();
            }
        });
        var coid;
        $("#company-name").change(function () {
            coid = $(this).find(":selected").val();
            poclist(coid);
            $(".clientd").empty();
            setTimeout(function () {
                $(".clientd ").trigger('change');
            }, 1500);

        });

        $(".clientd").change(function () {
            var pocid = $(this).val();
            setTimeout(function () {
                $("#tcid").val(pocid);
            }, 1500);

        });



        var room = 1;
        var form_id = 1;
        function client_details() {
            poclist(coid);
            room++;
            form_id += 1;
            var objTo = document.getElementById("client_details");
            var divtest = document.createElement("div");
            divtest.setAttribute("class", "form-group mt-3 cdetails row removeclass" + room);
            var rdiv = "removeclass" + room;
            divtest.innerHTML =
                '<div class="col-md-4 nopadding"><div class="form-group"> <select  name="clientName[]"  class="clientd form-select-1 form-control" data-cid="' + form_id + '" onChange="getcomdetails(' + form_id + ')"   id="clientName-' +
                form_id +
                '" class="form-select" aria-label="Default select example"> <option selected>Client Name</option> <option value="1">Sagar</option><option value="2">Sanjiv</option><option value="3">Rupali</option></select></div></div><div class="col-md-4 nopadding"><div class="form-group"> <input type="email" class="form-control clientemail' + form_id + '" id="clientEmail-' +
                form_id +
                '" name="clientEmail[]" value="" placeholder="Email ID"></div></div><div class="col-md-3 nopadding"><div class="form-group"> <input type="text" class="form-control clientcontact' + form_id + '" id="contactNo-' +
                form_id +
                '" name="contactNo[]" value="" placeholder="Contact No."></div></div><div class="col-md-1 nopadding"><div class="form-group"><div class="input-group">  <div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_client_details(' +
                room +
                ');"> <i class="fa-solid fa-minus"></i> </button></div></div></div></div><div class="clear"></div>';

            objTo.appendChild(divtest);

            listcname("clientName-" + form_id);
        }

        $(document).ready(function () {
            $(".mombtn").click(function () {
                $("#addmom").modal('show')
            })
            bindselect(apiurl + '/Master/get_meeting_type', 'meeting-type');
            bindselect(apiurl + '/Master/get_reporting_list', 'fav_clr');
            bindselect1(apiurl + '/Master/get_mom_thirdparty_team_type', 'ddteam');

            $('.btnadd').click(function () {
                bindselect1(apiurl + '/Master/get_mom_thirdparty_team_type', 'ddteam');
            });

            $(".fav_clr").change(function () {
                var team = $(this).val();
                $("#ddteam").val(team);
            });
        });

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
               
            }

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
                $(".followbox").css("display", "flex");
                $("#time").prop('required', true);
                $("#date").prop('required', true);
            }
            else {
                $(".followbox").css("display", "none");
                $("#time").prop('required', false);
                $("#date").prop('required', false);
            }

        })

        $("#filter-icon").click(function () {
            $(".filterwrap").slideToggle(500);
            $("#filter").css("display", "flex");
        });

        //alert(getCookies().PROFILE_IMG);

        $("#taskform").submit(function (event) {
            event.preventDefault();
            var Activity = $("#sactivity").val();
            var Activitytd = $("#sactivityts").val();
            var Type = $("#stype").val();
            var Typetd = $("#stypetd").val();
            var Category = $("#Category").val();
            var Categorytd = $("#Categorytd").val();
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
                "STATUS": "COMPLETED",
                "DA_TYPE": "TASK",
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

                console.log(response);
                if (response.message == "Daily Activity added Successfully.") {

                    if ($("#chkhid").val() == '1') {

                        var dataobj = {
                            "CID": CID,
                            "ACTIVITY": Activity,
                            "TYPE_OF_ACTIVITY": Type,
                            "ACTIVITY_CATEGORY": Category,
                            "REMARK": Remark,
                            "USER_GUID": getCookies().USER_GUID,
                            "FOLLOWUP_DATE": date,
                            "FOLLOWUP_TIME": time,
                            "DA_TYPE": "TODO",
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
                        });
                    }

                    $("#addtask").modal("hide");
                    toastr.success('Daily Activity added Successfully.', 'Activity Added');
                   

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

        $("#pagename").text('POC List');

        $("#form-pocup").submit(function (event) {
            event.preventDefault();

            var emailval = '';
            var numberval = '';
            $('.inpuWrap input[type =email]').each(function (index) {
                if (index != 0) {
                    emailval += ",";
                }
                emailval += $(this).val();
            });

            $('.inpuWrap input[type =text]').each(function (index) {
                if (index != 0) {
                    numberval += ",";
                }
                numberval += $(this).val();
            });

            var nameu = $("#nameup").val();
            var emailu = $("#emailup").val();
            var numberu = $("#numberup").val();
            var desigu = $("#desigup").val();
            var deptu = $("#deptup").val();
            var chk = $("#pocid").val();

            var dataobj = {
                "POC_ID": chk,
                "NAME": nameu,
                "EMAIL": emailu,
                "CONTACT": numberu,
                "DESIGNATION": desigu,
                "DEPARTMENT": deptu,
                "ADDEDBY": getCookies().USER_GUID,
                "CONTACT1": numberval,
                "EMAIL1": emailval
            };

            console.log(dataobj);
            var settings = {
                "url": "https://crmapi.24fd.com/Company_Master/update_company_POC_details",
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
                var obj = { "C_GUID": "ALL" }
                if (response.message == 'Comapny-POC Updated Successfully.') {
                    toastr.success('POC Updated Successfully.', 'POC Updated')

                    $.ajax({
                        type: 'POST',
                        url: apiurl + '/Company_Master/get_company_POC_mapping',
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


                    $("#form-poc")[0].reset();
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

        $(document).ready(function () {

            var max_fields = 25;
            var wrapper = $(".input_fields_wrap");
            var add_button = $(".add_field_button");

            $(add_button).click(function (e) {
                e.preventDefault();
                var total_fields = wrapper[0].childNodes.length;
                if (total_fields < max_fields) {
                    $(wrapper).append('<div class="inpuWrap row m-0 p-0"><div class="form-group chk_wrap col-md-4 pr-0 mb-0"><input type="email" class="form-control" name="CONTACT_PERSON_EMAIL" id="txtemail' + form_id + '" placeholder="Email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" title="eg. example@example.com" required> </div> <div class="form-group col-md-4 mb-0"><input type="text" class="form-control" pattern="[0-9]{10}" title="10 digits eg. 8888889999" name="number" id="txtnumber' + form_id + '" placeholder="Mobile No. of Contact Person" required></div>  <div class="removeRow col-md-12 mb-2 mt-1 pr-4"><a class="btnRemove">Remove</a></div></div>');
                }
            });


            var form_id = 2;
            $('.add_field_button').click(function () {
                form_id += 1;
                console.log(form_id);
            });

            var form_id1 = 2;
            $('.add_field_button_up').click(function () {
                form_id1 += 1;
                console.log(form_id1);
            });

            $(document).on('click', '.removeRow', function (e) {
                e.preventDefault();
                $(this).closest('.inpuWrap').remove();
                $('.firstchk').prop('checked', true);
                $('.checkboxg').prop('checked', false);
            });


            //update new input form
            var max_fields1 = 25;
            var wrapper1 = $(".input_fields_wrap_up");
            var add_button1 = $(".add_field_button_up");

            $(add_button1).click(function (e) {
                e.preventDefault();
                var total_fields1 = wrapper1[0].childNodes.length;
                if (total_fields1 < max_fields1) {
                    $(wrapper1).append('<div class="inpuWrap row m-0 p-0"><div class="form-group chk_wrap col-md-4 pr-0 mb-0"><input type="email" class="form-control" name="CONTACT_PERSON_EMAIL" id="txtemail' + form_id1 + '" placeholder="Email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" title="eg. example@example.com" required> </div> <div class="form-group col-md-4 mb-0"><input type="text" class="form-control" pattern="[0-9]{10}" title="10 digits eg. 8888889999" name="number" id="txtnumber' + form_id1 + '" placeholder="Mobile No. of Contact Person" required></div>  <div class="removeRow col-md-12 mb-2 mt-1 pr-4"><a class="btnRemove">Remove</a></div></div>');
                }
            });

           
            bindselect(apiurl + '/Master/get_24fd_person_list_by_dept?dept_id=ACDAF408-1322-ED11-82D6-02CDC8B1CF2E', 'ddsales');
            $(document).on('click', '.removeRow', function (e) {
                e.preventDefault();
                $(this).closest('.inpuWrap').remove();
                $('.firstchk').prop('checked', true);
                $('.checkboxg').prop('checked', false);
            });

            var urlParams = new URLSearchParams(window.location.search);
            var userid = urlParams.get('uid');
            var dstatus = urlParams.get('dstatus');

            var role = getCookies().DESIGNATION_ID;
            var uid = getCookies().USER_GUID;
            if (role != "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
                obj = {
                    "C_GUID": "ALL",
                    "USER_GUID": uid
                }
            }
            else if (dstatus == '1') {
                urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
                obj = {
                    "C_GUID": "ALL",
                    "USER_GUID": userid
                }
            }

            else {
                urlsales = apiurl + '/Company_Master/get_company_POC_mapping';
                var obj = { "C_GUID": "ALL" }
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
                        "fnDrawCallback": function (settings) {
                            var allChecked = true;
                            $('#usertable tbody tr').each(function () {
                                $(this).find(':checkbox[name=ckbox]').each(function () {
                                    if (!$(this).is(':checked')) {
                                        allChecked = false;
                                    }
                                });
                            });
                            $('#checkAll').prop('checked', allChecked);
                        },

                        buttons: [
                            {
                                text: ' Assigned POC',
                                action: function (e, dt, node, config) {
                                    var values = new Array();
                                    $('.checkbox:checked', usertable.rows().nodes()).each(function () {
                                        var obj = usertable.row($(this).parents('tr')).data();

                                        values.push(obj.poC_ID);
                                    });
                                    var count = values.length;
                                    $('#bblcount').text(count);
                                    $('#pocid1').val(JSON.stringify(values));
                                    $('#assign').modal('show');
                                    $('#form-assign').attr('id', 'assigntbl');;

                                }
                            },
                            ],

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
                            {
                                "data": "poC_ID",
                                "mRender": function (data, type, row) {
                                    return '<input type="checkbox" name="ckbox" style="margin:12px;" data-id="' + row.c_GUID +'" value="' + row.poC_ID + '" class="checkbox" id="ckbox"/> '
                                }
                            },

                            { "data": "name" },
                            { "data": "companY_NAME" },
                            //{ "data": "email" },
                            //{
                            //    "data": "email1",
                            //    "mRender": function (data, type, row) {
                            //        return '' + row.email + '<p class="leaveText"> ' + row.emaiL1 + '</p>'

                            //    }
                           // },
                            { "data": "contact" },
                            { "data": "designation" },
                            { "data": "department" },
                            {
                                "data": "linkedin",
                                "mRender": function (data, type, row) {
                                    return '<a href = "' + row.linkedin + '" target="_blnk" style="color:#0d6efd;"> <i class="fa-brands fa-linkedin"></i></a>'
                                }
                            },
                            { "data": "assignedto" },
                            {
                                "data": null,
                                "sClass": "skip-click",
                                "sDefaultContent": '<i class="ri-edit-box-fill editico" id=""></i>'
                            },
                            {
                                "data": null,
                                "sClass": "skip-click",
                                //"sDefaultContent": '<div class="AddTask  mb-2">Add Task</div> <div class="viewpoc ">View POC</div>'
                                "sDefaultContent": ' <div class="viewpoc ">View POC</div>'
                            }
                        ],
                        columnDefs: [
                            { className: "text-center", targets: [] },
                            { width: 60, targets: 0 },
                            { width: 220, targets: 1 },
                            { width: 250, targets: 2 },
                            {
                                "orderable": false,
                                targets: [0]
                            },
                            {
                                targets: [5, 6, 7],
                                render: function (data, type, row, meta) {
                                    return type === 'filter' ?
                                        data === '' ? '(Empty)' : data : data;
                                }
                            }
                        ],
                        "createdRow": function (row, data, dataIndex) {
                            if (data["assignedto"] != "") {
                                $("td .checkbox", row).css("pointer-events", "none");
                                $("td .checkbox", row).attr('checked', 'checked');
                                $("td .checkbox", row).css('display', 'none');
                                $("td:nth-child(1)", row).html('<img src="images/checked.png" class="chkimg">');
                            }
                            else {

                            }

                        },

                        initComplete: function () {
                            var info = this.api().page.info();

                            $("#entries").html(info.recordsTotal);
                            var cfiltercol = [];
                            cfiltercol = [5, 6, 7];
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

                        $('#usertable tbody').on("click", ".checkbox", function () {
                            if ($('.checkbox').is(":checked")) {
                                searchIDs = $(this).val()
                                var searchIDs = $("input:checkbox:checked").map(function () {
                                    return $(this).val();
                                }).get();

                                var coid = $("input:checkbox:checked").map(function () {
                                    return $(this).attr('data-id');
                                }).get();

                                var remove_Item = 'test';
                                searchIDs1 = $.grep(searchIDs, function (value) {
                                    return value != remove_Item;
                                });

                                var remove_Item1 = 'test';
                                coid1 = $.grep(coid, function (value) {
                                    return value != remove_Item1;
                                });
                                $("#pocid1").val(searchIDs1);
                                $("#coid1").val(coid1);
                            }
                            else {
                                $("#pocid1").val("");
                                $("#coid1").val(coid1);
                            }
                        });

                        $('#checkAll').click(function (e) {
                            var chk = $(this).prop('checked');
                            var currentRows = $('#usertable tbody tr');
                            $.each(currentRows, function () {
                                $(this).find(':checkbox[name=ckbox]').each(function () {
                                    $(this).prop('checked', chk);
                                });
                            });

                            if (this.checked) {
                                $(':checkbox').each(function () {
                                    this.checked = true;
                                    var searchIDs = $("input:checkbox:checked").map(function () {
                                        return $(this).val();
                                    }).get();

                                    var coid = $("input:checkbox:checked").map(function () {
                                        return $(this).attr('data-id');
                                    }).get(); 
                                    var remove_Item = 'test';
                                    searchIDs1 = $.grep(searchIDs, function (value) {
                                        return value != remove_Item;
                                    });
                                    var remove_Item1 = 'test';
                                    coid1 = $.grep(coid, function (value) {
                                        return value != remove_Item1;
                                    });

                                    console.log(coid1);
                                    console.log(searchIDs1);
                                    $("#pocid1").val(searchIDs1);
                                    $("#coid1").val(coid1);
                                });
                            } else {
                                $(':checkbox').each(function () {
                                    this.checked = false;
                                    $("#pocid1").val("");
                                    $("#coid1").val("");
                                });
                            }
                        });

                        $(".assignbtn1").click(function () {
                            $('#assign').modal('show');
                        });
                    $(".AddTask").click(function () {
                        var obj = usertable.row($(this).parents('tr')).data();
                        CID = obj.cid;
                        $('#addtask').modal('show');
                        $('#tcid').val(CID);
                    });

                    $(".viewpoc").click(function () {
                        var obj = usertable.row($(this).parents('tr')).data();
                        CID = obj.cid;
                        POC_ID = obj.poC_ID;
                        window.open('pocDetails.aspx?cid=' + CID + '&poc_id=' + POC_ID);
                            
                    });

                    if (role == '28b18abb-2096-ed11-82dd-02cdc8b1cf2e') {
                        // Get the column API object
                        var column = usertable.column(8);
                        // Toggle the visibility
                        column.visible(false);
                        $(".assignbtn1").hide();
                    }
                    $('#usertable tbody').on("click", "#checkAll", function () {
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
                            $(':checkbox').each(function () {
                                this.checked = false;
                                $("#pocid1").val("");
                            });
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

                        coide = $('#coid1').val(); //retrieve array
                        var coide1 = coide.replace(/[[\]"]/g, '');
                        var callerid = $("#ddsales option:selected").val();
                        //  var records = $('#bblcount').text();
                        var USER_CODE = getCookies().solitary_code;
                        console.log(idarray1);
                        var chk1 = $("#pocid1").val();
                        var USER_GUID = $("#ddsales option:selected").val();
                        var dataobj = {
                            "POC_ID": idarray1,
                            "C_GUID": coide1,
                            "USER_GUID": USER_GUID,
                            "CREATED_BY": getCookies().USER_GUID,
                        };

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
        });





    </script>
</asp:Content>
