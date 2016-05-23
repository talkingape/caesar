package edu.sdut.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import edu.sdut.dao.TaskInfoMapper;
import edu.sdut.model.TaskInfo;
import edu.sdut.model.TaskLog;
import edu.sdut.service.TaskService;
import edu.sdut.util.EasyuiDataGridJson;

@Service("TaskService")
public class TaskServiceImpl implements TaskService{
	
	@Resource
	TaskInfoMapper taskInfoMapper;
	
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

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
		String taskTitle = request.getParameter("taskTitle");
		String createUserIDStr = request.getParameter("createUserID");
		String currentUserIDStr = request.getParameter("currentUserID");
		String categoryStr = request.getParameter("category");
		String projectIDStr = request.getParameter("projectID");
		String statusStr = request.getParameter("status");
		String priorityStr = request.getParameter("priority");
		String createTimeBeginStr = request.getParameter("createTimeBegin");
		String createTimeEndStr = request.getParameter("createTimeEnd");
		String expectTimeBeginStr = request.getParameter("expectTimeBegin");
		String expectimeEndStr = request.getParameter("expectimeEnd");
		String pageStr = request.getParameter("page");
		String rowsStr = request.getParameter("rows");
		HashMap<String,Object> param = new HashMap<String,Object>();
		if (!StringUtils.isEmpty(taskTitle)) {
			param.put("taskTitle", taskTitle);
		}
		if (!StringUtils.isEmpty(createUserIDStr)&&!createUserIDStr.equals("-1")) {
			param.put("createUserID", Integer.parseInt(createUserIDStr));
		}
		if (!StringUtils.isEmpty(currentUserIDStr)&&!currentUserIDStr.equals("-1")) {
			param.put("currentUserID", Integer.parseInt(currentUserIDStr));
		}
		if (!StringUtils.isEmpty(categoryStr)&&!categoryStr.equals("-1")) {
			param.put("category", Integer.parseInt(categoryStr));
		}
		if (!StringUtils.isEmpty(projectIDStr)&&!projectIDStr.equals("-1")) {
			param.put("projectID", Integer.parseInt(projectIDStr));
		}
		if (!StringUtils.isEmpty(statusStr)&&!statusStr.equals("-1")) {
			param.put("status", Integer.parseInt(statusStr));
		}
		if (!StringUtils.isEmpty(priorityStr)&&!priorityStr.equals("-1")) {
			param.put("priority", Integer.parseInt(priorityStr));
		}
		try {
			if (!StringUtils.isEmpty(createTimeBeginStr)&&!StringUtils.isEmpty(createTimeEndStr)) {
				param.put("createTimeBegin", sdf.parse(createTimeBeginStr+" 00:00:00"));
				param.put("createTimeEnd", sdf.parse(createTimeEndStr+" 23:59:59"));
			}
			if (!StringUtils.isEmpty(expectTimeBeginStr)&&!StringUtils.isEmpty(expectimeEndStr)) {
				param.put("expectTimeBegin", sdf.parse(expectTimeBeginStr+" 00:00:00"));
				param.put("expectimeEnd", sdf.parse(expectimeEndStr+" 23:59:59"));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (!StringUtils.isEmpty(pageStr)&&!StringUtils.isEmpty(rowsStr)) {
			int page = Integer.parseInt(pageStr);
			int rows = Integer.parseInt(rowsStr);
			param.put("begin", rows*(page-1));
			param.put("step", rows);
		}
		return param;
	}

	@Override
	public EasyuiDataGridJson getTaskList(HashMap<String, Object> param) {
		List<HashMap<String, Object>> taskList = taskInfoMapper.getTaskList(param);
		EasyuiDataGridJson eJson=new EasyuiDataGridJson();
		eJson.setRows(taskList);
		Long total = taskInfoMapper.getTaskListCount(param);
		eJson.setTotal(total);
		return eJson;
	}

}
