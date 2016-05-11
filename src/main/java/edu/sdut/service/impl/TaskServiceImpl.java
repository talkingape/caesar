package edu.sdut.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import edu.sdut.model.TaskInfo;
import edu.sdut.model.TaskLog;
import edu.sdut.service.TaskService;
import edu.sdut.util.EasyuiDataGridJson;

@Service("TaskService")
public class TaskServiceImpl implements TaskService{

	@Override
	public boolean addTask(TaskInfo taskInfo) {
		return false;
	}

	@Override
	public boolean addTaskLog(TaskLog projectLog) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public HashMap<String, Object> getParamFromReq(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EasyuiDataGridJson getTaskList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

}
