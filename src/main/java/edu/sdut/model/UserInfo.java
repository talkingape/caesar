package edu.sdut.model;

import java.io.Serializable;
import java.util.Date;

public class UserInfo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 6804483292358064879L;

	private Integer id;

    private String name;

    private String password;

    private Integer groupId;

    private Integer actorId;

    private Integer extActId;

    private String tel;

    private String email;

    private Date createDatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getActorId() {
        return actorId;
    }

    public void setActorId(Integer actorId) {
        this.actorId = actorId;
    }

    public Integer getExtActId() {
        return extActId;
    }

    public void setExtActId(Integer extActId) {
        this.extActId = extActId;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
}