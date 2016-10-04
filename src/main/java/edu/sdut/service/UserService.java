package edu.sdut.service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import edu.sdut.model.UserActor;
import edu.sdut.model.UserGroup;
import edu.sdut.model.UserInfo;
import edu.sdut.model.UserLoginLog;
import edu.sdut.util.EasyuiDataGridJson;

public interface UserService {
	
	public UserInfo validateLogin(HashMap<String,Object> loginInfo);
	
	public List<UserActor> selectAllActor();
	
	public List<UserGroup> selectAllGroup();
	
	public HashMap<String,Object> getParamFromReq(HttpServletRequest request);
	
	public EasyuiDataGridJson getUserList(HashMap<String, Object> param);
	
	public Boolean isExistUser(String name);
	
	public int addUser(UserInfo userInfo);
	
	public int insertLoginLog(UserLoginLog log);
	
	public List<HashMap<String,Object>> getUserByGroup(int groupID);
	
	public List<HashMap<String,Object>> getUserByProject(int projectID);
	
	public UserInfo getUserInfoByID(int id);
	
	public boolean updateByPrimaryKeySelective(UserInfo record);
	
	public List<HashMap<String,Object>> getLoginLog(HashMap<String,Object> user);
	
	public Long getLoginLogCount(int userID);
}
