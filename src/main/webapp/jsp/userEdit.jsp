<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>用户管理</title>
</head>
<html>
<body>
	<div>
		<form style="text-align: center;">
			<table style="">
				<tbody>
					<tr>
						<td>用户名：</td>
						<td><input class="easyui-textbox" id="userName"
							name="userName"
							style="width: 91%; height: 24px"></td>
					</tr>
					<tr>
						<td>用户组别：</td>
						<td><select id="userGroup" name="userGroup"
							class="js-example-basic-single" style="width: 100%">
								<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>用户角色：</td>
						<td><select id="userGroup" name="userGroup"
							class="js-example-basic-single" style="width: 100%">
								<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>用户邮箱：</td>
						<td><input class="easyui-textbox" id="userEmail"
							name="userEmail"
							style="width: 91%; height: 24px"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>