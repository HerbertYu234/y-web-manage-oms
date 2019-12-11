<head>
    <title>文章标签</title>

    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <!-- Datatables -->
    <script src="/js/lib/datatables.net/js/jquery.dataTables.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet">
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

                        <table id="datatable">
                            <thead>
                            <th>
                                <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">编码</th>
                            <th class="column-title">名称</th>
                            </thead>

                            <tbody>

                            </tbody>
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
        $('#datatable').DataTable({
            autoWidth: true, //是否自适应宽度
            deferRender: true,
            info: true, //是否显示页脚信息，DataTables插件左下角显示记录数 <Showing 0 to 0 of 0 entries>
            lengthChange: true,
            ordering: true, //是否启动各个字段的排序功能
            paging: true,
            processing: true, //DataTables载入数据时，是否显示‘进度’提示
            scrollX: true,
            scrollY: true,
            searching: true, //是否启动过滤、搜索功能
            bServerSide: false,//开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值
            stateSave: false,//使用sessionStorage或localStorage保存datatable信息（pagination position, display length, filtering and sorting）

            sAjaxDataProp: "content",

            ajax: function (data, callback, settings) {
                let page = data.start / data.length;
                let param = {
                    page: page,
                    size: data.length,
                };
                YWM.Api.articleTag.page(param).then(function (res) {
                    //封装返回数据
                    let returnData = {
                        content: [],
                        draw: data.draw,//这里直接自行返回了draw计数器,应该由后台返回
                        recordsTotal: 0,
                        recordsFiltered: 0,
                    };
                    if (res) {
                        returnData.recordsTotal = res.totalElements;//返回数据全部记录
                        returnData.recordsFiltered = res.totalElements;//后台不实现过滤功能，每次查询均视作全部结果
                        if(res.content){
                            returnData.content = res.content ;//返回的数据列表
                            //console.log(returnData);
                        }
                    }
                    //调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
                    //此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
                    callback(returnData);
                });
            },

            //Callbacks
            createdRow: function (row, data, index) {
                // $(row).data("test","test-"+index); 没起效？
                row.setAttribute("data-test", "test-" + index);
                // $(row).addClass( 'important' );
                console.log("createdRow:", row, data, index);
            },
            rowCallback: function (row, data, displayNum, displayIndex, dataIndex) {
                console.log("rowCallback: ", row, data, displayNum, displayIndex, dataIndex);
            },
            footerCallback: function (row, data, start, end, display) {
                console.log("footerCallback:", row, data, start, end, display);
            },
            drawCallback: function (settings) {
                console.log('DataTables has redrawn the table', settings);
                init_iCheck();

                // var startIndex = this.api().context[0]._iDisplayStart;//获取到本页开始的条数
                // this.api().column(0).nodes().each(function (cell, i) {
                //     //翻页序号连续
                //     cell.innerHTML = startIndex + i + 1;
                // });
            },
            formatNumber: function (toFormat) {
                console.log("formatNumber: ", toFormat);
            },

            headerCallback: function (thead, data, start, end, display) {
                // $(thead).find('th').eq(0).html( 'Displaying '+(end-start)+' records' );
                console.log("headerCallback: ", start, end);
            },
            infoCallback: function (settings, start, end, max, total, pre) {
                var api = this.api();
                var pageInfo = api.page.info();

                return 'Page ' + (pageInfo.page + 1) + ' of ' + pageInfo.pages;
            },

            initComplete: function (settings, json) {
                console.log("initComplete!");
                // $('div.loading').remove();
            },

            displayStart: 0,
            lengthMenu: [ 10, 25, 50], //更改显示记录数 [ [10, 25, 50, -1], [10, 25, 50, "All"] ]
            pageLength: 5, //默认显示的记录数

            pagingType: "full_numbers", //numbers、simple、simple_numbers、full、full_numbers、first_last_numbers
            rowId: "id", //tr DOM ID

            stripeClasses: [ 'strip1', 'strip2', 'strip3' ],
            tabIndex: 0, //键盘导航table 0:默认文档流，-1:禁用

            language: {
                emptyTable: "_empty table_"
            },



            bScrollCollapse: true, //是否开启DataTables的高度自适应，当数据条数不够分页数据条数的时候，插件高度是否随数据条数而改变


        });
    })
</script>
</body>