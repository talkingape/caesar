<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="edu.sdut.model.UserInfo" %>
<html>
<style>
.linked_div{
	padding-left:10px;
	padding-right:10px;
	padding-bottom:2px;
	padding-top:2px;
	margin-right:1px;
	width: auto;
	height:18px;
	background-color: #578BB8;
	float: left;
	color: white;
	font-size: 12px;
	font-weight: bold;
}
.font_style{
	font-weight: bold;
	text-shadow: #F8F8FF;
	font-size: 10px;
	color: white;
}
.a_style{
	color: white;
	text-decoration: none;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<%UserInfo user=(UserInfo)request.getSession().getAttribute("user");%>
<div>
	<div style="background-color: #578BB8;height: 24px;margin-bottom: 1px;">
		<a href="javascript:void(0)" class="a_style"><img height="20px" src="${path}/pic/home32.png"><font class="font_style">主页</font></a>
		<a href="javascript:void(0)" class="a_style"><img height="20px" src="${path}/pic/box32.png"><font class="font_style">我的工作台</font></a>
		<a href="javascript:void(0)" class="a_style"><img height="20px" src="${path}/pic/linedpaperpencil32.png"><font class="font_style">项目</font></a>
		<div style="float: right;font-size: 14;padding-right: 3%;margin-top: 2px;color: white;font-weight: bold;">登录为：<%=user.getName() %></div>
	</div>
	<div align="center" style="float: none;height: auto;background-color: #467AA7;height: 54px;line-height:54px;overflow:hidden;">
		<font size="6" style="color: white;">凯&nbsp;&nbsp;撒&nbsp;&nbsp;项&nbsp;&nbsp;目&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统</font>
	</div>
	<div style="height: auto;margin-top: 1px;background-color: #578BB8;width: 100%;height: 22px">
		<div style="float: left;background-color: white;">
			<div class="linked_div"><a href="javascript:void(0)" class="a_style">概述</a></div>
			<div class="linked_div"><a href="${path }/projectModule/toAddProject.php" class="a_style">新建项目</a></div>
			<div class="linked_div"><a href="${path }/projectModule/toProjectList.php" class="a_style">搜索项目</a></div>
			<div class="linked_div"><a href="${path }/taskModule/toAddTask.php" class="a_style">新建任务</a></div>
			<div class="linked_div"><a href="${path }/taskModule/toTaskList.php" class="a_style">搜索任务</a></div>
			<div class="linked_div"><a href="${path }/userModule/toUserList.php" class="a_style">管理用户</a></div>
			<div class="linked_div"><a href="javascript:void(0)" class="a_style">文件</a></div>
			<div class="linked_div"><a href="javascript:void(0)" class="a_style">个人中心</a></div>
		</div>&nbsp;
	</div>
</div>
<script type="text/javascript">
</script>
</html>