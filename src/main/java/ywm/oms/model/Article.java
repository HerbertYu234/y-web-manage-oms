package ywm.oms.model;

import ywm.library.shared.model.ArticleType;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Herbert Yu on 2019-11-17 13:39
 */
public class Article extends ViewModel{

    /**
     * 标题
     */
    private String title;

    /**
     * 作者
     */
    private String author;

    /**
     * 用户
     */
    private String user;

    /**
     * 内容
     */
    private String content;

    /**
     * 类别
     */
    private ArticleType type;

    /**
     * 标签
     */
    private List<String> tags = new ArrayList<>();

    /**
     * 评论
     */
    private List<String> comments = new ArrayList<>();

    /**
     * 是否置顶
     */
    private boolean top = false;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArticleType getType() {
        return type;
    }

    public void setType(ArticleType type) {
        this.type = type;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getComments() {
        return comments;
    }

    public void setComments(List<String> comments) {
        this.comments = comments;
    }

    public boolean isTop() {
        return top;
    }

    public void setTop(boolean top) {
        this.top = top;
    }
}
