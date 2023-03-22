
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
var uid = getCookies().USER_GUID;


$("#glogin").hide();
	$("#mainform").fadeIn();
	$("#mload").hide();

	// $("#mload").show();
var vals, tfdteam;
// Client ID and API key from the Developer Console
      var CLIENT_ID = '477793518554-a4rnlmmalue0i321lrhqenvfakb4abqj.apps.googleusercontent.com';
      var API_KEY = 'AIzaSyB68ukTpXRBx2ml3lLEkrWut8VMF04tqvk';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://sheets.googleapis.com/$discovery/rest?version=v4","https://www.googleapis.com/discovery/v1/apis/gmail/v1/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/spreadsheets.readonly https://mail.google.com/ https://www.googleapis.com/auth/spreadsheets";

      var authorizeButton = document.getElementById('authorize_button');
      var signoutButton = document.getElementById('signout_button');

      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
        gapi.load('client:auth2', initClient);
      }

      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */

      function initClient() {
        gapi.client.init({
          apiKey: API_KEY,
          clientId: CLIENT_ID,
          discoveryDocs: DISCOVERY_DOCS,
          scope: SCOPES
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);
			
          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
          authorizeButton.onclick = handleAuthClick;
          signoutButton.onclick = handleSignoutClick;
        }, function(error) {
			/* show google signIn */
          renderButton();
			$("#mload").hide();
        });
      }

      /**
       *  Called when the signed in status changes, to update the UI
       *  appropriately. After a sign-in, the API is called.
       */

