package ywm.oms.service.remote;

import com.wolf.cloud.annotition.Feigns;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import ywm.oms.model.ArticleTag;

/**
 * Created by Herbert Yu on 2019-11-17 13:33
 */
//@FeignClient(value = "gateway", path = "person/test")
@FeignClient(value = "blog", path = "/tag")
public interface ArticleTagService {

    /**
     * 标签保存
     */
    @PostMapping("/save")
    ArticleTag tagSave(@RequestBody ArticleTag tag);

    /**
     * 标签删除
     */
    @DeleteMapping("/remove/{id}")
    boolean tagRemove(@PathVariable("id") String id);

    /**
     * 标签删除
     */
    @PostMapping("/remove")
    boolean tagRemove(@RequestParam("ids") String[] ids);

    /**
     * 标签数量
     */
    @GetMapping("/count")
    long tagCount();

    /**
     * 标签查询
     */
    @GetMapping("/page")
    Page<ArticleTag> tagPage(@Feigns.Param Pageable pageable);

    /**
     * 标签详情
     */
    @GetMapping("/detail/{id}")
    ArticleTag tagDetail(@PathVariable("id") String id);
}
