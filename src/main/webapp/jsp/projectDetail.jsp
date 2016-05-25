<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>项目内容</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div align="center" style="border: 2px gray solid; margin-left: auto; margin-right: auto; margin-top: 1%;margin-bottom: 1%">
	<div><font size="2"> 项目编码：${projectDetail.code } </font></div>
	<font size="5">
		<c:choose>
			<c:when test="${projectDetail.status==1 }">(新建)</c:when>
			<c:when test="${projectDetail.status==2 }">(开发中)</c:when>
			<c:when test="${projectDetail.status==3 }">(已上线)</c:when>
			<c:when test="${projectDetail.status==4 }">(已关闭)</c:when>
			<c:otherwise>(未知状态)</c:otherwise>
		</c:choose>
	</font>
	<font size="7"> ${projectDetail.title } </font>
	<font size="1">${projectDetail.userName}创建于<fmt:formatDate value="${projectDetail.createDateTime }" pattern="yyyy-MM-dd"/></font>
</div>
<div style="margin-top: 2%">
	<div style="width: 71%; margin-left: auto; margin-right: auto; margin-top: 1%;margin-bottom: 1%">
		<div style="float: left;margin-left: 6%;border: 1px gray solid;width: 36%;height:32%;background-color: #EBEBEB;">
			<div>任务追踪</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<tr><td><a href="javascript:void(0)">功能开发</a></td><td><c:if test="${!empty projectOverView.funcOpen}">${projectOverView.funcOpen}</c:if><c:if test="${empty projectOverView.funcOpen}">0</c:if> 打开/<c:if test="${!empty projectOverView.funcTotal}">${projectOverView.funcTotal}</c:if><c:if test="${empty projectOverView.funcTotal}">0</c:if>总数</td></tr>
						<tr><td><a href="javascript:void(0)">BUG修复</a></td><td><c:if test="${!empty projectOverView.bugOpen}">${projectOverView.bugOpen}</c:if><c:if test="${empty projectOverView.bugOpen}">0</c:if> 打开/<c:if test="${!empty projectOverView.bugTotal}">${projectOverView.bugTotal}</c:if><c:if test="${empty projectOverView.bugTotal}">0</c:if>总数</td></tr>
						<tr><td colspan="2"><a href="javascript:void(0)">查看所有问题</a></td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<div style="float: right;margin-right: 6%;border: 1px gray solid;width: 36%;height:32%;background-color: #EBEBEB;">
			<div>成员</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<tr><td>开发人员</td>
							<td><c:forEach var="user" items="${userList}">
									<c:if test="${user.actor eq 4 }">
										<a href="javascript:void(0)">${user.name}</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr><td>测试人员</td>
							<td><c:forEach var="user" items="${userList}">
									<c:if test="${user.actor eq 5 }">
										<a href="javascript:void(0)">${user.name}</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr><td>产品人员</td>
							<td><c:forEach var="user" items="${userList}">
									<c:if test="${user.actor eq 6 }">
										<a href="javascript:void(0)">${user.name}</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div align="center" style="width: 81%; margin-left: auto; margin-right: auto; margin-top: 2%;margin-bottom: 1%">
		<fieldset style="top: 2%;margin-top: 2%;width: 91%;height: 46%">
			<legend>描述</legend>
			<textarea readonly="readonly" style="width: 98%;height: 98%">${projectDetail.p_describe }</textarea>
		</fieldset>
	</div>
</div>
</body>
<script type="text/javascript" charset="UTF-8">
</script>
</html>