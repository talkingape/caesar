package edu.sdut.model;

public class UserInfo {
    private Integer id;

    private String name;

    private String password;

    private Integer actorId;

    private Integer extActId;

    private Integer tel;

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

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }
}