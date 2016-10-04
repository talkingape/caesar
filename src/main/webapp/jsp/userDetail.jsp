<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>用户详情</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>用户详情</legend>
		<form id="editUser">
			<table>
				<tbody>
					<tr hidden="true">
						<td>用户ID</td><td><input class="easyui-textbox"
							id="userID" name="userID" value="${userInfo.id }" disabled="disabled" style="width: 100%; height: 24px;"></td>
					</tr>
					<tr>
						<td>用户名称</td><td><input class="easyui-textbox"
							id="userName" name="userName" value="${userInfo.name }" disabled="disabled" style="width: 100%; height: 24px;"></td>
					</tr>
					<tr>
						<td>创建时间</td><td><input class="easyui-textbox"
							id="userCreateDatetime" name="userCreateDatetime" value='<fmt:formatDate value="${userInfo.createDatetime }" pattern="yyyy-MM-dd hh:mm:ss"/>' disabled="disabled" style="width: 100%; height: 24px;"></td>
					</tr>
					<tr>
						<td>用户组别</td><td><select id="userGroup" disabled="disabled"
							name="userGroup" class="js-example-basic-single" style="width: 100%">
							<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<c:if test="${item.id==userInfo.groupId }">
										<option value="${item.id }" selected="selected">${item.name }</option>
									</c:if>
									<c:if test="${item.id!=userInfo.groupId }">
										<option value="${item.id }">${item.name }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>用户角色</td><td><select id="userActor" disabled="disabled"
							name="userActor" class="js-example-basic-single" style="width: 100%">
							<option value="-1">请选择</option>
								<c:forEach items="${userActor }" var="item">
									<c:if test="${item.id==userInfo.actorId }">
										<option value="${item.id }" selected="selected">${item.name }</option>
									</c:if>
									<c:if test="${item.id!=userInfo.actorId }">
										<option value="${item.id }">${item.name }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>联系电话</td><td><input class="easyui-textbox" disabled="disabled"
							id="userTel" name="userTel" value="${userInfo.tel }" style="width: 100%; height: 24px;"></td>
					</tr>
					<tr>
						<td>邮箱</td><td><input class="easyui-textbox" disabled="disabled"
							id="userEmail" name="userEmail" value="${userInfo.email }" style="width: 100%; height: 24px;"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</fieldset>
	<fieldset>
	<legend>登录记录</legend>
		<div style="width: auto; margin-left: auto; margin-right: auto;margin-top: 1%">
			<table id="dataGrid" style="width: auto"></table>
		</div>
	</fieldset>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#userGroup").select2();
	$("#userActor").select2();
	$("#dataGrid").datagrid(
			{
				fit : false,
				pagination : true,
				url : 'getLoginLog.php',
				queryParams : {userID:$("#userID").val()},
				idField : 'id',
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50 ],
				fitColumns : true,
				striped : true,
				nowrap : true,
				rownumbers : true,
				singleSelect : false,
				columns : [ [
						{
							field : 'loginTime',
							title : '登录时间',
							width : 60,
							formatter : function(value, row, index){
								return formatDatebox(value,"yyyy-MM-dd hh:mm:ss")
							}
						},{
							field : 'loginIP',
							title : '登录IP',
							width : 60,
						}] ],
			});
});
</script>
</html>