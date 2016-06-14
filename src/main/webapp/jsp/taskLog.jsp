<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>项目日志</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div align="center" style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
<div><font size="7">项目名称:${taskOverView.title }</font></div>
	<table style="border: 1px black solid;">
		<tr style="border: 1px black solid;width: 80%;color: blue">
			<td style="width: 120">序号</td>
			<td style="width: 160">操作人</td>
			<td style="width: 160">操作时间</td>
			<td style="width: 160">操作前状态</td>
			<td style="width: 160">操作后状态</td>
			<td style="width: 160">操作前完成度</td>
			<td style="width: 160">操作后完成度</td>
			<td style="width: 160">描述</td>
		</tr>
		<c:forEach items="${taskLog }" var="log" varStatus="index">
			<tr <c:if test="${index.index%2==0 }">style="color:gray"</c:if>>
				<td>${index.count }</td>
				<td>${log.operater }</td>
				<td><fmt:formatDate value="${log.operateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				<td>
					<c:choose>
						<c:when test="${log.preStatus==1 }">新建</c:when>
						<c:when test="${log.preStatus==2 }">开发/修复中</c:when>
						<c:when test="${log.preStatus==3 }">已上线</c:when>
						<c:when test="${log.preStatus==4 }">已关闭</c:when>
						<c:otherwise>未知状态</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${log.preStatus==1 }">新建</c:when>
						<c:when test="${log.preStatus==2 }">开发/修复中</c:when>
						<c:when test="${log.preStatus==3 }">已上线</c:when>
						<c:when test="${log.preStatus==4 }">已关闭</c:when>
						<c:otherwise>未知状态</c:otherwise>
					</c:choose>
				</td>
				<td>
					${log.preCompletion }%
				</td>
				<td>
					${log.afterCompletion }%
				</td>
				<td>${log.opDescribe }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">

</script>
</html>