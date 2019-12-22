<#import "${wolf.context}/macros/modal.ftl" as modal />
<head>
    <title>公告</title>
    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <!-- Switchery -->
    <link href="/js/lib/switchery/dist/switchery.min.css" rel="stylesheet">
    <script src="/js/lib/switchery/dist/switchery.min.js"></script>

    <!-- Datatables -->
    <script src="/js/lib/datatables.net/js/jquery.dataTables.js"></script>
    <link href="/js/lib/datatables.net/css/jquery.dataTables.css" rel="stylesheet">

<#--<link  href="/js/lib/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">-->
<#--<script src="/js/lib/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>-->
</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div>
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>网站公告
                            <small>Announce</small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                            </li>
                        <#--<li><a class="close-link"><i class="fa fa-close"></i></a></li>-->
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div class="btn-group hidden-xs" id="toolbar">
                            <button id="btn_add" type="button" class="btn btn-info" title="新增" data-toggle="modal"
                                    data-target=".modal-announce">
                                <i class="fa fa-plus fa-fw"></i>
                            </button>

                            <button id="btn_batch_delete" type="button" class="btn btn-danger" title="删除选中"><i
                                    class="fa fa-trash-o fa-fw"></i>
                            </button>
                        </div>

                        <!--
                            1、bulk_action仅仅为了js选择器
                            2、class: display  in jquery.dataTables.css
                            2、class: table table-striped jambo_table  in dataTables.bootstrap.min.css
                        -->
                        <table id="announceTable" class="display bulk_action" style="width:100%">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check-all" class="flat">
                                </th>
                                <th <#--class="column-title"-->>标题</th>
                                <th <#--class="column-title"-->>内容</th>
                                <th <#--class="column-title"-->>启用/禁用</th>
                                <th <#--class="column-title"-->>轮播</th>
                                <th><span class="nobr">操作</span>
                            </tr>
                            </thead>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <@modal.announce_edit></@modal.announce_edit>
</div>
<!-- /page content -->

<script>
    let table;
    $(function () {

        //批量删除
        $("#btn_batch_delete").click(function () {
            let ids = getTableActiveIds();
            if (!ids || ids.length < 1) {
                alert("请先选择待删除记录");
                return;
            }
            if (confirm("确定要删除选中记录？")) {
                YWM.Api.notice.batchDelete(ids).then(function () {
                    window.location.reload();
                })
            }
        });

        table = new YWM.Table($('#announceTable'), {
            info: false,
            lengthChange: true,
            serverPromise: function (param) {
                return YWM.Api.notice.page(param);
            },
            createdRow: function (row, data, index) {
                console.log("createdRow:", row, data, index);
            },
            rowCallback: function (row, data, displayNum, displayIndex, dataIndex) {
                console.log("rowCallback: ", row, data, displayNum, displayIndex, dataIndex);
            },
            footerCallback: function (row, data, start, end, display) {
                console.log("footerCallback:", row, data, start, end, display);
            },
            drawCallback: function (settings) {
                init_iCheck();
                init_switchery(function () {

                    $(".js-switch.playable").off("change").on('change', function () {
                        var id = $(this).closest("tr").attr("id");
                        var checked=  $(this).prop("checked");
                        console.log(checked);
                        YWM.Api.notice.playable(id,checked).then(function () {
                            window.location.reload();
                        });
                    });

                });
            },
            initComplete: function (settings, json) {
                console.log("initComplete!");
            },
            lengthMenu: [4, 5, 10, 20], //更改显示记录数  也可以：[ [10, 25, 50, -1], [10, 25, 50, "All"] ]
            pageLength: 4, //默认显示的记录数
            pagingType: "input",//"full_numbers",
            columns: [
                {
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' class='flat' name='table_records'>";
                    }
                },
                {"data": "title"},
                {"data": "content"},
                {
                    "data": "status", render: function (data, type, row, meta) {
                        let active = data && data == 1 ? "checked='checked'" : "";
                        return "<input type='checkbox' class='js-switch status' " + active + ">"
                    }
                },
                {
                    "data": "playable", render: function (data, type, row, meta) {
                        let active = data ? "checked='checked'" : "";
                        return "<input type='checkbox' class='js-switch playable' " + active + ">"
                    }
                },
                {
                    "data": null, render: function (data, type, row, meta) {
                        // let tmp = "<a href='javascript:;' onclick=" + tagEdit(data.id) + " >编辑</a>"; 这种写法会立刻触发tagEdit？？
                        let tmp = "<a href='javascript:;' class='announceEdit' >编辑</a>";
                        return tmp;
                    }
                }
            ],
            columnDefs: [
                // { targets: [0], width: "20%"},
                {targets: '_all', visible: true}
            ],
            dom: '<"top"f>rt<"bottom"l<"clear">ip><"clear">'
        });

        //保存
        $(".btn_modal_save").click(function () {
            let $form = $(this).closest(".modal-content").find(".addOrUpdateForm");
            if ($form.length > 0) {
                YWM.Api.notice.store($form.serialize()).then(function (res) {
                    location.reload();
                })
            }
        });

        //编辑
        $("body").on("click", ".announceEdit", function () {
            let id = $(this).closest("tr").attr("id");
            announceEdit(id);
        });


        function announceEdit(id) {
            if (!id) return;
            YWM.Api.notice.findById(id).then(function (tag) {
                $(".modal-announce").find("form [name='id']").val(tag.id);
                $(".modal-announce").find("form [name='title']").val(tag.title);
                $(".modal-announce").find("form [name='content']").val(tag.content);
            });
            $(".modal-announce").modal('show');
        }

        //关闭弹出层
        $(".modal-tag").on('hidden.bs.modal', function (e) {
            // 清空之前内容
            $(".modal-announce").find("form [name='id']").val("");
            $(".modal-announce").find("form [name='title']").val("");
            $(".modal-announce").find("form [name='content']").val("");
        })

    })


    function getTableActiveIds() {
        return Array.prototype.slice.call(table.rows(".selected").ids());
    }
</script>
</body>