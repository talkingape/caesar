package edu.sdut.dao;

import java.util.HashMap;

import edu.sdut.model.TaskInfo;

public interface TaskInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TaskInfo record);

    int insertSelective(TaskInfo record);

    TaskInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskInfo record);

    int updateByPrimaryKey(TaskInfo record);
    
    HashMap<String,Object> getTaskByProjectID(int projectID);
}