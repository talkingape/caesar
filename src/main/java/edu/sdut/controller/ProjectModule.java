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
	public String toAddProject(HttpServletRequest request){
		List<UserGroup> userGroup = userService.selectAllGroup();
		request.setAttribute("userGroup", userGroup);
		return "addNewProject";
	}
	
	@ResponseBody
	@RequestMapping("/addProject")
	public String addProject(HttpServletRequest request){
		String title = request.getParameter("title");
		String userGroup = request.getParameter("userGroup");
		int groupId = Integer.parseInt(userGroup);
		String describe = request.getParameter("describe");
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		ProjectInfo projectInfo=new ProjectInfo();
		projectInfo.setTitle(title);
		projectInfo.setGroupId(groupId);
		projectInfo.setCreateUserId(user.getId());
		projectInfo.setDescribe(describe);
		boolean sign = projectService.addProject(projectInfo);
		if (sign) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("/toProjectList")
	public String toProjectList(HttpServletRequest request){
		List<UserGroup> userGroup = userService.selectAllGroup();
		request.setAttribute("userGroup", userGroup);
		return "projectList";
	}
	
	@ResponseBody
	@RequestMapping("/getProjectList")
	public EasyuiDataGridJson getProjectList(HttpServletRequest request){
		HashMap<String, Object> param = projectService.getParamFromReq(request);
		EasyuiDataGridJson projectList = projectService.getProjectList(param);
		return projectList;
	}
}
