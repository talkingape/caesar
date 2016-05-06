<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>添加新项目</title>
</head>
<html>
<body>
<div style="margin-top: 6%">
	<div style="float: left;margin-left: 6%;border: 1px gray solid;width: 30%;height:32%;background-color: #EBEBEB;">
		<div>任务追踪</div>
		<div style="margin-left: 24px;margin-top: 9px">
			<table>
				<tbody>
					<tr><td><a href="javascript:void(0)">功能开发</a></td><td>${funcOpen} 打开/${funcTotal}总数</td></tr>
					<tr><td><a href="javascript:void(0)">BUG修复</a></td><td>${bugOpen} 打开/${bugTotal}总数</td></tr>
					<tr><td colspan="2"><a href="javascript:void(0)">查看所有问题</a></td></tr>
				</tbody>
			</table>
		</div>
	</div>
	<div style="float: left;margin-left: 6%;border: 1px gray solid;width: 30%;height:32%;background-color: #EBEBEB;">
		<div>成员</div>
		<div style="margin-left: 24px;margin-top: 9px">
			<table>
				<tbody>
					<tr><td>开发人员</td>
						<td><c:forEach var="user" items="${userList}">
								<c:if test="${user.actor eq 4 }"></c:if>
								<a href="javascript:void(0)">${user.name}</a>
							</c:forEach>
						</td>
					</tr>
					<tr><td>测试人员</td>
						<td><c:forEach var="user" items="${userList}">
								<c:if test="${user.actor eq 5 }"></c:if>
								<a href="javascript:void(0)">${user.name}</a>
							</c:forEach>
						</td>
					</tr>
					<tr><td>产品人员</td>
						<td><c:forEach var="user" items="${userList}">
								<c:if test="${user.actor eq 6 }"></c:if>
								<a href="javascript:void(0)">${user.name}</a>
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" charset="UTF-8">
</script>
</html>