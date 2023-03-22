

var urlParams = new URLSearchParams(window.location.search);
var userid = urlParams.get('uid');
var hub = urlParams.get('name');

var dataurl = apiurl + "/Company_Master/get_all_company_list_bySalesPerson?User_Id=" + userid;
$.getJSON(dataurl, { format: "json" }).done(function (data) {
    $('#loader1').removeClass('hidden');
    // Object split 
    myjson = data.dataObject;
    if (myjson === null) {
        $('#ctable').hide();
        $('#errWrap').show();
    }
    else {
        $('#ctable').show();
        $('#errWrap').hide();

        ctable = $('#ctable').DataTable({

            "dom": '',
            buttons: {
                dom: {
                    button: {
                        className: 'btn btn-light'
                    }
                },
                buttons: [
                    { extend: 'excelHtml5', title: 'Folloup-Report SC' }

                ]
            },
            "order": [],
            responsive: {
                details: {
                    type: 'column',
                    target: 'tr'
                }
            },


            "dom": '',
            "lengthMenu": [[10, 50, 100, 200, 500, 1000, -1], [10, 50, 100, 200, 500, 1000, "All"]],
            "pagingType": "full",
            "infoFiltered": true,
            "processing": true,
            language: {
                paginate: {
                    next: '<i class="ri-arrow-right-circle-line tblico"></i>', // or '→'
                    previous: '<i class="ri-arrow-left-circle-line tblico"></i>' // or '←' 
                }
            },
            //-----------------------Ajax data code---------------------------------------->
            aaData: myjson,
            destroy: true,

            "columns": [
                { "data": "name" },
                { "data": "isActive" },
                { "data": "ctype" },
                { "data": "sectoR_NAME" },
                { "data": "industrY_MAPPED" },
                {
                    "mData": function (data, type, dataToSet) {
                        return remarkrender(data.status);
                    }
                },
            ],



            columnDefs: [

                { "width": "100px", "targets": 4 },
                {
                    targets: [0, 1],
                    "orderable": false
                },

                {
                    target: 1,
                    visible: false,
                },
            ],

            "createdRow": function (row, data, dataIndex) {
                switch (data["isActive"]) {
                    case "1": $("td", row).css("background-color", "#efefef");
                        break;
                    case "0": $("td", row).css("background-color", "#ccc");
                        $("td .present", row).css("pointer-events", "none");
                        $("td .present", row).text("pending");
                        $("td .present", row).css("background", "#92abb3");
                        $("td .present", row).css("color", "#4f606c");
                        break;
                    case "2": $("td", row).css("background-color", "#ccc");
                        $("td .present", row).css("pointer-events", "none");
                        $("td .present", row).text("Rejected");
                        $("td .present", row).css("background", "#D62646");
                        $("td .present", row).css("color", "#fff");
                        break;
                }
            },

            initComplete: function () {
                var info = this.api().page.info();

                $("#entries").html(info.recordsTotal);
                var cfiltercol = [];
                cfiltercol = [2, 4];
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
                            ctable.draw();

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
        });
    }

    $('#ctable tbody').on("click", '.status', function (event) {
        var obj = ctable.row($(this).parents('tr')).data();
        var cid = obj.c_GUID;
        window.open('CompanyDetails.aspx?cid=' + cid);
    });


    function remarkrender(remark) {
        if (remark == "ACTIVE" || "Active") {
            return '<p class="present status">Active</p>'
        }
        else if (remark == "Inactive") {
            return '<p class="absent status">Inactive</p>'
        }

    }
});