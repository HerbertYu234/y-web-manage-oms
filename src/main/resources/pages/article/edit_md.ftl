<#import "${wolf.context}/macros/article.ftl" as articleMcro />
<html>
<head>
    <title>文章编辑-MarkDown</title>
    <!-- iCheck -->
    <link href="/js/lib/iCheck/skins/flat/green.css" rel="stylesheet">
    <script src="/js/lib/iCheck/icheck.min.js"></script>

    <link href="${wolf.static}/js/lib/simplemde/dist/simplemde.min.css" rel="stylesheet">
    <script src="${wolf.static}/js/lib/simplemde/dist/simplemde.min.js"></script>
</head>
<body>

<!-- page content -->
<@articleMcro.edit editorType="SIMPLEMDE">
    <textarea class="form-control col-md-7 col-xs-12 valid" id="editor" style="display: none"
              required="required"></textarea>
</@articleMcro.edit>
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
    if (content) {
        simplemde.value(content);
    }

    function getEditorValue() {
        let content = simplemde.value();
        // let content = simplemde.markdown(simplemde.value()); markdown转换为html标签
        return content;
    }
</script>
</body>
</html>