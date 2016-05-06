package edu.sdut.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.sdut.dao.*;
import edu.sdut.model.*;
import edu.sdut.service.ProjectService;
import edu.sdut.util.CommonUtil;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService{
	
	@Resource
	UserInfoMapper userInfoMapper;
	@Resource
	ProjectInfoMapper projectInfoMapper;
	@Resource
	ProjectLogMapper projectLogMapper;

	@Override
	public boolean addProject(ProjectInfo projectInfo) {
		projectInfo.setCreateTime(new Date());
		projectInfo.setStatus(1);
		projectInfo.setCode(CommonUtil.genProCode(projectInfo.getGroupId(), projectInfo.getCreateUserId()));
		int id = projectInfoMapper.insertSelective(projectInfo);
		if (id>0) {
			ProjectLog projectLog=new ProjectLog();
			projectLog.setPreStatus(0);
			projectLog.setAfterStatus(0);
			projectLog.setOperaterId(projectInfo.getCreateUserId());
			projectLog.setDescribe("新建项目");
			projectLog.setOperateTime(new Date());
			projectLog.setProjectId(id);
			this.addProjectLog(projectLog);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean addProjectLog(ProjectLog projectLog) {
		int sign = projectLogMapper.insertSelective(projectLog);
		if (sign<=0) {
			return false;
		}else {
			return true;
		}
	}

}
