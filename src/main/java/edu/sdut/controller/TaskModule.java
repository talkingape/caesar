package edu.sdut.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.TaskInfo;
import edu.sdut.model.UserInfo;
import edu.sdut.service.ProjectService;
import edu.sdut.service.TaskService;
import edu.sdut.service.UserService;
import edu.sdut.util.EasyuiDataGridJson;

@RequestMapping("/taskModule")
@Controller
public class TaskModule {

	@Resource
	UserService userService;
	@Resource
	ProjectService projectService;
	@Resource
	TaskService taskService;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@RequestMapping("/toAddTask")
	public String toAddTask(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		List<HashMap<String, Object>> projectList = projectService.getProjectByGroup(user.getGroupId());
		List<HashMap<String, Object>> userList = userService.getUserByGroup(user.getGroupId());
		request.setAttribute("projectList", projectList);
		request.setAttribute("userList", userList);
		return "addNewTask";
	}

	@ResponseBody
	@RequestMapping("/addTask")
	public String addTask(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String category = request.getParameter("category");
		String taskTitle = request.getParameter("taskTitle");
		String projectID = request.getParameter("projectID");
		String currentUserId = request.getParameter("currentUserId");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		String expectTime = request.getParameter("expectTime");
		String taskTime = request.getParameter("taskTime");
		String describe = request.getParameter("describe");
		TaskInfo taskInfo = new TaskInfo();
		taskInfo.setCategory(Integer.parseInt(category));
		taskInfo.setTitle(taskTitle);
		taskInfo.setProjectId(Integer.parseInt(projectID));
		taskInfo.setCurrentUserId(Integer.parseInt(currentUserId));
		taskInfo.setStatus(Integer.parseInt(status));
		taskInfo.setPriority(Integer.parseInt(priority));
		try {
			taskInfo.setExpectTime(sdf.parse(expectTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		taskInfo.setCompletion(0);
		taskInfo.setTaskTime(Integer.parseInt(taskTime));
		taskInfo.setDescribe(describe);
		taskInfo.setCreateUserId(user.getId());
		taskInfo.setPreUserId(user.getId());
		taskService.addTask(taskInfo);
		return "false";
	}

	@RequestMapping("/toTaskList")
	public String toTaskList(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		List<HashMap<String, Object>> projectList = projectService.getProjectByGroup(user.getGroupId());
		List<HashMap<String, Object>> userList = userService.getUserByGroup(user.getGroupId());
		request.setAttribute("projectList", projectList);
		request.setAttribute("userList", userList);
		return "taskList";
	}

	@ResponseBody
	@RequestMapping("/getTaskList")
	public EasyuiDataGridJson getTaskList(HttpServletRequest request) {
		HashMap<String, Object> param = taskService.getParamFromReq(request);
		EasyuiDataGridJson taskList = taskService.getTaskList(param);
		return taskList;
	}

	@RequestMapping("/toEditTask")
	public String toEditTask(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String taskID = request.getParameter("taskID");
		int id = Integer.parseInt(taskID);
		List<HashMap<String, Object>> projectList = projectService.getProjectByGroup(user.getGroupId());
		List<HashMap<String, Object>> userList = userService.getUserByGroup(user.getGroupId());
		TaskInfo taskInfo = taskService.getTaskInfo(id);
		request.setAttribute("taskInfo", taskInfo);
		request.setAttribute("projectList", projectList);
		request.setAttribute("userList", userList);
		return "editTask";
	}

	@ResponseBody
	@RequestMapping("/editTask")
	public String editTask(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String taskID = request.getParameter("taskID");
		String currentUserId = request.getParameter("currentUserId");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		String expectTime = request.getParameter("expectTime");
		String taskTime = request.getParameter("taskTime");
		String describe = request.getParameter("describe");
		TaskInfo taskInfo = new TaskInfo();
		taskInfo.setId(Integer.parseInt(taskID));
		taskInfo.setCurrentUserId(Integer.parseInt(currentUserId));
		taskInfo.setDescribe(describe);
		taskInfo.setStatus(Integer.parseInt(status));
		try {
			taskInfo.setExpectTime(sdf.parse(expectTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		taskInfo.setTaskTime(Integer.parseInt(taskTime));
		taskInfo.setPriority(Integer.parseInt(priority));
		boolean sign = taskService.editTask(taskInfo, user.getId());
		if (sign) {
			return "success";
		}else{
			return "failed";
		}
	}
}
