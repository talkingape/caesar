package edu.sdut.dao;

import java.util.HashMap;
import java.util.List;

import edu.sdut.model.ProjectInfo;

public interface ProjectInfoMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(ProjectInfo record);

	int insertSelective(ProjectInfo record);

	ProjectInfo selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(ProjectInfo record);

	int updateByPrimaryKey(ProjectInfo record);

	List<HashMap<String,Object>> getProjectList(HashMap<String, Object> param);
	
	Long getProjectListCount(HashMap<String, Object> param);
	
	HashMap<String,Object> getProjectDetailByID(int projectID);
	
	List<HashMap<String,Object>> getOverView(int userID);
}