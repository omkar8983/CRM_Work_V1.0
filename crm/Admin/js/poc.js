
var urlParams = new URLSearchParams(window.location.search);
var userid = urlParams.get('uid');
var hub = urlParams.get('name');

urlsales = apiurl + '/Company_Master/get_company_POC_mapping_bySalesPerson';
obj = {
    "C_GUID": "ALL",
    "USER_GUID": userid
}

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
        (poctbl = $("#poctbl").DataTable({
            "fnDrawCallback": function (settings) {
                var allChecked = true;
                $('#poctbl tbody tr').each(function () {
                    $(this).find(':checkbox[name=ckbox]').each(function () {
                        if (!$(this).is(':checked')) {
                            allChecked = false;
                        }
                    });
                });
                $('#checkAll').prop('checked', allChecked);
            },

            buttons: [
                {
                    text: ' Assigned POC',
                    action: function (e, dt, node, config) {
                        var values = new Array();
                        $('.checkbox:checked', poctbl.rows().nodes()).each(function () {
                            var obj = poctbl.row($(this).parents('tr')).data();

                            values.push(obj.poC_ID);
                        });
                        var count = values.length;
                        $('#bblcount').text(count);
                        $('#pocid1').val(JSON.stringify(values));
                        $('#assign').modal('show');
                        $('#form-assign').attr('id', 'assigntbl');;

                    }
                },
            ],

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
                {
                    "data": "poC_ID",
                    "mRender": function (data, type, row) {
                        return '<input type="checkbox" name="ckbox" style="margin:12px;" data-id="' + row.c_GUID + '" value="' + row.poC_ID + '" class="checkbox" id="ckbox"/> '
                    }
                },
                { "data": "name" },
                { "data": "companY_NAME" },
                { "data": "contact" },
                {
                    "data": null,
                    "sClass": "skip-click",
                    "sDefaultContent": '<div class="viewpoc ">View POC</div>'
                }
            ],
            columnDefs: [
                { className: "text-center", targets: [] },
                { width: 60, targets: 0 },
                { width: 220, targets: 1 },
                { width: 250, targets: 2 },
                {
                    "orderable": false,
                    targets: [0]
                },
                {
                    targets: [],
                    render: function (data, type, row, meta) {
                        return type === 'filter' ?
                            data === '' ? '(Empty)' : data : data;
                    }
                }
            ],
            "createdRow": function (row, data, dataIndex) {
                if (data["assignedto"] != "") {
                    $("td .checkbox", row).css("pointer-events", "none");
                    $("td .checkbox", row).attr('checked', 'checked');
                    $("td .checkbox", row).css('display', 'none');
                    $("td:nth-child(1)", row).html('<img src="images/checked.png" class="chkimg">');
                }
                else {

                }

            },

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
                            poctbl.draw();

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



      

        $('#poctbl tbody').on("click", ".viewpoc", function () {
            var obj = poctbl.row($(this).parents('tr')).data();
            CID = obj.cid;
            POC_ID = obj.poC_ID;
            window.open('pocDetails.aspx?cid=' + CID + '&poc_id=' + POC_ID);

        });

        $('#poctbl tbody').on("click", "#checkAll", function () {
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
                $(':checkbox').each(function () {
                    this.checked = false;
                    $("#pocid1").val("");
                });
            }

        });

        $(document).on("change", "#fromdatef", function (e) {
            e.preventDefault(), ($.fn.dataTableExt.afnFiltering.length = 0);
            var t = $("#fromdatef").val();
            "" == t && (t = "1980-12-12"), (endDate = $("#todatef").val()), "" == endDate && (endDate = "2080-12-12"), filterByDate(6, t, endDate), poctbl.draw();
        });
    },

});