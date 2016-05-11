<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>添加新项目</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>新建任务</legend>
		<form>
			<table>
				<tbody>
					<tr>
						<td>任务类别</td><td><select id="category"
							name="category" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">功能研发</option>
							<option value="2">BUG修复</option>
							</select></td>
					</tr>
					<tr>
						<td>任务名称</td><td><input class="easyui-textbox"
							id="userID" name="userID" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>所属项目</td><td><select id="projectID"
							name="projectID" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${projectList }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>指派给</td><td><select id="currentUserId"
							name="currentUserId" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userList }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="status"
							name="status" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">新建</option>
							<option value="2">开发/修复中</option>
							<option value="3">已完成</option>
							<option value="4">已废弃</option>
							</select></td>
					</tr>
					<tr>
						<td>优先级</td><td><select id="priority"
							name="priority" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">紧急</option>
							<option value="2">高</option>
							<option value="3">普通</option>
							<option value="4">低</option>
							</select></td>
					</tr>
					<tr>
								<td>预计完成</td>
								<td><input class="easyui-datebox"
									id="createTime" name="createTimeBegin" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>工时</td><td><input class="easyui-textbox"
							id="userID" name="userID" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea rows="12" cols="126"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
	</fieldset>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#category").select2();
	$("#projectID").select2();
	$("#currentUserId").select2();
	$("#status").select2();
	$("#priority").select2();
});
</script>
</html>