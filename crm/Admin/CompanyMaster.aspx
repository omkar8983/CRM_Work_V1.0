<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CompanyMaster.aspx.cs" Inherits="CRM.Admin.CompanyMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
    <link rel='stylesheet' href='css/yearpicker.css' />
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" action="./user-list" id="form1"></form>
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">

            <div class="col-md-3">
                <div class="table-head">
                    
                    <h5> Company List</h5>
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
                        <a class="user-text" data-bs-toggle="modal" data-bs-target="#AddUser"><i class="fa-solid fa-plus"></i>
                            Add Company</a>
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
                            <th>Name</th>
                            <th>Branch City</th>
                            <th>Sector</th>
                            <th>Industry</th>
                            <th>Added</th>
                            <th>Approval</th>
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
    <div class="modal fade" id="AddUser" tabindex="-1" aria-labelledby="AddUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddUserLabel">Add Company </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="formwrap row">
                        <form class="row" enctype="multipart/form-data" id="form-user">
                            <div class="col-md-4 mb-3">
                                <label for="">Company Name <span class="star">*</span></label>
                                <input type="text" class="form-control" id="c-name" placeholder="Company-Name" required>
                            </div>
                            <div class="col-md-4 mb-3">

                                <label for="">Short Name </label>
                                <input type="text" class="form-control" id="s-name" placeholder="Short-Name">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Company Type </label>
                                <input type="text" class="form-control" id="ctype" placeholder="Company Type">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Select Sector <span class="star">*</span></label>
                                <select name="desig" class="form-control" id="ddsector" required>
                                    <option value="">Select Sector</option>
                                </select>
                            </div>
                              <div class="col-md-4 mb-3">
                                <label for="">Select Industry Type <span class="star">*</span></label>
                                <select class="form-control" id="ddindustry" name="ddindustry[]" multiple="multiple" required>
                                    <option value="">Select Industry Type</option>
                                </select>

                            </div>
                           
                       <div class="col-md-4 mb-3">
                                <label for="">Client Since </label>
                                 <input type="text" class="yearpicker form-control" value="" required/>
                          
                            </div>
                             
                            <div class="col-md-4 mb-3">
                                <label for="">Landline <span class="star">*</span></label>
                                <input type="number" class="form-control" id="l-number" aria-describedby="Landline" pattern="^[6-9]\d{9}$" title="Example (8888444422)" placeholder="Contact" maxlength="10" required />
                            </div>
                                 <div class="col-md-4 mb-3">
                                <label for="">Website </label>
                                <input type="text" class="form-control" id="Website" placeholder="Website">
                            </div> 
                            <div class="col-md-4 mb-3">
                                <label for="">Linkedin </label>
                                <input type="text" class="form-control" id="Linkedin" placeholder="Linkedin">
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="">Select Status <span class="star">*</span></label>
                                <select name="hub" id="status" class="form-control">
                                    <option value="">select Status</option>
                                    <option value="ACTIVE">Active</option>
                                    <option value="INACTIVE">Inactive</option>
                                </select>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="">Head office city </label>
                                <input type="text" class="form-control" id="hcity" placeholder="Head office city " >
                            </div>
                            <div class="col-md-4">
                                <label>Head office Address <span class="star">*</span></label>
                                <textarea class="form-control" name="" id="hadd" cols="30" rows="0" placeholder="Head office Address"></textarea>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Branch city </label>
                                <input type="text" class="form-control" id="bcity" placeholder="Branch city " required>
                            </div>
                            <div class="col-md-4">
                                <label>Branch Address</label>
                                <textarea class="form-control" name="" id="badd" cols="30" rows="0" placeholder="Branch Address"></textarea>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Employee Strength </label>
                                <input type="number" class="form-control" id="strength" aria-describedby="strength" placeholder="Employee Strength " maxlength="30" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Number of Branches </label>
                                <input type="number" class="form-control" id="Nbranches" aria-describedby="strength" placeholder="Number of Branches " maxlength="30" />
                            </div>
                             <div class="col-md-4 mb-3">
                                <label for="">Turnover </label>
                                <input type="number" class="form-control" id="Turnover" aria-describedby="Turnover" placeholder="Turnover " maxlength="30" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="">Number of Distributors </label>
                                <input type="number" class="form-control" id="ndistributors" aria-describedby="Turnover" placeholder="Number of Distributors  " maxlength="30"  />
                            </div>
                             <div class="col-md-4 mb-3">
                                <label for="">Select Region</label>
                                <select name="region" id="Region" class="form-control" required>
                                    <option value="">select Region</option>
                                    <option value="North">North</option>
                                    <option value="East">East</option>
                                    <option value="West">West</option>
                                    <option value="South">South</option>
                                </select>
                            </div>
                            <div class="col-md-4 profile-img">
                                <label for="">Add Company Logo </label>
                                <i class="attachment fa-solid fa-paperclip"></i>
                                <input type="file" accept=".jpg, .jpeg, .png" class="form-control" id="logo-img" placeholder="Add Profile picture">
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
    

    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
     <script src= "js/yearpicker.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(document).ready(function () {
            $(".yearpicker").yearpicker({
                startYear: new Date().getFullYear() - 10,
                endYear: new Date().getFullYear() + 10,
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
                alert('1');
            }

        }

        $("#filter-icon").click(function () {
            $(".filterwrap").slideToggle(500);
            $("#filter").css("display", "flex");
        });

        //alert(getCookies().PRofILE_IMG);

        $("#form-user").submit(function (event) {
            event.preventDefault();
            var Region = document.getElementById('Region').value;
            var status = document.getElementById('status').value;
            //var indusrty = document.getElementById('ddindustry').value;
            var form = new FormData();
            form.append("NAME", $("#c-name").val());
            form.append("SHORT_NAME", $("#s-name").val());
            form.append("LANDLINE", $("#l-number").val());
            form.append("Linkedin", $("#Linkedin").val());
            form.append("CTYPE", $("#ctype").val());
            form.append("CLIENT_SINCE", $(".yearpicker").val());
            form.append("WEBSITE", $("#Website").val());
            form.append("STATUS", status);
            form.append("HO_CITY", $("#hcity").val());
            form.append("HO_ADDRESS", $("#hadd").val());
            form.append("B_CITY", $("#bcity").val());
            form.append("B_ADDRESS", $("#badd").val());
            form.append("CREATED_BY", getCookies().USER_GUID);
            form.append("EMP_STRENGTH", $("#strength").val());
            form.append("N_BRANCHES", $("#Nbranches").val());
            form.append("TURNOVER", $("#Turnover").val());
            form.append("N_DISTRIBUTORS", $("#ndistributors").val());
            form.append("REGION", Region);
            form.append('Image', $('#logo-img')[0].files[0]);
            form.append("INDUSTRY_ID", $("#ddindustry").val());
            form.append("SECTOR_ID", $("#ddsector option:selected").val());

            console.log(form);

            var settings = {
                "url": apiurl + '/Company_Master/AddCompany',
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
                    toastr.success('Company Added Successfully.', 'User Added')
                    var JsonUrl = apiurl + '/Company_Master/get_all_company_list?COMPANY_ID=ALL';
                        $.getJSON(JsonUrl, { format: "json" }).done(function (data) {
                                var item = data.dataObject;
                                usertable.clear().draw();
                                usertable.rows.add(item);
                                usertable.columns.adjust().draw();
                        });

                    $("#form-user")[0].reset();
                    $("#ddreport").val('');
                }

                else if (resp.message == '0') {
                    toastr.warning('Existing Company.', 'Existing Employee')
                }
                else {
                    toastr.error('Something went wrong. Please try again!.', 'Error')
                    console.log(response);
                }
            });

        });

        $("#pagename").text('Company Master');

        $(document).ready(function () {
            bindselect(apiurl + '/Master/get_sector_list', 'ddsector');

            $("#ddsector").change(function () {
                var sectorid = this.value;
                $("#ddindustry").empty();
                bindselect(apiurl + '/Master/get_industry_list?sector_id=' + sectorid + '', 'ddindustry');
            });

            function remarkrender(remark) {
                if (remark == "ACTIVE" || "Active") {
                    return '<p class="present status">Active</p>'
                }
                else if (remark == "Inactive") {
                    return '<p class="absent status">Inactive</p>'
                }
                
            }

            var role = getCookies().DESIGNATION_ID;
            if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                var dataurl = apiurl + "/Company_Master/get_all_company_list?COMPANY_ID=ALL";
            }

            else {
                window.location = "Assignedcompanies.aspx";
            }

           
            $.getJSON(dataurl, { format: "json" }).done(function (data) {
                $('#loader1').removeClass('hidden');
                // Object split 
                myjson = data.dataObject;
                if (myjson === null) {
                    $('#usertable').hide();
                    $('#errWrap').show();
                }
                else {
                    $('#usertable').show();
                    $('#errWrap').hide();
                    usertable = $('#usertable').DataTable({
                        "fdom": '',
                        buttons: {
                            dom: {
                                button: {
                                    className: 'btn btn-light'
                                }
                            },
                            buttons: [
                                { extend: 'excelHtml5', title: 'Folloup-Report SC' }

                            ]
                        },
                        "order": [],
                        responsive: {
                            details: {
                                type: 'column',
                                target: 'tr'
                            }
                        },
                        "dom": 'Bfrtip',
                        "lengthMenu": [[10, 50, 100, 200, 500, 1000, -1], [10, 50, 100, 200, 500, 1000, "All"]],
                        "pagingType": "full",
                        "infoFiltered": true,
                        "processing": true,
                        language: {
                            paginate: {
                                next: '<i class="ri-arrow-right-circle-line tblico"></i>', // or '→'
                                previous: '<i class="ri-arrow-left-circle-line tblico"></i>' // or '←' 
                            }
                        },
                        //-----------------------Ajax data code---------------------------------------->
                        aaData: myjson,
                        destroy: true,

                        "columns": [
                            { "data": "name" },
                            { "data": "b_CITY" },
                            { "data": "sectoR_NAME" },
                            { "data": "industrY_MAPPED" },
                            { "data": "addedBy" },
                            {
                                "data": "isActive",
                                "mRender": function (data, type, row) {
                                    if (row.isActive == '0') {

                                        return '<div class="Approvtbtn tblbtn" data-id="1" style="width:95px; font-size:11px;" >Approve <i class="ri-check-double-fill"></i></div>  <div class="Rejectbtn tblbtn redbtn" data-id="2"  style="width:95px; font-size:11px; margin-left:5px;" >Reject <i class="ri-close-line"></i></div> '
                                    }
                                    else if (row.isActive === '1') {
                                        return '<p class="leaveText"> <i class="ri-checkbox-multiple-fill approveIcon"></i>  Approved</p>'
                                    }
                                    else if (row.isActive === '2'){
                                        return '<p class="leaveText"><i class="ri-close-circle-fill rejectIcon"></i> Rejected </p>'
                                    }
                                }
                            },
                            {
                                "mData": function (data, type, dataToSet) {
                                    return remarkrender(data.status);
                                }
                            },


                        ],

                        columnDefs: [
                            { "width": "100px", "targets": 3 },
                            { "width": "170px", "targets": 5 },
                            { "width": "80px", "targets": 6 },
                            {
                                targets: [0, 1],
                                "orderable": false
                            },
                        ],

                        "createdRow": function (row, data, dataIndex) {

                            switch (data["isActive"]) {
                                case "True": $("td", row).css("background-color", "#fff");
                                    break;
                                case "False": $("td", row).css("background-color", "#ccc");
                                    $("td .present", row).text("pending");
                                    $("td .present", row).css("background", "#92abb3");
                                    $("td .present", row).css("color", "#4f606c");
                                    break;
                            }
                        },

                        initComplete: function () {
                            var info = this.api().page.info();

                            $("#entries").html(info.recordsTotal);
                            var cfiltercol = [];
                            cfiltercol = [2, 4, 1, 6];
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
                    });
                }


                $('#usertable tbody').on("click", '.tblbtn', function (event) {
                    var obj = usertable.row($(this).parents('tr')).data();
                    var cid = obj.c_GUID;
                    var vald = $(this).attr("data-id");

                    var obj = {
                        "CREATED_BY": getCookies().USER_GUID,
                        "C_GUID": cid,
                        "IsActive": vald
                    }
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
                            var settings = {
                        "url": apiurl + '/Company_Master/update_company_approval_status_addedbyPOC',
                                "method": "POST",
                                "timeout": 0,
                                "headers": {
                                    "Content-Type": "application/json"
                                },
                                "data": JSON.stringify(
                                    obj
                                ),
                    };

                    $.ajax(settings).done(function (response) {
                        var resp = JSON.parse(response)
                        console.log(resp);
                        if (resp == '1') {
                            toastr.success('Company Aprroved Successfully.', 'Aprroved')
                            var JsonUrl = apiurl + '/Company_Master/get_all_company_list?COMPANY_ID=ALL';
                            $.getJSON(JsonUrl, { format: "json" }).done(function (data) {
                                var item = data.dataObject;
                                usertable.clear().draw();
                                usertable.rows.add(item);
                                usertable.columns.adjust().draw();
                            });

                            $("#form-user")[0].reset();
                            $("#ddreport").val('');
                        }

                        else if (resp.message == '2') {
                            toastr.warning('Company Rejected', 'Rejected')
                        }
                        else {
                            toastr.error('Something went wrong. Please try again!.', 'Error')
                            console.log(response);
                        }
                    });
                        }
                    });

                });

                $('#usertable tbody').on("click", '.status', function (event) {
                    var obj = usertable.row($(this).parents('tr')).data();
                    var cid = obj.c_GUID;
                    window.open('CompanyDetails.aspx?cid=' + cid);
                });
            });
        });

    </script>

</asp:Content>
