<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="CRM.Admin.CompanyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />

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
            width: 97%;
            padding: 10px 10px !important;
        }

        #ddindustry {
            height: 35px;
        }

        body {
            padding-bottom: 10px !important;
        }

        #assign .modal-dialog {
            max-width: 300px;
            margin: 8.75rem auto;
        }

        .switchicon i {
              font-size: 20px;
    width: 50px;
    cursor: pointer;
    background: #2560a9;
    color: #fff;
    padding: 4px;
    border-radius: 5px;
    text-align: center;
    margin-left: 6px;
    justify-content: center;
        }

        .switchicon {
            margin-top: 6px;
            margin-right: 0;
            display:flex;
        }

        .boxview {
            margin-right: unset;
            margin-bottom: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <div class="companyWrap">
                <div class="companyInfo">
                    <div class="companyhead">
                        <img src="images/user.svg" />
                        <h2 id="cname">24 Framed Digital <span id="cshortname">(24FD)</span></h2>
                    </div>
                    <div class="companydetails row">
                        <div class="col-md-4">
                            <div class="cdetails">
                                <h5>Website </h5>
                                <p id="website">www.24framesdigital.com</p>
                                <h5>Contact Number </h5>
                                <p id="contact">8983287666</p>
                                <h5>Head office City </h5>
                                <p id="hcity">Mumbai</p>
                                <h5>Head office Address </h5>
                                <p id="hadd">room no.8 datey bhavan dadar west</p>
                                <h5>Branch City </h5>
                                <p id="bcity">Mumbai</p>
                                <h5>Branch Address </h5>
                                <p id="badd">room no.8 datey bhavan dadar west</p>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="cdetails">
                                <h5>Status</h5>
                                <p id="status" style="color: #41a720;">Active</p>
                                <h5>Client Since</h5>
                                <p id="clients">01 Jan 2020</p>
                                <h5>Number of Branches</h5>
                                <p id="n_BRANCHES">10</p>
                                <h5>Employee Strength</h5>
                                <p id="emP_STRENGTH">1000</p>
                                <h5>Number of Distributors</h5>
                                <p id="distributors">230</p>
                                <h5>Turnover</h5>
                                <p id="turnover">500000</p>

                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="cdetails">
                                <h5>Sector</h5>
                                <p id="sector">Non /Pharma</p>
                                <h5>Industry</h5>
                                <p id="industry">Transport &amp; Logistics, Infrastructure &amp; Real Estate, Industry Association, Consultancy, NGO, Others, Clothing/apparel</p>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="pocWrap row">
                    <div class="col-md-3">
                        <h3>POC Details</h3>
                    </div>
                    <div class="col-md-9">
                        <div class="btntop">
                            <div class="switchicon">
                                <i class="ri-list-unordered" id="list"></i>
                                <i class="ri-bank-card-line" id="box"></i>
                                 <a class="addbtn btn" data-bs-toggle="modal" data-bs-target="#Addpoc">Add POC</a>
                            </div>
                            <a class="assignbtn" style="display: none;">Assign POC</a>
                            <a class="assignbtn1" style="">Assign POC</a>
                           
                            <div class="btnswrap" style="display: ;">
                                <input type="checkbox" name="chkbox" id="selectAll" value="test">
                                <p style="margin: 0;">Select / Deselect All</p>
                            </div>
                    </div>
                    </div>
                    <div class="row" id="poclist" style="display: none;">
                    </div>

                </div>

            <div class="col-md-12 mt-4" id="usertbl">
                <div class="col-md-12 filterwrap">
                    <div id="filter" class="col-md-3"></div>
                </div>

                <table id="usertable" class="display" style="width: 100%;">
                    <thead>
                        <tr style="background: #fff;">
                            <th>
                                <input type="checkbox" name="checkAll" id="checkAll" class="form-check-input-styled"></th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Designation</th>
                            <th>Departmant</th>
                            <th>Linkedin</th>
                            <th>Assignd To</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
            </div>
            
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="Addpoc" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
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
                                <label for="">First Name</label>
                                <input type="text" class="form-control" id="txtfname" placeholder="First Name" required>
                            </div>
                             <div class="col-md-4 mb-3">
                                <label for="">Last Name</label>
                                <input type="text" class="form-control" id="txtlname" placeholder="Last Name" required>
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
                                <label for="">First Name </label>
                                <input type="text" class="form-control" id="fnameup" placeholder="POC Name" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Last Name </label>
                                <input type="text" class="form-control" id="lnameup" placeholder="POC Name" required>
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
                                <label for="">Linkedin </label>
                                <input type="text" class="form-control" id="Linkedin1" placeholder="Linkedin">
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
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="js/main.js"></script>
    <script>

        var urlParams = new URLSearchParams(window.location.search);
        var companyid = urlParams.get('cid');
        var mail;
        var name;
        var number;
        var desg;
        var dept;
        var chk;
        var chkarr = [];
        var idarray;
        $('#selectAll').click(function () {
            if (this.checked) {
                $(':checkbox').each(function () {
                    this.checked = true;
                    var searchIDs = $("input:checkbox:checked").map(function () {
                        return $(this).val();
                    }).get(); // <----
                    var remove_Item = 'test';
                    searchIDs1 = $.grep(searchIDs, function (value) {
                        return value != remove_Item;
                    });
                    console.log(searchIDs1);
                    $("#pocid1").val(searchIDs1);
                });
            } else {
                $(':checkbox').each(function () {
                    this.checked = false;
                    $("#pocid1").val("");
                });
            }
        });

        function getCookies() {
            var cookieMap = {};
            let coo = document.cookie.split(';');
            for (var value of coo.values()) {

                if (value.includes('SALES_CRM=')) {
                    var cookie = value.trim().replace('SALES_CRM=', '').split('&');
                    cookie.forEach(x => { cookieMap[x.split('=')[0]] = x.split('=')[1] });
                    return cookieMap;

                }
            }
        }

        var role = getCookies().DESIGNATION_ID;

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
        $(document).ready(function () {
            //add new input form
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

            $(document).on('click', '.removeRow', function (e) {
                e.preventDefault();
                $(this).closest('.inpuWrap').remove();
                $('.firstchk').prop('checked', true);
                $('.checkboxg').prop('checked', false);
            });

            $("#list").click(function () {
                $("#usertbl").show();
                $("#poclist").hide();
                $(".assignbtn").hide();
                $(".assignbtn1").show();
                $(".btnswrap").show();
                $(".switchicon").removeClass('boxview')
            })
            $("#box").click(function () {
                $("#usertbl").hide();
                $("#poclist").show();
                $(".assignbtn").show();
                $(".assignbtn1").hide();
                $(".btnswrap").show();
                $(".switchicon").addClass('boxview')
            })

            bindselect(apiurl + '/Master/get_24fd_person_list_by_dept?dept_id=ACDAF408-1322-ED11-82D6-02CDC8B1CF2E', 'ddsales');
            $.ajax({
                type: 'POST',
                url: salesurl,
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

                        buttons: {
                            dom: {
                                button: {
                                    className: 'btn btn-border btnpoc'
                                }
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
                                //{
                                //    text: '<i class="fa fa-check" aria-hidden="true"></i>&nbsp;&nbsp;Select All',
                                //    action: function (e, dt, node, config) {
                                //        $('input', usertable.rows({ search: 'applied' }).nodes()).prop('checked', true);
                                //    }

                                //},
                                //{
                                //    text: '<i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp;Unselect All',
                                //    action: function (e, dt, node, config) {
                                //        $('input', usertable.rows({ search: 'applied' }).nodes()).prop('checked', false);
                                //    }

                                //}
                            ]
                        },

                        dom: "Bfrtip",
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
                                    return '<input type="checkbox" name="ckbox" style="margin:12px;" value="' + row.poC_ID + '" class="checkbox" id="ckbox"/> '

                                }
                            },
                            
                            { "data": "name" },
                            //{ "data": "email" },
                            {
                                "data": "email1",
                                "mRender": function (data, type, row) {
                                    return '' + row.email + '<p class="leaveText"> ' + row.emaiL1+'</p>'
                                    
                                }
                            },
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
                            }
                        ],
                        columnDefs: [
                            { className: "text-center", targets: [] },
                            { width: 60, targets: 0 },
                            { width: 100, targets: 1 },
                            { width: 100, targets: 2 },
                            { width: 100, targets: 4 },
                            {
                                "orderable": false,
                                targets: [0]
                            },
                            {
                                targets: [1, 2],
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
                            cfiltercol = [1, 2];
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

                    }));


                    if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                        usertable.columns([0]).visible(true);
                    }
                    else {
                        usertable.columns([4]).visible(false);
                    }

                    if (role == '28b18abb-2096-ed11-82dd-02cdc8b1cf2e') {
                        // Get the column API object
                        var column = usertable.column(7);
                        // Toggle the visibility
                        column.visible(true);
                        $(".assignbtn1").hide();
                    }

                    $('#usertable tbody').on("click", '.Empcode', function (event) {
                        var obj = usertable.row($(this).parents('tr')).data();
                        var userID = obj.useR_GUID;
                        var empcode = obj.emP_CODE;
                        var hub = obj.hub;
                        var name = obj.name;
                        window.open('user-profile.aspx?uid=' + userID + '&empcode=' + empcode + '&hub=' + hub + '&name=' + name);
                    });


                    $('#checkAll').click(function (e) {
                        var chk = $(this).prop('checked');
                        var currentRows = $('#usertable tbody tr');
                        $.each(currentRows, function () {
                            $(this).find(':checkbox[name=ckbox]').each(function () {
                                $(this).prop('checked', chk);
                            });
                        });
                    });
                    $(".assignbtn1").click(function () {
                        $('#assign').modal('show');
                        //var checkboxChecked = $('.custom-select input[name=ckbox]:checked');
                        //if ($(".checkbox").prop('checked') == true) {
                        //    $('#assign').modal('show');
                        //}
                        //else {
                        //    toastr.warning('please select POC to assign', 'POC Assign')
                        //}
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
                        idarray1 = idarray1.replace("on", '');
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
                            if (role != "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                                urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
                                obj = {
                                    "C_GUID": companyid,
                                    "USER_GUID": userid
                                }
                            }

                            else {
                                urlsales = apiurl + '/Company_Master/get_company_POC_mapping';
                                var obj = { "C_GUID": companyid }
                            }
                            if (response.message == 'Comapny-POC assigned to 24fd person Successfully.') {
                                toastr.success('POC Assigend Successfully.', 'POC Assigend')
                                $("#form-assign")[0].reset();

                                $.ajax({
                                    type: 'POST',
                                    url: urlsales,
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


        function poclist(response) {
            var data = response;

            myjson = data.dataObject;
            errorflag = data.code;
            console.log(myjson);

            if (errorflag === "500") {
                $('#' + divid).html("<div class='text-center'>Server Side Error .<div>");
            }
            else if (errorflag === "200" & myjson === null) {
                $('#' + divid).html("<div class='text-center'>Timeline data not available .<div>");
            }
            else {
                var img;
                var docwrap = "";
                //docwrap = docwrap + '<div class="row">';
                for (var i = 0; i < data.dataObject.length; i++) {
                    var item = data.dataObject[i];
                    docwrap = docwrap + '<div class="col-md-4">';
                    docwrap = docwrap + ' <div class="pocdetails">';
                    docwrap = docwrap + '<p> <strong>Name: </strong> <span id="name">' + item.name + '</span></p>';
                    docwrap = docwrap + '<p> <strong>Email: </strong><span id="mail">' + item.email + '</p>';
                    if (item.emaiL1 != "") {
                        docwrap = docwrap + '<p> <strong>Alternative Email: </strong><span id="mail">' + item.emaiL1 + '</p>';
                    }
                    else {
                     
                    }
                    docwrap = docwrap + '<p> <strong>Contact: </strong><span id="contact"><span id="number">' + item.contact + '</p>';
                    docwrap = docwrap + '<p> <strong>Designation: </strong><span id="desg">' + item.designation + '</p>';
                    docwrap = docwrap + '<p> <strong>Department: </strong><span id="dept">' + item.department + '</p>';
                    docwrap = docwrap + '<p> <strong>Assigned To: </strong><span id="dept">' + item.assignedto + '</p>';
                    if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                        docwrap = docwrap + '<i class="ri-edit-box-fill edit" id="' + item.poC_ID + '" style="right:5%;"></i>';
                    }
                    else {
                        docwrap = docwrap + '<input type="checkbox" name="chkbox" value="' + item.poC_ID + '" class="checkbox" />';
                        docwrap = docwrap + '<i class="ri-edit-box-fill edit" id="' + item.poC_ID + '"></i>';
                    }

                    docwrap = docwrap + '</div>';
                    docwrap = docwrap + '</div>';

                }
                //docwrap = docwrap + '<div class="col-md-4">';
                //docwrap = docwrap + '<div class="addbtn" data-bs-toggle="modal" data-bs-target="#Addpoc">';
                //docwrap = docwrap + '<i class="ri-add-line pico"></i>';
                //docwrap = docwrap + '</div>';
                //docwrap = docwrap + '</div>';
                //docwrap = docwrap + '</div>';
                $('#poclist').html(docwrap);
                $(document).on("click", ".edit", function () {

                    //var chk = $(".checkbox").val();
                    var mail = $(this).parent().find("#mail").html();
                    var name = $(this).parent().find("#name").html();
                    var number = $(this).parent().find("#number").html();
                    var desg = $(this).parent().find("#desg").html();
                    var dept = $(this).parent().find("#dept").html();
                    var chk = $(this).attr("id");
                    $("#pocid").val(chk)
                    $('#pocupdate').modal('show');
                    $("#nameup").val(name);
                    $("#emailup").val(mail);
                    $("#numberup").val(number);
                    $("#desigup").val(desg);
                    $("#deptup").val(dept);
                });

                $(document).on("click", ".checkbox", function () {
                    if ($('.checkbox').is(":checked")) {
                        searchIDs = $(this).val()
                        var searchIDs = $("input:checkbox:checked").map(function () {
                            return $(this).val();
                        }).get(); 
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
            }
        }

        var role = getCookies().DESIGNATION_ID;
        if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
            $(".assignbtn").show();
            $(".btnswrap").show();
            $(".assignbtn1").show();
        }
        else {
            $(".assignbtn").hide();
            $(".btnswrap").hide();
            $(".assignbtn1").hide();
        }

        $(".assignbtn").click(function () {
            $('#assign').modal('show');
            //if ($(".checkbox").prop('checked') == true) {
            //    $('#assign').modal('show');
            //}
            //else {
            //    toastr.warning('please select POC to assign', 'POC Assign')
            //}
        });

       

        $("#form-assign").submit(function (event) {
            event.preventDefault();
            var chk1 = $("#pocid1").val();
            var USER_GUID = $("#ddsales option:selected").val();
            var dataobj = {
                "POC_ID": chk1,
                "C_GUID": companyid,
                "USER_GUID": USER_GUID,
                "CREATED_BY": getCookies().USER_GUID,
            };

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
                if (response.message == 'Comapny-POC assigned to 24fd person Successfully.') {
                    toastr.success('POC Assigend Successfully.', 'POC Assigend')
                    $("#form-assign")[0].reset();
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
            var chk = $("#pocid").val();
            var Linkedin1 = $("#Linkedin1").val();

            var dataobj = {
                "POC_ID": chk,
                "NAME": nameu,
                "EMAIL": emailu,
                "CONTACT": numberu,
                "DESIGNATION": desigu,
                "DEPARTMENT": deptu,
                "ADDEDBY": getCookies().USER_GUID,
                "CONTACT1": numberval,
                "EMAIL1": emailval,
                "Linkedin": Linkedin1
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
                if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                    urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
                    obj = {
                        "C_GUID": companyid,
                        "USER_GUID": userid
                    }
                }

                else {
                    urlsales = apiurl + '/Company_Master/get_company_POC_mapping';
                    var obj = { "C_GUID": companyid }
                }


                if (response.message == 'Comapny-POC Updated Successfully.') {
                    toastr.success('POC Updated Successfully.', 'POC Updated')

                    $.ajax({
                        type: 'POST',
                        url: urlsales,
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

        var role = getCookies().ROLE_ID;
        var userid = getCookies().USER_GUID;
        if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
            obj = {
                "C_GUID": companyid,
                "USER_GUID": userid
            }

            $.ajax({
                type: 'POST',
                url: apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {
                    console.log(response);
                    poclist(response);

                }
            });
        }

        else {
            obj = { "C_GUID": companyid }
            $.ajax({
                type: 'POST',
                url: apiurl + '/Company_Master/get_company_POC_mapping',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {
                    console.log(response);
                    poclist(response);

                }
            });
        }

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
         
            var name = $("#txtname").val();
            var email = $("#txtemail").val();
            var number = $("#txtnumber").val();
            var desig = $("#txtdesig").val();
            var dept = $("#txtdept").val();
            var Linkedin = $("#Linkedin").val();

            if (number != "" || email != "") {
                var dataobj = {
                    "C_GUID": companyid,
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
                        urlsales = apiurl + '/Company_Master/get_company_POC_mapping';
                        var obj = { "C_GUID": companyid }
                    }

                    if (response.message == 'Comapny-POC Mapped Successfully.') {
                        toastr.success('POC Added Successfully.', 'POC Added')
                        $.ajax({
                            type: 'POST',
                            url: urlsales,
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


        if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
            var salesurl = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
            obj = {
                "C_GUID": companyid,
                "USER_GUID": userid
            }
        }
        else {
            salesurl = apiurl + '/Company_Master/get_company_POC_mapping'
            obj = { "C_GUID": companyid }
        }




        JsonUrl = apiurl + '/Company_Master/get_all_company_list?COMPANY_ID=' + companyid;
        $.getJSON(JsonUrl, { format: "json" }).done(function (data) {
            Name = data.dataObject[0].name;
            sName = data.dataObject[0].shorT_NAME;
            website = data.dataObject[0].website;
            hcity = data.dataObject[0].hO_CITY;
            hO_ADDRESS = data.dataObject[0].hO_ADDRESS;
            bcity = data.dataObject[0].b_CITY;
            b_ADDRESS = data.dataObject[0].b_ADDRESS;
            clients = data.dataObject[0].clienT_SINCE;
            n_BRANCHES = data.dataObject[0].n_BRANCHES;
            emP_STRENGTH = data.dataObject[0].emP_STRENGTH;
            distributors = data.dataObject[0].n_DISTRIBUTORS;
            turnover = data.dataObject[0].turnover;
            Sector = data.dataObject[0].sectoR_NAME;
            industry = data.dataObject[0].industrY_MAPPED;
            status = data.dataObject[0].status;
            $("#cname").text(Name);
            $("#website").text(website);
            $("#hcity").text(hcity);
            $("#hadd").text(hO_ADDRESS);
            $("#bcity").text(bcity);
            $("#badd").text(b_ADDRESS);
            $("#status").text(status);
            $("#clients").text(clients);
            $("#n_BRANCHES").text(n_BRANCHES);
            $("#emP_STRENGTH").text(emP_STRENGTH);
            $("#distributors").text(distributors);
            $("#turnover").text(turnover);
            $("#Sector").text(Sector);
            $("#industry").text(industry);
            $("#status").text(status);
        });
    </script>
</asp:Content>
