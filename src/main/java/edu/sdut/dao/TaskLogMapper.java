package edu.sdut.dao;

import edu.sdut.model.TaskLog;

public interface TaskLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TaskLog record);

    int insertSelective(TaskLog record);

    TaskLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskLog record);

    int updateByPrimaryKey(TaskLog record);
}