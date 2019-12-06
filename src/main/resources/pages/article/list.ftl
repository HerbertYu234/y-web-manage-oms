<!DOCTYPE html>
<html lang="en">
<head>
    <title>文章列表 </title>
</head>

<body class="nav-md">

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
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

        <div class="clearfix"></div>

        <div class="row" style="display: block;">
            <div class="clearfix"></div>

            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Table design
                            <small>Custom design</small>
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
                                <div class="btn-group hidden-xs" id="toolbar">
                                    <a class="btn btn-success" title="发表文章" href="${wolf.context}/article/edit"> <i
                                            class="fa fa-pencil fa-fw"></i>
                                    </a>
                                    <button id="btn_delete_ids" type="button" class="btn btn-danger" title="删除选中"><i
                                            class="fa fa-trash-o fa-fw"></i>

                                    </button>
                                    <button id="btn_update_status" type="button" class="btn btn-dark" title="批量发布"><i
                                            class="fa fa-bullhorn fa-fw"></i>

                                    </button>
                                    <button id="btn_push_ids" type="button" class="btn btn-info" title="批量推送到百度"><i
                                            class="fa fa-send-o fa-fw"></i>

                                    </button>
                                </div>
                            </div>
                            <div class="columns columns-right btn-group pull-right">
                                <button class="btn btn-dark" type="button" name="refresh" title="刷新"><i
                                        class="fa fa-refresh icon-refresh"></i>
                                </button>
                            </div>
                            <div class="pull-right search">
                                <input class="form-control" type="text" placeholder="搜索">
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table id="datatable" class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat">
                                    </th>
                                    <th class="column-title">Invoice</th>
                                    <th class="column-title">Invoice Date</th>
                                    <th class="column-title">Order</th>
                                    <th class="column-title">Bill to Name</th>
                                    <th class="column-title">Status</th>
                                    <th class="column-title">Amount</th>
                                    <th class="column-title no-link last"><span class="nobr">Action</span>
                                    </th>
                                    <th class="bulk-actions" colspan="7">
                                        <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span
                                                class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                    </th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="even pointer">
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
                                </tr>
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000038</td>
                                    <td class=" ">May 24, 2014 10:55:33 PM</td>
                                    <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                                    </td>
                                    <td class=" ">Mike Smith</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$432.26</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
                                <tr class="odd pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000037</td>
                                    <td class=" ">May 24, 2014 10:52:44 PM</td>
                                    <td class=" ">121000204</td>
                                    <td class=" ">Mike Smith</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$333.21</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000040</td>
                                    <td class=" ">May 24, 2014 11:47:56 PM</td>
                                    <td class=" ">121000210</td>
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
                                    <td class=" ">May 26, 2014 11:30:12 PM</td>
                                    <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                                    </td>
                                    <td class=" ">John Blank L</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$741.20</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000038</td>
                                    <td class=" ">May 26, 2014 10:55:33 PM</td>
                                    <td class=" ">121000203</td>
                                    <td class=" ">Mike Smith</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$432.26</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
                                <tr class="odd pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000037</td>
                                    <td class=" ">May 26, 2014 10:52:44 PM</td>
                                    <td class=" ">121000204</td>
                                    <td class=" ">Mike Smith</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$333.21</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>

                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">121000040</td>
                                    <td class=" ">May 27, 2014 11:47:56 PM</td>
                                    <td class=" ">121000210</td>
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
                                    <td class=" ">May 28, 2014 11:30:12 PM</td>
                                    <td class=" ">121000208</td>
                                    <td class=" ">John Blank L</td>
                                    <td class=" ">Paid</td>
                                    <td class="a-right a-right ">$741.20</td>
                                    <td class=" last"><a href="#">View</a>
                                    </td>
                                </tr>
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
    $(document).ready(function () {
        init_DataTables();


        let parmas = {
            v: Math.random(),
        }
        $.get(wolf_context + "/article/page", parmas, function (pageArticle) {
            console.log("pageArticle:",pageArticle);
        });

    });

    function init_DataTables() {
        console.log('run_datatables');

        if (typeof ($.fn.DataTable) === 'undefined') {
            return;
        }
        console.log('init_DataTables');

        var handleDataTableButtons = function () {
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
        }();

        $('#datatable').dataTable({
            searching: false,
            scrollX: false,
            lengthChange: false,
        });

        $('#datatable-keytable').DataTable({
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

        TableManageButtons.init();

    };
</script>
</body>
</html>
