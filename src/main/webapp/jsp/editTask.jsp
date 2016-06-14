<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>编辑任务</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>编辑任务</legend>
		<form>
			<table>
				<tbody>
					<tr>
						<td>任务类别</td><td><select id="category"
							name="category" class="js-example-basic-single" disabled="disabled" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1" <c:if test="${taskInfo.category==1 }">selected="selected"</c:if> >功能研发</option>
							<option value="2" <c:if test="${taskInfo.category==2 }">selected="selected"</c:if> >BUG修复</option>
							</select></td>
					</tr>
					<tr>
						<td>任务名称</td><td><input class="easyui-textbox"
							id="taskTitle" name="taskTitle" value="${taskInfo.title }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>所属项目</td><td><select id="projectID"
							name="projectID" class="js-example-basic-single" disabled="disabled" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${projectList }" var="item">
									<c:if test="${taskInfo.projectId==item.id }">
										<option value="${item.id }" selected="selected">${item.title }</option>
									</c:if>
									<c:if test="${taskInfo.projectId!=item.id }">
										<option value="${item.id }">${item.title }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>指派给</td><td><select id="currentUserId"
							name="currentUserId" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userList }" var="item">
									<c:if test="${taskInfo.currentUserId==item.id }">
										<option value="${item.id }" selected="selected">${item.name }</option>
									</c:if>
									<c:if test="${taskInfo.currentUserId!=item.id }">
										<option value="${item.id }">${item.name }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="status"
							name="status" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1" <c:if test="${taskInfo.status==1 }">selected="selected"</c:if> >新建</option>
							<option value="2" <c:if test="${taskInfo.status==2 }">selected="selected"</c:if> >开发/修复中</option>
							<option value="3" <c:if test="${taskInfo.status==3 }">selected="selected"</c:if> >已完成</option>
							<option value="4" <c:if test="${taskInfo.status==4 }">selected="selected"</c:if> >已废弃</option>
							</select></td>
					</tr>
					<tr>
						<td>优先级</td><td><select id="priority"
							name="priority" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1" <c:if test="${taskInfo.priority==1 }">selected="selected"</c:if> >紧急</option>
							<option value="2" <c:if test="${taskInfo.priority==2 }">selected="selected"</c:if> >高</option>
							<option value="3" <c:if test="${taskInfo.priority==3 }">selected="selected"</c:if> >普通</option>
							<option value="4" <c:if test="${taskInfo.priority==4 }">selected="selected"</c:if> >低</option>
							</select></td>
					</tr>
					<tr>
								<td>预计完成</td>
								<td><input class="easyui-datebox"
									id="expectTime" name="expectTime" value="${taskInfo.expectTime }" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>工时</td><td><input class="easyui-textbox"
							id="taskTime" name="taskTime" value="${taskInfo.taskTime }" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea rows="12" cols="126">${taskInfo.describe }</textarea></td>
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