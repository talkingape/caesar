package edu.sdut.dao;

import java.util.HashMap;
import java.util.List;

import edu.sdut.model.ProjectLog;

public interface ProjectLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectLog record);

    int insertSelective(ProjectLog record);

    ProjectLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectLog record);

    int updateByPrimaryKey(ProjectLog record);
    
    List<HashMap<String, Object>> getProjectLog(int projectID);
}