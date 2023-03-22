<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="user-list.aspx.cs" Inherits="CRM.Admin.user_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
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
            padding: 10px 10px !important;
        }
        .mainWrap{
            overflow-x:scroll;
            overflow-y:hidden;
        }
        @media (max-width:600px) {
            .user-btn {
                width: 200px;
            }

                .user-btn a {
                    background-color: #82C43C !important;
                    padding: 7px 4px !important;
                    border-radius: 12px !important;
                    color: white !important;
                    font-size: 11px !important;
                    margin-left: 1em !important;
                }

            .list-name h5 {
                font-size: 13px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" action="./user-list" id="form1"></form>
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">

            <div class="col-md-3">
                <div class="table-head">
                     
                    <h5>All Employees</h5>
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
                    
                </div>
            </div>
            <div class="col-md-12 mt-4">
                <div class="col-md-12 filterwrap">
                    <div id="filter" class="col-md-3"></div>
                </div>

                <table id="usertable" class="display" style="width: 100%;">
                    <thead>
                        <tr style="background: #fff;">
                            <th>EMP Code</th>
                            <th>Name</th>
                            <th>DOJ</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Departmant</th>
                            <th>Reporting To</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
    </div>

    </div>

        <!-- Modal -->
    <div class="modal fade" id="AddUser"  aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel">Add User </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="form-user">
                            <div class="col-md-4 mb-3">
                                <label for="">First Name </label>
                                <input type="text" class="form-control" id="f-name" placeholder="First-Name" required>
                            </div>
                            <div class="col-md-4 mb-3">

                                <label for="">Midle Name </label>
                                <input type="text" class="form-control" id="m-name" placeholder="Middle-Name">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Last Name </label>
                                <input type="text" class="form-control" id="l-name" placeholder="Last-Name" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Employee Biometric Code </label>
                                <input type="text" class="form-control" id="empCode" placeholder="Employee Code" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Employee ID </label>
                                <input type="text" class="form-control" id="empid" placeholder="Employee Code" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Gender </label>
                                <select class="form-control" name="gender" id="g-name" placeholder="Select Gender" required>
                                    <option value="">select Gender</option>
                                    <option value="MALE">Male</option>
                                    <option value="FEMALE">Female</option>
                                    <option value="OTHERS">Others</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">DOB </label>
                                <input type="date" class="form-control" id="dob" placeholder="DOB" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">DOJ </label>
                                <input type="date" class="form-control" id="doj" placeholder="DOJ" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Contact </label>
                                <input type="number" class="form-control" id="p-number" aria-describedby="mobile" pattern="^[6-9]\d{9}$" title="Example (8888444422)" placeholder="Contact" maxlength="10" required />
                                <%--<input type="text" class="form-control" name="Phone Number" id="p-number" pattern="/(7|8|9)\d{9}/"  title="Phone number with 7-9 and remaing 9 digit with 0-9"  placeholder="Contact" required>--%>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Official Contact </label>
                                <input type="number" id="off-number" class="form-control" maxlength = "10" minlength="10" placeholder="Official Contact">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Email </label>
                                <input type="Email" class="form-control" id="p-email" placeholder="Email" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Official Email </label>
                                <input type="Email" class="form-control" id="off-email" placeholder="Official Email">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Hub</label>
                                <select name="hub" id="hub" class="form-control">
                                    <option value="">select Hub</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Banglore">Banglore</option>
                                    <option value="Delhi">Delhi</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Role</label>
                                <select name="role" class="form-control" id="ddrole" required>
                                    <option value="">select Role</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Designation</label>
                                <select name="desig" class="form-control" id="dddesig" required>
                                    <option value="">Select Designation</option>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Department</label>
                                <select name="" class="form-control" id="dddept">
                                    <option value="">Select Department</option>

                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Reporting person</label>
                                <select class="form-control" id="ddreport" name="ddreport[]" multiple="multiple" required>
                                    <option value="">Select Reporting person</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label>Address</label>
                                <textarea class="form-control" name="" id="add" cols="30" rows="0" placeholder="Address"></textarea>
                            </div>

                            <div class="col-md-4 profile-img">
                                <label for="">Add Profile picture </label>
                                <i class="attachment fa-solid fa-paperclip"></i>
                                <input type="file" accept=".jpg, .jpeg, .png" class="form-control" id="profile-img" placeholder="Add Profile picture" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">In Probation</label>
                                <select name="probation" id="probation" class="form-control">
                                    <option value="">select</option>
                                    <option value="true" selected>Yes</option>
                                    <option value="false">No</option>
                                </select>
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
   
    <script src="js/main.js"></script>

   
    <script>
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

        var cur_role;
        var cooks = getCookies();
        var roles = JSON.parse('{  "6D4FCD9D-A8EB-EC11-82D5-02CDC8B1CF2E": "Admin",  "C2764AAD-A8EB-EC11-82D5-02CDC8B1CF2E": "Employee",  "29C4A8B9-A8EB-EC11-82D5-02CDC8B1CF2E": "Director",  "BB7179C9-A8EB-EC11-82D5-02CDC8B1CF2E": "Manager",  "4CEB5CD1-A8EB-EC11-82D5-02CDC8B1CF2E": "HOD",  "1EAF5BD8-A8EB-EC11-82D5-02CDC8B1CF2E": "Team Lead",  "0CD92DFD-A8EB-EC11-82D5-02CDC8B1CF2E": "Super Admin", "40CF5DD6-9E22-ED11-82D6-02CDC8B1CF2E": "Trainee"}');
        var cc = cooks['ROLE_ID'];
        for (n in roles) {
            if (n.toUpperCase() == cc.toUpperCase()) {
                cur_role = roles[n];// value where key is n
                localStorage.setItem("myrole", cur_role);
            }
        }



        $("#filter-icon").click(function () {
            $(".filterwrap").slideToggle(500);
            $("#filter").css("display", "flex");
        });

        //alert(getCookies().PROFILE_IMG);

        $("#form-user").submit(function (event) {
            event.preventDefault();
            var hub = document.getElementById('hub').value;
            var form = new FormData();
            var reporting = $("#ddreport").val();
            form.append("EMP_CODE", $("#empCode").val());
            form.append("EMP_ID", $("#empid").val());
            form.append("F_NAME", $("#f-name").val());
            form.append("M_NAME", $("#m-name").val());
            form.append("L_NAME", $("#l-name").val());
            form.append("GENDER", $("#g-name").val());
            form.append("DOB", $("#dob").val());
            form.append("DOJ", $("#doj").val());
            form.append("EMAIL", $("#p-email").val());
            form.append("EMAIL1", $("#off-email").val());
            form.append("ADDRESS", $("#add").val());
            form.append("HUB", hub);
            form.append("CREATED_BY", getCookies().USER_GUID);
            form.append("ROLE_ID", $("#ddrole option:selected").val());
            form.append("DESIGNATION_ID", $("#dddesig option:selected").val());
            form.append("DEPT_ID", $("#dddept option:selected").val());
            form.append("REPORTING_TO", reporting);
            form.append('Image', $('#profile-img')[0].files[0]);
            form.append("CONTACT", $("#p-number").val());
            form.append("CONTACT1", $("#off-number").val());
            form.append("PROBATION_PERIOD", $("#probation").val());


            var settings = {
                "url": apiurl + '/Employee/AddEmployee',
                "method": "POST",
                "timeout": 0,
                "processData": false,
                "mimeType": "multipart/form-data",
                "contentType": false,
                "data": form
            };

            $.ajax(settings).done(function (response) {
                var resp = JSON.parse(response)
                $("#AddUser").modal("hide");
                if (resp.message == '1') {
                    toastr.success('User Added Successfully.', 'User Added')

                    var obj = { "USER_GUID": "ALL" };
                    $.ajax({
                        type: 'POST',
                        url: apiurl + '/Employee/Get_Employee_List',
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8 ',
                        data: JSON.stringify(obj),
                        async: false,
                        processData: false,
                        success: function (data) {
                            var item = data.dataObject;
                            usertable.clear().draw();
                            usertable.rows.add(item);
                            usertable.columns.adjust().draw();
                        }
                    });

                    $("#form-user")[0].reset();
                    $("#ddreport").val('');
                }

                else if (resp.message == '0') {
                    toastr.warning('Existing Employee Code.', 'Existing Employee')
                }
                else {
                    toastr.error('Something went wrong. Please try again!.', 'Error')
                    console.log(response);
                }
            });

        });

        $("#pagename").text('Employee List');

        $(document).ready(function () {
            bindselect(apiurl + '/Master/get_role_list', 'ddrole');
            bindselect(apiurl + '/Master/get_department_list', 'dddept');
            bindselect(apiurl + '/Master/get_designation_list', 'dddesig');
            bindselect(apiurl + '/Master/get_reporting_list', 'ddreport');



            //alert(cur_role);
            if (cur_role == 'Admin') {
                var obj = { "USER_GUID": "ALL" };
            }
            else {

                var obj = { "USER_GUID": getCookies().USER_GUID };//ALL
            }



            $.ajax({
                type: 'POST',
                url: apiurl + '/Employee/Get_Employee_List',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {

                    var tbldata = response.dataObject;
                    console.log(tbldata);
                    (usertable = $("#usertable").DataTable({
                        dom: "fltip",
                        order: [],
                        responsive: { details: { type: "column", target: "tr" } },
                        lengthMenu: [
                            [10, 25, 50, 100, 200, -1],
                            [10, 25, 50, 100, 200, "All"]
                        ],
                        pagingType: "full",
                        infoFiltered: !0,
                        aaData: tbldata,
                        "oSearch": { "sSearch": "Sales" },
                        columns: [
                            {
                                "mData": function (data, type, dataToSet) {
                                    return ' <div class="Empcode"> <i class="ri-eye-fill"></i>' + data.emP_CODE + '</div>';
                                }
                            },
                            //{
                            //    data: 'profilE_IMG',
                            //    render: function (data) {
                            //        if (data == null) {
                            //            return '<div class="user-wrap"><span class="tblimg"><img src="images/user.svg" alt="" /></span>  <div class="username">' + data.name + '<br /><span class="tbldesg" style="text-transform:lowercase"> ' + data.designation + ' </span></div> </div>'
                            //        }
                            //        else {
                            //            return '<div class="user-wrap"><span class="tblimg"><img src="https://crm.24fd.com/resources/profileimages/' + profilE_IMG+'" alt="" /></span>  <div class="username">' + data.name + '<br /><span class="tbldesg" style="text-transform:lowercase"> ' + data.designation + ' </span></div> </div>'
                            //        }

                            //    },
                            //},

                            {
                                "mData": function (data, type, dataToSet) {
                                    if (data.profilE_IMG == null) {
                                        return '<div class="user-wrap"><span class="tblimg"><img src="images/user.svg" alt="" /></span>  <div class="username">' + data.name + '<br /><span class="tbldesg" style="text-transform:lowercase"> ' + data.designation + ' </span></div> </div>';
                                    }
                                    else {
                                        return '<div class="user-wrap"><span class="tblimg"><img src="https://crm.24fd.com/Admin/Documents/' + data.profilE_IMG + '" alt="" /></span>  <div class="username">' + data.name + '<br /><span class="tbldesg" style="text-transform:lowercase"> ' + data.designation + ' </span></div> </div>';
                                    }
                                }
                            },

                            {
                                "data": "doj",
                                "render": function (data) {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() + "-" + date.getFullYear();
                                }
                            },
                            {
                                "mData": function (data, type, dataToSet) {
                                    return '<div class="usercontact"> <h6><span> Personal:</span>' + data.email + '</h6><h6><span>Office:</span>' + data.emaiL1 + '</h6></div>';
                                }
                            },
                            {
                                "mData": function (data, type, dataToSet) {
                                    return '<div class="usercontact"> <h6><span> Personal:</span>' + data.contact + '</h6><h6><span>Office:</span>' + data.contacT1 + '</h6></div>';
                                }
                            },
                            { "data": "dept" },
                            { "data": "reportinG_TO_NAME" },
                            {
                                "mData": function (data, type, dataToSet) {
                                    if (data.status == 'DEACTIVE') {
                                        return '<div class="btn btndeact">Deactive</div>';
                                    }
                                    else if (data.status == 'ACTIVE') {
                                        return '<div class="btn btnact">Active</div>';
                                    }
                                }
                            },
                        ],
                        columnDefs: [
                            { className: "text-center", targets: [] },
                            { width: 60, targets: 0 },
                            { width: 220, targets: 1 },
                            { width: 250, targets: 2 },

                            {
                                targets: [5, 6],
                                render: function (data, type, row, meta) {
                                    return type === 'filter' ?
                                        data === '' ? '(Empty)' : data : data;
                                }
                            }
                        ],
                        createdRow: function (e, t, a) {
                            switch (t.DECLARATION) {
                                case "0":
                                case "1":
                                    $("td", e).css("background-color", "#ffffff"), $("td", e).css("color", "black"), $("td", e).css("font-weight", "500");
                            }
                        },
                        drawCallback: function (settings) {

                        },
                        initComplete: function () {
                            var info = this.api().page.info();

                            $("#entries").html(info.recordsTotal);
                            var cfiltercol = [];
                            cfiltercol = [5, 6];
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
                        }

                    }))

                    /* reporting to list */
                    //usertable.column(6).search(fname).column(5).search(deptname).draw();

                    $('#usertable tbody').on("click", '.Empcode', function (event) {
                        var obj = usertable.row($(this).parents('tr')).data();
                        var userID = obj.useR_GUID;
                        var empcode = obj.emP_CODE;
                        var hub = obj.hub;
                        var name = obj.name;
                        window.open('SalesWork.aspx?uid=' + userID + '&name=' + name);
                    });
                    $(document).on("change", "#fromdatef", function (e) {
                        e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
                        var t = $("#fromdatef").val();
                        "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), usertable.draw();
                    });
                }

            });
        });

        function searchbynamedept(deptname, fname) {
            usertable.column(6).search(fname).column(5).search(deptname).draw();
        }



        var obj1 = {
            "APPROVAL_TO": "1353A47B-6C29-49E9-98C2-1E1AA48AB05C",
            "AttendanceDate": "2022-12",
            "STATUS": "TEAM"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            url: "https://crmapi.24fd.com/Attendance/get_attendance_compoff_approval_list",
            data: JSON.stringify(obj1),
            async: false,
            processData: false,
            success: function (response) {
                console.log(response);
            },
            error: function () {

                toastr.error('Something went wrong. Please try again!.', 'Error')
            }
        });

    </script>

</asp:Content>

