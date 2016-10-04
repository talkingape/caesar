<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>编辑用户</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>编辑用户</legend>
		<form id="editUser">
			<table>
				<tbody>
					<tr hidden="true">
						<td>用户ID</td><td><input class="easyui-textbox"
							id="userID" name="userID" value="${userInfo.id }" style="width: 100%; height: 24px;"></td>
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
						<td>用户组别</td><td><select id="userGroup" <c:if test="${isAdmin eq 0 }">disabled="disabled"</c:if>
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
						<td>用户角色</td><td><select id="userActor" <c:if test="${isAdmin eq 0 }">disabled="disabled"</c:if>
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
						<td>联系电话</td><td><input class="easyui-textbox"
							id="userTel" name="userTel" value="${userInfo.tel }" style="width: 100%; height: 24px;"></td>
					</tr>
					<tr>
						<td>邮箱</td><td><input class="easyui-textbox"
							id="userEmail" name="userEmail" value="${userInfo.email }" style="width: 100%; height: 24px;"></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div align="right"><a class="easyui-linkbutton" style="width: 80px;"
					href="javascript:void(0)" onclick="submit()">确认修改</a></div>
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
});
function submit(){
	$.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: "editUser.php?"+$("#editUser").serialize(),
        success: function(data){
        	if(data=='success'){
        		refreshAfterCloseShow("修改成功",800);
        		//window.location.href="{path}/projectModule/toProjectList.php";
        	}else if(data=='failed'){
        		refreshAfterCloseShow("修改失败",800);
        	}else{
        		refreshAfterCloseShow("未知错误",800);
        	}
        }
	});
}
</script>
</html>