package ywm.oms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public Page<Article> page(@PageableDefault(size = 10, page = 0) Pageable pageable) {
        Page<Article> articles = articleService.articleSearch(new ArticleSearchTerm(), pageable);
        return articles;
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(value = "id", required = false) String id, Model model) {
        Article article = articleService.articleDetail(id);
        if (null != article) {
            model.addAttribute("article", article);
        }
        return "/article/edit";
    }


    @PostMapping("/store")
    public String store(Article article) {
        articleService.articleSave(article);
        return "redirect:/article/list";
    }
}