package edu.sdut.service;

import edu.sdut.model.*;

public interface ProjectService {
	
	public boolean addProject(ProjectInfo projectInfo);
	
	public boolean addProjectLog(ProjectLog projectLog);
}