var myemail, myname;
      function updateSigninStatus(isSignedIn) {
		  
		 
        if (isSignedIn) {

          authorizeButton.style.display = 'none';
          //signoutButton.style.display = 'block';
			var auth2 = gapi.auth2.getAuthInstance();
			if (auth2.isSignedIn.get()) {
  var profile = auth2.currentUser.get().getBasicProfile();
  console.log('ID: ' + profile.getId());
  console.log('Full Name: ' + profile.getName());
  console.log('Given Name: ' + profile.getGivenName());
  console.log('Family Name: ' + profile.getFamilyName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail());
				myemail=profile.getEmail();
				myname=profile.getName();
}	
			
          getsheetid();
			
			/*  for displaying logout btn if new scopes added  */
			if(localStorage.getItem('isloutonce')!="y"){
				$('#islogout').modal({backdrop: 'static', keyboard: false});
			}
			/* ********************* */
			
        } else {
          authorizeButton.style.display = 'block';
          signoutButton.style.display = 'none';
			$("#mload").hide();
			
        }
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick(event) {
        gapi.auth2.getAuthInstance().signIn();
		  
		  $("#mload").show();
		  localStorage.setItem('isloutonce','y');
      }

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick(event) {
		  var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut()
        .then(function () {
            auth2.disconnect();
		localStorage.setItem('isloutonce','y');
            console.log('User signed out.');
            location.reload();
        });
      }

function unauthlogout(){
	 var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut()
        .then(function () {
            auth2.disconnect();
            console.log('User signed out.');
            location.reload();
        });
}

      /**
       * Append a pre element to the body containing the given message
       * as its text node. Used to display the results of the API call.
       *
       * @param {string} message Text to be placed in pre element.
       */
      function appendPre(message) {
        var pre = document.getElementById('content');
        var textContent = document.createTextNode(message + '\n');
        pre.appendChild(textContent);
      }


 /**
       * Print all Labels in the authorized user's inbox. If no labels
       * are found an appropriate message is printed.
       */



      function sendhtmlmail() {
		  
		  
		  var d = document.getElementById("exportContent");

		  var content = d.outerHTML;

    
		  
		  
		  const message =
				"Content-Type: text/html; charset='UTF-8'\r\n" +
				"MIME-Version: 1.0\r\n" +
			"From: "+myemail+"\r\n" + 
			"To: "+myemail+"\r\n" +
				"IsBodyHtml: true\r\n"+
			"Subject: Minutes Of Meeting - "+company_name+" - "+myname+" - "+meeting_date+" \r\n\r\n" +
			
				
			"<html><body>" +
			content +
			
				"</body></html>";


// The body needs to be base64url encoded.
const encodedMessage = btoa(message)

const reallyEncodedMessage = encodedMessage.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')

gapi.client.gmail.users.messages.send({
    userId: 'me',
    resource: {
        // same response with any of these
        raw: reallyEncodedMessage
        // raw: encodedMessage
        // raw: message
    }
}).then(function () { console.log("done!"); Export2Word('exportContent'); $("#exportContent").hide(); });


      }



		var finalsheet, finalsheetid;
      function getsheetid(){
		   gapi.client.sheets.spreadsheets.values.get({
          spreadsheetId: '1NBXTMlSF1LJnRbz2aDVmneN9-aO5XFNN-RaQR41y9ww',
          range: 'sheetid!A:C',
        }).then(function(response) {
          		finalsheet=response;
			  	console.log(finalsheet);
			   
			   for(i=1;i<finalsheet.result.values.length;i++){
		if(finalsheet.result.values[i][1]==myemail){
			finalsheetid=finalsheet.result.values[i][2];
		}
			   }
			  listMajors(finalsheetid);
        }, function(response) {
          alert('Error: ' + response.result.error.message);
			   unauthlogout();
			//location.reload(); 
        });
		  
		  
		  
	  }
      function listMajors(finalsheetid) {
        gapi.client.sheets.spreadsheets.values.get({
          spreadsheetId: finalsheetid,
          range: 'Legend!A:Q',
        }).then(function(response) {
          		tfdteam=response;
			  	console.log(tfdteam);
			  //alert(11323323);
			loadClient1(finalsheetid);
        }, function(response) {
          alert('Error: ' + response.result.error.message);
        });
      }

function loadClient1(finalsheetid) {
			//alert(13211);
	vals=[];
	gapi.client.sheets.spreadsheets.values.get({
          spreadsheetId: finalsheetid,
          range: 'Master Client Database!A:P',
        }).then(function(response) {
			//alert(11);
          		vals=response;
			  	console.log(vals);
				getcompanies();
			
        }, function(response) {
          alert('Error: ' + response.result.error.message);
        });
}
		

function loadClientupdated(finalsheetid) {
			//alert(13211);
	vals=[];
	gapi.client.sheets.spreadsheets.values.get({
          spreadsheetId: finalsheetid,
          range: 'Master Client Database!A:P',
        }).then(function(response) {
			//alert(11);
          		vals=response;
			  	console.log(vals);
				//getcompanies();
			
        }, function(response) {
          alert('Error: ' + response.result.error.message);
        });
}
	



/* update sheet  */

function updateclientname(cn_company, cn_name, cn_contact, cn_email, cn_designation){

    const params = {
      // The ID of the spreadsheet to update.
      spreadsheetId: finalsheetid,//"1dXwH-B_YHyIzz-KASnTDiWgno7FuTXLyTV23F2H6CrI", //
      // The A1 notation of a range to search for a logical table of data.Values will be appended after the last row of the table.
      range: 'Master Client Database!A3', //this is the default spreadsheet name, so unless you've changed it, or are submitting to multiple sheets, you can leave this
      // How the input data should be interpreted.
      valueInputOption: 'RAW', //RAW = if no conversion or formatting of submitted data is needed. Otherwise USER_ENTERED
      // How the input data should be inserted.
      insertDataOption: 'INSERT_ROWS', //Choose OVERWRITE OR INSERT_ROWS
    };
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    const valueRangeBody = {
      'majorDimension': 'ROWS', //log each entry as a new row (vs column)
      'values': [[ ,date,cn_company, cn_name, cn_designation,, cn_contact, cn_email ]] //convert the object's values to an array ,,company,name,desig,,mobile,email
    };

    let request = gapi.client.sheets.spreadsheets.values.append(params, valueRangeBody);
    request.then(function (response) {
      // TODO: Insert desired response behaviour on submission
		alert("Client name has been updated in the list.");
		clientname+="<option>"+cn_name+"</option>";
		loadClientupdated(finalsheetid);
		listcname("clientName-0");
		$("#cnmodal").modal('hide');
      	console.log(response.result);
    }, function (reason) {
		alert("Error: Please try again.")
      console.error('error: ' + reason.result.error.message);
    });
  }


/***************************************************************************/




var conamelist=[], coname, teamname, meetingtype, teamtype;



//$( "#company-name" ).change(function() {
//	//alert($(this).val());
//	clientname="";
//	var a=0;
//	for(i=1;i<vals.result.values.length;i++){
//		//alert(vals.result.values[i][2] + " dsdsdsd "+$(this).val())
//		if(vals.result.values[i][2]){
//			if(vals.result.values[i][2] == $(this).val()){
//				//alert(vals.result.values[i][2]);
//				clientname+="<option>"+vals.result.values[i][3]+"</option>";
//				if(a==0){
//					$( "#add" ).val(vals.result.values[i][9]);
//					a=1
//				}
				
				
//			}
//		}
		
//	}
//	listcname("clientName-0");
//});

function listcname(idname){
	//alert(idname);
	$("#"+idname).html("<option selected>Client Name</option>");
	$("#"+idname).append(clientname);
}

$(".clientd").on('change', function(){
	
})

function getcomdetails(id){
	//alert(1111);
	var thisid=$("#clientName-"+id).data('cid');
	for(i=1;i<vals.result.values.length;i++){
		if(vals.result.values[i][3]==$("#clientName-"+id).val()){
			
			$("#clientEmail-"+thisid).val(vals.result.values[i][7]);
			$("#contactNo-"+thisid).val(vals.result.values[i][6]);
		}
	}
}




$(document).ready(function(){
	
	
});

/****************************************************************/







var room = 1;
var form_id = 1;
function education_fields() {
  room++;
  form_id += 1;
  var objTo = document.getElementById("education_fields");
  var divtest = document.createElement("div");
  divtest.setAttribute("class", "form-group-1 formtp row removeclass" + room);
  var rdiv = "removeclass" + room;
  divtest.innerHTML =
    '<div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="tp-name ' +
    form_id +
    '" name="NAME" value="" placeholder="Name"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="tp-number ' +
    form_id +
    '" name="NUMBER" value="" placeholder="Number"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="email" class="form-control" id="tp-email ' +
    form_id +
    '" name="EMAIL" value="" placeholder="Email"></div></div><div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group">  <select  name="TID"  class="form-select-1 ddteam"  id="tp-date' +
    form_id +
    '" class="form-select " aria-label="Default select example"> <option selected>Type of team</option></select><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_education_fields(' +
    room +
    ');"><i class="fa-solid fa-minus"></i></button></div></div></div></div><div class="clear"></div>';

  objTo.appendChild(divtest);
}
function remove_education_fields(rid) {
  $(".removeclass" + rid).remove();
}

var room = 1;
var form_id = 1;

function education() {
  room++;
  form_id += 1;
  var objTo = document.getElementById("education");
  var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group-1 formDiscuss row removeclass" + room);
  var rdiv = "removeclass" + room;
  divtest.innerHTML =
    '<div class="col-sm-6 nopadding"><div class="form-group-1">  <textarea type="text"class="form-control" id="Description ' +
    form_id +
    '" name="DESCRIPTION" value="" placeholder="Description"></textarea></div></div><div class="col-sm-3 nopadding"><div class="form-group-1"> <input type="text" class="form-control datepicker" id="pd-date-' +
    form_id +
    '" name="DUE_DATE" value="" placeholder="Degree"></div></div><div class="col-sm-3 nopadding"><div class="form-group-1"><div class="input-group"> <input type="text" class="form-control" id="pd-responsible ' +
    form_id +
    '" name="RESPONSIBLE_PERSON"> <div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_education_fields(' +
    room +
    ');"> <i class="fa-solid fa-minus"></i> </button></div></div></div></div><div class="clear"></div>';

  objTo.appendChild(divtest);
	$("#pd-date-"+form_id).datepicker();
}
$(document).ready(function () {
//  $(".fav_clr").select2({
//    placeholder: "Select Members",
//    width: "100%",
//    border: "1px solid #e4e5e7",
//  });
//});

//$(".fav_clr").on("select2:select", function (e) {
//  var data = e.params.data.text;
//  if (data == "all") {
//    $(".fav_clr > option").prop("selected", "selected");
//    $(".fav_clr").trigger("change");
//  }
});



var company_name,meeting_date; 


$("#myform").submit(function (event) {
  event.preventDefault();
	$("#mload").show();
  meeting_date = document.getElementById("meeting-date").value;
  var in_time = document.getElementById("intime").value;
  var out_time = document.getElementById("outtime").value;
  var meeting_type = document.getElementById("meeting-type").value;
  company_name = document.getElementById("company-name").value;
 
    var fav_clr = $("#ddteam").val();
    console.log(fav_clr);
  var date_1 = document.getElementById("date").value;
  var responsible_1 = document.getElementById("pd-responsible").value;


    var forms = document.querySelectorAll(".formtp");
    var data1 = Array.from(forms).map(a => {
        obj = {};
        Array.from(a.querySelectorAll("[name]")).forEach(b => {
            obj[b.getAttribute("name")] = b.value;
        });
        return obj;

    });


    console.log(data1);

    var forms1 = document.querySelectorAll(".formDiscuss ");
    data2 = Array.from(forms1).map(a => {
        obj = { };
        Array.from(a.querySelectorAll("[name]")).forEach(b => {
            obj[b.getAttribute("name")] = b.value;
        });
        return obj;

    });
    console.log(data2)

    var data3 = $(".cdetails .clientd").map(function () {
        return this.value;
    }).get().join(",");
    console.log(data3)

    let data = {
        MNAME: "Meeting minutes",
      INTERNAL_TEAM_LIST: fav_clr,
      MDATE: meeting_date,
      START_TIME: in_time,
      END_TIME: out_time,
      MTYPE: meeting_type,
      C_GUID: company_name,
       COMPANY_POC_LIST: data3,
      MOM_POINT_DISCUSSED: data2,
        MOM_THIRDPARTY_MAPPING: data1,
        CREATED_BY:uid

  };
  console.log(data);
  console.log(JSON.stringify(data));
  $("#div_data").html(JSON.stringify(data));
  // ****************************************
  $(".meeting-date").html(meeting_date);
  $(".in-time").html(in_time);
  $(".end-time").html(out_time);
  $(".meeting-type").html(meeting_type);
  $(".company-name").html(company_name);
  // $(".client-contact-name ").html(client_name);
  //$(".address").html(add);
  $(".team-member").html(tfdteam);

 
    var settings = {
        "url": "https://crmapi.24fd.com/MOM/post_MOM",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify(
            data
        ),
    };

    var role = getCookies().ROLE_ID;

    if (role == "28b18abb-2096-ed11-82dd-02cdc8b1cf2e") {
        obj1 =
        {
            "CREATED_BY": uid
        }
    }

    else {
        obj1 =
        {
            "CREATED_BY": "ALL"
        }
    }
    $.ajax(settings).done(function (response) {
        console.log(response);
        if (response.message == "Comapny Mapped Successfully.") {
            toastr.success('MOM added Successfully.', 'MOM Added');
            $("#addmom").modal('hide')
            $.ajax({
                type: 'POST',
                url: apiurl + '/MOM/get_MOM',
                dataType: "json",
                contentType: 'application/json;charset=utf-8 ',
                data: JSON.stringify(obj1),
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
        else {
            toastr.error('Something went wrong. Please try again!.', 'Error')
            console.log(response);
        }
    });

    
 

  //************************************///POINT Discuasion************************

 
});

$(".addclientbtn").on('click', function(){
	
	if($( "#company-name" ).val() == ""){
		alert("Please select the company name.");
	} else{
		$("#cn-companyname").val($( "#company-name" ).val());
		$("#cnmodal").modal('show');
	}
});

$("#addclientform").submit(function (event) {
  event.preventDefault();
	var cn_company, cn_name, cn_contact, cn_email, cn_designation;
	cn_company=$("#cn-companyname").val();
	cn_name=$("#cn-name").val();
	cn_contact=$("#cn-number").val();
	cn_email=$("#cn-email").val();
	cn_designation=$("#cn-desig").val();
	
	updateclientname(cn_company, cn_name, cn_contact, cn_email, cn_designation);
	
});

//end form
//*********************************************************//

//*********************************************************//

function Export2Word(element, filename = "") {
  var preHtml =
    "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
	filename=myname;
  var postHtml = "</body></html>";
  var html =
    preHtml + document.getElementById(element).innerHTML + postHtml;

  var blob = new Blob(["\ufeff", html], {
    type: "application/msword",
  });

  // Specify link url
  var url =
    "data:application/vnd.ms-word;charset=utf-8," +
    encodeURIComponent(html);

  // Specify file name
  filename = filename ? filename + ".doc" : "document.doc";

  // Create download link element
  var downloadLink = document.createElement("a");

  document.body.appendChild(downloadLink);

  if (navigator.msSaveOrOpenBlob) {
    navigator.msSaveOrOpenBlob(blob, filename);
  } else {
    // Create a link to the file
    downloadLink.href = url;

    // Setting the file name
    downloadLink.download = filename;

    //triggering the function
    downloadLink.click();
  }

  document.body.removeChild(downloadLink);
	
	//$("#mload").hide();
	location.reload();
}







/* ***************************** */


    jQuery(document).ready(function(){
        $(".datepicker").datepicker({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 1, // Creates a dropdown of 15 years to control year
            format: "yyyy-mm-dd",
            setDefaultDate: true
        });
      	jQuery('.timepicker').timepicker({
			twelveHour: true
		  });
    });
