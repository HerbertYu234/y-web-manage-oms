<#macro edit editorType>
<#import "${wolf.context}/macros/modal.ftl" as modal />
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
                                            <input type="hidden" name="editorType" value="${editorType}">
                                            <input type="hidden" name="id" value="${(article.id)!}">
                                            <input type="hidden" name="status" value="${(article.status)!0}">
                                            <div class="item form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12" for="title">标题 <span class="required">*</span></label>
                                                <div class="col-md-8 col-sm-8 col-xs-12">
                                                    <input type="text" class="form-control" name="title" id="title" value="${(article.title)!}" required="required" placeholder="请输入标题"/>
                                                </div>

                                                <div class="col-md-2 col-sm-2 col-xs-12">
                                                    <select class="form-control" name="type">
                                                        <option>--选择分类--</option>
                                                            <#if types??>
                                                                <#list types as type>
                                                                    <option value="${type}" ${((article.type?? && article.type==type))?then("selected='selected'","")} >${type.desc}</option>
                                                                </#list>
                                                            </#if>
                                                    </select>
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
                                                                <input type="checkbox" name="top" value="${(article.top)?then('true','false')}" class="flat" ${(article.top)?then("checked='checked'","")} >
                                                                <ins class="iCheck-helper"></ins>
                                                            </div>
                                                            置顶
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">标签</label>
                                                <div class="col-md-10 col-sm-10 col-xs-10" id="tag_container">
                                                        <#if (article.tagDetail)??>
                                                            <#list article.tagDetail as tag>
                                                            <span data-id="${tag.id}" class="btn badge ${tag?item_cycle("badge-primary","badge-secondary","badge-success","badge-danger","badge-warning","badge-info","badge-dark","bg-green")} " title="${tag.desc}">${tag.name}</span>
                                                            </#list>
                                                        </#if>
                                                    <a class="btn" href="javascript:;" data-toggle="modal" data-target=".modal-select-tag" title="编辑"><i class="fa fa-edit"></i></a>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12" for="password">内容 <span class="required">*</span></label>
                                                <div class="col-md-10 col-sm-10 col-xs-10">
                                                    <textarea class="form-control col-md-7 col-xs-12" id="hideEditor" style="display: none" >${(article.content)!}</textarea>
                                                    <#nested/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12"></label>
                                                <div class="col-md-10 col-sm-10 col-xs-12">
                                                    <button type="button" id="publishArticle" class="btn btn-success to-choose-info"><i class="fa fa-pencil">${(article.status==1)?then("保存文章","发布文章")}</i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <@modal.article_select_tag></@modal.article_select_tag>
</div>

<script>
    $(function () {
        /**
         *  发布文章
         */
        $("body").on("click", "#publishArticle", function () {
            let content = getEditorValue();
            let $top = $("#publishForm input[name='top']");
            $top.val($top.prop('checked'));
            $("#publishForm").append(`<textarea name="content" style="display: none;">{value}</textarea>`.replace("{value}", content));

            let tags = [];
            $("#tag_container span").each(function (i, item) {
                tags.push($(item).data('id'));
            });
            $("#publishForm").append(`<input type="hidden" name="tags" value="{value}">`.replace("{value}", tags));
            $("#publishForm").submit();
        });


        /**
         * 切换编辑器
         */
        $("#changeEditor").click(function () {
            var $this = $(this);
            if (confirm("确定要切换编辑器吗？切换后本页内容将可能会丢失？")) {
                window.location.href = $this.data("href");
            }
        });


        /**
         * 确认选中标签
         */
        $("body").on("click", ".btn_modal_confirm_tag", function () {
            $("#tag_container").find("span").remove();
            const colors = ["badge-primary", "badge-secondary", "badge-success", "badge-danger", "badge-warning", "badge-info", "badge-dark", "bg-green"];
            let $tags = $(".modal.modal-select-tag form span.active");

            let totalNums = $tags.length;
            let pageSize = colors.length;

            let htl = "";
            $tags.each(function (index, item) {
                let color = colors [index % pageSize];
                htl += "<span class='btn badge badge-primary " + color + "' data-id='" + $(item).data("id") + "'>" + $(item).text() + "</span>";
            });
            $(htl).prependTo($("#tag_container"));
            $(".modal.modal-select-tag").modal("hide");
        });

    });
</script>
</#macro>