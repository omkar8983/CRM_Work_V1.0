
var urlParams = new URLSearchParams(window.location.search);
var userid = urlParams.get('uid');
var name = urlParams.get('name');
obj1 =
{
    "CREATED_BY": userid
}

$.ajax({
    type: 'POST',
    url: "https://crmapi.24fd.com/MOM/get_MOM",
    dataType: "json",
    contentType: 'application/json;charset=utf-8 ',
    data: JSON.stringify(obj1),
    async: false,
    processData: false,
    success: function (response) {

        var tbldata = response.dataObject;
        (momtbl = $("#momtbl").DataTable({
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
                { "data": "companY_NAME" },
                { "data": "mdate" },
                { "data": "createD_BY" },
                {
                    "data": "min",
                    "mRender": function (data, type, row) {
                        return '<a class="btn btn-success momview">View</a>'

                    }
                },

            ],
            columnDefs: [
                { className: "text-center", targets: [] },
                { width: 60, targets: 0 },
                { width: 220, targets: 1 },
                { width: 250, targets: 2 },
                {
                    targets: [0],
                    render: function (data, type, row, meta) {
                        return type === 'filter' ?
                            data === '' ? '(Empty)' : data : data;
                    }
                }
            ],

            initComplete: function () {
                var info = this.api().page.info();

                $("#entries").html(info.recordsTotal);
                var cfiltercol = [];
                cfiltercol = [0];
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
                            momtbl.draw();

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



            $(".assignbtn1").click(function () {
                $('#assign').modal('show');
            });
        $(".AddTask").click(function () {
            var obj = momtbl.row($(this).parents('tr')).data();
            CID = obj.cid;
            $('#addtask').modal('show');
            $('#tcid').val(CID);
        });


        $('#momtbl tbody').on("click", ".momview", function () {
            var obj = momtbl.row($(this).parents('tr')).data();
            MID = obj.mid;
            window.open('momDetails.aspx?MID=' + MID)
        });

        $('#momtbl tbody').on("click", ".checkbox", function () {
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


        $(document).on("change", "#fromdatef", function (e) {
            e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
            var t = $("#fromdatef").val();
            "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), momtbl.draw();
        });
    },

});