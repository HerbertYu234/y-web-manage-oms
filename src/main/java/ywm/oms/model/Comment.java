package ywm.oms.model;

import ywm.library.shared.model.CommentType;

import java.util.List;

/**
 * Created by Herbert Yu on 2019-11-12 18:22
 * 评论、留言
 */
public class Comment extends ViewModel {


    /**
     * 评论类型
     */
    private CommentType type;

    /**
     * 评论id
     */
    private String target;


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

    public CommentType getType() {
        return type;
    }

    public void setType(CommentType type) {
        this.type = type;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
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
