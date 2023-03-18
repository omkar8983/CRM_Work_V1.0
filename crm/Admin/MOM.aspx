<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="MOM.aspx.cs" Inherits="CRM.Admin.MOM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   <link rel="stylesheet" href="css/datetime.css">
    <link rel="stylesheet" href="css/style2.css">
    <script src="https://kit.fontawesome.com/62072e2a5c.js" crossorigin="anonymous"></script>
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

        .input-group {
            flex-wrap: unset !important;
        }

        #myform {
            background: white;
        }

        body {
            overflow-x: hidden;
        }

        .btn-success {
            color: #fff;
            background-color: #157347;
            border-color: #146c43;
            display: flex !important;
            align-items: center !important;
        }

        .datepicker-modal {
            position: fixed;
            top: 30% !important;
            transform: translateX(-50%) !important;
            left: 50% !important;
            z-index: 9999999999!important;
        }

        .timepicker-modal {
            position: fixed;
            top: 30% !important;
            transform: translateX(-50%) !important;
            left: 50% !important;
            z-index: 9999999999!important;
        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            width: 200px !important;
        }

       /* .select2-container {
            z-index: 0 !important;
        }*/

        .modal-dialog {
            max-width: 900px !important;
            margin: 1.75rem auto;
        }

        .modal .row {
            padding: 0.2em 1em;
        }
       #addmom {
    position: fixed;
    top: 130px;
    left: 0;
    z-index: 1060;
    display: none;
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: auto;
    outline: 0;
}
       .momview {
    justify-content: center;
    border-radius: 5px;
    width: auto;
}
        .momview:hover {
    justify-content: center;
    border-radius: 5px;
    width: auto;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <div class="col-md-3">
                <div class="table-head">
                    <h5>MOM List</h5>
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
                        <a class="mombtn" style="width: 90%!important;">Create MOM</a>
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
                            <th>Company</th>
                            <%--<th>POC</th>--%>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Type</th>
                            <th>Created By</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>
    </div>



    <div class="modal fade" id="addmom" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel3">Add MOM </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">

                        <form id="myform" autocomplete="off">
                            <div class="row">
                                <div class="col-md-4 col-sm-4 ">
                                    <span class="text">Date:</span>
                                    <input id="meeting-date" name="date" type="text" class="datepicker form-control" />
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
                                    <div class="col-md-6"><a class="addclientbtn badge"  data-bs-toggle="modal" data-bs-target="#Addpoc">Click here to add new client</a></div>
                                </div>
                                <div class="form-group cdetails row">

                                    <div class="col-md-4 nopadding">
                                        <div class="form-group">
                                            <!-- <input type="name" class="form-control" id="clientName" name="tp-name[]" value="" placeholder="Client Name" /> -->
                                            <select name="clientName[]" id="clientName-0" class="clientd form-select-1 form-control" onchange="getcomdetails(0)" data-cid="0" aria-label="Default select example">
                                                <option value="" selected>Client Name</option>
                                            </select>
                                            <input type="hidden" id="tcid" />
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
                                    <h2>Third party Name</h2>
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
                                    <h2>Points discussed</h2>
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
                                                <input id="date" name="DUE_DATE" value="" placeholder="Due_date" type="text" class="datepicker form-control">
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


    <div class="modal fade" id="Addpoc" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true" style="margin-top:2em">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel">Add POC </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="form-poc">
                            <div class="col-md-4 mb-3">
                                <label for="">POC Name</label>
                                <input type="text" class="form-control" id="txtname" placeholder="POC Name" required>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="">Designation </label>
                                <input type="text" class="form-control" id="txtdesig" placeholder="Designation">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Department </label>
                                <input type="text" class="form-control" id="txtdept" placeholder="Department">
                            </div>
                             <div class="col-md-4 mb-3">
                                <label for="">Linkedin </label>
                                <input type="text" class="form-control" id="Linkedin" placeholder="Linkedin">
                            </div>
                            <div class="row col-md-12 input_fields_wrap m-0 p-0">
                                <div class="col-md-4 mb-3">
                                <label for="">Email </label>
                                <input type="Email" name="Email" class="form-control" id="txtemail" placeholder="Email">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Contact </label>
                                <input type="text" name="number" id="txtnumber" class="form-control" pattern="[0-9]{10}" title="10 digits eg. 8888889999" maxlength="10" minlength="10" placeholder="Contact">
                            </div>
                            </div>
                              <div class="col-md-12">
                                <a class="btnBorder colorBlue add_field_button"><i class="ri-add-circle-fill"></i>&nbsp; Add more</a>
                            </div>
                            <div class="col-md-12 mt-3 text-left">
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
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.js"></script>
    <script src="js/index.js"></script>
    <script src="js/main.js"></script>
    <script>
        function getCookies() {
            var cookieMap = {};
            let coo = document.cookie.split(';');
            for (var value of coo.values()) {
                if (value.includes('SALES_CRM=')) {
                    var cookie = value.trim().replace('SALES_CRM=', '').split('&');
                    cookie.forEach(x => { cookieMap[x.split('=')[0]] = x.split('=')[1] });//x.split('='), cook[x[0] = x[1]]);console.log(x.split('=')[0]), console.log(x.split('=')[1])
                    return cookieMap;
                }
            }

            if (coo.values() === 'l') {
                alert('1');
            }

        }
        var uid = getCookies().USER_GUID;

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
                    $(div_data).appendTo('#company-name');
                }

            }
        });


        var coid;
        $("#company-name").change(function () {
            coid = $(this).find(":selected").val();
            poclist(coid);
            $(".clientd").empty();
            setTimeout(function () {
                $(".clientd ").trigger('change');
            }, 500);

        });
        $(".clientd").change(function () {
            var pocid = $(this).val();
            $("#tcid").val(pocid);
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
        function remove_client_details(rid) {
            $(".removeclass" + rid).remove();
        }

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

                    for (var i = 0; i < data.dataObject.length; i++) {
                        var item = data.dataObject[i];
                        div_data = "<option data-value=" + item.contact + " data-id=" + item.email + " value=" + item.cid + ">" + item.name + "</option>";
                        $(div_data).appendTo(".clientd");
                    }
                    //$(".clientd").change(function () {
                    //    var email = $(this).find('option:selected').attr('data-id');
                    //    var mnumber = $(this).find('option:selected').attr('data-value')
                    //    $(this).parent().parent().parent().find("div[id^='clientEmail']").val(email);
                    //    $(".clientEmail").val(email);
                    //    $(".clientcontact").val(mnumber);
                    //});
                }
            });

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

        function getcomdetails(id) {

            var email = $("#clientName-" + id).find('option:selected').attr('data-id');
            var mnumber = $("#clientName-" + id).find('option:selected').attr('data-value');
            $("#clientEmail-" + id).val(email);
            $("#contactNo-" + id).val(mnumber);
        }

        var role = getCookies().DESIGNATION_ID;

        if (role == "28B18ABB-2096-ED11-82DD-02CDC8B1CF2E") {
            obj1 =
            {
                "CREATED_BY": "ALL"
            }
        }

        else {
            obj1 =
            {
                "CREATED_BY": uid
            }
        }

        $.ajax({
            type: 'POST',
            url: "https://crmapi.24fd.com/MOM/get_MOM",
            dataType: "json",
            contentType: 'application/json;charset=utf-8 ',
            data: JSON.stringify(obj1),
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
                        { "data": "companY_NAME" },
                        //{ "data": "companY_POC_LIST" },
                        { "data": "mdate" },
                        {
                            "data": "starT_TIME",
                            "mRender": function (data, type, row) {
                                return '<p class="leaveText"> <b>Start Time</b>' + row.starT_TIME + ' </br>  </p> <p class="m-0"><b>End Time</b>' + row.enD_TIME +' </p>'

                            }
                        },
                        { "data": "mtype" },
                        { "data": "createD_BY" },
                        {
                            "data": "min",
                            "mRender": function (data, type, row) {
                                return '<a class="btn btn-success momview">View MOM</a>'

                            }
                        },
                        
                    ],
                    columnDefs: [
                        { className: "text-center", targets: [] },
                        { width: 60, targets: 0 },
                        { width: 220, targets: 1 },
                        { width: 250, targets: 2 },
                        {
                            targets: [0],
                            render: function (data, type, row, meta) {
                                return type === 'filter' ?
                                    data === '' ? '(Empty)' : data : data;
                            }
                        }
                    ],
                   
                    initComplete: function () {
                        var info = this.api().page.info();

                        $("#entries").html(info.recordsTotal);
                        var cfiltercol = [];
                        cfiltercol = [0];
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



                    $(".assignbtn1").click(function () {
                        $('#assign').modal('show');
                    });
                $(".AddTask").click(function () {
                    var obj = usertable.row($(this).parents('tr')).data();
                    CID = obj.cid;
                    $('#addtask').modal('show');
                    $('#tcid').val(CID);
                });

               
                $('#usertable tbody').on("click", ".momview", function () {
                    var obj = usertable.row($(this).parents('tr')).data();
                    MID = obj.mid;
                    window.open('momDetails.aspx?MID=' + MID )
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



        $("#form-poc").submit(function (event) {
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

            var cid = $("#company-name").val();
            var name = $("#txtname").val();
            var email = $("#txtemail").val();
            var number = $("#txtnumber").val();
            var desig = $("#txtdesig").val();
            var dept = $("#txtdept").val();
            var Linkedin = $("#Linkedin").val();
            if (number != "" || email != "") {
                var dataobj = {
                    "C_GUID": cid,
                    "NAME": name,
                    "EMAIL": email,
                    "CONTACT": number,
                    "DESIGNATION": desig,
                    "DEPARTMENT": dept,
                    "ADDEDBY": getCookies().USER_GUID,
                    "CONTACT1": numberval,
                    "EMAIL1": emailval,
                    "Linkedin": Linkedin
                };

                console.log(dataobj);
                var settings = {
                    "url": "https://crmapi.24fd.com/Company_Master/post_company_POC_mapping",
                    "method": "POST",
                    "timeout": 0,
                    "headers": {
                        "Content-Type": "application/json"
                    },
                    "data": JSON.stringify([
                        dataobj
                    ]),
                };

                $.ajax(settings).done(function (response) {
                    //var resp = JSON.parse(response)
                    $("#Addpoc").modal("hide");
                    console.log(response);
                    if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                        urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
                        obj = {
                            "C_GUID": companyid,
                            "USER_GUID": userid
                        }
                    }

                    else {
                        alert('21');
                        urlsales = apiurl + '/Company_Master/get_company_POC_mapping';
                        var obj = { "C_GUID": companyid }
                    }

                    if (response.message == 'Comapny-POC Mapped Successfully.') {
                        toastr.success('POC Added Successfully.', 'POC Added')
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
            }
            else {
                Swal.fire(
                    'Please Enter Email or Phone?',
                    '',
                    'info'
                )
            }
        });

    </script>
</asp:Content>
