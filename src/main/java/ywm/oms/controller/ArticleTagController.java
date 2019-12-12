package ywm.oms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ywm.library.shared.model.ResEntity;
import ywm.oms.model.ArticleTag;
import ywm.oms.service.remote.ArticleTagService;

/**
 * Created by Herbert Yu on 2019-12-11 16:39
 */
@Controller
@RequestMapping("/article/tag")
public class ArticleTagController extends BaseController {

    @Autowired
    private ArticleTagService articleTagService;


    @GetMapping("/list")
    public String list(Model model) {
        return "/article/tag";
    }

    @GetMapping("/page")
    @ResponseBody
    public ResEntity page(@PageableDefault(size = Integer.MAX_VALUE, page = 0) Pageable pageable) {
        Page<ArticleTag> tags = articleTagService.tagPage(pageable);
        return ResEntity.result(tags);
    }

    @PostMapping("/store")
    @ResponseBody
    public ResEntity store(ArticleTag tag) {
        ArticleTag save = articleTagService.tagSave(tag);
        return ResEntity.result(save);
    }

    @GetMapping("/detail/{id}")
    @ResponseBody
    public ResEntity detail(@PathVariable("id")String id){
        return ResEntity.result(articleTagService.tagDetail(id));
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResEntity batchDelete(@RequestParam String[] ids) {
        return ResEntity.result(articleTagService.tagRemove(ids));
    }
}
