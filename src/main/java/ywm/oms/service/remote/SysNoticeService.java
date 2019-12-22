package ywm.oms.service.remote;

import com.wolf.cloud.annotition.Feigns;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import ywm.oms.model.SysNotice;
import ywm.oms.service.term.SysNoticeTerm;

/**
 * Created by Herbert Yu on 2019-12-17 21:11
 */
@FeignClient(value = "sys", path = "/notice")
public interface SysNoticeService {

    /**
     * 保存
     */
    @PostMapping("/save")
    SysNotice save(@RequestBody SysNotice sysNotice);

    /**
     * 删除
     */
    @PostMapping("/remove")
    boolean remove(@RequestParam("ids") String[] ids);

    /**
     * 详情
     */
    @GetMapping("/detail/{id}")
    SysNotice detail(@PathVariable("id") String id);

    /**
     * 检索
     */
    @GetMapping("/search")
    Page<SysNotice> search(@Feigns.Param SysNoticeTerm term, @Feigns.Param Pageable pageable);
}
