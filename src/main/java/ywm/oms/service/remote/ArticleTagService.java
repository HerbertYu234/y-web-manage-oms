package ywm.oms.service.remote;

import org.springframework.cloud.netflix.feign.FeignClient;
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
    boolean tagRemove(@PathVariable String id);

    /**
     * 标签数量
     */
    @GetMapping("/count")
    long tagCount();
}
