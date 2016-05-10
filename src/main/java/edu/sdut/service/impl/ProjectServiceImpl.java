package edu.sdut.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import edu.sdut.dao.*;
import edu.sdut.model.*;
import edu.sdut.service.ProjectService;
import edu.sdut.util.CommonUtil;
import edu.sdut.util.EasyuiDataGridJson;

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

	@Override
	public HashMap<String, Object> getParamFromReq(HttpServletRequest request) {
		String projectName = request.getParameter("projectName");
		String userName = request.getParameter("userName");
		String userGroup = request.getParameter("userGroup");
		String projectStatus = request.getParameter("projectStatus");
		String createTimeBegin = request.getParameter("createTimeBegin");
		String createTimeEnd = request.getParameter("createTimeEnd");
		String pageStr = request.getParameter("page");
		String rowsStr = request.getParameter("rows");
		HashMap<String,Object> param =new HashMap<String,Object>();
		if (!StringUtils.isEmpty(projectName)) {
			param.put("projectName", projectName);
		}
		if (!StringUtils.isEmpty(userName)) {
			param.put("userName", userName);
		}
		if (!StringUtils.isEmpty(userGroup)) {
			param.put("userGroup", userGroup);
		}
		if (!StringUtils.isEmpty(projectStatus)) {
			param.put("projectStatus", projectStatus);
		}
		if (!StringUtils.isEmpty(createTimeBegin)) {
			param.put("createTimeBegin", createTimeBegin);
		}
		if (!StringUtils.isEmpty(createTimeEnd)) {
			param.put("createTimeEnd", createTimeEnd);
		}
		if (!StringUtils.isEmpty(pageStr)&&!StringUtils.isEmpty(rowsStr)) {
			int page = Integer.parseInt(pageStr);
			int rows = Integer.parseInt(rowsStr);
			param.put("begin", rows*(page-1));
			param.put("step", rows);
		}
		return param;
	}
	
	@Override
	public EasyuiDataGridJson getProjectList(HashMap<String, Object> param) {
		List<HashMap<String, Object>> projectList = projectInfoMapper.getProjectList(param);
		EasyuiDataGridJson eJson=new EasyuiDataGridJson();
		eJson.setRows(projectList);
		Long total = projectInfoMapper.getProjectListCount(param);
		eJson.setTotal(total);
		return eJson;
	}

}
