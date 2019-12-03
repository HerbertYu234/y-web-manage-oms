package ywm.oms.model;

import java.io.Serializable;

/**
 * Created by Herbert Yu on 2019-12-03 21:10
 */
public abstract class ViewModel implements Serializable {

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
