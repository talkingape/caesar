<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>添加新项目</title>
</head>
<html>
<body>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 6%">
	<fieldset>
		<legend>新建项目</legend>
		<form>
			<table>
				<tbody>
					<tr>
						<td>项目名称</td><td><input class="easyui-textbox"
							id="userID" name="userID" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>分配组别</td><td><select id="userGroup"
							name="userGroup" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea rows="12" cols="126"></textarea></td>
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
<script type="text/javascript" charset="UTF-8">
</script>
</html>