<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>任务内容</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div align="center" style="border: 2px gray solid; margin-left: auto; margin-right: auto; margin-top: 1%;margin-bottom: 1%">
	<div><font size="2">任务状态：<c:if test="${taskOverView.category==1 }">功能研发</c:if><c:if test="${taskOverView.category==2 }">BUG修复</c:if> 任务编码：${taskOverView.code } </font></div>
	<font size="5">
		<c:choose>
			<c:when test="${taskOverView.status==1 }">(新建)</c:when>
			<c:when test="${taskOverView.status==2 }">(开发中)</c:when>
			<c:when test="${taskOverView.status==3 }">(已完成)</c:when>
			<c:when test="${taskOverView.status==4 }">(已废弃)</c:when>
			<c:otherwise>(未知状态)</c:otherwise>
		</c:choose>
	</font>
	<font size="7"> ${taskOverView.title } </font>
	<font size="5">
		<c:choose>
			<c:when test="${taskOverView.priority==1 }">(紧急)</c:when>
			<c:when test="${taskOverView.priority==2 }">(高)</c:when>
			<c:when test="${taskOverView.priority==3 }">(普通)</c:when>
			<c:when test="${taskOverView.priority==4 }">(低)</c:when>
			<c:otherwise>(未知状态)</c:otherwise>
		</c:choose>
	</font>
	<font size="1">${taskOverView.userName}创建于<fmt:formatDate value="${taskOverView.createDateTime }" pattern="yyyy-MM-dd"/></font>
</div>
<div style="margin-top: 2%">
	<div style="width: 71%; margin-left: auto; margin-right: auto; margin-top: 1%;margin-bottom: 1%">
		<div style="float: left;margin-left: 6%;border: 1px gray solid;width: 36%;height:32%;background-color: #EBEBEB;">
			<div>任务追踪</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<tr><td><a href="${path }/projectModule/toProjectDetail.php?projectID=${taskDetail.projectID}">所属项目</a></td><td>${taskDetail.projectTitle }</td></tr>
						<tr><td><a href="javascript:void(0)">当前被指派人</a></td><td>${taskDetail.currentUserName }</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<div style="float: right;margin-right: 6%;border: 1px gray solid;width: 36%;height:32%;background-color: #EBEBEB;">
			<div>属性</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<tr><td>期望完成时间</td>
							<td>&nbsp;<fmt:formatDate value="${taskDetail.expectTime }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr><td>工时</td>
							<td>&nbsp;${taskDetail.taskTime }小时
							</td>
						</tr>
						<tr><td>完成度</td>
							<td>&nbsp;${taskDetail.completion }%
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
			<textarea readonly="readonly" style="width: 98%;height: 98%">${taskDetail.t_describe }</textarea>
		</fieldset>
	</div>
</div>
</body>
<script type="text/javascript" charset="UTF-8">
</script>
</html>