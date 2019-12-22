package ywm.oms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ywm.library.shared.model.ResEntity;
import ywm.oms.model.SysNotice;
import ywm.oms.service.remote.SysNoticeService;
import ywm.oms.service.term.SysNoticeTerm;

/**
 * Created by Herbert Yu on 2019-12-18 17:37
 * 通知公告
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {


    @Autowired
    private SysNoticeService sysNoticeService;


    @GetMapping("/list")
    public String list(Model model) {
        return "/notice/list";
    }


    @GetMapping("/page")
    @ResponseBody
    public ResEntity page(@PageableDefault(size = 10, page = 0) Pageable pageable,
                          SysNoticeTerm term) {
        Page<SysNotice> notices = sysNoticeService.search(term, pageable);
        return ResEntity.result(notices);
    }

    @PostMapping("/store")
    @ResponseBody
    public ResEntity store(SysNotice sysNotice) {
        sysNoticeService.save(sysNotice);
        return ResEntity.success();
    }

    /**
     * 批量删除
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResEntity batchDelete(@RequestParam String[] ids) {
        return ResEntity.result(sysNoticeService.remove(ids));
    }


    @GetMapping("/find/{id}")
    @ResponseBody
    public ResEntity find(@PathVariable("id") String id) {
        return ResEntity.result(sysNoticeService.detail(id));
    }

    @GetMapping("/playable/{id}")
    @ResponseBody
    public ResEntity playable(@PathVariable("id") String id,
                              @RequestParam Boolean playable) {
        SysNotice detail = sysNoticeService.detail(id);
        if (null != detail) {
            detail.setPlayable(playable);
            sysNoticeService.save(detail);
            return ResEntity.success();
        }
        return ResEntity.fail();
    }

    @GetMapping("/push")
    public String push(Model model){
        return "/notice/push";
    }
}
