package ywm.oms.service.remote;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;
import ywm.oms.model.ArticleComment;

/**
 * Created by Herbert Yu on 2019-11-17 13:33
 */
@FeignClient(value = "gateway", path = "blog/comment")
//@FeignClient(value = "blog", path = "/comment")
public interface ArticleCommentService {

    /**
     * 评论保存
     */
    @PostMapping("/save")
    ArticleComment commentSave(@RequestBody ArticleComment comment);


    /**
     * 评论删除
     */
    @DeleteMapping("/remove/{id}")
    boolean commentRemove(@PathVariable String id);

    /**
     * 评论数量
     */
    @GetMapping("/count")
    long commentCount();
}
