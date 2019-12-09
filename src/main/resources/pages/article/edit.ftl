<html>
<head>
    <title>文章发布</title>
    <script src="${wolf.static}/js/lib/wangEditor/wangEditor.js"></script>
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
                    <#if !id??>
                    <div class="pull-right"><small>切换到 <a class="pointer" id="changeEditor" data-href="/article/publishMd">Markdown编辑器</a></small></div>
                    </#if>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <input type="hidden" name="isMarkdown" value="0">
                                                <input type="hidden" name="id">
                                                <div class="item form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12" for="title">标题 <span class="required">*</span></label>
                                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                                        <input type="text" class="form-control col-md-7 col-xs-12" name="title" id="title" required="required" placeholder="请输入标题"/>
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
                                                                    <input type="checkbox" class="flat" <#--checked="checked"-->>
                                                                    <ins class="iCheck-helper"></ins>
                                                                </div>
                                                                置顶
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12" for="password">内容 <span class="required">*</span></label>
                                                    <div class="col-md-11 col-sm-11 col-xs-12">
                                                        <div id="editor" <#--style="width: 100%;height: 150px;"-->></div>
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
    var E = window.wangEditor; //https://www.kancloud.cn/wangfupeng/wangeditor3/332599
    var editor = new E('#editor');
    // 通过 url 参数配置 debug 模式。url 中带有 debug 才会开启 debug 模式
    editor.customConfig.debug = location.href.indexOf('debug') > 0 ;
    editor.create();

    let content = ' <div label-module="para-title"><h3>起源</h3></div><div label-module="para">公元前20世纪，原居住在中亚草原地区属于印欧语系的<a target="_blank" href="https://baike.baidu.com/item/%E9%9B%85%E5%88%A9%E5%AE%89%E4%BA%BA">雅利安人</a>越过现今<a target="_blank" href="https://baike.baidu.com/item/%E9%98%BF%E5%AF%8C%E6%B1%97">阿富汗</a>和<a target="_blank" href="https://baike.baidu.com/item/%E5%B7%B4%E5%9F%BA%E6%96%AF%E5%9D%A6">巴基斯坦</a>交界处的兴都库什山脉涌入<a target="_blank" href="https://baike.baidu.com/item/%E4%BC%8A%E6%9C%97%E9%AB%98%E5%8E%9F">伊朗高原</a>和<a target="_blank" href="https://baike.baidu.com/item/%E5%8D%B0%E5%BA%A6%E6%AC%A1%E5%A4%A7%E9%99%86">印度次大陆</a>西北部地区，创造了自己的文化和宗教。信奉多神特别是<a target="_blank" href="https://baike.baidu.com/item/%E7%81%AB%E7%A5%9E">火神</a>，并实行繁琐的祭祀仪式。最早反映在《伽泰》中的诸神崇拜，光明神或善神阿胡拉·玛兹达的地位已经十分重要。</div><div><a name="2_2"></a><a name="sub100510_2_2"></a><a name="发展"></a><a name="2-2"></a></div><div label-module="para-title"><h3>发展</h3></div><div label-module="para">早期的原始宗教还没有一个唯一的“造物主”概念，但在众神中渐渐发展出了“主神”。后来一神教的出现，和雅利安原始宗教<a target="_blank" href="https://baike.baidu.com/item/%E5%A4%9A%E7%A5%9E%E5%B4%87%E6%8B%9C">多神崇拜</a>中的主要内容：<a target="_blank" href="https://baike.baidu.com/item/%E5%AF%86%E7%89%B9%E6%8B%89">密特拉</a>（mitra）崇拜，有直接的关系，密特拉崇拜在上古是最主要的崇拜对象之一，火、光明、太阳神崇拜都源自密特拉崇拜，它是<a target="_blank" href="https://baike.baidu.com/item/%E5%8F%A4%E5%9F%83%E5%8F%8A">古埃及</a>多神崇拜文明之外较早具有<a target="_blank" href="https://baike.baidu.com/item/%E4%B8%80%E7%A5%9E%E8%AE%BA">一神论</a>萌芽的宗教崇拜。有人认为世界上最早的一神论，<a target="_blank" href="https://baike.baidu.com/item/%E9%98%BF%E8%82%AF%E9%82%A3%E9%A1%BF">阿肯那顿</a>法老（Akhenaten，有时亦译作埃赫那顿）的宗教改革，有来自它的影响，当然证据还不充分。</div><div label-module="para"><div><a nslog-type="9317" href="https://baike.baidu.com/pic/%E7%90%90%E7%BD%97%E4%BA%9A%E6%96%AF%E5%BE%B7%E6%95%99/1814225/0/99636c0e39a1219a7bcbe180?fr=lemma&amp;ct=single" target="_blank" title="法拉瓦哈标志"><img src="https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=4c63fc05b319ebc4c478719bb227cf79/10dfa9ec8a13632757820153918fa0ec08fac767.jpg" alt="法拉瓦哈标志"></a>法拉瓦哈标志</div>琐罗亚斯德教事实上已经是一个改革过的宗教信仰。到公元前6世纪，琐罗亚斯德才真正完成了一神论性质的宗教改革，阿胡拉·马兹达成为唯一的、最高的、不被创造的主神光明神，而它的原型<a target="_blank" href="https://baike.baidu.com/item/%E5%AF%86%E7%89%B9%E6%8B%89">密特拉</a>则被降格为阿胡拉·马兹达在人世中的代表。但后来伊斯兰教进入波斯时，最负隅顽抗的不是当时波斯的主流信仰琐罗亚斯德教，而是更古老的密特拉崇拜。</div><div label-module="para">公元前522年波斯<a target="_blank" href="https://baike.baidu.com/item/%E9%98%BF%E5%A5%91%E7%BE%8E%E5%B0%BC%E5%BE%B7%E7%8E%8B%E6%9C%9D">阿契美尼德王朝</a><a target="_blank" href="https://baike.baidu.com/item/%E5%A4%A7%E6%B5%81%E5%A3%AB%E4%B8%80%E4%B8%96">大流士一世</a>执政后，为了统一波斯的需要，独尊阿胡拉·马兹达，力图贬低部落的氏族神台瓦等。其后继者塞齐斯等追随大流士的信仰，常自称为阿胡拉·马兹达的使者，声称神的意志通过皇帝宣示人世。据考证，琐罗亚斯德的庇护者维斯塔巴就是大流士的父亲，琐罗亚斯德也独尊阿胡拉·马兹达为最高神。阿契美尼德<div><a nslog-type="9317" href="https://baike.baidu.com/pic/%E7%90%90%E7%BD%97%E4%BA%9A%E6%96%AF%E5%BE%B7%E6%95%99/1814225/0/e8112b2a932de6685243c167?fr=lemma&amp;ct=single" target="_blank" title="波斯帝国遗址"><img src="https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=7d49e960e924b899da3c7e3a5e071d59/6a600c338744ebf84f3da75fd9f9d72a6059a706.jpg" alt="波斯帝国遗址"></a>波斯帝国遗址</div>王朝时的宗教为祭司阶层麻葛所控制，麻葛崇拜阿胡拉·马兹达，反对恶灵，对死者实行天葬。因此有人把麻葛和反映琐罗亚斯德教信仰的《伽泰》联系起来，认为该教是在阿契美尼德王朝前后时期的信仰基础上发展起来的。</div><div label-module="para">公元前4世纪，希腊<a target="_blank" href="https://baike.baidu.com/item/%E4%BA%9A%E5%8E%86%E5%B1%B1%E5%A4%A7%E5%A4%A7%E5%B8%9D">亚历山大大帝</a>征服波斯后，波斯进入<a target="_blank" href="https://baike.baidu.com/item/%E5%B8%8C%E8%85%8A%E5%8C%96%E6%97%B6%E6%9C%9F">希腊化时期</a>，琐罗亚斯德教受到沉重打击，但在公元元年前后又重新活动。在波斯<a target="_blank" href="https://baike.baidu.com/item/%E4%B8%87%E7%A5%9E%E6%AE%BF">万神殿</a>中出现了希腊和波斯的混合神祇。阿胡拉·马兹达及其僚神成了太阳神、月神等的伙伴。在罗马统治时期，琐罗亚斯德教诸神之一<a target="_blank" href="https://baike.baidu.com/item/%E5%AF%86%E7%89%B9%E6%8B%89">密特拉</a>神（<a target="_blank" href="https://baike.baidu.com/item/%E5%A4%AA%E9%98%B3%E7%A5%9E">太阳神</a>）成为<a target="_blank" href="https://baike.baidu.com/item/%E5%9C%B0%E4%B8%AD%E6%B5%B7">地中海</a>地区普遍信仰的对象。</div><div label-module="para">公元3世纪波斯<a target="_blank" href="https://baike.baidu.com/item/%E8%90%A8%E7%8F%8A%E7%8E%8B%E6%9C%9D">萨珊王朝</a>创建后，琐罗亚斯德教重新兴盛，取得了国教的地位。萨珊诸王都兼教主，自称阿胡拉·玛兹达的祭司长、<a target="_blank" href="https://baike.baidu.com/item/%E7%81%B5%E9%AD%82">灵魂</a>的<a target="_blank" href="https://baike.baidu.com/item/%E6%95%91%E4%B8%96%E4%B8%BB">救世主</a>等。他们搜集、整理希腊化时期散佚的经典，编纂了《<a target="_blank" href="https://baike.baidu.com/item/%E9%98%BF%E7%BB%B4%E6%96%AF%E9%99%80">阿维斯陀</a>》（Zent～Avesta），使该教教义有了具体、明确的内容。5世纪时，该教一部分教徒在玛兹达克的领导下，进行了一场社会和<a target="_blank" href="https://baike.baidu.com/item/%E5%AE%97%E6%95%99%E6%94%B9%E9%9D%A9">宗教改革</a>。491～529年之间，在波斯和<a target="_blank" href="https://baike.baidu.com/item/%E9%98%BF%E5%A1%9E%E6%8B%9C%E7%96%86">阿塞拜疆</a>等地掀起了大规模的、持续不断的起义。萨珊王朝先后采取欺骗与高压的政策，起义最终被镇压。</div><div label-module="para">公元7世纪萨珊王朝亡于<a target="_blank" href="https://baike.baidu.com/item/%E7%A9%86%E6%96%AF%E6%9E%97">穆斯林</a>。起初<a target="_blank" href="https://baike.baidu.com/item/%E5%93%88%E9%87%8C%E5%8F%91">哈里发</a>对琐罗亚斯德教徒表示宽容，在依法纳税后容许其保持自己的信仰；若干年后强迫琐罗亚斯德教教徒改信伊斯兰教。残留在波斯本土的该教教徒，被称为迦巴尔（<a target="_blank" href="https://baike.baidu.com/item/%E5%BC%82%E6%95%99%E5%BE%92">异教徒</a>）。部分通过西域（今新疆）进入中国内地，使该教在南北朝和隋唐时期盛行于西域。</div><div label-module="para">很多人错误地把琐罗亚斯德教与<a target="_blank" href="https://baike.baidu.com/item/%E6%91%A9%E5%B0%BC%E6%95%99">摩尼教</a>混为一谈，实际这三者同源但教义不同甚至略有冲突。就如同犹太教、基督教和<a target="_blank" href="https://baike.baidu.com/item/%E5%A4%A9%E4%B8%BB%E6%95%99">天主教</a>的关系。据20世纪70年代统计，约有1.7万人，分布在伊朗南部的耶斯德和格尔孟等地；另一部分教徒从8世纪初由波斯迁往印度西海岸古扎拉特等地后，与迦巴尔失去联系，至15世纪中叶后又恢复联系。17世纪后，他们在<a target="_blank" href="https://baike.baidu.com/item/%E5%AD%9F%E4%B9%B0">孟买</a>附近形成一个独特的社会集团，被称为<a target="_blank" href="https://baike.baidu.com/item/%E5%B8%95%E8%A5%BF%E4%BA%BA">帕西人</a>。据20世纪80年代统计，帕西人约有10万，大都经营工商业，在印度经济生活中有重要影响。</div> ';
    editor.txt.html(content);


    $(function () {
       $("body").on("click","#publishArticle",function () {
           let content = editor.txt.html();
           $("#publishForm").append(`<textarea name="content" style="display: none;" value="{value}"/>`.replace("{value}",content));
           $("#publishForm").submit();
       });
    });
</script>
</body>
</html>