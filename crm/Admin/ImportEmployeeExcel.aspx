<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportEmployeeExcel.aspx.cs" Inherits="Admin_ImportEmployeeExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="css/page.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="css/nav.css" />

    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            border: 1px solid gray;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        td {
            background: #fff;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        input[type=file] {
            display: block;
            font-size: 1.2em;
            padding: 4px;
            border-radius: 5px;
            width: 100%;
            background-color: white;
        }

        .card-title {
            color: #ffffff !important;
            /* font-weight: 500 !important; */
        }

        th {
            text-align: inherit;
            padding: 5px;
            background-color: #007dc4;
            color: white;
            text-align: center;
        }

        td {
            padding: 5px;
        }

        #error {
            display: none;
            margin-left: .5rem;
            font-size: 0.9rem;
            z-index: 9999;
            width: 30%;
            text-align: left;
            right: 0;
            top: 10%;
            position: fixed;
            padding: 10px;
            padding-left: 0;
            color: white;
            /* height: 25px; */
            box-shadow: 0px 0px 5px grey;
            overflow: hidden;
            background-color: #2a3140;
        }
    </style>
</head>
<body>
   <div id="AddUser_errorwrap" class="text-center pt-2 col-md-12 col-sm-6 col-xs-12 mastererror"></div>
 
    <div class="content pt-3 bg_body">

        <form id="form1" runat="server">

            <div class="row" style="">
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control-uniform-custom" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
                </div>
                <div class="col-md-3">
                    <a href="test_user.xlsx" class="btn btn-info w-100 text-uppercase" download">Download Example Upload Format</a>
                </div>
                
            </div>
           <%-- <div class="row">
                  <div class="col-md-3">
                                                <label>Category <span class="text-danger">*</span></label>
                                                <select id="ddcatsource" data-placeholder="Select Category Source" class="form-control form-control-lg" >
                                                    <option></option>
                                                </select>
                                                <asp:HiddenField ID="Hiddencat" runat="server" />
                                                <asp:HiddenField ID="Hiddencat_text" runat="server" />
                                            </div>
                  <div class="col-md-3">
                                                <label>Lead Source <span class="text-danger">*</span></label>
                                                <select id="ddleadsource" data-placeholder="Select Lead Source" class="form-control form-control-lg" >
                                                    <option></option>
                                                </select>
                                                <asp:HiddenField ID="Hiddenlead" runat="server" />
                                                <asp:HiddenField ID="Hiddenlead_text" runat="server" />
                                            </div>
                  <div class="col-md-3">
                                                    <label id="owner" for="unit">Owner  <span class="text-danger">*</span></label>
                                                    <div class="input-group">
                                                        <select name="unit" data-placeholder="Select Owner" id="ddassign" class="form-control select-clear">
                                                            <option></option>
                                                        </select>
                                                    </div>
                                                    <asp:HiddenField ID="hdn_ddassign" runat="server" />
                                                    <asp:HiddenField ID="hdn_ddassign_txt" runat="server" />
                                                     <label id="lbl_error_owner" class="servererror"></label>
                                                </div>

