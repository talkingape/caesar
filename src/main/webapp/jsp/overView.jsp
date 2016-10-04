<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>概览</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: 320px; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<div style="margin-top: 2%">
	<div style="width: 71%; margin-left: auto; margin-right: auto; margin-top: 1%;margin-bottom: 1%">
		<div style="float: left;margin-left: 6%;border: 1px gray solid;width: 42%;height:64%;background-color: #EBEBEB;">
			<div>关联项目</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<c:forEach items="${projectOverView }" var="item">
							<tr><td>${item.code }</td>
							<td><a href="${path }/projectModule/toProjectDetail.php?projectID=${item.id}">${item.title }</a></td>
							<td>
								<c:choose>
									<c:when test="${item.status==1 }">新建</c:when>
									<c:when test="${item.status==2 }">开发中</c:when>
									<c:when test="${item.status==3 }">已上线</c:when>
									<c:when test="${item.status==4 }">已关闭</c:when>
									<c:otherwise>(未知状态)</c:otherwise>
								</c:choose>
							</td></tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div style="float: right;margin-right: 6%;border: 1px gray solid;width: 42%;height:64%;background-color: #EBEBEB;">
			<div>当前任务</div>
			<div style="margin-left: 24px;margin-top: 9px">
				<table>
					<tbody>
						<c:forEach items="${taskOverView }" var="item">
							<tr><td>${item.code }</td>
							<td><c:if test="${item.category eq 1}">功能研发</c:if>
								<c:if test="${item.category eq 2}">BUG修复</c:if>
							</td>
							<td><a href="${path }/taskModule/toTaskDetail.php?taskID=${item.id}">${item.title }</a></td>
							<td>
								<c:choose>
									<c:when test="${item.status==1 }">新建</c:when>
									<c:when test="${item.status==2 }">开发中</c:when>
									<c:when test="${item.status==3 }">已完成</c:when>
									<c:when test="${item.status==4 }">已废弃</c:when>
									<c:otherwise>未知状态</c:otherwise>
								</c:choose>
							</td>
							<td>进度：${item.completion }%</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#userGroup").select2();
	$("#status").select2();
});
</script>
</html>