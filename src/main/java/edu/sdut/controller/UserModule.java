package edu.sdut.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.sdut.dao.*;
import edu.sdut.model.UserActor;
import edu.sdut.model.UserGroup;

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
}
