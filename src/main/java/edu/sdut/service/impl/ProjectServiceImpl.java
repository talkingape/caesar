package edu.sdut.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	@Resource
	TaskInfoMapper taskInfoMapper;
	
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	@Override
	public boolean addProject(ProjectInfo projectInfo) {
		projectInfo.setCreateTime(new Date());
		projectInfo.setCode(CommonUtil.genProCode(projectInfo.getGroupId(), projectInfo.getCreateUserId()));
		int id = projectInfoMapper.insertSelective(projectInfo);
		if (id>0) {
			ProjectLog projectLog=new ProjectLog();
			projectLog.setPreStatus(0);
			projectLog.setAfterStatus(projectInfo.getStatus());
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
		String userGroupStr = request.getParameter("userGroup");
		String projectStatusStr = request.getParameter("projectStatus");
		String createTimeBeginStr = request.getParameter("createTimeBegin");
		String createTimeEndStr = request.getParameter("createTimeEnd");
		String pageStr = request.getParameter("page");
		String rowsStr = request.getParameter("rows");
		HashMap<String,Object> param =new HashMap<String,Object>();
		if (!StringUtils.isEmpty(projectName)) {
			param.put("projectName", projectName);
		}
		if (!StringUtils.isEmpty(userName)) {
			param.put("userName", userName);
		}
		if (!StringUtils.isEmpty(userGroupStr)&&!userGroupStr.equals("-1")) {
			param.put("userGroup", Integer.parseInt(userGroupStr));
		}
		if (!StringUtils.isEmpty(projectStatusStr)&&!projectStatusStr.equals("-1")) {
			param.put("projectStatus", Integer.parseInt(projectStatusStr));
		}
		try {
			if (!StringUtils.isEmpty(createTimeBeginStr)&&!StringUtils.isEmpty(createTimeEndStr)) {
				param.put("createTimeBegin", sdf.parse(createTimeBeginStr+" 00:00:00"));
				param.put("createTimeEnd", sdf.parse(createTimeEndStr+" 23:59:59"));
			}
		} catch (ParseException e) {
			e.printStackTrace();
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

	@Override
	public List<HashMap<String, Object>> getProjectByGroup(int groupID) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("userGroup", groupID);
		List<HashMap<String, Object>> projectList = projectInfoMapper.getProjectList(param);
		return projectList;
	}

	@Override
	public HashMap<String, Object> getProjectOverView(int projectID) {
		HashMap<String, Object> productOverView = taskInfoMapper.getOverViewByProjectID(projectID);
		return productOverView;
	}

	@Override
	public HashMap<String, Object> getProjectDetailByID(int projectID) {
		HashMap<String, Object> projectDetail = projectInfoMapper.getProjectDetailByID(projectID);
		return projectDetail;
	}
	
	@Override
	public boolean editProject(ProjectInfo projectInfo) {
		ProjectInfo preProject = projectInfoMapper.selectByPrimaryKey(projectInfo.getId());
		int id = projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
		if (id>0) {
			ProjectLog projectLog=new ProjectLog();
			projectLog.setPreStatus(preProject.getStatus());
			projectLog.setAfterStatus(projectInfo.getStatus());
			projectLog.setOperaterId(projectInfo.getCreateUserId());
			projectLog.setDescribe("编辑项目");
			projectLog.setOperateTime(new Date());
			projectLog.setProjectId(id);
			this.addProjectLog(projectLog);
			return true;
		}else {
			return false;
		}
	}
}
