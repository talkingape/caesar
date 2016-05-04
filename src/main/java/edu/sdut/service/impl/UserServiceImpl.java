package edu.sdut.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import edu.sdut.dao.*;
import edu.sdut.model.UserActor;
import edu.sdut.model.UserGroup;
import edu.sdut.model.UserInfo;
import edu.sdut.service.UserService;
import edu.sdut.util.EasyuiDataGridJson;

@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Resource
	UserInfoMapper userInfoMapper;
	@Resource
	UserActorMapper userActorMapper;
	@Resource
	UserAuthorityMapper userAuthorityMapper;
	@Resource
	UserGroupMapper userGroupMapper;
	
	@Override
	public UserInfo validateLogin(HashMap<String,Object> loginInfo) {
		UserInfo userInfo = userInfoMapper.selectByNamePassword(loginInfo);
		return userInfo;
	}

	@Override
	public HashMap<String, Object> getParamFromReq(HttpServletRequest request) {
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
		return userInfo;
	}

	@Override
	public EasyuiDataGridJson getUserList(HashMap<String, Object> param) {
		EasyuiDataGridJson eJson=new EasyuiDataGridJson();
		List<HashMap<String, Object>> userList = userInfoMapper.getUserList(param);
		eJson.setRows(userList);
		long listCount = userInfoMapper.getUserListCount(param);
		eJson.setTotal(listCount);
		return eJson;
	}

	@Override
	public List<UserActor> selectAllActor() {
		List<UserActor> allActor = userActorMapper.selectAllActor();
		return allActor;
	}

	@Override
	public List<UserGroup> selectAllGroup() {
		List<UserGroup> allGroup = userGroupMapper.selectAllGroup();
		return allGroup;
	}
}
