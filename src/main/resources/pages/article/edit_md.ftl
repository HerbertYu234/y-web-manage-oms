<html>
<head>
    <title>文章发布</title>
    <link href="${wolf.static}/js/lib/simplemde/dist/simplemde.min.css" rel="stylesheet">
    <script src="${wolf.static}/js/lib/simplemde/dist/simplemde.min.js"></script>
</head>
<body>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <#--<div class="page-title">
            <div class="title_left">
                <h5>Plain Page</h5>
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

        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <#--<div class="x_title">
                        <h2>Plain Page</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>-->
                    <div class="x_content">
                        <#--Add content to the page ...-->
                            <form id="publishForm" action="${wolf.context}/article/store" method="post" class="form-horizontal form-label-left" novalidate>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>发布文章 <small>可以通过右上角“系统配置”-“文章编辑器”选择默认的文章发布编辑器</small></h2>
                    <#if !((article.id)??)>
                    <div class="pull-right"><small>切换到 <a class="pointer" id="changeEditor" data-href="${wolf.context}/article/edit">富文本编辑器</a></small></div>
                    </#if>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <input type="hidden" name="editorType" value="SIMPLEMDE">
                                                <input type="hidden" name="id" value="${(article.id)!}">
                                                <div class="item form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12" for="title">标题 <span class="required">*</span></label>
                                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                                        <input type="text" class="form-control col-md-7 col-xs-12" name="title" id="title" value="${(article.title)!}" required="required" placeholder="请输入标题"/>
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <#--<div class="checkbox">-->
                                                            <#--<label>-->
                                                                <#--<input type="checkbox" class="square" checked name="original"> 原创-->
                                                            <#--</label>-->
                                                        <#--</div>-->
                                                        <div class="checkbox">
                                                            <label class="">
                                                                <div class="icheckbox_flat-green" style="position: relative;">
                                                                    <input type="checkbox" name="top" value="${(article.top)!false}" class="flat" ${((article.top)??)?string("checked='checked'","")} >
                                                                    <ins class="iCheck-helper"></ins>
                                                                </div>
                                                                置顶
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12" for="password">内容 <span class="required">*</span></label>
                                                    <div class="col-md-10 col-sm-10 col-xs-10">
                                                        <textarea class="form-control col-md-7 col-xs-12" id="hideEditor" style="display: none" >${(article.content)!}</textarea>
                                                        <textarea class="form-control col-md-7 col-xs-12 valid" id="editor" style="display: none" required="required"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12"></label>
                                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                                        <button type="button" id="publishArticle" class="btn btn-success to-choose-info"><i class="fa fa-pencil"> 发布文章</i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#--<@publishmodal></@publishmodal>-->
                            </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- /page content -->

<script>

    var simplemde = new SimpleMDE({
        element: document.getElementById("editor"),
        spellChecker: false,
        autofocus: true,
        autoDownloadFontAwesome: false, //true会强制下载Font Awesome，false不会下载
        placeholder: "Type here...",
        // autosave: {
        //     enabled: true,
        //     uniqueId: "demo",
        //     delay: 1000,
        // },
        tabSize: 4,
        status: true, //编辑器底部的状态栏，不需要就设置为false
        lineWrapping: false,
        renderingConfig: {
            codeSyntaxHighlighting: false //设置为true会使用 highlight.js代码高亮，默认是false,如果设置为true,请在页面中引入js
        },
        // toolbar: [{ //false标题栏不显示
        //     name: "bold",
        //     action: SimpleMDE.toggleBold,
        //     className: "fa fa-bold",
        //     title: "Bold",
        // },
        //     {
        //         name: "custom",
        //         action: function customFunction(editor){
        //             // Add your own code
        //         },
        //         className: "fa fa-star",
        //         title: "Custom Button",
        //     },
        //     "|", // Separator
        // ],
        showIcons: ["code", "table", "clean-block", "horizontal-rule"],
    });


    let content = $("#hideEditor").val();
    if(content){
        simplemde.value(content);
    }


    $(function () {
       $("body").on("click","#publishArticle",function () {
           let content = simplemde.value();
           // let content = simplemde.markdown(simplemde.value()); markdown转换为html标签
           let $top = $("#publishForm input[name='top']");
           $top.val($top.prop('checked'));
           $("#publishForm").append(`<textarea name="content" style="display: none;">{value}</textarea>`.replace("{value}",content));
           $("#publishForm").submit();
       });


        /**
         * 切换编辑器
         */
        $("#changeEditor").click(function () {
            var $this = $(this);
            if(confirm("确定要切换编辑器吗？切换后本页内容将可能会丢失？")){
                window.location.href = $this.data("href");
            }
        })

    });
</script>
</body>
</html>