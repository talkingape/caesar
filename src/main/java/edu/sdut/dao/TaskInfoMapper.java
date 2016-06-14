package edu.sdut.dao;

import java.util.HashMap;
import java.util.List;

import edu.sdut.model.TaskInfo;

public interface TaskInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TaskInfo record);

    int insertSelective(TaskInfo record);

    TaskInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskInfo record);

    int updateByPrimaryKey(TaskInfo record);
    
    HashMap<String,Object> getOverViewByProjectID(int projectID);
    
    List<HashMap<String, Object>> getTaskList(HashMap<String,Object> param);

	Long getTaskListCount(HashMap<String, Object> param);
	
	HashMap<String, Object> getTaskOverView(int taskID);

	HashMap<String, Object> getTaskDetail(int taskID);
}