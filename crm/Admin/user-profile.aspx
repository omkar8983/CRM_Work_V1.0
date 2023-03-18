<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="CRM.Admin.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css"/>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://weareoutman.github.io/clockpicker/dist/jquery-clockpicker.css" />
   <link href="css/clockpicker.css" rel="stylesheet" />
   <link href="css/mdtimepicker.css" rel="stylesheet" />

    <style>
        label {
            margin-top: 1em;
            font-size: 14px;
        }

        input {
            font-size: 13px;
        }

        .form-control {
            font-size: 12px;
        }

        textarea {
            height: 38px;
        }

        .btn {
            padding: 5px 40px;
        }

        label {
            margin-top: 8px;
        }

        .uploadtxt {
            position: absolute;
            bottom: -2px;
            margin: 0 auto;
            width: 100%;
            color: #2a6bbb;
            visibility: hidden;
            transition: all 0.3s ease-out;
        }

            .uploadtxt p {
                width: 110px;
                margin: 0 auto;
                background: #fff;
            }

        #upload:before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            background: #3d3d3d;
            border-radius: 50%;
            opacity: 0.5;
            visibility: hidden;
            transition: all 0.3s ease-out;
        }

        #upload:before {
            visibility: visible;
            transition: all 0.3s ease-out;
        }

        .profile_cover_Wrap {
            width: 100px;
            margin-bottom: 1.5em;
            border-radius: 50%;
            background: #fff;
            display: block;
            height: 100px;
            position: relative;
        }

            .profile_cover_Wrap img {
                width: 100%;
                height: 100px;
                border-radius: 50%;
            }

            .profile_cover_Wrap:hover .uploadtxt {
                visibility: visible;
                transition: all 0.3s ease-out;
            }

        .upload_icon {
            position: absolute;
            right: 13%;
            bottom: -1px;
            color: #fff;
            background: #0e5aa3;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 1.2em;
        }

        .form-switch {
            padding-left: 1.5em;
            display: flex !important;
            align-items: center;
        }

        #DOL {
            margin-left: 20px;
        }
        #usertable_filter{
            display:none;
        }
        #usertable_length:nth-child(1){
            display:none;
        }

        .modal .btn-submit {
    margin: 0;
    background: #007cc3;
    color: #f5f5f5 !important;
    font-weight: 500;
    text-transform: uppercase;
    border-radius: 10px;
    font-size: 1em;
    margin-right: 1.5em;
    padding: 0.1em 2em;
    display: flex;
    box-shadow: 0px 5px 5px 0px #cdb2b7ad;
    align-items: center;
}
        table.dataTable {
    width: 100%;
    margin: 0 auto;
    clear: both;
    border-collapse: separate;
    border-spacing: 0 5px;
}
        table.dataTable tbody th, table.dataTable tbody td {
    padding: 0px 10px!important;
}
        .dropdown-menu.datepicker-dropdown {
    position: absolute;
    z-index: 1000;
    display: none;
    min-width: 10rem;
    padding: 0.5rem 0;
    margin: 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 0.25rem;
    height: auto;
    width: auto;
    min-width: unset!important;
}
        .datepicker td, .datepicker th {
    text-align: center;
    width: 40px;
    height: 40px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    border: none;
}
        #regularize .MonthpickerWrap i{
