package edu.sdut.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/toAddTask")
	public String toAddTask(HttpServletRequest request){
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		List<HashMap<String, Object>> projectList = projectService.getProjectByGroup(user.getGroupId());
		List<HashMap<String, Object>> userList = userService.getUserByGroup(user.getGroupId());
		request.setAttribute("projectList", projectList);
		request.setAttribute("userList", userList);
		return "addNewTask";
	}
	
	@RequestMapping("/toTaskList")
	public String toTaskList(HttpServletRequest request){
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		List<HashMap<String, Object>> projectList = projectService.getProjectByGroup(user.getGroupId());
		List<HashMap<String, Object>> userList = userService.getUserByGroup(user.getGroupId());
		request.setAttribute("projectList", projectList);
		request.setAttribute("userList", userList);
		return "taskList";
	}
	
	@ResponseBody
	@RequestMapping("/getTaskList")
	public EasyuiDataGridJson getTaskList(HttpServletRequest request){
		HashMap<String, Object> param = taskService.getParamFromReq(request);
		EasyuiDataGridJson taskList = taskService.getTaskList(param);
		return taskList;
	}
	
	@RequestMapping("/editTask")
	public String editTask(HttpServletRequest request){
		
		return "editTask";
	}
}