<%--                   <div class="col-md-3">
                                                    <label id="status" for="unit">Status  <span class="text-danger">*</span></label>
                                                    <div class="input-group">
                                                        <select name="unit" data-placeholder="Select Owner" id="ddstatus" class="form-control select-clear">
                                                            <option></option>
                                                        </select>
                                                    </div>
                                                    <asp:HiddenField ID="hdn_ddstatus" runat="server" />
                                                    <asp:HiddenField ID="hdn_ddstatus_txt" runat="server" />
                                                     <label id="lbl_status" class="servererror"></label>
                                                </div>
              
            </div>--%>

            <div class="row">
                <div class="col-md-3">
                    <asp:Button ID="Check" runat="server" Text="Upload Excel" OnClick="Check_Click" class="btn btn-success w-100 text-uppercase" />

                </div>
            </div>
            <div class="row pt-2">
                <div class="col-md-12">
                    <div class="exceldiv">
                        <div class="card">
                            <div class="card-header header-elements-inline">
                                 
                                <h5 class="card-title"><i class="fa fa-clone fa-1x "></i>&nbsp;&nbsp;Uploaded Leads</h5>
                               <asp:Label ID="lbl_catsource" runat="server" Text=""></asp:Label>
                                 <asp:Label ID="lbl_leadsource" runat="server" Text=""></asp:Label>
                                <div class="header-elements">
                                    <div class="list-icons">
                                        <a class="list-icons-item" data-action="collapse"></a>
                                        <a class="list-icons-item" data-action="fullscreen"></a>
                                        <%--    <a class="list-icons-item" data-action="remove"></a>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">

                        <asp:GridView ID="GridView1" AutoGenerateColumns="true" runat="server" OnRowDataBound="GridView1_RowDataBound" CssClass="Grid" Width="600" RowStyle-Wrap="false">
                        </asp:GridView>
                                
                            </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-6">
                    <div class="block-head" style="">

                        <span id="successcount" runat="server" style="margin-left: 20px; line-height: 15px; background-color: #4caf50; padding: 0px; color: white; font-size: 1rem; border-radius: 2px;"></span>
                    </div>

                    <div class="block-head" style="">
                        <span id="failurecount" runat="server" style="margin-left: 20px; line-height: 15px; background-color: #f44336; padding: 0px; color: white; font-size: 1rem; border-radius: 2px;"></span>

                    </div>
                      <div class="block-head" style="">
                        <span id="failurecount_wrongstatus" runat="server" style="margin-left: 20px; line-height: 15px; background-color: #f44336; padding: 0px; color: white; font-size: 1rem; border-radius: 2px;"></span>

                    </div>

                </div>

                <div class="col-md-6">
                    <div class="block-head p-1" id="errordisplaydiv" style="background-color: #ffffff; font-size: 1.2rem; color: #f44336; display: none; border-radius: 2px;" runat="server"><span id="errorcount" runat="server"></span> Error</div>

                    <div id="errorListdiv" runat="server" style="background-color: #f44336; color: white; padding: 0px 2rem; border-radius: 2px;">
                    </div>

                </div>
                <div class="col-md-6">
                    <div id="Successdisplaydiv" runat="server" style="display: none; width: 100%; border-radius: 2px;">
                    </div>

                </div>
            </div>

            <div class="row pt-2">
                <div class="col-md-12 col-sm-12" style=" border-radius: 2px;">

                    <div id="duplicatedsitewrapper" runat="server">
                        <div class="card">
                            <div class="card-header header-elements-inline">
                                <h5 class="card-title"><i class="fa fa-clone fa-1x "></i>&nbsp;&nbsp;Duplicate Leads</h5>
                                <div class="header-elements">
                                    <div class="list-icons">
                                        <a class="list-icons-item" data-action="collapse"></a>
                                        <a class="list-icons-item" data-action="fullscreen"></a>
                                        <%--    <a class="list-icons-item" data-action="remove"></a>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <asp:Button Text="Export" ID="btnexport" runat="server" class="btn btn-success mb-2" Style="padding: 3px 12px; background-color: #2461bf; height: 28px;" OnClick="btn_export" />

                                        <asp:GridView ID="GridView3" AutoGenerateColumns="true" runat="server" Width="600" RowStyle-Wrap="false">
                                            <RowStyle CssClass="oddRow" />
                                            <AlternatingRowStyle CssClass="evenRow" />
                                        </asp:GridView>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="" id="successlistdiv" runat="server" style="margin-left: 20px; line-height: 15px; background-color: #4caf50; padding: 0px; color: white; font-size: 1rem; border-radius: 2px;"></div>
                                    </div>
                                  
                                </div>


                            </div>

                            
                        </div>

                    </div>

                </div>

            </div>

            <div class="row pt-2">
                <div class="col-md-12 col-sm-12" style=" border-radius: 2px;">

                    <div id="wrongsitewrapper" runat="server">
                        <div class="card">
                            <div class="card-header header-elements-inline">
                                <h5 class="card-title"><i class="fa fa-clone fa-1x "></i>&nbsp;&nbsp;Wrong status Sites</h5>
                                <div class="header-elements">
                                    <div class="list-icons">
                                        <a class="list-icons-item" data-action="collapse"></a>
                                        <a class="list-icons-item" data-action="fullscreen"></a>
                                        <%--    <a class="list-icons-item" data-action="remove"></a>--%>
                                    </div>
                                </div>
                            </div>

                           <%-- <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <asp:Button Text="Export" ID="btnexportwrongstatus" runat="server" class="btn btn-success mb-2" Style="padding: 3px 12px; background-color: #2461bf; height: 28px;" OnClick="btn_export_wrong_status" />

                                        <asp:GridView ID="grd_wrong_sites_inserted" AutoGenerateColumns="true" runat="server" Width="600" RowStyle-Wrap="false">
                                            <RowStyle CssClass="oddRow" />
                                            <AlternatingRowStyle CssClass="evenRow" />
                                        </asp:GridView>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="" id="wrongstatuslistdiv" runat="server" style="margin-left: 20px; line-height: 15px; background-color: #4caf50; padding: 0px; color: white; font-size: 1rem; border-radius: 2px;"></div>
                                    </div>
                                  
                                </div>


                            </div>--%>

                            
                        </div>

                    </div>

                </div>

            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 text-center pl-2" id="error">
                <asp:Label ID="errorwrap" ForeColor="red" runat="server" class=""> </asp:Label>

            </div>
        </form>

    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/page.js"></script>

    <script>
        $("#ContentPlaceHolder1_Check").click(function () {

            var strconfirm = confirm("Are you sure, you want to Upload this Excel Sheet?");
            if (strconfirm == true) {
                //var leadsourceid = $("#ddleadsource option:selected").val();
                //var catsourceid = $("#ddcatsource option:selected").val();
                //var bde_id = $("#ddassign option:selected").val();

                ////alert(leadsourceid);
                //if (catsourceid == "" || typeof catsourceid === 'undefined') {
                //    error_msg("Please Select Category.");
                //    return false;
                //}

                //if (leadsourceid == "" || typeof leadsourceid === "undefined") {
                //    error_msg("Please Select Lead Source.");
                //    return false;
                //}
                //if (bde_id == "" || typeof bde_id === "undefined") {
                //    error_msg("Please Select Sale Coordinator.");
                //    return false;
                //}

                if (document.getElementById("ContentPlaceHolder1_FileUpload1").files.length == 0) {
                    error_msg("Excel File Not Selected.");

                    return false;
                }

                else {

                    $("#loadingdiv").show();
                    return true;
                }
            }
            else {
                return false;
            }
        });


        $(document).ready(function () {

            bindselect(ckurl2 + "/UserLogin.svc/get_user_select2/1DE7E6D0-60F5-45DB-B029-1129E2659E6A", "ddassign", "AddUser_errorwrap");
            $("#ddassign").on('change', function () {
                var value = $(this).val();
                $('#ContentPlaceHolder1_hdn_ddassign').val(value);
            });

            bindselect(apiurl1 + "/Category.svc/get_category_select2", "ddcatsource", "AddUser_errorwrap");


            $('#ddcatsource').on('change', function () {
                var val = $(this).val();

                $('#ddleadsource').empty();

                bindselect(apiurl1 + "/Lead_Source.svc/get_lead_source_select2/" + val, "ddleadsource", "AddUser_errorwrap");
                setTimeout(function () {
                    $('#ContentPlaceHolder1_Hiddencat').val($("#ddcatsource option:selected").val());
                    $('#ContentPlaceHolder1_Hiddenlead').val($("#ddleadsource option:selected").val());
                    $('#ContentPlaceHolder1_Hiddencat_text').val($("#ddcatsource option:selected").text());
                    $('#ContentPlaceHolder1_Hiddenlead_text').val($("#ddleadsource option:selected").text());

                }, 500);

            });


            $('#ddleadsource').on('change', function () {

                var catname = $.trim($("#ddcatsource option:selected").val());
                var leadsource = $.trim($("#ddleadsource option:selected").val());
                //alert(leadsource);
                setTimeout(function () {
                    $('#ContentPlaceHolder1_Hiddencat').val(catname);
                    $('#ContentPlaceHolder1_Hiddenlead').val(leadsource);
                    $('#ContentPlaceHolder1_Hiddenlead_text').val($("#ddleadsource option:selected").text());

                }, 500);

            });
            var lead_cn = $('#spn_count_successList').text();
            var callerid = $('#ContentPlaceHolder1_hdn_ddassign').val();
            //alert(lead_cn);
            //alert(callerid);
            if (lead_cn == "" || lead_cn == "0" ) {
                //alert("blank");

            }
            else {
               
                var data_noti = { "ASSIGGNED_TO": callerid, "LEAD_COUNT": lead_cn };

                var saveData_noti = $.ajax({
                    type: 'POST',
                   //url: "http://localhost:61081/Notifications_Management.svc/Notification_for_bulk_upload_to_BDE",
                   url: apiurl1 + "Notifications_Management.svc/Notification_for_bulk_upload_to_BDE",
                    data: JSON.stringify(data_noti),
                    dataType: "json",
                    contentType: 'application/json;charset=utf-8 ',
                    success: function (resultData) {

                       // alert("Success");
                    }
                });
            }
           

        });
    </script>
</body>
</html>
