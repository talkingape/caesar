package edu.sdut.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.sdut.model.TaskInfo;
import edu.sdut.model.TaskLog;
import edu.sdut.util.EasyuiDataGridJson;

public interface TaskService {
	public boolean addTask(TaskInfo taskInfo);
	
	public boolean addTaskLog(TaskLog projectLog);
	
	public HashMap<String,Object> getParamFromReq(HttpServletRequest request);
	
	public EasyuiDataGridJson getTaskList(HashMap<String, Object> param);
	
	public TaskInfo getTaskInfo(int taskID);
	
	public boolean editTask(TaskInfo taskInfo,int userID);

	public HashMap<String, Object> getTaskOverView(int taskID);

	public HashMap<String, Object> getTaskDetail(int taskID);
	
	public List<HashMap<String, Object>> getTaskLog(int taskID);
}
