<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="SalesWork.aspx.cs" Inherits="CRM.Admin.SalesWork" %>

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

        .tbl-card {
            background: #fff;
            padding: 1em;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            border-radius:5px;
            padding-bottom:1em;
            height: 320px;
            position:relative;
        }

        table.dataTable {
            border-spacing: 0 4px !important;
        }

       table.dataTable tbody th, table.dataTable tbody td {
         padding: 0px 10px !important;
       }

       table.dataTable thead th, table.dataTable thead td {
          padding: 10px;
          border-bottom: 1px solid rgba(0, 0, 0, 0.3);
          background: #e2e8ee;
       }
       .vbtn{
           font-size:13px!important;
           padding:4px!important;
       }
       table.dataTable tbody tr {
        background-color: #efefef!important;
        }
       able.dataTable.stripe > tbody > tr.odd > *, table.dataTable.display > tbody > tr.odd > * {
        height: 30px!important;
        }
       .btn {
           font-size:12px!important;
           padding:5px!important;
       }
       .veiw-btn{
           position:absolute;
           bottom:10px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 mainWrap">
           <div class="empname"><h4 id="sales-name"></h4></div>
            <div class="col-md-6 mt-4">
                <div class="tbl-card">
                    <h5>Assigned Companies</h5>
                    <table id="ctable" class="display" style="width: 100%;">
                        <thead>
                            <tr style="background: #fff;">
                                <th>Name</th>
                                <th>active</th>
                                <th>Type</th>
                                <th>Sector</th>
                                <th>Industry</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>

                    </table>
                    <div class="veiw-btn">
                        <button class="view-company vbtn btn btn-success mt-2">View more</button>
                    </div>
                </div>

            </div>

             <div class="col-md-6 mt-4">
                <div class="tbl-card">
                    <h5>POC List</h5>
                    <table id="poctbl" class="display" style="width: 100%;">
                    <thead>
                        <tr style="background: #fff;">
                            <th>
                            <input type="checkbox" name="checkAll" id="checkAll" class="form-check-input-styled"></th>
                            <th>Name</th>
                            <th>Company</th>
                            <th>Contact</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
                    <div class="veiw-btn">
                        <button class="view-poc vbtn btn btn-success mt-2">View more</button>
                    </div>
                </div>

            </div>


            <div class="col-md-6 mt-4">
                <div class="tbl-card">
                    <h5>Daily Update</h5>
                    <table id="dailytbl" class="display" style="width: 100%;">
                    <thead>
                       <tr style="background: #fff;">
                            <th>POC</th>
                            <th>Company</th>
                            <th>Created By</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
                    <div class="veiw-btn">
                        <button class="view-dupdate vbtn btn btn-success mt-2">View more</button>
                    </div>
                </div>

            </div>

             <div class="col-md-6 mt-4">
                <div class="tbl-card">
                    <h5>MOM</h5>
                    <table id="momtbl" class="display" style="width: 100%;">
                    <thead>
                       <tr style="background: #fff;">
                            <th>Company</th>
                            <th>Date</th>
                            <th>Created By</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
                    <div class="veiw-btn">
                        <button class="view-momt vbtn btn btn-success mt-2">View more</button>
                    </div>
                </div>

            </div>


            <div class="col-md-6 mt-4">
                <div class="tbl-card">
                    <h5>TO-DO List</h5>
                    <table id="todotbl" class="display" style="width: 100%;">
                    <thead>
                       <tr style="background: #fff;">
                            <th>POC</th>
                            <th>Company</th>
                            <th>Activity</th>
                            <th> Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
                    <div class="veiw-btn">
                        <button class="view-todo vbtn btn btn-success mt-2">View more</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="js/yearpicker.js"></script>
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

        var urlParams = new URLSearchParams(window.location.search);
        var userid = urlParams.get('uid');
        var name = urlParams.get('name');
        $("#sales-name").text(name);
        $(".view-company").click(function () {
            window.location.href = "Assignedcompanies.aspx?uid="+ userid + '&dstatus=1' + '&name=' + name
        });

        $(".view-poc").click(function () {
            window.location.href = "poc_list.aspx?uid="+ userid + '&dstatus=1' + '&name='+name
        });

        $(".view-dupdate").click(function () {
            window.location.href = "daily_updates.aspx?uid="+ userid + '&dstatus=1' + '&name=' + name
        });

        $(".view-momt").click(function () {
            window.location.href = "mom.aspx?uid="+ userid + '&dstatus=1' + '&name=' + name
        });

        $(".view-todo").click(function () {
            window.location.href = "TODO_list.aspx?uid=" + userid + '&dstatus=1' + '&name=' + name
        });
        
    </script>
    <script src="js/company.js"></script>
    <script src="js/poc.js"></script>
    <script src="js/dailyUpdate.js"></script>
    <script src="js/mom.js"></script>
    <script src="js/todo.js"></script>

</asp:Content>
