<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>项目列表</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<fieldset style="border: 1px blue dashed">
			<legend>查询条件</legend>
			<div style="float: left;width: 72%">
				<form id="queryForm">
					<table style="width: 72%">
						<tbody>
							<tr style="height: 36px">
								<td style="width: 8%">任务标题</td>
								<td style="width: 64%"><input class="easyui-textbox"
									id="projectName" name="projectName" style="width: 42%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 8%">创建用户</td>
								<td><select id="createUserId"
									name="createUserId" class="js-example-basic-single" style="width: 50%">
									<option value="-1">请选择</option>
										<c:forEach items="${userList }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
									</select></td>
							</tr>
							<tr>
								<td>指派给</td>
								<td><select id="currentUserId"
									name="currentUserId" class="js-example-basic-single" style="width: 50%">
									<option value="-1">请选择</option>
										<c:forEach items="${userList }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
									</select></td>
							</tr>
							<tr>
								<td>任务类别</td><td><select id="category"
									name="category" class="js-example-basic-single" style="width: 42%">
									<option value="-1">请选择</option>
									<option value="1">功能研发</option>
									<option value="2">BUG修复</option>
									</select></td>
							</tr>
							<tr>
								<td>所属项目</td><td><select id="projectID"
									name="projectID" class="js-example-basic-single" style="width: 42%">
									<option value="-1">请选择</option>
										<c:forEach items="${projectList }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
									</select></td>
							</tr>
							<tr>
								<td>当前状态</td><td><select id="status"
									name="status" class="js-example-basic-single" style="width: 42%">
									<option value="-1">请选择</option>
									<option value="1">新建</option>
									<option value="2">开发/修复中</option>
									<option value="3">已完成</option>
									<option value="4">已废弃</option>
									</select></td>
							</tr>
							<tr>
								<td>优先级</td><td><select id="priority"
									name="priority" class="js-example-basic-single" style="width: 42%">
									<option value="-1">请选择</option>
									<option value="1">紧急</option>
									<option value="2">高</option>
									<option value="3">普通</option>
									<option value="4">低</option>
									</select></td>
							</tr>
							<tr style="height: 36px">
								<td>创建时间</td>
								<td><input class="easyui-datebox"
									id="createTime" name="createTimeBegin" style="width: 32%; height: 32px;">至<input class="easyui-datebox"
									id="createTime" name="createTimeEnd" style="width: 32%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td>预计完成</td>
								<td><input class="easyui-datebox"
									id="createTime" name="createTimeBegin" style="width: 32%; height: 32px;">至<input class="easyui-datebox"
									id="createTime" name="createTimeEnd" style="width: 32%; height: 32px;"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div style="float: right; height: 150px;">
				<a class="easyui-linkbutton" style="width: 80px; margin-top: 286px"
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
	$("#category").select2();
	$("#projectID").select2();
	$("#priority").select2();
	$("#status").select2();
	$("#dataGrid")
			.datagrid(
					{
						fit : false,
						fitColumns : true,
						pagination : true,
						url : 'getTaskList.php',
						idField : 'id',
						pageSize : 30,
						pageList : [ 10, 20, 30, 40, 50 ],
						striped : true,
						nowrap : true,
						rownumbers : true,
						singleSelect : false,
						columns : [ [
								{
									field : 'code',
									title : '任务编码',
									width : 60,
								},{
									field : 'title',
									title : '任务标题',
									width : 60,
								},{
									field : 'category',
									title : '任务类别',
									width : 60,
								},{
									field : 'projectName',
									title : '所属项目',
									width : 60,
								},{
									field : 'createUserName',
									title : '创建用户',
									width : 60,
								},{
									field : 'createUserName',
									title : '当前指派人',
									width : 60,
								},{
									field : 'status',
									title : '项目状态',
									width : 60,
								},{
									field : 'completion',
									title : '完成度',
									width : 60,
								},{
									field : 'priority',
									title : '优先级',
									width : 60,
								},{
									field : 'createDateTime',
									title : '创建日期',
									width : 60,
									formatter : function(value, row, index){
										return formatDatebox(value,"yyyy-MM-dd")
									}
								},{
									field : 'expectDateTime',
									title : '期望时间',
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
										str+="<a href='javascript:void(0)'>编辑</a>";
										str+="&nbsp;&nbsp;<a href='javascript:void(0)'>详情</a>";
										return str;
									}
								}] ],
					});
});
(function($) {
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
				o[this.name] = o[this.name].join(",");
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
})(jQuery);
function submit(){
	$("#dataGrid").datagrid({url:'getTaskList.php',queryParams:$('#queryForm').serializeObject()});
}
</script>