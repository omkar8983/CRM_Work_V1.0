
var urlParams = new URLSearchParams(window.location.search);
var userid = urlParams.get('uid');
var name = urlParams.get('name');
urlsales = apiurl + '/DailyActivity/get_daily_activity';
var obj = { "USER_GUID": userid, "STATUS": "PENDING", "DATE_FILTER": "UPCOMING" }

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
        (todotbl = $("#todotbl").DataTable({
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
                { "data": "activity" },
               
                {
                    "data": "followuP_DATE",
                    "mRender": function (data, type, row) {
                        if (row.followuP_DATE == '') {
                            return '<p>-</p>'
                        }
                        else {
                            return '<p>' + row.followuP_DATE + '</p>'
                        }
                    }
                },
            ],
            columnDefs: [
                { className: "text-center", targets: [] },
                { width: 100, targets: 0 },
                { width: 100, targets: 1 },
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
                            todotbl.draw();

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


            $('#todotbl tbody').on("click", ".updatetask ", function () {
                $("#updatetask").modal('show');
                var obj = todotbl.row($(this).parents('tr')).data();
                AID = obj.aid;

            });

        $(document).on("change", "#fromdatef", function (e) {
            e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
            var t = $("#fromdatef").val();
            "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), todotbl.draw();
        });
    },

});