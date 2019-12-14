<html>
<head>
    <title>文章类别</title>
    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <!-- Datatables -->
    <script src="/js/lib/datatables.net/js/jquery.dataTables.js"></script>
    <link href="/js/lib/datatables.net/css/jquery.dataTables.css" rel="stylesheet">
</head>

<body>
    <!-- page content -->
    <div class="right_col" role="main">
        <div>
            <div class="row">
                <div class="col-md-12 col-sm-12  ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Plain Page</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <#--<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Settings 1</a>
                                        <a class="dropdown-item" href="#">Settings 2</a>
                                    </div>-->
                                </li>
                                <#--<li><a class="close-link"><i class="fa fa-close"></i></a></li>-->
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">

                            <table id="typeTable" class="display bulk_action" style="width:100%">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat">
                                    </th>
                                    <th>名称</th>
                                    <th>描述</th>
                                    <th><span class="nobr">操作</span>
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
    let table;
    $(function () {

        YWM.Api.articleType.list().then(function(res){

            table = new YWM.Table($('#typeTable'),{
                info: false,
                paging: false,
                lengthChange: false,
                drawCallback: function (settings) {
                    init_iCheck();
                },
                columns: [
                    {
                        render: function (data, type, row, meta) {
                            return "<input type='checkbox' class='flat' name='table_records'>";
                        }
                    },
                    {"data": "name"},
                    {"data": "desc"},
                    {
                        "data": null, render: function (data, type, row, meta) {
                            let tmp = "<a href='javascript:;'>编辑</a>";
                            return tmp;
                        }
                    }
                ],
                dom: '<"top"f>rt<"bottom"l<"clear">ip><"clear">',
                data: res
            });
        });
    })
</script>
</body>
</html>