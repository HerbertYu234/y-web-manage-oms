package ywm.oms.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Herbert Yu on 2019-12-03 21:10
 */
public abstract class ViewModel implements Serializable {

    private String id;

    private long updateTime;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(long updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
