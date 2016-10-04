<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<%@ page language="java" import="edu.sdut.model.UserInfo"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="curUser" value='<%=(UserInfo)request.getSession().getAttribute("user") %>'/>
<title>项目列表</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<input id="curGroup" hidden="hidden" value="${curUser.groupId }">
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<fieldset style="border: 1px blue dashed">
			<legend>查询条件</legend>
			<div style="float: left;width: 72%">
				<form id="queryForm">
					<table style="width: 72%">
						<tbody>
							<tr style="height: 36px">
								<td style="width: 8%">项目标题</td>
								<td style="width: 64%"><input class="easyui-textbox"
									id="projectName" name="projectName" style="width: 42%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 8%">创建用户</td>
								<td style="width: 64%"><input class="easyui-textbox"
									id="userName" name="userName" style="width: 42%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td>所属组别</td>
								<td><select id="userGroup"
									name="userGroup" class="js-example-basic-single"
									style="width: 42%">
										<option value="-1">请选择</option>
										<c:forEach items="${userGroup }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr style="height: 36px">
								<td>项目状态</td>
								<td><select id="projectStatus"
									name="projectStatus" class="js-example-basic-single"
									style="width: 42%">
										<option value="-1">请选择</option>
										<option value="1">新建</option>
										<option value="2">开发中</option>
										<option value="3">已上线</option>
										<option value="4">已关闭</option>
								</select></td>
							</tr>
							<tr style="height: 36px">
								<td>创建时间</td>
								<td><input class="easyui-datebox"
									id="createTime" name="createTimeBegin" style="width: 32%; height: 32px;">至<input class="easyui-datebox"
									id="createTime" name="createTimeEnd" style="width: 32%; height: 32px;"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div style="float: right; height: 150px;">
				<a class="easyui-linkbutton" style="width: 80px; margin-top: 169px"
					href="javascript:void(0)" onclick="submit()">查询</a>
			</div>
		</fieldset>
	</div>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<table id="dataGrid"></table>
	</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
</html>
<script type="text/javascript" charset="UTF-8">
$(function() {
	$("#userGroup").select2();
	$("#projectStatus").select2();
	$("#dataGrid")
			.datagrid(
					{
						fit : false,
						fitColumns : true,
						pagination : true,
						url : 'getProjectList.php',
						idField : 'id',
						pageSize : 30,
						pageList : [ 10, 20, 30, 40, 50 ],
						striped : true,
						nowrap : true,
						rownumbers : true,
						singleSelect : false,
						columns : [ [
								{
									field : 'id',
									hidden : true
								},{
									field : 'code',
									title : '项目编码',
									width : 60,
								},{
									field : 'title',
									title : '项目标题',
									width : 60,
								},{
									field : 'userName',
									title : '创建用户',
									width : 60,
								},{
									field : 'userGroupID',
									title : '所属用户组',
									width : 60,
									hidden : true,
								},{
									field : 'userGroup',
									title : '所属用户组',
									width : 60,
								},{
									field : 'status',
									hidden : true,
								},{
									field : 'statusName',
									title : '项目状态',
									width : 60,
									formatter : function(value, row, index){
										if(row.status==1){
											return "新建";
										}else if(row.status==2){
											return "开发中";
										}else if(row.status==3){
											return "已上线";
										}else if(row.status==4){
											return "已关闭";
										}else{
											return "未知";
										}
									}
								},{
									field : 'createDateTime',
									title : '创建日期',
									width : 60,
									formatter : function(value, row, index){
										return formatDatebox(value,"yyyy-MM-dd")
									}
								},{
									field : 'action',
									title : '操作',
									width : 60,
									formatter : function(value, row, index){
										var str="";
										if($("#curGroup").val()==1||row.userGroupID==$("#curGroup").val()){
											str+="<a href='${path}/projectModule/toEditProject.php?projectID="+row.id+"'>编辑</a>&nbsp;&nbsp;";
										}
										str+="<a href='${path}/projectModule/toProjectDetail.php?projectID="+row.id+"'>详情</a>&nbsp;&nbsp;";
										str+="<a href='${path}/projectModule/toProjectLog.php?projectID="+row.id+"'>日志</a>&nbsp;&nbsp;";
										return str;
									}
								}] ],
					});
});
function submit(){
	$("#dataGrid").datagrid({url:'getProjectList.php',queryParams:$('#queryForm').serializeObject()});
}
</script>