<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRMLogin.aspx.cs" Inherits="CRM.CRMLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    </form>
     <form id="loginForm">
                <input type="number" id="mobile" placeholder="Enter your Mobile Number"  />
                <input type="text" id="password" placeholder="Enter your Password" />
                 <input class="button" type="submit" />
        </form>
     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#loginForm").submit(function (e) {
                e.preventDefault();
                var mobile = $("#mobile").val();
                var password = $("#password").val();
                alert(mobile);
                obj = {
                    mobile,
                    password
                }
                console.log(obj);
                $.ajax({
                    type: 'POST',
                    url: 'login.aspx/User_login',
                    dataType: "json",
                    contentType: 'application/json;charset=utf-8 ',
                    data: {
                        "mobile": "123456789",
                        "password": "1234",
                    },
                    async: false,
                    processData: false,
                    success: function (response) {
                    }
               

            });
        });
        });

    </script>
</body>
</html>
