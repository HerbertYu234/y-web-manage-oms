<head>
    <title>文章标签</title>

    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <!-- Datatables -->
    <script src="/js/lib/datatables.net/js/jquery.dataTables.js"></script>
    <link href="/js/lib/datatables.net/css/jquery.dataTables.css" rel="stylesheet">

    <#--<link  href="/js/lib/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">-->
    <#--<script src="/js/lib/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>-->
    <style type="text/css">
        .dataTables_paginate .paginate_button{
            box-sizing: initial !important;
            display: initial !important;
            min-width: initial !important;
            padding: initial !important;
            margin-left: initial !important;
            text-align: initial !important;
            text-decoration: initial !important;
            color: initial !important;
            border: initial !important;
            border-radius: initial !important;
        }
        .paginate_button:hover{
            background: none!important;
        }

        .dataTables_paginate .paginate_button>a{
            font-size: 12px;
            display: inline-block;
            font-weight: bold;
            padding: 0 10px;
            line-height: 20px;
            text-align: center;
            transition: 0.3s all linear;

            padding: 6px 9px !important;
            background: rgba(65, 167, 191, 0.2) !important;
            /*box-shadow: inset 0 0 45px 0 rgba(32, 101, 143, 0.35);*/
            border-color: #ddd !important;
        }

        .dataTables_paginate .paginate_button> a:hover, .dataTables_paginate .paginate_button.active>a {
            /*background: #0099f1;*/
            color: #009cd7;
            /*border-radius: 50px;*/
            /*-webkit-border-radius: 50px;*/
            transition: 0.3s all linear;

            padding: 6px 9px !important;
            background: rgba(65, 167, 191, 0.2) !important;
            /*box-shadow: inset 0 0 45px 0 rgba(32, 101, 143, 0.35);*/
            border-color: #ddd !important;
        }
    </style>
</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div>
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>文章标签列表
                            <small>Article Tag List</small>
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
                            <button id="btn_add" type="button" class="btn btn-info" title="新增标签" data-toggle="modal"
                                    data-target=".modal-tag">
                                <i class="fa fa-plus fa-fw"></i>
                            </button>

                            <button id="btn_batch_delete" type="button" class="btn btn-danger" title="删除选中"><i
                                    class="fa fa-trash-o fa-fw"></i>
                            </button>
                        </div>

                        <div class="modal fade modal-tag" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel">标签编辑</h4>
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    <#--<h4>Text in a modal</h4>-->
                                        <form class="form-horizontal form-label-left addOrUpdateForm" novalidate>
                                            <input type="hidden" name="id">
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">名称
                                                    <span class="required">*</span></label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" class="form-control " name="name"
                                                           required="required" placeholder="请输入标签名称"/>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="description">标签描述 </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea class="form-control " name="desc" placeholder="请输入标签描述"
                                                              maxlength="100"></textarea>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary btn_modal_save">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--
                            1、bulk_action仅仅为了js选择器
                            2、class: display  in jquery.dataTables.css
                            2、class: table table-striped jambo_table  in dataTables.bootstrap.min.css
                        -->
                        <table id="datatable" class="display bulk_action" style="width:100%">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check-all" class="flat">
                                </th>
                                <th <#--class="column-title"-->>编码</th>
                                <th <#--class="column-title"-->>名称</th>
                                <th <#--class="column-title"-->>描述</th>
                                <th class="column-title no-link last"><span class="nobr">操作</span>
                            </tr>
                            </thead>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<script>
    $(function () {

        new YWM.Table($('#datatable'),{
            info: false,
            lengthChange: true,
            serverPromise: function(param){
                return YWM.Api.articleTag.page(param);
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
            },
            initComplete: function (settings, json) {
                console.log("initComplete!");
            },
            lengthMenu: [2,5, 10, 20], //更改显示记录数  也可以：[ [10, 25, 50, -1], [10, 25, 50, "All"] ]
            pageLength: 2, //默认显示的记录数
            pagingType: "input",//"full_numbers",
            columns: [
                {
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' class='flat' name='table_records'>";
                    }
                },
                {"data": "id"},
                {"data": "name"},
                {"data": "desc"},
                {
                    "data": null, render: function (data, type, row, meta) {
                        // let tmp = "<a href='javascript:;' onclick=" + tagEdit(data.id) + " >编辑</a>"; 这种写法会立刻触发tagEdit？？
                        let tmp = "<a href='javascript:;' class='tagEdit' >编辑</a>";
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

        //保存标签
        $(".btn_modal_save").click(function () {
            let $form = $(this).closest(".modal-content").find(".addOrUpdateForm");
            if ($form.length > 0) {
                YWM.Api.articleTag.store($form.serialize()).then(function (res) {
                    location.reload();
                })
            }
        });

        //编辑标签
        $("body").on("click", ".tagEdit", function () {
            let id = $(this).closest("tr").attr("id");
            tagEdit(id);
        });


        function tagEdit(id) {
            if (!id) return;
            YWM.Api.articleTag.findById(id).then(function (tag) {
                $(".modal-tag").find("form [name='id']").val(tag.id);
                $(".modal-tag").find("form [name='name']").val(tag.name);
                $(".modal-tag").find("form [name='desc']").val(tag.desc);
            });
            $(".modal-tag").modal('show');
        }

        //关闭弹出层
        $(".modal-tag").on('hidden.bs.modal', function (e) {
            // 清空之前内容
            $(".modal-tag").find("form [name='id']").val("");
            $(".modal-tag").find("form [name='name']").val("");
            $(".modal-tag").find("form [name='desc']").val("");
        })

    })
</script>
</body>