package edu.sdut.service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import edu.sdut.model.UserActor;
import edu.sdut.model.UserGroup;
import edu.sdut.model.UserInfo;
import edu.sdut.util.EasyuiDataGridJson;

public interface UserService {
	
	public UserInfo validateLogin(HashMap<String,Object> loginInfo);
	
	public List<UserActor> selectAllActor();
	
	public List<UserGroup> selectAllGroup();
	
	public HashMap<String,Object> getParamFromReq(HttpServletRequest request);
	
	public EasyuiDataGridJson getUserList(HashMap<String, Object> param);
}
