package ywm.oms.service.remote;

import com.wolf.cloud.annotition.Feigns;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import ywm.oms.model.Article;
import ywm.oms.service.term.ArticleTerm;

/**
 * Created by Herbert Yu on 2019-11-17 13:33
 */
@FeignClient(value = "gateway", path = "blog/article")
//@FeignClient(value = "blog", path = "/article")
public interface ArticleService {

    /**
     * 文章保存
     */
    @PostMapping("/save")
    Article articleSave(@RequestBody Article article);

    /**
     * 文章删除
     */
    @DeleteMapping("/remove/{id}")
    boolean articleRemove(@PathVariable("id") String id);

    /**
     * 文章删除
     */
    @PostMapping("/remove")
    boolean articleRemove(@RequestParam("ids") String[] ids);

    /**
     * 根据id查找
     */
    @GetMapping("/detail/{id}")
    Article articleDetail(@PathVariable("id") String id);

    /**
     * 文章检索
     */
    @GetMapping("/search")
    Page<Article> articleSearch(@Feigns.Param ArticleTerm term, @Feigns.Param Pageable pageable);

    /**
     * 数量统计
     */
    @GetMapping("/count")
    long articleCount(@Feigns.Param ArticleTerm term);


    /**
     * 文章状态变更
     */
    @PostMapping("/change/status/{status}")
    boolean articleChangeStatus(@PathVariable("status") Integer status,
                                @RequestParam("ids") String[] ids);
}
