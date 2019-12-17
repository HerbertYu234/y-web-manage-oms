package ywm.oms.model;


import java.util.List;

/**
 * Created by Herbert Yu on 2019-11-12 18:22
 * 评论、留言
 */
public class ArticleComment extends ViewModel {

    /**
     * 评论id
     */
    private String article;


    private String comment;

    /**
     * 用户
     */
    private String user;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 图片
     */
    private List<String> images;

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }
}
