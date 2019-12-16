<!DOCTYPE html>
<html lang="en">
<head>
    <title>文章列表 </title>

    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <!-- Switchery -->
    <link href="/js/lib/switchery/dist/switchery.min.css" rel="stylesheet">
    <script src="/js/lib/switchery/dist/switchery.min.js"></script>

    <!-- Datatables -->
    <script src="/js/lib/datatables.net/js/jquery.dataTables.js"></script>

    <link href="/js/lib/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <script src="/js/lib/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

    <script src="/js/lib/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/js/lib/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="/js/lib/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="/js/lib/datatables.net-buttons/js/buttons.print.min.js"></script>

    <link href="/js/lib/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <script src="/js/lib/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>

    <link href="/js/lib/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <script src="/js/lib/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>

<#--<script src="/js/lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script>-->
<#--<link  href="/js/lib/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">-->
<#--<script src="/js/lib/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>-->

    <link href="/js/lib/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    <script src="/js/lib/datatables.net-scroller/js/dataTables.scroller.min.js"></script>

    <script src="/js/lib/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
</head>

<body class="nav-md">

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
    <#--<div class="page-title">
        <div class="title_left">
            <h3>Tables
                <small>Some examples to get you started</small>
            </h3>
        </div>

        <div class="title_right">
            <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                  <button class="btn btn-default" type="button">Go!</button>
                </span>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>-->

        <div class="row" style="display: block;">
            <div class="clearfix"></div>

            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>文章列表
                            <small>Article List</small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <p>Add class <code>bulk_action</code> to table for bulk actions options on row select</p>

                    <#--<div class="row">-->
                    <#--<div class="col-md-6">-->
                    <#--<div class="btn-group">-->
                    <#--<button class="btn btn-success" type="button">新建</button>-->
                    <#--<button class="btn btn-info" type="button">删除</button>-->
                    <#--<button class="btn btn-primary" type="button">Haha</button>-->
                    <#--</div>-->

                    <#--<div class="columns columns-right btn-group pull-right"><button class="btn btn-default" type="button" name="refresh" title="刷新"><i class="fa fa-refresh icon-refresh"></i></button></div>-->
                    <#--<div class="pull-right search"><input class="form-control" type="text" placeholder="搜索"></div>-->
                    <#--</div>-->
                    <#--</div>-->

                        <div class="fixed-table-toolbar">
                            <div class="bs-bars pull-left">
                                <div class="btn-group hidden-xs">
                                    <a class="btn btn-success" title="发表文章" href="${wolf.context}/article/edit"> <i
                                            class="fa fa-pencil fa-fw"></i>
                                    </a>
                                    <button id="btn_batch_delete" type="button" class="btn btn-danger" title="删除选中"><i
                                            class="fa fa-trash-o fa-fw"></i>
                                    </button>
                                    <button id="btn_status_undeploy" type="button" class="btn btn-dark" title="批量取消发布">
                                        <i
                                                class="fa fa-bullhorn fa-fw"></i>
                                    </button>
                                    <button id="btn_status_deploy" type="button" class="btn btn-info" title="批量发布"><i
                                            class="fa fa-send-o fa-fw"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="columns columns-right btn-group pull-right">
                                <button id="btn-search-keyword" class="btn btn-dark" type="button" name="refresh"
                                        title="刷新"><i
                                        class="fa fa-refresh icon-refresh"></i>
                                </button>
                            </div>
                            <div class="pull-right search">
                                <input class="form-control" id="search-keyword" type="text" placeholder="搜索">
                            </div>
                        </div>

                        <div>
                            <table id="datatable" class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat">
                                    </th>
                                    <th class="column-title">标题</th>
                                    <th class="column-title">分类</th>
                                    <th class="column-title">状态</th>
                                    <th class="column-title">Order</th>
                                    <th class="column-title">作者</th>
                                    <th class="column-title">是否置顶</th>
                                    <th class="column-title">开启评论</th>
                                    <th class="column-title">浏览</th>
                                    <th class="column-title">评论</th>
                                    <th class="column-title">喜欢</th>
                                    <th class="column-title">更新时间</th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                    <th class="bulk-actions" colspan="12">
                                        <a class="antoo" style="color:#fff; font-weight:500;">批量操作 ( <span
                                                class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                    </th>
                                </tr>
                                </thead>

                                <tbody id="article-container">
                                <#--<tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000040</td>
                                    <td class=" ">May 23, 2014 11:47:56 PM</td>
                                    <td class=" ">121000210 <i class="success fa fa-long-arrow-up"></i></td>
                                    <td class=" ">John Blank L</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$7.45</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
                                <tr class="odd pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000039</td>
                                    <td class=" ">May 23, 2014 11:30:12 PM</td>
                                    <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                                    </td>
                                    <td class=" ">John Blank L</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$741.20</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>-->

                                </tbody>
                            </table>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<script>
    let table;
    $(document).ready(function () {

        init_DataTables();

        //批量删除
        $("#btn_batch_delete").click(function () {

        });

        //批量发布
        $("#btn_status_deploy").click(function () {
            let ids = getTableActiveIds();
            YWM.Api.article.batchChangeStatus(YWM.Constant.ArticleStatus.DEPLOY, ids).then(function () {
                window.location.reload();
            })
        });

        //批量取消发布
        $("#btn_status_undeploy").click(function () {
            let ids = getTableActiveIds();
            YWM.Api.article.batchChangeStatus(YWM.Constant.ArticleStatus.UNDEPLOY, ids).then(function () {
                window.location.reload();
            })
        });

        //刷新
        $("#btn-search-keyword").click(function () {
            table.draw();
        });


    });


    function getTableActiveIds() {
        return Array.prototype.slice.call(table.api().rows(".selected").ids());
    }


    function init_DataTables() { //http://www.datatables.net
        if (typeof ($.fn.DataTable) === 'undefined') {
            console.log('datatables undefined');
            return;
        }

        /*var handleDataTableButtons = function () {
            if ($("#datatable-buttons").length) {
                $("#datatable-buttons").DataTable({
                    dom: "Blfrtip",
                    buttons: [
                        {
                            extend: "copy",
                            className: "btn-sm"
                        },
                        {
                            extend: "csv",
                            className: "btn-sm"
                        },
                        {
                            extend: "excel",
                            className: "btn-sm"
                        },
                        {
                            extend: "pdfHtml5",
                            className: "btn-sm"
                        },
                        {
                            extend: "print",
                            className: "btn-sm"
                        },
                    ],
                    responsive: true
                });
            }
        };

        TableManageButtons = function () {
            "use strict";
            return {
                init: function () {
                    handleDataTableButtons();
                }
            };
        }();*/

        table = new YWM.Table($('#datatable'),{
            rowId: "id",
            paging: true,
            pageLength: 5, //默认显示的记录数
            pagingType: "full_numbers", //详细分页组
            bServerSide: true,//开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值
            serverPromise: function(params){
                let keyword = $("#search-keyword").val();
                if(keyword){
                    params.keyword = keyword;
                }
                return YWM.Api.article.page(params);
            },
            createdRow: function (row, data, index) {
                // $(row).data("test","test-"+index); 没起效？
                row.setAttribute("data-test", "test-" + index);
                // console.log("createdRow:",row, data, index);
            },
            footerCallback: function (row, data, start, end, display) {
                console.log("footerCallback:", row, data, start, end, display);
            },
            drawCallback: function (settings) {
                console.log('DataTables has redrawn the table', settings);
                init_iCheck();
                init_switchery(function () {

                    //是否置顶
                    $(".js-switch.top").off("change").on('change', function () {
                        var checked=  $(this).prop("checked");
                        console.log(checked);
                    });

                    //是否开启评论
                    $(".js-switch.comment").off("change").on('change', function () {
                        var checked=  $(this).prop("checked");
                        console.log(checked);
                    })
                });

                // var startIndex = this.context[0]._iDisplayStart;//获取到本页开始的条数
                // this.api().column(0).nodes().each(function (cell, i) {
                //     //翻页序号连续
                //     cell.innerHTML = startIndex + i + 1;
                // });
            },
            sAjaxDataProp: "content",
            columns: [
                {
                    "className": "a-center", render: function (data, type, row, meta) {
                        return "<input type='checkbox' class='flat' name='table_records'>";
                    }
                },
                {"data": "title"},
                {"data": "typeDesc"},
                {"data": "statusName"},
                {"data": null, "defaultContent": "todo"},
                {"data": null, "defaultContent": "todo"},
                {
                    "data": "top", render: function (data, type, row, meta) {
                        let active = data ? "checked='checked'" : "";
                        return "<input type='checkbox' class='js-switch top' " + active + ">"
                    }
                },
                {
                    "data": "commentAllowed", render: function (data, type, row, meta) {
                        let active = data ? "checked='checked'" : "";
                        return "<input type='checkbox' class='js-switch comment' " + active + ">"
                    }
                },
                {"data": "lookNum", "defaultContent": "-"},
                {"data": "commitNum", "defaultContent": "-"},
                {"data": "loveNum", "defaultContent": "-"},
                {
                    "data": "updateTime", render: function (data, type, row, meta) {
                        return YWM.Util.formatDateTime(data);
                    }
                },
                {
                    "data": null, render: function (data, type, row, meta) {
                        let tmp = "<a href=" + wolf_context + "'/article/" + (data.editorType == 'SIMPLEMDE' ? 'edit_md' : 'edit') + "?id=" + data.id + "'>编辑</a>\n" +
                                "<a href=" + wolf_context + "'/article/delete/" + data.id + "'>删除</a>";
                        return tmp;
                    }
                }
            ]
        });


        /*$('#datatable-keytable').DataTable({
            keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
            ajax: "js/datatables/json/scroller-demo.json",
            deferRender: true,
            scrollY: 380,
            scrollCollapse: true,
            scroller: true
        });

        $('#datatable-fixed-header').DataTable({
            fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
            'order': [[1, 'asc']],
            'columnDefs': [
                {orderable: false, targets: [0]}
            ]
        });
        $datatable.on('draw.dt', function () {
            $('checkbox input').iCheck({
                checkboxClass: 'icheckbox_flat-green'
            });
        });

        TableManageButtons.init();*/

    };
</script>
</body>
</html>
