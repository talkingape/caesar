package edu.sdut.dao;

import java.util.List;

import edu.sdut.model.UserAuthority;

public interface UserAuthorityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAuthority record);

    int insertSelective(UserAuthority record);

    UserAuthority selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAuthority record);

    int updateByPrimaryKey(UserAuthority record);
    
    List<UserAuthority> selectAllAuthority();
}