package edu.sdut.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.dao.*;
import edu.sdut.model.UserActor;
import edu.sdut.model.UserGroup;
import edu.sdut.util.EasyuiDataGridJson;

@Controller
@RequestMapping("/userModule")
public class UserModule {
	
	@Resource
	UserInfoMapper userInfoMapper;
	@Resource
	UserActorMapper userActorMapper;
	@Resource
	UserAuthorityMapper userAuthorityMapper;
	@Resource
	UserGroupMapper userGroupMapper;
	
	@RequestMapping("/toUserManagement")
	public String toUserManagement(HttpServletRequest request){
		List<UserActor> allActor = userActorMapper.selectAllActor();
		List<UserGroup> allGroup = userGroupMapper.selectAllGroup();
		request.setAttribute("userActor", allActor);
		request.setAttribute("userGroup", allGroup);
		return "jsp/userManagement";
	}
	
	@ResponseBody
	@RequestMapping("/getUserList")
	public EasyuiDataGridJson getUserList(HttpServletRequest request){
		String userID = request.getParameter("userID");
		String userName = request.getParameter("userName");
		String userGroup = request.getParameter("userGroup");
		String userActor = request.getParameter("userActor");
		String pageStr = request.getParameter("page");
		String rowsStr = request.getParameter("rows");
		HashMap<String, Object> userInfo=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(userID)){
			userInfo.put("userID", userID);
		}
		if(!StringUtils.isEmpty(userName)){
			userInfo.put("userName", userName);
		}
		if(!StringUtils.isEmpty(userGroup)){
			userInfo.put("userGroup", userGroup);
		}
		if(!StringUtils.isEmpty(userActor)){
			userInfo.put("userActor", userActor);
		}
		if (!StringUtils.isEmpty(pageStr)&&!StringUtils.isEmpty(rowsStr)) {
			int page = Integer.parseInt(pageStr);
			int rows = Integer.parseInt(rowsStr);
			userInfo.put("begin", rows*(page-1));
			userInfo.put("step", rows);
		}
		EasyuiDataGridJson eJson=new EasyuiDataGridJson();
		List<HashMap<String, Object>> userList = userInfoMapper.getUserList(userInfo);
		eJson.setRows(userList);
		long listCount = userInfoMapper.getUserListCount(userInfo);
		eJson.setTotal(listCount);
		return eJson;
	}
}
