package edu.sdut.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.*;
import edu.sdut.service.ProjectService;

@Controller
@RequestMapping("/projectModule")
public class ProjectModule {
	
	@Resource
	ProjectService projectService;
	
	@RequestMapping("/toAddProject")
	public String toAddProject(HttpServletRequest request){
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
}
