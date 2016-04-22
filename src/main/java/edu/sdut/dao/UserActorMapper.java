package edu.sdut.dao;

import edu.sdut.model.UserActor;

public interface UserActorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserActor record);

    int insertSelective(UserActor record);

    UserActor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserActor record);

    int updateByPrimaryKey(UserActor record);
}