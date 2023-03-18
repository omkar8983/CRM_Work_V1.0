<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="pocDetails.aspx.cs" Inherits="CRM.Admin.pocDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn:hover {
    color: #fff;
    background-color: #0b5ed7;
    border-color: #0a58ca;
    width: auto!important;
}
        .btn{
            margin:0 5px;
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
                        <h2 id="pname">24 Framed Digital</h2>
                    </div>
                    <div class="companydetails row">
                        <div class="col-md-3">
                            <div class="cdetails">
                                <h5>Company Name </h5>
                                <p id="cname">www.24framesdigital.com</p>
                                <h5>linkedin </h5>
                                <p id="linkedin">www.24framesdigital.com</p>
                               <h5>Department </h5>
                                <p id="dept">www.24framesdigital.com</p>
                            </div>
                        </div>

                         <div class="col-md-3">
                            <div class="cdetails">
                                <h5>Email </h5>
                                <p id="assign">t@t.com</p>
                                <h5>Alternate Email </h5>
                                <p id="added">t@t.com</p>
                                <h5>designation</h5>
                                <p id="desg">t@t.com</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="cdetails">
                                 <h5>Contact Number </h5>
                                <p id="contact">8983287666</p>
                                <h5>Alternate number </h5>
                                <p id="acontact">8983287666</p>

                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="cdetails">
                                <h5>Email </h5>
                                <p id="email">t@t.com</p>
                                <h5>Alternate Email </h5>
                                <p id="aemail">t@t.com</p>
                            </div>
                        </div>

                    </div>
                     
                </div>

            </div>
            <div class="mt-3">
                <div class="btnwarp1">
                <div class="btntask btntbl">Daily Activity</div>
<%--                <div class="mom btntbl">MOM</div>--%>
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
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>

                <div class="btnwarp1 mt-3">
                <div class="btntask btntbl">TODO</div>
<%--                <div class="mom btntbl">MOM</div>--%>
                </div>

                <div class="list-name mb-3" style="margin-left:0;">
                    <a id="overdue" class="btn btn-danger">Overdue</a>
                    <a id="today" class="btn btn-primary">Today</a>
                    <a id="upcoming" class="btn btn-success">Upcoming</a>
                    </div>

                  <table id="usertable1" class="display" style="width: 100%;">
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
                            <th>Status</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
            
           
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
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
        var uid = getCookies().USER_GUID;;
        var urlParams = new URLSearchParams(window.location.search);
        var companyid = urlParams.get('cid');
        var pocid = urlParams.get('poc_id');

        var obj = {
            "CID": companyid
        }

        $.ajax({
            type: 'POST',
            url: "https://crmapi.24fd.com/Company_Master/get_company_POC_details",
            dataType: "json",
            contentType: 'application/json;charset=utf-8 ',
            data: JSON.stringify(obj),
            async: false,
            processData: false,
            success: function (response) {
                var item = response.dataObject;
                $("#pname").text(item[0].name);
                $("#cname").text(item[0].companY_NAME);
                $("#contact").text(item[0].contact);
                $("#acontact").text(item[0].contacT1);
                $("#email").text(item[0].email);
                $("#aemail").text(item[0].emaiL1);
                $("#linkedin").text(item[0].linkedin);
                $("#assign").text(item[0].assignedto);
                $("#added").text(item[0].addedby);
                $("#dept").text(item[0].department);
                $("#desg").text(item[0].designation);

                console.log(item);
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


        $(document).ready(function () {
            function dateformat(date) {
                var date = date;
                var d = new Date(date.split("/").reverse().join("/"));
                var dd = d.getDate();
                var mm = d.getMonth() + 1;
                var yy = d.getFullYear();
                return (yy + "-" + mm + "-" + dd);
            }
            var obj1 = {
                "USER_GUID": getCookies().USER_GUID,
                "POC_ID": pocid,
                "STATUS": "COMPLETED"
            }

            $.ajax({
                type: 'POST',
                url: "https://crmapi.24fd.com/DailyActivity/get_daily_activity_underPOC",
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
                            { "data": "status" },

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

                        $(document).on("change", "#fromdatef", function (e) {
                            e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
                            var t = $("#fromdatef").val();
                            "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), usertable.draw();
                        });
                },

            });

          

            function gettodo(tbldate) {
                var obj = { "USER_GUID": uid, "STATUS": "PENDING", "DATE_FILTER": tbldate }
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


            $("#overdue").click(function () {
                gettodo('OVERDUE');
            });

            $("#today").click(function () {
                gettodo('TODAY');
            });

            $("#upcoming").click(function () {
                gettodo('UPCOMING');
            });



            var obj2 = {
                "USER_GUID": getCookies().USER_GUID,
                "POC_ID": pocid,
                "STATUS":"PENDING",
                "DATE_FILTER":"TODAY",
            }
            $.ajax({
                type: 'POST',
                url: "https://crmapi.24fd.com/DailyActivity/get_daily_activity_underPOC",
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj2),
                async: false,
                processData: false,
                success: function (response) {

                    var tbldata = response.dataObject;
                    (usertable = $("#usertable1").DataTable({
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
                            { "data": "status" },

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
