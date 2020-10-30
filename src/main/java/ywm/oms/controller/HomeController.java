package ywm.oms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ywm.library.shared.model.ArticleType;
import ywm.library.shared.model.ResEntity;
import ywm.library.shared.model.UserDTO;
import ywm.library.shared.remote.SharedUserService;
import ywm.library.shared.security.SecurityService;
import ywm.oms.service.remote.ArticleService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Herbert Yu on 2019-11-17 13:45
 */
@Controller
public class HomeController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private SharedUserService sharedUserService;

    @Autowired
    private SecurityService securityService;


    @GetMapping(value = {"", "/", "/index"})
    public String index(Model model) {
        UserDTO admin = sharedUserService.findByUsername("admin");
        model.addAttribute("articleNum", articleService.articleCount(null));
        model.addAttribute("articleTypeNum", ArticleType.values().length);
        return "/index";
    }


    @GetMapping("/plain")
    private String plain(Model model) {
        return "/plain";
    }


    @GetMapping("/logout")
    @ResponseBody
    public ResEntity logout(HttpServletRequest request, HttpServletResponse response) {
        securityService.logout(request, response);
        return ResEntity.success();
    }

}
