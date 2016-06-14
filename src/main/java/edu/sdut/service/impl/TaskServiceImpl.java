package edu.sdut.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import edu.sdut.dao.TaskInfoMapper;
import edu.sdut.dao.TaskLogMapper;
import edu.sdut.model.TaskInfo;
import edu.sdut.model.TaskLog;
import edu.sdut.service.TaskService;
import edu.sdut.util.CommonUtil;
import edu.sdut.util.EasyuiDataGridJson;

@Service("TaskService")
public class TaskServiceImpl implements TaskService{
	
	@Resource
	TaskInfoMapper taskInfoMapper;
	@Resource
	TaskLogMapper taskLogMapper;
	
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	@Transactional
	@Override
	public boolean addTask(TaskInfo taskInfo) {
		taskInfo.setCreateTime(new Date());
		taskInfo.setCode(CommonUtil.genTaskCode(taskInfo.getProjectId(), taskInfo.getCreateUserId()));
		int taskID = taskInfoMapper.insert(taskInfo);
		if (taskID>0) {
			TaskLog taskLog = new TaskLog();
			taskLog.setOperateTime(new Date());
			taskLog.setAfterCompletion(0);
			taskLog.setAfterStatus(taskInfo.getStatus());
			taskLog.setDescribe("新建项目");
			taskLog.setOperator(taskInfo.getCreateUserId());
			taskLog.setPreCompletion(0);
			taskLog.setPreStatus(0);
			taskLog.setTaskId(taskID);
			this.addTaskLog(taskLog);
			return true;
		}
		return false;
	}

	@Override
	public boolean addTaskLog(TaskLog taskLog) {
		int sign = taskLogMapper.insert(taskLog);
		if (sign>0) {
			return true;
		}else{
			return false;
		}
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

	@Override
	public TaskInfo getTaskInfo(int taskID) {
		TaskInfo taskInfo = taskInfoMapper.selectByPrimaryKey(taskID);
		return taskInfo;
	}

	@Override
	public boolean editTask(TaskInfo taskInfo,int userID) {
		TaskInfo preTask = taskInfoMapper.selectByPrimaryKey(taskInfo.getId());
		int sign = taskInfoMapper.updateByPrimaryKey(taskInfo);
		if(sign>0){
			TaskLog taskLog=new TaskLog();
			taskLog.setPreStatus(preTask.getStatus());
			taskLog.setAfterStatus(taskInfo.getStatus());
			taskLog.setOperator(userID);
			taskLog.setDescribe("编辑项目");
			taskLog.setOperateTime(new Date());
			taskLog.setTaskId(taskInfo.getId());
			this.addTaskLog(taskLog);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public HashMap<String, Object> getTaskOverView(int taskID) {
		HashMap<String, Object> taskOverView = taskInfoMapper.getTaskOverView(taskID);
		return taskOverView;
	}

	@Override
	public HashMap<String, Object> getTaskDetail(int taskID) {
		HashMap<String, Object> taskDetail = taskInfoMapper.getTaskDetail(taskID);
		return taskDetail;
	}

	@Override
	public List<HashMap<String, Object>> getTaskLog(int taskID) {
		List<HashMap<String, Object>> taskLog = taskLogMapper.getTaskLog(taskID);
		return taskLog;
	}

}
