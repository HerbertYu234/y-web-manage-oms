package ywm.oms.service.remote;

import com.wolf.cloud.annotition.Feigns;
import com.wolf.core.support.Pager;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import ywm.oms.model.Article;
import ywm.oms.service.term.ArticleSearchTerm;

/**
 * Created by Herbert Yu on 2019-11-17 13:33
 */
//@FeignClient(value = "gateway", path = "person/test")
@FeignClient(value = "blog", path = "/")
public interface BlogService {

    /**
     * 文章保存
     */
    @PostMapping("/article/save")
    Article articleSave(@RequestBody Article article);

    /**
     * 文章删除
     */
    @DeleteMapping("/article/remove/{id}")
    boolean articleRemove(@PathVariable("id") String id);

    /**
     * 文章检索
     */
    @GetMapping("/article/search")
    Page<Article> articleSearch(@Feigns.Param ArticleSearchTerm term,@Feigns.Param Pageable pageable);
}
