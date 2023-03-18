<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRM.login"  %>

<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
      <link  rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="admin/css/style.css" />

    <title>CRM</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
          <div class="logo_sec">
            <img src="admin/images/logo.svg" alt="" />
          </div>
       
          <div class="reg-form">
            <div class="form_wrapper">
              <div class="form_container">
                   <div class="text-box" >
          <div class="reg_text">
            <h3>Sign In</h3>
            </div>
            <div class="reg_dec">
              <h5 id="text_1">Welcome To 24 Frames Digital <br /><span class="text-color" style="font-size:18px;">CRM! </span> Login to access CRM features !</h5>
          </div>
        </div>
                <div class="row clearfix">
                  <div class="">
                    <form id="loginform">
                      <div class="input_field">
                        <label class="text-lable" for="">Employee Code</label>
                         <span><i class="fa-regular fa-envelope"></i></span>
                        <input type="text" name="number" id="mobile" placeholder="Enter your Employee Code" required />
                      </div>
                      <div class="input_field">   <label class="text-lable" for="">Password</label> <span><i class="fa-regular fa-lock"></i></span>
                        <input type="password" name="password" id="password" placeholder="Enter your Password" required />
                        <p class="f-password">Forgot Password?</p>
                      </div>                    
                      <div class="row clearfix">
                        
                      <input class="button" type="submit" value="Login" />
                    </form>
                  <%--  <div class="google-text">
                      <p >Or continue with</p>
                    </div>--%>
                  </div>
                </div>
              </div>
            
          </div>
        </div>
      </div>
      </div>

      <div class="col-md-6">
        <div class="bg-color">
          <div class="bg-img">
            <img src="admin/images/form-img.svg" alt="" />
          </div>
          <div class="banner-text">
            <h2>Sign in to CRM</h2>
          </div>
        </div>
      </div>
    </div>
 

 
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
      <%--<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.1/dist/js.cookie.min.js"></script>--%>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>

<script type = "text/javascript">

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

  
    $(document).ready(function () {
        console.log("ready!");
       
        $("#loginform").submit(function (e) {
            e.preventDefault();
           var mobile = $("#mobile").val();
            var password = $("#password").val();
            var obj = {
                "mobile":mobile ,
                "password": password
            }
            $.ajax({
                type: "POST",
                url: "login.aspx/User_login",
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    console.log(response.d); 
                }
            });
            function OnSuccess(response) {
                console.log(response.d);
                if (response.d === "1") {
                    var role = getCookies().ROLE_ID;
                    if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
                        window.location = "admin/Assignedcompanies.aspx";
                    }

                    else {
                        window.location = "admin/CompanyMaster.aspx";
                        }
                   
                }
                else if (response.d === "0") {
                    toastr.error('Please enter valid Credentials to login.', 'Invalid Credentials!')
                }
                
            }
        });
        
    });
  
</script>
  </body>
</html>

