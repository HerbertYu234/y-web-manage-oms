package ywm.oms.model;

import ywm.library.shared.model.ArticleType;
import ywm.library.shared.model.EidtorType;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Herbert Yu on 2019-11-17 13:39
 */
public class Article extends ViewModel {

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

    private String typeDesc;

    /**
     * 标签
     */
    private List<String> tags = new ArrayList<>();

    /**
     * 状态
     */
    private Integer status;

    /**
     * 状态描述
     */
    private String statusName;

    /**
     * 评论
     */
    private List<String> comments = new ArrayList<>();

    /**
     * 是否置顶
     */
    private boolean top = false;

    /**
     * 编辑器
     */
    private EidtorType editorType = EidtorType.WANGEDITOR;

    /**
     * 评论数
     */
    private long commitNum;

    /**
     * 阅读数
     */
    private long lookNum;

    /**
     * 喜欢/点赞 数
     */
    private long likeNum;


    private List<ArticleTag> tagDetail;


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

    public EidtorType getEditorType() {
        return editorType;
    }

    public void setEditorType(EidtorType editorType) {
        this.editorType = editorType;
    }

    public long getCommitNum() {
        return commitNum;
    }

    public void setCommitNum(long commitNum) {
        this.commitNum = commitNum;
    }

    public long getLookNum() {
        return lookNum;
    }

    public void setLookNum(long lookNum) {
        this.lookNum = lookNum;
    }

    public long getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(long likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }

    public List<ArticleTag> getTagDetail() {
        return tagDetail;
    }

    public void setTagDetail(List<ArticleTag> tagDetail) {
        this.tagDetail = tagDetail;
    }
}
