<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>用户管理</title>
</head>
<html>
<body>
	<div style="width: 81%;margin-left: auto;margin-right: auto;">
		<fieldset>
			<legend>查询条件</legend>
			<table>
				<tbody>
					<tr style="height: 36px">
						<td style="width: 80px">用户ID</td>
						<td style="width: 240px"><input class="easyui-textbox" id="userID" name="userID"
							style="width: 100%; height: 32px;"></td>
					</tr>
					<tr style="height: 36px">
						<td style="width: 80px">用户姓名</td>
						<td style="width: 240px"><input class="easyui-textbox" id="userName" name="userName"
							style="width: 100%; height: 32px;"></td>
					</tr>
					<tr style="height: 36px">
						<td style="width: 80px">用户组别</td>
						<td style="width: 240px"><select id="userGroup" name="userGroup" class="js-example-basic-single" style="width: 100%">
								<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr style="height: 36px">
						<td style="width: 80px">用户角色</td>
						<td style="width: 240px"><select id="userActor" name="userActor" class="js-example-basic-single" style="width: 100%">
								<option value="-1">请选择</option>
								<c:forEach items="${userActor }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
</body>
</html>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#userGroup").select2({
		enoughRoomBelow : true,
		enoughRoomAbove : false
	});
	$("#userActor").select2();
});
</script>