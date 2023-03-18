<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AllEmployeeData.aspx.cs" Inherits="CRM.Admin.AllEmployeeData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet" />
    <style>
        .mainWrap {
            justify-content: center;
        }

        h3 {
            margin-bottom: 0;
        }

        .eximgbox img {
            width: 100%;
            margin-top: -20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
         <asp:HiddenField ID="hdndate" runat="server" />
    <asp:HiddenField ID="hdnhub" runat="server" />
   
   
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
            <div class="exportBox">
                <h3>Export Employee Attendance Data</h3>
                <div class="eximgbox">
                    <img src="images/export.svg" />
                </div>
                <div class="row">
                    <div class="col-md-4">
                      <select name="hub" id="hub" class="form-control" required>
                            <option value="">select Hub</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Banglore">Banglore</option>
                            <option value="Delhi">Delhi</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group MonthpickerWrap">
                            <i class="ri-calendar-event-fill"></i>
                            <input type="text" id="datepicker_month" class="form-control" placeholder="Select Months" required/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnExport" class="btnexport" runat="server" Text="Export To Excel" OnClick="ExportExcel" />
                    </div>
                </div>

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

    <script type="text/javascript">
        $("#datepicker_month").datepicker({
            format: "MM yyyy",
            viewMode: "years",
            minViewMode: "months",
            autoclose: true,
        }).on('changeDate', function (e) {
            var date = (e.format());
            var date2 = formatDate(date);
            $("#ContentPlaceHolder1_hdndate").val(date2 + "-01");
        });

        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('#datepicker_month').datepicker('setDate', today);

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
        $("#hub").change(function () {
            var hub = $("#hub option:selected").val()
            $("#ContentPlaceHolder1_hdnhub").val(hub);
        });
    </script>

         </form>
</asp:Content>
