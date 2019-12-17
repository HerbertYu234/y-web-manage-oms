package ywm.oms.model;

/**
 * Created by Herbert Yu on 2019-12-17 21:13
 */
public class SysNotice extends ViewModel{

    /**
     * 创建人
     */
    private String userId;

    /**
     * 状态
     * 1 启用
     * -1 禁用
     */
    private int status = 1;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 轮播展示
     */
    private Boolean playable;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getPlayable() {
        return playable;
    }

    public void setPlayable(Boolean playable) {
        this.playable = playable;
    }
}
