package edu.sdut.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.*;
import edu.sdut.service.UserService;
import edu.sdut.util.CommonUtil;
import edu.sdut.util.EasyuiDataGridJson;

@Controller
@RequestMapping("/userModule")
public class UserModule {

	@Resource
	UserService userService;

	@RequestMapping("/toUserList")
	public String toUserList(HttpServletRequest request) {
		List<UserActor> allActor = userService.selectAllActor();
		List<UserGroup> allGroup = userService.selectAllGroup();
		request.setAttribute("userActor", allActor);
		request.setAttribute("userGroup", allGroup);
		return "userList";
	}

	@ResponseBody
	@RequestMapping("/getUserList")
	public EasyuiDataGridJson getUserList(HttpServletRequest request) {
		HashMap<String, Object> param = userService.getParamFromReq(request);
		EasyuiDataGridJson eJson = userService.getUserList(param);
		return eJson;
	}

	@ResponseBody
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userGroup = request.getParameter("userGroup");
		String userActor = request.getParameter("userActor");
		UserInfo userInfo = new UserInfo();
		userInfo.setName(userName);
		userInfo.setEmail(userEmail);
		userInfo.setPassword(CommonUtil.randomStr(8));
		userInfo.setGroupId(Integer.parseInt(userGroup));
		userInfo.setActorId(Integer.parseInt(userActor));
		userInfo.setCreateDatetime(new Date());
		if (userService.isExistUser(userInfo.getName())) {
			return new String("exist");
		}
		int sign = userService.addUser(userInfo);
		if (sign==1) {
			return new String("success");
		}else{
			return new String("failed");
		}
	}
	
	@ResponseBody
	@RequestMapping("/getUserByGroup")
	public List<HashMap<String,Object>> getUserByGroup(int groupID){
		List<HashMap<String, Object>> userList = userService.getUserByGroup(groupID);
		return userList;
	}
	
}
