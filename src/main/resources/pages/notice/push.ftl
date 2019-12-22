<html>
<head>
    <title>消息推送</title>
    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>
</head>

<body>

<!-- page content -->
<div class="right_col" role="main">
    <div>
        <div class="page-title">
            <div class="title_left">
                <h3>前端消息推送</h3>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-4">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>当前在线(10人)
                            <small>from websocket</small>
                        </h2>
                    <#--<ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>-->
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <ul class="to_do" id="onlineUsers">
                                <li>
                                    <p><input type="checkbox" value="all" class="flat"> 所有人（@all）</p>
                                </li>
                                <li>
                                    <p><input type="checkbox" class="flat"> Schedule meeting with new client </p>
                                </li>
                                <li>
                                    <p><input type="checkbox" class="flat"> Create email address for new intern</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>消息推送给
                            <small id="receivers"></small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                    <#--<div id="editor-one" class="editor-wrapper"></div>-->
                    <#--<br/>-->
                    <#--<div class="ln_solid"></div>-->

                        <form class="form-horizontal form-label-left">
                            <div class="item form-group">
                                <label class="control-label col-md-2 col-sm-2 ">消息内容:</label>
                                <div class="col-md-10 col-sm-10 ">
                                    <textarea rows="5" class="resizable_textarea form-control"></textarea>
                                </div>
                            </div>
                            <div class="item form-group">
                                <div class="col-md-12 col-sm-12 offset-md-6">
                                <#--<button class="btn btn-primary" type="button">Cancel</button>-->
                                <#--<button class="btn btn-primary" type="reset">Reset</button>-->
                                    <button type="button" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<!-- /page content -->

<script>

    $(function () {
        init_iCheck(function () {

            $("#onlineUsers input[type='checkbox']").off("ifChecked").on("ifChecked", function (event) {
                var checked = $(this).prop("checked");
                console.log("change", checked, $(this));

                if (checked) {
                    $(this).closest("li").siblings("li").find("input[type='checkbox']").iCheck('uncheck');
                    $("#receivers").text($(this).closest("p").text());
                    return false;
                }
            });

            $("#onlineUsers input[type='checkbox']").off("ifUnchecked").on("ifUnchecked", function (event) {
                var checked = $(this).prop("checked");
                console.log("change", checked, $(this));
                $("#receivers").text("");
            });

        });


    });

</script>
</body>
</html>