position: absolute;
    right: 10px;
    top: 10px;
        }
        #btn-close{
            position:absolute;
            right:-10px;
            top:-10px;
                background: #bdc0d5b3;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    border: none;
    font-size: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" action="./user-list" id="form1"></form>

    <div class="container-fluid">
        <div class="row mt-2 mainWrap mr-0">
            <div class="col-md-2">
                <div class="sidepanel">
                    <div class="sidemenu">
                        <ul>
                            <li class="activep" id="profileLink"><i class="ri-profile-line"></i>User Profile</li>
                            <li id="documentsLink"><i class="ri-file-text-line"></i>User Documents</li>
                            <li id="attendacnelink"><i class="ri-file-chart-line"></i>Attendacne</li>
                        </ul>
                    </div>
                </div>
            </div>
   
            <div class="col-md-10" id="Profileinfo"  style="display: block" >
                <form class="row" enctype="multipart/form-data" id="form-user">
                    <div class="p_img">
                        <div class="profile_cover_Wrap">
                            <img src="#" id="upload_img" />
                            <input id="profile-img" type="file" style="display: none" accept=".jpg, .jpeg, .png">
                            <div class="upload_icon">
                                <i class="ri-pencil-fill"></i>
                            </div>
                            <%--<div class="uploadtxt">
                            <p>upload image <i class="fa fa-cloud-upload" aria-hidden="true"></i></p>
                        </div>--%>
                        </div>
                        <div class="row">
                            <label>Employee Active Status</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="empstatus">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label>First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" id="F_NAME" required />
                    </div>
                    <div class="col-md-4">
                        <label>Middle Name</label>
                        <input type="text" class="form-control" placeholder="Middle Name" id="M_NAME" />
                    </div>
                    <div class="col-md-4">
                        <label>Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" id="L_NAME" required />
                    </div>
                    <div class="col-md-4">
                        <label>Employee Code</label>
                        <input type="text" class="form-control" placeholder="Employee Code" id="empCode" required />
                    </div>
                    <div class="col-md-4">
                        <label>Gender</label>
                        <select class="form-control" name="gender" id="g-name" placeholder="Select Gender" required>
                            <option value="">select Gender</option>
                            <option value="MALE">Male</option>
                            <option value="FEMALE">Female</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>DOB</label>
                        <input type="date" class="form-control" placeholder="Date of birth" id="dob" required />
                    </div>
                    <div class="col-md-4">
                        <label>DOJ</label>
                        <input type="date" class="form-control" placeholder="Date of Joining" id="DOJ" required />
                    </div>
                    <div class="col-md-4">
                        <label>Personal Number</label>
                        <input type="number" class="form-control" placeholder="Personal Number" id="p-number" required />
                    </div>

                    <div class="col-md-4">
                        <label>Office Number</label>
                        <input
                            type="number"
                            class="form-control"
                            placeholder="Office Number"
                            id="off-number" />
                    </div>
                    <div class="col-md-4">
                        <label>Personal Email</label>
                        <input
                            type="email"
                            class="form-control"
                            placeholder="Personal Email"
                            id="p-email"
                            required />
                    </div>
                    <div class="col-md-4">
                        <label>Office Email</label>
                        <input
                            type="email"
                            class="form-control"
                            placeholder="Office Email"
                            id="off-email"
                            required />
                    </div>
                    <div class="col-md-4">
                        <label for="">Select Hub</label>
                        <select name="hub" id="hub" class="form-control" required>
                            <option value="">select Hub</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Banglore">Banglore</option>
                            <option value="Delhi">Delhi</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Select Role</label>
                        <select name="role" class="form-control" id="ddrole" required>
                            <option value="">Select Role</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="">Select Designation</label>
                        <select name="" class="form-control" id="dddesig" required>
                            <option value="">Select Designation</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="">Select Department</label>
                        <select name="" class="form-control" id="dddept" required>
                            <option value="">Select Department</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="">Select Reporting person</label>
                        <select name="" class="form-control" id="ddreport" multiple required>
                            <option value="">Select Reporting person</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Address</label>
                        <textarea class="form-control" name="" id="add" cols="30" rows="0" placeholder="Address"></textarea>
                    </div>
                    <div class="col-md-4">
                        <label>Is Resigned &nbsp;&nbsp Date of Leaving</label>
                        <div class="form-check form-switch" style="padding-left: 1.5em;">
                            <input class="form-check-input" type="checkbox" id="resigned">
                            <input type="date" class="form-control mt-2" id="DOL" placeholder="Date of Leaving" style="display: none;" />
                        </div>

                    </div>
                    <input type="hidden" id="imgval" />

                    <div class="col-md-12 mt-3 text-left">
                        <input type="submit" class="btn btn-primary btnSave">
                    </div>
                </form>
            </div>

            <div class="col-md-10" id="docupload"  style="display: none;">
                <div class="docUpload">

                    <div class="docupwrap row">
                        <form id="updatedoc" class="row" enctype="multipart/form-data">
                        <div class="col-md-4">
                            <label>Select Document Type</label>
                            <select class="form-control" id="dddoctype" required>
                                <option value="">Select document type</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Upload Document</label>
                            <input type="file" id="doc-img" class="form-control" accept=".jpg, .jpeg, .png, application/pdf"  required/>
                        </div>
                        <div class="col-md-3 mt-4">
                            <input type="submit" class="btn btnSave btn-primary" />
                        </div>
                       </form>
                    </div>
                </div>

                <div class="documentWrap" id="documentList">
                </div>
            </div>

            <div class="col-md-10" id="attendacne"  style="display: none;">
                <div class="row headrow">
                    <div class="col-md-3">
                <div class="table-head">
                    <h5>All Users</h5>
                </div>
            </div>
            <div class="col-md-9">
                <div class="filters-wrap">
                    <div class="list-name">
                        <span>Total:</span>
                        <h5>&nbsp;<strong id="entries"></strong> Entriess</h5>
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
                    <table id="usertable" class="display" style="width: 100%;">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Login</th>
                            <th>Logout</th>
                            <th>Duration</th>
                            <th>Machine Remark</th>
                            <th>Remark</th>
                        </tr>
                            </thead>
                    </table>
            </div>
        </div>
    </div>
  

    <!-- Document Modal -->
<div class="modal fade" id="docmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      <div class="modal-body">
        <img src="images/pan.jpg" id="docImg" style="display:none;"/>
        <iframe src="https://crm.24fd.com/Admin/Documents/24FD_25-20220816103230Font_Used.pdf" id="docPdf" style="width:100%; height:80vh; display:none;"></iframe>
      </div>
    </div>
  </div>
</div>

        <!--Regularize Modal -->
