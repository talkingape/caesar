package edu.sdut.model;

import java.util.Date;

public class TaskLog {
    private Integer id;

    private Integer taskId;

    private Integer operator;

    private Date operateTime;

    private Integer preStatus;

    private Integer afterStatus;

    private Integer preCompletion;

    private Integer afterCompletion;

    private String describe;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public Integer getPreStatus() {
        return preStatus;
    }

    public void setPreStatus(Integer preStatus) {
        this.preStatus = preStatus;
    }

    public Integer getAfterStatus() {
        return afterStatus;
    }

    public void setAfterStatus(Integer afterStatus) {
        this.afterStatus = afterStatus;
    }

    public Integer getPreCompletion() {
        return preCompletion;
    }

    public void setPreCompletion(Integer preCompletion) {
        this.preCompletion = preCompletion;
    }

    public Integer getAfterCompletion() {
        return afterCompletion;
    }

    public void setAfterCompletion(Integer afterCompletion) {
        this.afterCompletion = afterCompletion;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}