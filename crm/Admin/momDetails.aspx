<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="momDetails.aspx.cs" Inherits="CRM.Admin.momDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .mom-remark{
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background:#fff;
            padding:5px 10px;
            border-radius:10px;
        }
        .mom-remark p{
            margin:0;
            display:flex;
            align-items:center;
        }
        .momupdate{
            font-size:12px!important;
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
            <div class="row m-0">
                <div class="col-md-12 mt-3">
                    <div id="momremark">
                    </div>
                </div>
            </div>
             <div class="remark row">
                 <div class="col-md-12 d-flex mt-4">
                 <textarea rows="2" cols="50" class="form-control" id="mom-remark" placeholder="Add Remark here..."></textarea>
                <input type="submit" class="btn btn-success mx-3" id="momsubmit"/>
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

        $("#momsubmit").click(function () {
            var obj = {
                "MID": companyid,
                "REMARK": $("#mom-remark").val(),
                "CREATED_BY": getCookies().USER_GUID
            }
            console.log(obj)
            $.ajax({
                type: 'POST',
                url: "https://crmapi.24fd.com/MOM/post_MOM_REMARK",
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {
                    if (response.message == "Remark Added Successfully.") {
                        toastr.success("Remark Added Successfully.");
                        getmom();
                        $("#mom-remark").empty();
                    }
                    else {
                        toastr.error("something went wrong")
                    }
                }
            });
        });


        var obj1 = {
            "MID": companyid,
        }
        console.log(obj)
        function getmom() {
            $.ajax({
                type: 'POST',
                url: "https://crmapi.24fd.com/MOM/get_MOM_REMARK",
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj1),
                async: false,
                processData: false,
                success: function (response) {
                    console.log(response)
                    var docwrap = "";
                    for (var i = 0; i < response.dataObject.length; i++) {
                        var item = response.dataObject[i];
                        docwrap = docwrap + '<div class="mom-remark mt-2 row">';
                        docwrap = docwrap + '<p class="col-md-10">' + item.remark + '</p>';
                        docwrap = docwrap + '<p class="col-md-2 momupdate"> ' + item.createD_BY + '</br>' + item.createD_ON +'</p>';
                        docwrap = docwrap + '</div>';

                    }
                    $('#momremark').html(docwrap);
                }
            });
        }

        $(document).ready(function () {
            getmom();
        });
        function getCookies() {
            var cookieMap = {};
            let coo = document.cookie.split(';');
            for (var value of coo.values()) {

                if (value.includes('SALESCRM=')) {
                    var cookie = value.trim().replace('SALESCRM=', '').split('&');
                    cookie.forEach(x => { cookieMap[x.split('=')[0]] = x.split('=')[1] });
                    return cookieMap;

                }
            }
        }

    </script>
</asp:Content>

