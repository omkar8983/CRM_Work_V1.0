<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="momDetails.aspx.cs" Inherits="CRM.Admin.momDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <h5>Meeting Type </h5>
                                <p id="linkedin">www.24framesdigital.com</p>
                               <h5>24FD Team Members </h5>
                                <p id="dept">www.24framesdigital.com</p>
                            </div>
                        </div>

                         <div class="col-md-3">
                            <div class="cdetails">
                                <h5>Date </h5>
                                <p id="assign">t@t.com</p>
                                <h5>Start Tme</h5>
                                <p id="added">t@t.com</p>
                                <h5>End Time</h5>
                                <p id="desg">t@t.com</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="cdetails">
                                 <h5>POC List</h5>
                                <p id="contact">8983287666</p>
                                <h5>thirdpartY_MAPPING </h5>
                                <p id="acontact">8983287666</p>

                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="cdetails">
                                <h5>Points Discussed </h5>
                                <p id="email">t@t.com</p>
<%--                                <h5>Alternate Email </h5>
                                <p id="aemail">t@t.com</p>--%>
                            </div>
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
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="js/main.js"></script>
    <script>

        var urlParams = new URLSearchParams(window.location.search);
        var companyid = urlParams.get('MID');
        var pocid = urlParams.get('poc_id');

        var obj = {
            "MID": companyid
        }
        $.ajax({
            type: 'POST',
            url: "https://crmapi.24fd.com/MOM/get_MOM_by_mom_id",
            dataType: "json",
            contentType: 'application/json;charset=utf-8 ',
            data: JSON.stringify(obj),
            async: false,
            processData: false,
            success: function (response) {
                var item = response.dataObject;
                $("#pname").text(item[0].createD_BY);
                $("#cname").text(item[0].companY_NAME);
                $("#contact").text(item[0].companY_POC_LIST);
                $("#acontact").text(item[0].thirdpartY_MAPPING);
                $("#email").text(item[0].poinT_DISCUSSED);
                $("#aemail").text(item[0].emaiL1);
                $("#linkedin").text(item[0].mtype);
                $("#assign").text(item[0].mdate);
                $("#added").text(item[0].starT_TIME);
                $("#dept").text(item[0].internaL_TEAM_LIST);
                $("#desg").text(item[0].enD_TIME);

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


      
    </script>
</asp:Content>

