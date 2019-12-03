package ywm.oms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ywm.library.shared.model.ArticleType;
import ywm.oms.service.remote.ArticleService;

/**
 * Created by Herbert Yu on 2019-11-17 13:45
 */
@Controller
public class HomeController extends BaseController {

    @Autowired
    private ArticleService articleService;


    @GetMapping(value = {"", "/"})
    public String index(Model model) throws InterruptedException {
        model.addAttribute("articleNum", articleService.articleCount(null));
        model.addAttribute("articleTypeNum", ArticleType.values().length);
        return "/index";
    }


    @GetMapping("/plain")
    private String plain(Model model) {
        return "/plain.ftl";
    }
}
