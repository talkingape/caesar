<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>编辑项目</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>编辑项目</legend>
		<form>
			<table>
				<tbody>
					<tr hidden="true">
						<td>项目ID</td><td><input class="easyui-textbox"
							id="projectID" name="projectID" value="${projectDetail.id }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>项目名称</td><td><input class="easyui-textbox"
							id="userID" name="userID" value="${projectDetail.title }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>项目编码</td><td><input class="easyui-textbox"
							id="userID" name="userID" value="${projectDetail.code }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>分配组别</td><td><select id="userGroup"
							name="userGroup" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<c:if test="${item.id==projectDetail.userGroup }">
										<option value="${item.id }" selected="selected">${item.name }</option>
									</c:if>
									<c:if test="${item.id!=projectDetail.userGroup }">
										<option value="${item.id }">${item.name }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="curStatus"
							name="curStatus" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">新建</option>
							<option value="2">开发中</option>
							<option value="3">已上线</option>
							<option value="4">已关闭</option>
							</select></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea rows="12" cols="126">${projectDetail.describe }</textarea></td>
					</tr>
					<tr>
						<td>上传文件</td><td><input type="file"></td>
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
	$("#userGroup").select2();
	$("#curStatus").select2();
});
</script>
</html>