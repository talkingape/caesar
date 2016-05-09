<%@include file="/jsp/header.jsp"%>
<html>
	<div>
		<c:forEach var="item" items="${projectList }">
			<div><img src="${path}/pic/star32.png"><a href="javascript:void(0)">${item.name}</a></div>
		</c:forEach>
	</div>
</html>