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
	<form>
		<div style="height: 48px"><div style="width: 24%;float: left;font-family: 幼圆;font-size: 24px">用户名：</div>
			<input class="easyui-textbox" id="newUserName" name="userName"
						style="width: 76%; height: 64%"></div>
		<div style="height: 48px"><div style="width: 24%;float: left;">用户名：</div>
			<input class="easyui-textbox" id="newUserEmail" name="userEmail"
						style="width: 76%; height: 64%"></div>
		<div style="height: 48px"><div style="width: 24%;float: left;">用户名：</div>
			<select id="newUserGroup" name="userGroup" class="js-example-basic-single" style="width: 76%; height: 64%">
				<option value="-1">请选择</option>
					<c:forEach items="${userGroup }" var="item">
						<option value="${item.id }">${item.name }</option>
					</c:forEach>
				</select></div>
		<div style="height: 48px"><div style="width: 24%;float: left;">用户名：</div>
			<select id="newUserActor" name="userActor" class="js-example-basic-single" style="width: 76%; height: 64%">
				<option value="-1">请选择</option>
					<c:forEach items="${userActor }" var="item">
						<option value="${item.id }">${item.name }</option>
					</c:forEach>
				</select></div>
		<div style="height: 48px;text-align: center"><a class="easyui-linkbutton" style="width: 80px; margin-top: 124px"
					href="javascript:void(0)" onclick="addUser()">新增用户</a></div>
	</form>
</div>
</body>
<script type="text/javascript" charset="">
	$("#userGroup").select2();
</script>
</html>