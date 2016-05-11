package edu.sdut.dao;

import java.util.*;

import edu.sdut.model.UserInfo;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    UserInfo selectByNamePassword(HashMap<String,Object> userInfo);
    
    List<HashMap<String,Object>> getUserList(HashMap<String,Object> userInfo);
    
    long getUserListCount(HashMap<String,Object> userInfo);
    
    int isExistUser(String name);
    
    List<HashMap<String,Object>> getUserByGroup(int groupID);
}