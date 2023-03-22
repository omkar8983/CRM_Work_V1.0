
var urlParams = new URLSearchParams(window.location.search);
var userid = urlParams.get('uid');
var name = urlParams.get('name');

urlsales = apiurl + '/DailyActivity/get_daily_activity';
var obj = { "USER_GUID": userid, "STATUS": "COMPLETED" }

$.ajax({
    type: 'POST',
    url: urlsales,
    dataType: "json",
    contentType: 'application/json;charset=utf-8 ',
    data: JSON.stringify(obj),
    async: false,
    processData: false,
    success: function (response) {

        var tbldata = response.dataObject;
        (dailytbl = $("#dailytbl").DataTable({
            dom: "",
            order: [],
            responsive: { details: { type: "column", target: "tr" } },
            lengthMenu: [
                [5, 25, 1e3, 500, 200, 100, 50, 25],
                ["ALL", 1e3, 500, 200, 100, 50, 25, 10],
            ],
            pagingType: "full",
            infoFiltered: !0,
            aaData: tbldata,
            columns: [
                { "data": "poC_NAME" },
                { "data": "companY_NAME" },
                
                { "data": "createD_BY" },
                {
                    "data": "activity",
                    "render": function (data) {
                        if (data == 'Meeting') {
                            return "<div class='btnmom' style='font-size:1.5em'> <i class='ri-eye-line viewmom' title='View MOM'  style='color:green;'></i> "
                        } else {
                            return "<div class='btnmom' style='font-size:1.5em'>- </div>"
                            return ""
                        }
                    },

                    "name": "Status", "autoWidth": true
                },
            ],
            columnDefs: [
                { className: "text-center", targets: [] },
                { width: 100, targets: 0 },
                { width: 120, targets: 1 },
                { width: 100, targets: 2 },

                {
                    targets: [0, 1],
                    render: function (data, type, row, meta) {
                        return type === 'filter' ?
                            data === '' ? '(Empty)' : data : data;
                    }
                }
            ],
            "createdRow": function (row, data, dataIndex) {


            },

            initComplete: function () {
                var info = this.api().page.info();

                $("#entries").html(info.recordsTotal);
                var cfiltercol = [];
                cfiltercol = [0, 1, 2, 3];
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
                            dailytbl.draw();

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




            $('#dailytbl tbody').on("click", ".checkbox", function () {
                if ($('.checkbox').is(":checked")) {
                    searchIDs = $(this).val()
                    var searchIDs = $("input:checkbox:checked").map(function () {
                        return $(this).val();
                    }).get(); // <----
                    var remove_Item = 'test';
                    searchIDs1 = $.grep(searchIDs, function (value) {
                        return value != remove_Item;
                    });
                    $("#pocid1").val(searchIDs1);
                }
                else {
                    $("#pocid1").val("");
                }
            });


        $('#dailytbl tbody').on("click", '.viewmom', function (e) {
            window.open('MOM.aspx');
        });


        $('#dailytbl tbody').on("click", '.editico', function (e) {
            $("#pocupdate").modal("show");
            var obj = dailytbl.row($(this).parents('tr')).data();
            $("#pocid").val(obj.poC_ID)
            $("#nameup").val(obj.name);
            $("#emailup").val(obj.email);
            $("#numberup").val(obj.contact);
            $("#desigup").val(obj.designation);
            $("#deptup").val(obj.department);

            var emaillist = obj.emaiL1;
            var emailarr = []
            emailarr.push(obj.emaiL1);
            emailarr = emaillist.split(",");

            var numberlist = obj.contacT1;
            var numarr = []
            numarr.push(obj.contacT1);
            numarr = numberlist.split(",");



            var docwrap = "";
            for (var i = 0; i < emailarr.length; i++) {
                if (emailarr[i] == "") {

                }
                else {
                    docwrap = docwrap + '<input type="email" class="form-control mb-3" name="CONTACT_PERSON_EMAIL" id="txtemail' + i + '" placeholder="Email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" title="eg. example@example.com" value="' + emailarr[i] + '" >  ';
                }

            }
            $('.div1').html(docwrap);

            var docwrap = "";
            for (var i = 0; i < numarr.length; i++) {
                if (numarr[i] == "") {

                }
                else {
                    docwrap = docwrap + '<div class="col-md-6"><input type="text" class="form-control mb-3" pattern="[0-9]{10}" title="10 digits eg. 8888889999" name="number" id="txtnumber' + i + '" placeholder="Mobile No. of Contact Person" value="' + numarr[i] + '" ></div> <div class="removeRow col-md-3 mb-2 mt-1 pr-4"><a class="btnRemove">Remove</a></div>';
                }
            }
            $('.div2').html(docwrap);
        });

        $('#assign').on('click', '.btnSave', function (event) {
            event.preventDefault();

            idarray = $('#pocid1').val(); //retrieve array
            var idarray1 = idarray.replace(/[[\]"]/g, '');
            var callerid = $("#ddsales option:selected").val();
            //  var records = $('#bblcount').text();
            var USER_CODE = getCookies().solitary_code;
            console.log(idarray1);
            var chk1 = $("#pocid1").val();
            var USER_GUID = $("#ddsales option:selected").val();
            var dataobj = {
                "POC_ID": idarray1,
                "C_GUID": companyid,
                "USER_GUID": USER_GUID,
                "CREATED_BY": getCookies().USER_GUID,
            };

            console.log(dataobj);
            console.log(dataobj);
            var settings = {
                "url": "https://crmapi.24fd.com/Company_Master/post_company_POC_24fdperson_mapping",
                "method": "POST",
                "timeout": 0,
                "headers": {
                    "Content-Type": "application/json"
                },
                "data": JSON.stringify(
                    dataobj
                ),
            };

            $.ajax(settings).done(function (response) {
                $("#assign").modal("hide");
                console.log(response);

                if (response.message == 'Comapny-POC assigned to 24fd person Successfully.') {
                    toastr.success('POC Assigend Successfully.', 'POC Assigend')
                    $("#form-assign")[0].reset();

                    $.ajax({
                        type: 'POST',
                        url: apiurl + '/Company_Master/get_company_POC_mapping',
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8 ',
                        data: JSON.stringify(obj),
                        async: false,
                        processData: false,
                        success: function (response) {
                            poclist(response);
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        url: urlsales,
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8 ',
                        data: JSON.stringify(obj),
                        async: false,
                        processData: false,
                        success: function (response) {
                            var item = response.dataObject;
                            dailytbl.clear().draw();
                            dailytbl.rows.add(item);
                            dailytbl.columns.adjust().draw();
                        }
                    });
                }


                else if (response.message == 'EXISTSING Comapny-POC Mapped Successfully.') {
                    toastr.warning('Existing POC.', 'Existing POC')
                }
                else {
                    toastr.error('Something went wrong. Please try again!.', 'Error')
                    console.log(response);
                }
            });


        });
        $(document).on("change", "#fromdatef", function (e) {
            e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
            var t = $("#fromdatef").val();
            "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), dailytbl.draw();
        });
    },

});