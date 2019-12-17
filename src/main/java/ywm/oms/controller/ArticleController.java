package ywm.oms.controller;

import com.wolf.core.support.Pager;
import com.wolf.lang.helper.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ywm.library.shared.model.ArticleType;
import ywm.library.shared.model.ResEntity;
import ywm.oms.model.Article;
import ywm.oms.model.ArticleTag;
import ywm.oms.service.remote.ArticleService;
import ywm.oms.service.remote.ArticleTagService;
import ywm.oms.service.term.ArticleTerm;

/**
 * Created by Herbert Yu on 2019-11-23 13:40
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleTagService articleTagService;

    /**
     * 文章列表
     */
    @GetMapping("/list")
    public String list(Model model) {
        return "/article/list";
    }

    /**
     * 文章分页数据
     */
    @GetMapping("/page")
    @ResponseBody
    public ResEntity page(@PageableDefault(size = 10, page = 0) Pageable pageable,
                          ArticleTerm term) {
        Page<Article> articles = articleService.articleSearch(term, pageable);
        return ResEntity.result(articles);
    }

    /**
     * 文章编辑-富文本
     */
    @GetMapping("/edit")
    public String edit(@RequestParam(value = "id", required = false) String id, Model model) {
        model.addAttribute("types", ArticleType.values());
        Page<ArticleTag> tags = articleTagService.tagPage(new Pager(0, Integer.MAX_VALUE));
        model.addAttribute("tags", tags != null ? tags.getContent() : null);

        if (Strings.isNotBlank(id)) {
            Article article = articleService.articleDetail(id);
            if (null != article) {
                model.addAttribute("article", article);
            }
        }
        return "/article/edit";
    }

    /**
     * 文章编辑-md
     */
    @GetMapping("/edit_md")
    public String editMd(@RequestParam(value = "id", required = false) String id, Model model) {
        model.addAttribute("types", ArticleType.values());
        Page<ArticleTag> tags = articleTagService.tagPage(new Pager(0, Integer.MAX_VALUE));
        model.addAttribute("tags", tags != null ? tags.getContent() : null);

        if (Strings.isNotBlank(id)) {
            Article article = articleService.articleDetail(id);
            if (null != article) {
                model.addAttribute("article", article);
            }
        }
        return "/article/edit_md";
    }

    /**
     * 文章保存
     */
    @PostMapping("/store")
    public String store(Article article) {
        articleService.articleSave(article);
        return "redirect:/article/list";
    }

    /**
     * 删除
     */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        articleService.articleRemove(id);
        return "redirect:/article/list";
    }

    /**
     * 批量删除
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResEntity batchDelete(@RequestParam String[] ids) {
        return ResEntity.result(articleService.articleRemove(ids));
    }

    /**
     * 是否发布状态变更
     */
    @ResponseBody
    @PostMapping("/change/status/{status}")
    public ResEntity changeStatus(@PathVariable("status") Integer status, @RequestParam String[] ids) {
        return ResEntity.result(articleService.articleChangeStatus(status, ids));
    }

    /**
     * 是否置顶
     */
    @PostMapping("/top/allowed/{id}")
    @ResponseBody
    public ResEntity isTop(@PathVariable("id") String id,@RequestParam Boolean top) {
        if (null != top) {
            Article article = articleService.articleDetail(id);
            if (article != null) {
                article.setTop(top);
                articleService.articleSave(article);
                return ResEntity.success();
            }
        }
        return ResEntity.fail();
    }

    /**
     * 是否开启评论
     */
    @PostMapping("/comment/allowed/{id}")
    @ResponseBody
    public ResEntity isComment(@PathVariable("id") String id,@RequestParam Boolean comment) {
        if (null != comment) {
            Article article = articleService.articleDetail(id);
            if (article != null) {
                article.setCommentAllowed(comment);
                articleService.articleSave(article);
                return ResEntity.success();
            }
        }
        return ResEntity.fail();
    }
}
