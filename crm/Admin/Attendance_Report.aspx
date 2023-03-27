<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Attendance_Report.aspx.cs" Inherits="CRM.Admin.Attendance_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet" />
    <style>
        .dt-buttons {
            width: 50%;
            display: flex;
            position: absolute;
            left: 16%;
            top: -10px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%-- <div>
            <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick="ExportExcel" />
        </div>--%>
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <div class="row .headrow">
                <div class="col-md-3">
                    <div class="table-head">
                        <h5>Attendance Report</h5>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="filters-wrap">
                        <div class="list-name">
                            <a href="AllEmployeeData" target="_blank" class="btnexport">Export All Data</a>
                        </div>
                        <div class="list-name">
                            <span>Total:</span>
                            <h5>&nbsp;<strong id="entries"></strong> Entries</h5>
                        </div>
                        <div class="list-name">
                            <i id="filter-icon" class="fa-solid fa-arrow-down-wide-short"></i>
                        </div>
                        <div class="list-name ms-3">
                            <div class="form-group MonthpickerWrap">
                                <i class="ri-calendar-event-fill"></i>
                                <input type="text" id="datepicker_month" class="form-control" placeholder="Select Months" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12 mt-4">
              
                <div class="col-md-12 filterwrap">
                    <div id="filter" class="col-md-3"></div>
                </div>

                <table id="usertable" class="display" style="width: 100%;">
                    <thead>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.print.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://rawgit.com/KidSysco/jquery-ui-month-picker/v3.0.0/demo/MonthPicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>

    <script src="js/main.js"></script>
    <script>




        $("#datepicker_month").datepicker({
            format: "MM yyyy",
            viewMode: "years",
            minViewMode: "months",
            autoclose: true,
        }).on('changeDate', function (e) {
            var date = (e.format());
            attendance(dateformat(date));
        });

        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('#datepicker_month').datepicker('setDate', today);
        function dateformat(date) {
            var date = date;
            var d = new Date(date.split("/").reverse().join("-"));
            var dd = d.getDate();
            var mm = d.getMonth() + 1;
            var yy = d.getFullYear();
            return (yy + "-" + mm)
        }

        var date = new Date();
        var dd = String(date.getDate()).padStart(2, '0');
        var mm = String(date.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = date.getFullYear();
        date = yyyy + '-' + mm;

        function attendance(date) {
            date = date;
            var obj = { "startdate": date + "-01" };
            $.ajax({
                type: 'POST',
                url: apiurl + '/Employee/get_all_employeed_attendance_record',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {
                    if (response == '' || response == null) {
                        $("#usertable").hide();
                    }
                    else {
                        $("#usertable").show();
                    }
                    var tbldata = response;
                    var my_columns = [];
                    $.each(tbldata[0], function (key, value) {
                        var my_item = {};
                        my_item.data = key;
                        my_item.title = key;
                        my_columns.push(my_item);
                    });

                    (usertable = $("#usertable").DataTable({
                        dom: 'lBfrtip',
                        buttons: [{
                            extend: 'excel',
                            text: 'Export To Excel &nbsp;&nbsp;<i class="ri-chat-download-fill"></i>',
                            titleAttr: 'excel',
                            title: 'date_excel',
                            exportOptions: {
                                rows: ':visible'
                            }

                        },

                        ],

                        "language": {
                            "emptyTable": "No Data Found"
                        },
                        order: [],
                        responsive: { details: { type: "column", target: "tr" } },
                        lengthMenu: [
                            [10, 25, 1e3, 500, 200, 100, 50, 25],
                            ["ALL", 1e3, 500, 200, 100, 50, 25, 10],
                        ],
                        pagingType: "full",
                        infoFiltered: !0,
                        aaData: tbldata,
                        "columns": my_columns,


                        columnDefs: [
                            { "width": "120px", "targets": 3 },
                            {
                                targets: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30],
                                "orderable": false
                            },
                            {
                                "className": "",
                                targets: [6]
                            },
                        ],

                        createdRow: function (e, t, a) {
                            switch (t.DECLARATION) {
                                case "0":
                                case "1":
                                    $("td", e).css("background-color", "#ffffff"), $("td", e).css("color", "black"), $("td", e).css("font-weight", "500");
                            }
                        },

                        initComplete: function () {
                            var info = this.api().page.info();

                            $("#entries").html(info.recordsTotal);
                            var cfiltercol = [];
                            cfiltercol = [];
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

                        $('#usertable tbody').on("click", '.Empcode', function (event) {
                            var obj = usertable.row($(this).parents('tr')).data();
                            var userID = obj.useR_GUID;
                            window.location.href = 'user-profile.aspx?uid=' + userID

                        });


                    $(document).on("change", "#fromdatef", function (e) {
                        e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
                        var t = $("#fromdatef").val();
                        "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), usertable.draw();
                    });
                },

            });
        }

        $("#datepicker_month").datepicker({
            format: "MM yyyy",
            //altFormat:"dd-mm-yyyy",
            viewMode: "years",
            minViewMode: "months",
            autoclose: true
        }).on('changeDate', function (e) {
            var date1 = e.format();
            var date2 = formatDate(date1);
            $('#usertable').dataTable().fnDestroy();
            attendance(date2);
        });


        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2)
                month = '0' + month;
            if (day.length < 2)
                day = '0' + day;
            // alert([year, month].join('/'));
            return [year, month].join('-');
        }

        $(document).ready(function () {

        });



    </script>
</asp:Content>
