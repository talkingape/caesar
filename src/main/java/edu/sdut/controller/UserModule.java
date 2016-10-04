package edu.sdut.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.*;
import edu.sdut.service.ProjectService;
import edu.sdut.service.TaskService;
import edu.sdut.service.UserService;
import edu.sdut.util.CommonUtil;
import edu.sdut.util.EasyuiDataGridJson;

@Controller
@RequestMapping("/userModule")
public class UserModule {

	@Resource
	UserService userService;
	@Resource
	ProjectService projectService;
	@Resource
	TaskService taskService;
	
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
	
	@RequestMapping("/toEditUser")
	public String toEditUser(HttpServletRequest request){
		String userIDs = request.getParameter("userID");
		int userID = 0;
		if (userIDs != null && !"".equals(userIDs)) {
			userID = Integer.parseInt(userIDs);
		}
		List<UserActor> allActor = userService.selectAllActor();
		List<UserGroup> allGroup = userService.selectAllGroup();
		request.setAttribute("userActor", allActor);
		request.setAttribute("userGroup", allGroup);
		UserInfo currentUser = (UserInfo)request.getSession().getAttribute("user");
		if(currentUser.getActorId()==1){
			request.setAttribute("isAdmin", 1);
		}else{
			request.setAttribute("isAdmin", 0);
		}
		if (userID==0) {
			request.setAttribute("userInfo", (UserInfo)request.getSession().getAttribute("user"));
			return "editUser";
		}
		UserInfo userInfo = userService.getUserInfoByID(userID);
		request.setAttribute("userInfo", userInfo);
		return "editUser";
	}
	
	@ResponseBody
	@RequestMapping("/editUser")
	public String editUser(HttpServletRequest request){
		String userIDs = request.getParameter("userID");
		String userGroups = request.getParameter("userGroup");
		String userActors = request.getParameter("userActor");
		String userTel = request.getParameter("userTel");
		String userEmail = request.getParameter("userEmail");
		UserInfo user=new UserInfo();
		int userID = 0;
		if (userIDs != null && !"".equals(userIDs)) {
			userID = Integer.parseInt(userIDs);
		}
		if (userGroups != null && !"".equals(userGroups)) {
			int userGroup = 0;
			userGroup = Integer.parseInt(userGroups);
			user.setGroupId(userGroup);
		}
		if (userActors != null && !"".equals(userActors)) {
			int userActor = 0;
			userActor = Integer.parseInt(userActors);
			user.setActorId(userActor);
		}
		user.setEmail(userEmail);
		user.setId(userID);
		user.setTel(userTel);
		boolean sign = userService.updateByPrimaryKeySelective(user);
		if (sign) {
			return "success";
		}
		return "failed";
	}
	@RequestMapping("/toUserDetail")
	public String toUserDetail(HttpServletRequest request){
		String userIDs = request.getParameter("userID");
		int userID = 0;
		if (userIDs != null && !"".equals(userIDs)) {
			userID = Integer.parseInt(userIDs);
		}
		List<UserActor> allActor = userService.selectAllActor();
		List<UserGroup> allGroup = userService.selectAllGroup();
		request.setAttribute("userActor", allActor);
		request.setAttribute("userGroup", allGroup);
		if (userID==0) {
			request.setAttribute("userInfo", (UserInfo)request.getSession().getAttribute("user"));
			return "userDetail";
		}
		UserInfo userInfo = userService.getUserInfoByID(userID);
		request.setAttribute("userInfo", userInfo);
		return "userDetail";
	}
	
	@RequestMapping("/toOverView")
	public String toOverView(HttpServletRequest request){
		UserInfo userInfo=(UserInfo)request.getSession().getAttribute("user");
		int userID = userInfo.getId();
		List<HashMap<String,Object>> projectOverView = projectService.getOverView(userID);
		List<HashMap<String,Object>> taskOverView = taskService.getOverView(userID);
		request.setAttribute("projectOverView", projectOverView);
		request.setAttribute("taskOverView", taskOverView);
		return "overView";
	}
	
	@ResponseBody
	@RequestMapping("/getLoginLog")
	public EasyuiDataGridJson getLoginLog(HttpServletRequest request){
		String userIDs = request.getParameter("userID");
		int userID = 0;
		if (userIDs != null && !"".equals(userIDs)) {
			userID = Integer.parseInt(userIDs);
		}
		String pageStr = request.getParameter("page");
		String rowsStr = request.getParameter("rows");
		HashMap<String,Object> param=new HashMap<String,Object>();
		param.put("userID", userID);
		if (!StringUtils.isEmpty(pageStr)&&!StringUtils.isEmpty(rowsStr)) {
			int page = Integer.parseInt(pageStr);
			int rows = Integer.parseInt(rowsStr);
			param.put("begin", rows*(page-1));
			param.put("step", rows);
		}
		EasyuiDataGridJson eJson=new EasyuiDataGridJson();
		List<HashMap<String, Object>> loginLog = userService.getLoginLog(param);
		Long loginLogCount = userService.getLoginLogCount(userID);
		eJson.setTotal(loginLogCount);
		eJson.setRows(loginLog);
		return eJson;
	}
}
