<#macro announce_edit>
<div class="modal fade modal-announce" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">公告编辑</h4>
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            <#--<h4>Text in a modal</h4>-->
                <form class="form-horizontal form-label-left addOrUpdateForm" novalidate>
                    <input type="hidden" name="id">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">标题
                            <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control " name="title" required="required"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="description">内容 </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control " name="content" maxlength="100"></textarea>
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
</#macro>

<#macro tag_edit>
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
</#macro>


<#macro article_select_tag>
<div class="modal fade modal-select-tag" style="z-index: 10001" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">选择标签</h4>
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            <#--<h4>Text in a modal</h4>-->
                <form class="form-horizontal form-label-left addOrUpdateForm" novalidate>
                    <#if tags??>
                    <#list tags as tag>
                        <#assign active=false />
                        <#if (article.tagDetail)??>
                        <#list article.tagDetail as hasTag>
                            <#if hasTag.id==tag.id>
                                <#assign active=true/>
                                <#break/>
                            </#if>
                        </#list>
                        </#if>
                        <span class="btn btn-sm btn-secondary ${active?then('active','')}" title="${tag.desc!}" data-id="${tag.id}" onclick="$(this).toggleClass('active')">${tag.name}</span>
                    </#list>
                    </#if>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary btn_modal_confirm_tag">确定</button>
            </div>
        </div>
    </div>
</div>
</#macro>