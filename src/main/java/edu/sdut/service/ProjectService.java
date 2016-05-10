package edu.sdut.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import edu.sdut.model.*;
import edu.sdut.util.EasyuiDataGridJson;

public interface ProjectService {
	
	public boolean addProject(ProjectInfo projectInfo);
	
	public boolean addProjectLog(ProjectLog projectLog);
	
	public HashMap<String,Object> getParamFromReq(HttpServletRequest request);
	
	public EasyuiDataGridJson getProjectList(HashMap<String, Object> param);
}
