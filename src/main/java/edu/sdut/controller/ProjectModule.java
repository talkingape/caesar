package edu.sdut.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.*;
import edu.sdut.service.ProjectService;
import edu.sdut.service.UserService;
import edu.sdut.util.EasyuiDataGridJson;

@Controller
@RequestMapping("/projectModule")
public class ProjectModule {

	@Resource
	ProjectService projectService;
	@Resource
	UserService userService;

	@RequestMapping("/toAddProject")
	public String toAddProject(HttpServletRequest request) {
		List<UserGroup> userGroup = userService.selectAllGroup();
		request.setAttribute("userGroup", userGroup);
		return "addNewProject";
	}

	@ResponseBody
	@RequestMapping("/addProject")
	public String addProject(HttpServletRequest request) {
		String title = request.getParameter("title");
		String userGroup = request.getParameter("userGroup");
		int groupId = Integer.parseInt(userGroup);
		String describe = request.getParameter("describe");
		String curStatus =request.getParameter("curStatus");
		int status =Integer.parseInt(curStatus);
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		ProjectInfo projectInfo = new ProjectInfo();
		projectInfo.setTitle(title);
		projectInfo.setGroupId(groupId);
		projectInfo.setCreateUserId(user.getId());
		projectInfo.setDescribe(describe);
		projectInfo.setStatus(status);
		boolean sign = projectService.addProject(projectInfo);
		if (sign) {
			return "success";
		}
		return "failed";
	}

	@RequestMapping("/toProjectList")
	public String toProjectList(HttpServletRequest request) {
		List<UserGroup> userGroup = userService.selectAllGroup();
		request.setAttribute("userGroup", userGroup);
		return "projectList";
	}

	@ResponseBody
	@RequestMapping("/getProjectList")
	public EasyuiDataGridJson getProjectList(HttpServletRequest request) {
		HashMap<String, Object> param = projectService.getParamFromReq(request);
		EasyuiDataGridJson projectList = projectService.getProjectList(param);
		return projectList;
	}

	@RequestMapping("/toProjectDetail")
	public String toProjectDetail(HttpServletRequest request) {
		String projectIDs = request.getParameter("projectID");
		int projectID = 0;
		if (projectIDs != null && !"".equals(projectIDs)) {
			projectID = Integer.parseInt(projectIDs);
		}
		HashMap<String, Object> projectOverView = projectService.getProjectOverView(projectID);
		List<HashMap<String, Object>> userList = userService.getUserByProject(projectID);
		HashMap<String, Object> projectDetail = projectService.getProjectDetailByID(projectID);
		request.setAttribute("projectOverView", projectOverView);
		request.setAttribute("userList", userList);
		request.setAttribute("projectDetail", projectDetail);
		return "projectDetail";
	}
	
	@RequestMapping("/toEditProject")
	public String toEditProject(HttpServletRequest request){
		String projectIDs = request.getParameter("projectID");
		int projectID = 0;
		if (projectIDs != null && !"".equals(projectIDs)) {
			projectID = Integer.parseInt(projectIDs);
		}
		List<UserGroup> userGroup = userService.selectAllGroup();
		request.setAttribute("userGroup", userGroup);
		HashMap<String, Object> projectDetail = projectService.getProjectDetailByID(projectID);
		request.setAttribute("projectDetail", projectDetail);
		return "editProject";
	}

	@RequestMapping("/editProject")
	public String editProject(HttpServletRequest request){
		String ids = request.getParameter("projectID");
		int id =Integer.parseInt(ids);
		String userGroup = request.getParameter("userGroup");
		int groupId = Integer.parseInt(userGroup);
		String describe = request.getParameter("describe");
		String curStatus =request.getParameter("curStatus");
		int status =Integer.parseInt(curStatus);
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		ProjectInfo projectInfo = new ProjectInfo();
		projectInfo.setId(id);
		projectInfo.setGroupId(groupId);
		projectInfo.setCreateUserId(user.getId());
		projectInfo.setDescribe(describe);
		projectInfo.setStatus(status);
		boolean sign = projectService.editProject(projectInfo);
		if (sign) {
			return "success";
		}
		return "failed";
	}
}