<div class="modal fade" id="regularize" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title titlem pl-2">Add Regularization (Forgot to punch/ Early / Late mark)</h4>
                     <div class="col col-sm-8">
                        <button class="btn AddBox btnpopup m-2 pl-1" id="addLeave" style="background: rgb(57, 124, 195); ">Leave</button>

                        <button class="btn AddBox btnpopup mx-2 pl-1" id="WFH" style="background: rgb(57, 124, 195); ">WFH</button>

                         <button class="btn AddBox btnpopup mx-2 pl-1" id="addReg" style="background: rgb(85, 207, 156); ">Regularization</button>

                         <button class="btn AddBox btnpopup mx-2 pl-1" id="onsite" style="background: rgb(57, 124, 195); ">Onsite</button>
                         <button class="btn AddBox btnpopup mx-2 pl-1" id="compoff" style="background: rgb(57, 124, 195); ">Compoff</button>

                         <%--<button class="btn AddBox btnpopup mx-2 pl-1" id="applyWeekoff" style="background: rgb(57, 124, 195); ">Early /Late</button>--%>
                    </div>
                    <button type="button" class="close" id="btn-close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body mt-3"><grammarly-extension data-grammarly-shadow-root="true" style="position: absolute; top: 0px; left: 0px; pointer-events: none;" class="cGcvT"></grammarly-extension><grammarly-extension data-grammarly-shadow-root="true" style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none;" class="cGcvT"></grammarly-extension>
                     <form id="AddRegularize" style="">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Enter Clock-in Time</label>
                                <div class="input-group clockpicker" data-autoclose="true">
                                    <input type="text" id="Clockin" class="form-control clockp" value="" required="">
                                    <span class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Enter Clock-out Time</label>
                                <div class="input-group clockpicker" data-autoclose="true">
                                    <input type="text" id="Clockout" class="form-control clockp" value="" required="">
                                    <span class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="pl-2" for="exampleFormControlTextarea1">Enter Remark </label>
                            <textarea class="form-control" id="Remark" rows="3" title="Enter Remark" style="height: 80px!important;" required="" spellcheck="false"></textarea>
                            <input type="hidden" id="Date" value="Mon Aug 01 2022 00:00:00 GMT+0530 (India Standard Time)">
                        </div>
                        <div class="col-md-12 mt-4 p-0">
                            <button type="submit" id="AddRegularizeBtn" class="btn btn-submit ml-0 modalsubmit">Submit <i class="ri-check-double-line"></i></button>
                        </div>
                    </form>

                    <form id="wfhform" style="display: none;">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Enter Clock-in Time</label>
                                <div class="input-group clockpicker" data-autoclose="true">
                                    <input type="text" id="Clockin1" class="form-control" value="" required="">
                                    <span class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Enter Clock-out Time</label>
                                <div class="input-group clockpicker" data-autoclose="true">
                                    <input type="text" id="Clockout1" class="form-control" value="" required="">
                                    <span class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="pl-2" for="exampleFormControlTextarea1">Enter Remark </label>
                            <textarea class="form-control" id="Remark1" rows="3" title="Enter Remark" style="height: 80px!important;" required="" spellcheck="false"></textarea>
                            <input type="hidden" id="Date11" value="Mon Aug 01 2022 00:00:00 GMT+0530 (India Standard Time)">
                        </div>
                        <div class="col-md-12 mt-4 p-0">
                            <button type="submit" id="AddRegularizeBtn1" class="btn btn-submit ml-0 modalsubmit">Submit <i class="ri-check-double-line"></i></button>
                        </div>
                    </form>

                     <form id="Leaveform" class="row" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Leave Type</label>
                                <select class="form-control" id="ddLeaveType" required="">
                                    <option value="" disabled="" selected="">Select Leave Type</option>
                                    <option value="CL">CL</option>
                                    <option value="PL">PL</option>
                                    <option value="SL">SL</option>
                                    <option value="LOP">LOP</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Leave Balance</label>
                                <input type="text" class="form-control" id="leaveBalance" aria-describedby="emailHelp" placeholder="Leave Balance" required="" disabled="">
                                <input type="hidden" id="Date1" value="Mon Aug 01 2022 00:00:00 GMT+0530 (India Standard Time)">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="chklbl">
                                    <input type="checkbox" id="HalfdayCheck" class="chkbox" name="HalfdayCheck" value="0">
                                 Apply For Half Day</label>
                            </div>
                         </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Reason</label>
                                <textarea class="form-control" id="Reason" title="Enter Reason" rows="3" style="height: 120px!important;" required=""></textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group mt-3 d-flex">
                                
                                <button type="submit" id="AddLeave" class="btn btn-submit ml-0 modalsubmit">Apply <i class="ri-check-double-line"></i></button>
                            </div>
                        </div>
                    </form>

                     <form id="OutdoorM" class="row" style="display: none;">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Number of meeting</label>
                                <input id="txt_noOfMeeting" class="form-control" required=""> 
                                </div>
                                
                            </div>

                           <div class="col-md-4">
                               <div class="form-group">
                                   <label for="time-1" data-clear-btn="false">Start Time</label>


                                   <div class="input-group">
                                   <input type="time" id="start_time" data-clear-btn="false" name="time-1" value="" class="form-control" required="">
                                    </div>
                               </div>
                               
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="time-2" data-clear-btn="true">End Time</label>

                                    
                                    <div class="input-group">
                                   <input type="time" id="end_time" data-clear-btn="true" name="time-2" value="" class="form-control" required="">
                                        </div>
                                </div>
                                 
                            </div>
                          
                            <div class="col-md-12">
                                <div class="form-group">
                                     <label>Remark</label>
                                <textarea id="remark" class="form-control" required=""></textarea>
                                </div>
                               
                            </div>

                             <div class="col-md-12">
                            <div class="form-group mt-3 d-flex">
                                
                                <button type="submit" id="ApplyMeeting" class="btn btn-submit ml-0 modalsubmit">Apply <i class="ri-check-double-line"></i></button>
                            </div>
                        </div>

                    </form>

                     <form id="WeekOffDay" class="row" style="display: none;">
                         <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Date </label>
                                       
                                         <div class="form-group MonthpickerWrap">
                                        <i class="ri-calendar-event-fill"></i>
                                         <input type="text" id="dateWeek" class="m-0 form-control UserDp w-100" placeholder="Select Date" style="height:40px; background: #c7baba24 !important;" required="" aria-autocomplete="none">
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <label>Remark</label>
                                <input id="txt_remark" class="form-control w-100" required=""> 
                                </div>
                                
                            </div>
                         <div class="col-md-12">
                            <div class="form-group mt-3 d-flex">
                                
                                <button type="submit" id="Apply_weekoff" class="btn btn-submit ml-0 modalsubmit">Apply <i class="ri-check-double-line"></i></button>
                            </div>
                        </div>
                        </form>
                     <form id="compoffmodal" class="row" style="display: none;">
                         
                     

                         <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Date </label>
                                       
                                         <div class="form-group MonthpickerWrap">
                                        <i class="ri-calendar-event-fill"></i>
                                         <input type="text" id="compoffdateWeek" class="m-0 form-control UserDp w-100" placeholder="Select Date" style="height:40px; background: #c7baba24 !important;" required="" aria-autocomplete="none">
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <label>Remark</label>
                                <input id="compofftxt_remark" class="form-control w-100" required=""> 
                                </div>
                                
                            </div>
                         <div class="col-md-12">
                            <div class="form-group mt-3 d-flex">
                                
                                <button type="submit" id="Apply_compoff" class="btn btn-submit ml-0 modalsubmit">Apply <i class="ri-check-double-line"></i></button>
                            </div>
                        </div>
                        </form>

                </div>
            </div>
  </div>
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
     <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="js/clockpicker.js"></script>
    <script src="js/mdtimepicker.js"></script>

    <script src="js/filesave.js"></script>

    <script src="js/main.js"></script>
    <script>
        window.onload = function () {
            mdtimepicker('.clockp', {
                events: {
                    timeChanged: function (data) {
                        console.log('timeChanged', data)
                    }
                }
            })
        }
        //$('.clockpicker').clockpicker({
        //    'default': DisplayCurrentTime(),
        //    donetext: 'Done',
        //    twelvehour: true,
        //    autoclose: false,
        //    leadingZeroHours: false,
        //    upperCaseAmPm: true,
        //    leadingSpaceAmPm: true,
        //}).find('input').val(DisplayCurrentTime())

        //function DisplayCurrentTime() {
        //    var date = new Date();
        //    var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
        //    var am_pm = date.getHours() >= 12 ? "PM" : "AM";
        //    hours = hours < 10 ? "0" + hours : hours;
        //    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
        //    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
        //    time = hours + ":" + minutes + " " + am_pm;
        //    //time = hours + ":" + minutes + am_pm;
        //    return time;
        //};

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
        
        var urlParams = new URLSearchParams(window.location.search);
        var userid = urlParams.get('uid');
        var hub = urlParams.get('hub');
        var empcode = urlParams.get('empcode');
        var name = urlParams.get('name');

        $(".sidemenu li").click(function () {
            $(".sidemenu li.activep").removeClass('activep');
            $(this).addClass('activep');
        });

        $("#profileLink").click(function () {
            $("#Profileinfo").show();
            $("#docupload").hide();
            $("#attendacne").hide();

        });

        $("#documentsLink").click(function () {
            $("#Profileinfo").hide();
            $("#attendacne").hide();
            $("#docupload").show();
        });

        $("#attendacnelink").click(function () {
            $("#Profileinfo").hide();
            $("#attendacne").show();
            $("#docupload").hide();
        });

        var chkval;
        $('#empstatus').on('change', function () {
            this.value = this.checked ? 1 : 0;
            if (this.value == 0) {
                chkval = "DEACTIVE"
            }
            else if (this.value == 1) {
                chkval = "ACTIVE"
            }

        }).change();
        var resigned;
        $('#resigned').on('change', function () {
            this.value = this.checked ? 1 : 0;
            if (this.value == 0) {
                resigned = "false"
                $("#DOL").hide();
                $("#DOL").prop('required', false);
            }
            else if (this.value == 1) {
                resigned = "true"
                $("#DOL").show();
                $("#DOL").prop('required', true);
            }

        }).change();


        $("#form-user").submit(function (event) {
            event.preventDefault();
            var hub = document.getElementById('hub').value;
            var reporting = $("#ddreport").val();
            var form = new FormData();
            form.append("EMP_CODE", $("#empCode").val());
            form.append("F_NAME", $("#F_NAME").val());
            form.append("M_NAME", $("#M_NAME").val());
            form.append("L_NAME", $("#L_NAME").val());
            form.append("GENDER", $("#g-name").val());
            form.append("DOB", $("#dob").val());
            form.append("DOJ", $("#DOJ").val());
            form.append("EMAIL", $("#p-email").val());
            form.append("EMAIL1", $("#off-email").val());
            form.append("ADDRESS", $("#add").val());
            form.append("HUB", hub);
            form.append("CREATED_BY", getCookies().USER_GUID);
            form.append("ROLE_ID", $("#ddrole option:selected").val());
            form.append("DESIGNATION_ID", $("#dddesig option:selected").val());
            form.append("DEPT_ID", $("#dddept option:selected").val());
            form.append("REPORTING_TO", reporting);
            form.append("STATUS", chkval);
            form.append("ISRESIGNED", resigned);

            if (typeof $('#profile-img')[0].files[0] === "undefined") {
                form.append("Image", "");
            }
            else {
                form.append("Image", $('#profile-img')[0].files[0]);
            }

            form.append("CONTACT", $("#p-number").val());
            form.append("CONTACT1", $("#off-number").val());
            form.append("DOL", $("#DOL").val());
            form.append("USER_GUID", userid);
            $.ajax({
                "url": apiurl + '/Employee/UpdateEmployee',
                "method": "POST",
                "timeout": 0,
                "processData": false,
                "mimeType": "multipart/form-data",
                "contentType": false,
                "data": form,
                success: function (response) {
                    var resp = JSON.parse(response)

                    if (resp.message == '1' || resp.message == '2') {
                        toastr.success('Data updated Successfully.', 'Data Updated')
                    }
                   
                    else {
                        toastr.error('Something went wrong. Please try again!.', 'Error')
                        console.log(response);
                    }

                },
                error: function () {

                    toastr.error('Something went wrong. Please try again!.', 'Error')
                }
            });
        });


        $("#updatedoc").submit(function (event) {
            event.preventDefault();
            var form1 = new FormData();
            form1.append("Image", $('#doc-img')[0].files[0]);
            form1.append("DOCUMENT_ID", $("#dddoctype option:selected").val());
            form1.append("CREATED_BY", getCookies().USER_GUID);
            form1.append("EMP_CODE", getCookies().EMP_CODE);
            form1.append("USER_GUID", userid);
            $.ajax({
                "url": apiurl + '/Employee/UploadDocument',
                "method": "POST",
                "timeout": 0,
                "processData": false,
                "mimeType": "multipart/form-data",
                "contentType": false,
                "data": form1,
                success: function (response) {
                    var resp = JSON.parse(response)

                    if (resp.message == '1') {
                        toastr.success('Data Uploaded Successfully.', 'Data Updated');
                        setTimeout(function () {
                            userdoc();
                        }, 2000);
                    }
                    else {
                        toastr.error('Something went wrong. Please try again!.', 'Error')
                        console.log(response);
                    }

                },
                error: function () {
                    toastr.error('Something went wrong. Please try again!.', 'Error')
                }
            });

        });

        function forceDownload(link) {
            var url = link.getAttribute("data-href");
            var fileName = link.getAttribute("download");
            link.innerText = "Working...";
            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);
            xhr.responseType = "blob";
            xhr.onload = function () {
                var urlCreator = window.URL || window.webkitURL;
                var imageUrl = urlCreator.createObjectURL(this.response);
                var tag = document.createElement('a');
                tag.href = imageUrl;
                tag.download = fileName;
                document.body.appendChild(tag);
                tag.click();
                document.body.removeChild(tag);
                link.innerText = "Download Image";
            }
            xhr.send();
        }
        function userdoc() {
        var obj = { "USER_GUID": userid };
        $.ajax({
            type: 'POST',
            url: apiurl + '/Employee/Get_Employee_Documents',
            dataType: "json",
            contentType: 'application/json;charset=utf-8 ',
            data: JSON.stringify(obj),
            async: false,
            processData: false,
            success: function (response) {
                console.log(response);
                var data = response;

                myjson = data.dataObject;
                errorflag = data.code;

                if (errorflag === "500") {
                    $('#' + divid).html("<div class='text-center'>Server Side Error .<div>");
                }
                else if (errorflag === "200" & myjson === null) {
                    $('#' + divid).html("<div class='text-center'>Timeline data not available .<div>");
                }
                else {
                    var img;
                    var docwrap = "";
                    for (var i = 0; i < data.dataObject.length; i++) {
                        var item = data.dataObject[i];
                        var img = item.documenT_IMG;
                        var fileName = img;
                        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1);
                        
                        docwrap = docwrap + '<div class="row docrow">';
                        docwrap = docwrap + '<div class="col-md-2">';
                        if (fileNameExt == 'pdf') {
                            docwrap = docwrap + ' <img src="images/pdf.png" class="docimg" id="tbldoc" style="width:60px;"/>';
                        }
                        else {
                            docwrap = docwrap + ' <img src="https://crm.24fd.com/Admin/Documents/' + item.documenT_IMG + '" class="docimg" href="" id="tbldoc"/>';
                        }
                        docwrap = docwrap + '</div>';
                        docwrap = docwrap + '<div class="col-md-1">';
                        docwrap = docwrap + '<p>' + item.documenT_TYPE + '</p>';
                        docwrap = docwrap + '</div>';
                        docwrap = docwrap + '<div class="col-md-2">';
                        docwrap = docwrap + '<p>' + item.name + '</p>';
                        docwrap = docwrap + '</div>';
                        docwrap = docwrap + '<div class="col-md-2">';
                        docwrap = docwrap + '<p>' + item.createD_ON + '</p>';
                        docwrap = docwrap + '</div>';
                        docwrap = docwrap + '<div class="col-md-5 btnbox">';
                        docwrap = docwrap + '<a class="btn docbtn btnview" id="https://crm.24fd.com/Admin/Documents/' + item.documenT_IMG + '" ><i class="ri-eye-fill"></i>View</a>';
                        docwrap = docwrap + '<a class="btn docbtn btndnld" href="https://crm.24fd.com/Admin/Documents/' + item.documenT_IMG + '"  download><i class="ri-download-cloud-fill"></i>Download</a>';
                        docwrap = docwrap + '<a class="btn docbtn btndlt" data-id="' + item.documenT_ID + '" ><i class="ri-delete-bin-6-fill"></i>Delete</a>';
                        docwrap = docwrap + '</div>';
                        docwrap = docwrap + '</div>';
                    }
                    $('#documentList').html(docwrap);

                    $(".btnview").on('click', function () {
                        var tbldoc = $(this).attr('id');
                        var fileName = tbldoc;
                        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1);
                        if (fileNameExt == 'pdf') {
                            $("#docImg").hide();
                            $("#docPdf").show();
                            $("#docPdf").attr("src", tbldoc)
                            $("#docmodal").modal('show');
                        }
                        else {
                            $("#docImg").show();
                            $("#docPdf").hide();
                            $("#docImg").attr("src", tbldoc)
                            $("#docmodal").modal('show');
                        }
                       
                      })

                    //$(".docimg").on('click', function (e) {
                    //    e.preventDefault();
                    //    var imagePath = $(this).attr('src');
                    //    alert(imagePath);
                    //    var fileName = "24FD_25-20220816112312profile.png";
                    //   saveAs(imagePath, fileName);
                    //});

                
                    $(".btndlt").on('click', function (event) {
                        var docid = $(this).attr('data-id');
                        event.preventDefault();
                        var obj = {
                            "DOCUMENT_ID": docid,
                            "DELETED_BY": userid
                        }
                        console.log(obj);
                        $.ajax({
                            "url": apiurl + '/Employee/Delete_Employee_Document',
                            "method": "POST",
                            dataType: "json",
                            contentType: 'application/json;charset=utf-8 ',
                            data: JSON.stringify(obj),
                            async: false,
                            processData: false,
                            success: function () {
                                toastr.success('Data Deleted Successfully.', 'Data Updated');
                                setTimeout(function () {
                                    userdoc();
                                }, 2000);
                            },
                            error: function () {
                                toastr.error('Something went wrong. Please try again!.', 'Error')
                            }
                        });
                    });
                  
                }
            }
        });
        }
        $(document).ready(function () {
            userdoc();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#upload_img').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#profile-img").change(function () {
            readURL(this);
        });

        $(document).ready(function () {
            $("#pagename").text('User profile');

            $('#upload_img').click(function () {
                $('#profile-img').click();
            });
            $('#upload_icon').click(function () {
                $('#profile-img').click();
            });
        });

        function remarkrender(remark) {
            if (remark == "EarlyOut") {
                return '<p class="eout status">Early Out</p>'
            }
            else if (remark == "LateMark") {
                return '<p class="latem status">Late Mark</p>'
            }
            else if (remark == "Holiday") {
                return '<p class="holiday status">Holiday</p>'
            }
            else if (remark == "A") {
                return '<p class="absent status">Absent</p>'
            }
            else if (remark == "P"){
                return '<p class="present status">Present</p>'
            }
            else if (remark == "Weekly Off") {
                return '<p class="weekoff status">Weekly Off</p>'
            }
            else if (remark == "No Punch") {
                return '<p class="latem status">No Punch</p>'
            }
            else if (remark == "Half Day") {
                return '<p class="latem status">Half Day</p>'
            }
        }

        var obj = { "USER_GUID": userid };
        $.ajax({
            type: 'POST',
            url: apiurl + '/Employee/Get_Employee_List',
            dataType: "json",
            contentType: 'application/json;charset=utf-8 ',
            data: JSON.stringify(obj),
            async: false,
            processData: false,
            success: function (response) {
                var data = response.dataObject[0];
                
                DOB = data.dob;
                DOJ = data.doj;
                DOL = data.dol;

                if (DOB != "") {
                    var now = new Date(DOB);

                    var day = ("0" + now.getDate()).slice(-2);
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);

                    var today = now.getFullYear() + "-" + (month) + "-" + (day);
                }
                if (DOJ != "") {
                    var date = new Date(DOJ);

                    var day = ("0" + date.getDate()).slice(-2);
                    var month = ("0" + (date.getMonth() + 1)).slice(-2);

                    var today1 = date.getFullYear() + "-" + (month) + "-" + (day);
                }
                if (DOL != "") {
                    var dol = new Date(DOL);

                    var day = ("0" + dol.getDate()).slice(-2);
                    var month = ("0" + (dol.getMonth() + 1)).slice(-2);

                    var today2 = dol.getFullYear() + "-" + (month) + "-" + (day);
                }

                var reportingval = data.reportinG_TO.toLowerCase();;
                var selectval = new Array();

                selectval = reportingval.split(",");
                setTimeout(function () {
                    $('#g-name').val(data.gender);
                    $('#g-name').select2().trigger('change');
                    $('#hub').val(data.hub);
                    $('#hub').select2().trigger('change');
                    $('#ddrole').val(data.rolE_ID);
                    $('#ddrole').select2().trigger('change');
                    $('#dddesig').val(data.designatioN_ID);
                    $('#dddesig').select2().trigger('change');
                    $('#dddept').val(data.depT_ID);
                    $('#dddept').select2().trigger('change');
                    $('#ddreport').val(selectval);
                    $('#ddreport').select2().trigger('change');
                }, 2000);

                $("#F_NAME").val(data.f_NAME);
                $("#M_NAME").val(data.m_NAME);
                $("#L_NAME").val(data.l_NAME);
                $("#empCode").val(data.emP_CODE);
                $("#dob").val(today);
                $("#DOJ").val(today1);
                $("#p-number").val(data.contact);
                $("#off-number").val(data.contacT1);
                $("#p-email").val(data.email);
                $("#off-email").val(data.emaiL1);
                $("#add").val(data.address);
                $("#DOL").val(today2);

                //resign status

                if (data.isresigned == true) {
                    $('#resigned').prop('checked', true);
                    $("#DOL").show();
                    $("#DOL").prop('required', true);
                }
                else {
                    $('#resigned').prop('checked', false);
                    $("#DOL").prop('required', false);
                    $("#DOL").hide();
                }
                //status
                if (data.status == "ACTIVE") {
                    $('#empstatus').prop('checked', true);
                }
                else {
                    $('#empstatus').prop('checked', false);
                }

                var img = data.profilE_IMG;
                $("#imgval").val(img);

                if (img == "" || img == null) {
                    $("#upload_img").attr("src", "images/user.svg");
                }
                else {
                    $("#upload_img").attr("src", 'https://crm.24fd.com/Admin/Documents/' + img);
                }
            }
        });

        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth());
        //alert(formatDate(today));
        $('#datepicker_month').datepicker({
            format: "MM yyyy",
            viewMode: "years",
            minViewMode: "months",
            autoclose: true
        });
        $('#datepicker_month').datepicker('setDate', today)
        $('#datepicker_month').datepicker(
            attendance(formatDate(today), hub, empcode, name)
        )
        
        function attendance(date, hub, empcode, name) {
            var datec = date+"-01";
            var hub = hub;
            var empcode = empcode;
            var obj = {
                "EMP_CODE": empcode,
                "HUB": hub,
                "startdate": datec
            };
            var date_excel = 'Month :' + date + "" + "Name :" + name;
            $.ajax({
                type: 'POST',
                url: apiurl + '/Employee/Get_Employee_Attendance',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj),
                async: false,
                processData: false,
                success: function (response) {
                    var tbldata = response.dataObject;
                    //$("#usertable").dataTable().fnDestroy();

                    (usertable = $("#usertable").DataTable({

                        dom: 'lB',
                        buttons: [{
                            extend: 'excel',
                            text: 'Export To Excel &nbsp;&nbsp;<i class="ri-chat-download-fill"></i>',
                            titleAttr: 'excel',
                            title: date_excel,
                            exportOptions: {
                                rows: ':visible'
                            }

                        },

                        ],
                        "language": {
                            "emptyTable": "No Data Found"
                        },
                        order: [],
                        destroy: true,
                        responsive: { details: { type: "column", target: "tr" } },
                        lengthMenu: [
                            [31, 55, 1e3, 500, 200, 100, 55, 31],
                            ["ALL", 1e3, 500, 200, 100, 50, 31],
                        ],
                        pagingType: "full",
                        infoFiltered: !0,
                        aaData: tbldata,
                        columns: [

                            { "data": "attendanceDate" },
                            { "data": "empLogin" },
                            { "data": "empLogout" },
                            { "data": "duration" },
                            { "data": "machinRemark" },
                            {
                                "mData": function (data, type, dataToSet) {
                                    return remarkrender(data.remark);
                                }
                            },
                          
                        ],
                        columnDefs: [
                            { "width": "160px", "targets": 3 },
                            { "width": "120px", "targets": 2 },
                            { "width": "120px", "targets": 1 },
                            { "width": "120px", "targets": 0 },
                            { "width": "130px", "targets": 4 },
                            { "width": "100px", "targets": 5 },
                            {
                                targets: [2, 3, 4,5],
                                "orderable": false
                            },
                            {
                                "className": "",
                                targets: [4]
                            },
                        ],



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

                        $('#usertable tbody').on("click", '.status', function (event) {
                            var obj = usertable.row($(this).parents('tr')).data();
                            var remark = obj.remark;
                            if (remark == 'EarlyOut' || remark == 'A' || remark == 'LateMark') {
                                $('#regularize').modal('show');
                            }
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
            $('#usertable').dataTable();
            attendance(date2, hub, empcode, name);
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

        $('#dateWeek').datepicker({
            format: "dd-mm-yyyy",
            //altFormat:"dd-mm-yyyy",
            viewMode: "years",
            minViewMode: "days",
            autoclose: true,
            minDate: 0,

        });
        $('#compoffdateWeek').datepicker({
            format: "dd-mm-yyyy",
            //altFormat:"dd-mm-yyyy",
            viewMode: "years",
            minViewMode: "days",
            autoclose: true,
            minDate: 0,

        });
        $(document).ready(function () {

            bindselect(apiurl + '/Master/get_role_list', 'ddrole');
            bindselect(apiurl + '/Master/get_department_list', 'dddept');
            bindselect(apiurl + '/Master/get_designation_list', 'dddesig');
            bindselect(apiurl + '/Master/get_reporting_list', 'ddreport');
            bindselect(apiurl + '/Master/get_document_type', 'dddoctype');
            
            $('#addLeave').click(function (e) {
                e.preventDefault();
                var weeklyoff = $("#ContentPlaceHolder1_weeklyoff").val();
                if (weeklyoff >= 1) {
                    $('#applyWeekoff').hide();
                    $('#WeekOffDay').hide();
                } else {
                    $('#applyWeekoff').show();
                    $('#WeekOffDay').hide();
                }
                $('#applyWeekoff').css('background', '#397CC3');
                $('#Leaveform').show();
                $('#addLeave').css('background', '#55CF9C');
                $('#compoff').show();
                $('#compoff').css('background', '#397CC3');
                $('#wfhform').hide();
                $('#WFH').css('background', '#397CC3');
                $('#compoffmodal').hide();
                $('#AddRegularize').hide();
                $('#addOutdoorM').show();
                $('#addOutdoorM').css('background', '#397CC3');
                $('#addReg').show();
                $('#addReg').css('background', '#397CC3');
                $('#OutdoorM').hide();
                $('.modal-title').text('Apply Leave');
            });

            $('#WFH').click(function (e) {
                e.preventDefault();
                var weeklyoff = $("#ContentPlaceHolder1_weeklyoff").val();
                if (weeklyoff >= 1) {
                    $('#applyWeekoff').hide();
                    $('#WeekOffDay').hide();
                } else {
                    $('#applyWeekoff').show();
                    $('#WeekOffDay').hide();
                }
                $('#applyWeekoff').css('background', '#397CC3');
                $('#Leaveform').hide();
                $('#wfhform').show();
                $('#WFH').css('background', '#55CF9C');
                $('#addLeave').css('background', '#397CC3');
                $('#compoff').show();
                $('#compoff').css('background', '#397CC3');
                $('#compoffmodal').hide();
                $('#AddRegularize').hide();
                $('#addOutdoorM').show();
                $('#addOutdoorM').css('background', '#397CC3');
                $('#addReg').show();
                $('#addReg').css('background', '#397CC3');
                $('#OutdoorM').hide();
                $('.modal-title').text('Work From Home');
            });
            
            $('#addReg').click(function (e) {
                e.preventDefault();
                $('#AddRegularize').show();
                $('#addReg').css('background', '#55CF9C');
                $('#addLeave').show();
                $('#compoff').show();
                $('#compoffmodal').hide();
                $('#Leaveform').hide();
                $('#addOutdoorM').show();
                $('#OutdoorM').hide();
                $('#wfhform').hide();
                $('#WFH').css('background', '#397CC3');
                $('#addLeave').css('background', '#397CC3');
                $('#compoff').css('background', '#397CC3');
                $('#addOutdoorM').css('background', '#397CC3');
                $('#applyWeekoff').css('background', '#397CC3');
                var weeklyoff = $("#ContentPlaceHolder1_weeklyoff").val();
                if (weeklyoff >= 1) {
                    $('#applyWeekoff').hide();
                    $('#WeekOffDay').hide();
                } else {
                    $('#applyWeekoff').show();
                    $('#WeekOffDay').hide();
                }
                $('#WeekOffDay').hide();
                $('.modal-title').text('Add Regularization (Forgot to punch/ Early / Late mark)');
            });
            $('#onsite').click(function (e) {
                e.preventDefault();
                $('#OutdoorM').show();
                $('#addOutdoorM').css('background', '#55CF9C');
                $('#compoff').show();
                $('#compoff').css('background', '#397CC3');
                $('#compoffmodal').hide();
                $('#addLeave').show();
                $('#addLeave').css('background', '#397CC3');
                $('#addReg').show();
                $('#addReg').css('background', '#397CC3');
                $('#wfhform').hide();
                $('#WFH').css('background', '#397CC3');
                $('#Leaveform').hide();
                $('#AddRegularize').hide();
                $('#applyWeekoff').css('background', '#397CC3');
                var weeklyoff = $("#ContentPlaceHolder1_weeklyoff").val();
                if (weeklyoff >= 1) {
                    $('#applyWeekoff').hide();
                    $('#WeekOffDay').hide();
                } else {
                    $('#applyWeekoff').show();
                    $('#WeekOffDay').hide();
                }
                $('#WeekOffDay').hide();
                $('.modal-title').text('Apply Outdoor Meeting / Event');
            });

            $('#applyWeekoff').click(function (e) {
                e.preventDefault();
                $('#applyWeekoff').css('background', '#55CF9C');
                $('#WeekOffDay').show();
                $('#compoff').show();
                $('#compoff').css('background', '#397CC3');
                $('#compoffmodal').hide();
                $('#OutdoorM').hide();
                $('#addOutdoorM').css('background', '#397CC3');
                $('#addOutdoorM').show();
                $('#addLeave').show();
                $('#addLeave').css('background', '#397CC3');
                $('#addReg').show();
                $('#addReg').css('background', '#397CC3');
                $('#wfhform').hide();
                $('#WFH').css('background', '#397CC3');
                $('#Leaveform').hide();
                $('#AddRegularize').hide();
                $('.modal-title').text('Early out / Late mark');
            });
            $('#compoff').click(function (e) {
                e.preventDefault();
                var weeklyoff = $("#ContentPlaceHolder1_weeklyoff").val();
                if (weeklyoff >= 1) {
                    $('#applyWeekoff').hide();
                    $('#WeekOffDay').hide();
                } else {
                    $('#applyWeekoff').show();
                    $('#WeekOffDay').hide();
                }
                $('#applyWeekoff').css('background', '#397CC3');
                $('#WeekOffDay').hide();
                $('#compoffmodal').show();
                $('#compoff').css('background', '#55CF9C');
                $('#OutdoorM').hide();
                $('#addOutdoorM').css('background', '#397CC3');
                $('#addOutdoorM').show();
                $('#addLeave').show();
                $('#addLeave').css('background', '#397CC3');
                $('#addReg').show();
                $('#addReg').css('background', '#397CC3');
                $('#wfhform').hide();
                $('#WFH').css('background', '#397CC3');
                $('#Leaveform').hide();
                $('#AddRegularize').hide();
                $('.modal-title').text('Apply Comp off');
            });
        });
    </script>
</asp:Content>

