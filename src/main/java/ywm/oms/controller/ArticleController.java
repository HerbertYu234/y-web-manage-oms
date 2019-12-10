package ywm.oms.controller;

import com.wolf.lang.helper.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ywm.library.shared.model.ResEntity;
import ywm.oms.model.Article;
import ywm.oms.service.remote.ArticleService;
import ywm.oms.service.term.ArticleSearchTerm;

/**
 * Created by Herbert Yu on 2019-11-23 13:40
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;


    @GetMapping("/list")
    public String list(Model model) {
        return "/article/list";
    }

    @GetMapping("/page")
    @ResponseBody
    public ResEntity page(@PageableDefault(size = 10, page = 0) Pageable pageable,
                          ArticleSearchTerm term) {
        Page<Article> articles = articleService.articleSearch(term, pageable);
        return ResEntity.result(articles);
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(value = "id", required = false) String id, Model model) {
        if (Strings.isNotBlank(id)) {
            Article article = articleService.articleDetail(id);
            if (null != article) {
                model.addAttribute("article", article);
            }
        }
        return "/article/edit";
    }

    @GetMapping("/edit_md")
    public String editMd(@RequestParam(value = "id", required = false) String id, Model model) {
        if (Strings.isNotBlank(id)) {
            Article article = articleService.articleDetail(id);
            if (null != article) {
                model.addAttribute("article", article);
            }
        }
        return "/article/edit_md";
    }


    @PostMapping("/store")
    public String store(Article article) {
        articleService.articleSave(article);
        return "redirect:/article/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        articleService.articleRemove(id);
        return "redirect:/article/list";
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResEntity batchDelete(@RequestParam String[] ids) {
        return ResEntity.result(articleService.articleRemove(ids));
    }

    @ResponseBody
    @PostMapping("/change/status/{status}")
    public ResEntity changeStatus(@PathVariable("status") Integer status, @RequestParam String[] ids) {
        return ResEntity.result(articleService.articleChangeStatus(status, ids));
    }
}
