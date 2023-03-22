
var apiurl = 'https://crmapi.24fd.com'

//Bind DropDown with API
function bindselect(ajaxurl, ddidname) {
    //alert(ddidname);
    var myjson = [];
    var errorflag = [];
    $.getJSON(ajaxurl, { format: "json" }).done(function (data) {
        myjson = data.dataObject;

        errorflag = data.code;
        if (errorflag === "500") {
            $('#' + errordiv).html("<div class='text-center'>Server Side Error .<div>");
        }
        else if (errorflag === "200" & myjson === null) {
            $('#' + errordiv).html("<div class='text-center' style='color:#fff!important;'>Data not available .<div>");
        }
        else {
            if (data.dataObject.length === 0) {
                $('#' + errordiv).css('background-color', 'rgba(244, 67, 54, 0.85)');
                $('#' + errordiv).fadeIn('slow');
                $('#' + errordiv).html("<i class='fa fa-info-circle'></i>&nbsp;&nbsp;<label id='lblerrorpage'> No data available in " + ddidname + " DropDown </label>");
                setTimeout(function () {
                    $('#' + errordiv).fadeOut('slow');
                }, 3000);

            }
            else {

                $('#' + ddidname).select2({
                    casesensitive: false,
                    tags: true,
                    data: myjson,
                    cache: true,

                    delay: 250,
                    closeOnSelect: true,
                });
          }
        }
    });
}



function bindselect1(ajaxurl, ddidname) {
    //alert(ddidname);
    var myjson = [];
    var errorflag = [];
    $.getJSON(ajaxurl, { format: "json" }).done(function (data) {
        myjson = data.dataObject;

        errorflag = data.code;
        if (errorflag === "500") {
            $('#' + errordiv).html("<div class='text-center'>Server Side Error .<div>");
        }
        else if (errorflag === "200" & myjson === null) {
            $('#' + errordiv).html("<div class='text-center' style='color:#fff!important;'>Data not available .<div>");
        }
        else {
            if (data.dataObject.length === 0) {
                $('#' + errordiv).css('background-color', 'rgba(244, 67, 54, 0.85)');
                $('#' + errordiv).fadeIn('slow');
                $('#' + errordiv).html("<i class='fa fa-info-circle'></i>&nbsp;&nbsp;<label id='lblerrorpage'> No data available in " + ddidname + " DropDown </label>");
                setTimeout(function () {
                    $('#' + errordiv).fadeOut('slow');
                }, 3000);
            }
            else {

                $('.' + ddidname).select2({
                    casesensitive: false,
                    tags: true,
                    data: myjson,
                    cache: true,

                    delay: 250,
                    closeOnSelect: true,
                });
            }
        }
    });
}

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

