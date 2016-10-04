package edu.sdut.dao;

import java.util.HashMap;
import java.util.List;

import edu.sdut.model.UserLoginLog;

public interface UserLoginLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserLoginLog record);

    int insertSelective(UserLoginLog record);

    UserLoginLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLoginLog record);

    int updateByPrimaryKey(UserLoginLog record);
    
    List<HashMap<String,Object>> getLoginLog(HashMap<String,Object> user);
    
    Long getLoginLogCount(int userID);
}