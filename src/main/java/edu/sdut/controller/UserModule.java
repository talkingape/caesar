package edu.sdut.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.*;
import edu.sdut.service.UserService;
import edu.sdut.util.EasyuiDataGridJson;

@Controller
@RequestMapping("/userModule")
public class UserModule {
	
	@Resource
	UserService userService;
	
	@RequestMapping("/toUserManagement")
	public String toUserManagement(HttpServletRequest request){
		List<UserActor> allActor = userService.selectAllActor();
		List<UserGroup> allGroup = userService.selectAllGroup();
		request.setAttribute("userActor", allActor);
		request.setAttribute("userGroup", allGroup);
		return "jsp/userManagement";
	}
	
	@ResponseBody
	@RequestMapping("/getUserList")
	public EasyuiDataGridJson getUserList(HttpServletRequest request){
		HashMap<String, Object> param = userService.getParamFromReq(request);
		EasyuiDataGridJson eJson = userService.getUserList(param);
		return eJson;
	}
}
