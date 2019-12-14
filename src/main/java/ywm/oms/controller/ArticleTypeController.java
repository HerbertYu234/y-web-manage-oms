package ywm.oms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ywm.library.shared.model.ArticleType;
import ywm.library.shared.model.ResEntity;

/**
 * Created by Herbert Yu on 2019-12-14 21:23
 */
@Controller
@RequestMapping("/article/type")
public class ArticleTypeController extends BaseController {

    @GetMapping("/list")
    public String list(Model model) {
        return "/article/type";
    }

    @GetMapping("/data")
    @ResponseBody
    public ResEntity data() {
        return ResEntity.result(ArticleType.toListMap());
    }
}
