<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>用户管理</title>
</head>
<html>
<body>
	<div style="width: 81%; margin-left: auto; margin-right: auto;">
		<fieldset style="border: 1px blue dashed">
			<legend>查询条件</legend>
			<div style="float: left;">
				<form id="queryForm">
					<table>
						<tbody>
							<tr style="height: 36px">
								<td style="width: 80px">用户ID</td>
								<td style="width: 240px"><input class="easyui-textbox"
									id="userID" name="userID" style="width: 100%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 80px">用户姓名</td>
								<td style="width: 240px"><input class="easyui-textbox"
									id="userName" name="userName" style="width: 100%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 80px">用户组别</td>
								<td style="width: 240px"><select id="userGroup"
									name="userGroup" class="js-example-basic-single"
									style="width: 100%">
										<option value="-1">请选择</option>
										<c:forEach items="${userGroup }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 80px">用户角色</td>
								<td style="width: 240px"><select id="userActor"
									name="userActor" class="js-example-basic-single"
									style="width: 100%">
										<option value="-1">请选择</option>
										<c:forEach items="${userActor }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div style="float: right; height: 150px;">
				<a class="easyui-linkbutton" style="width: 80px; margin-top: 124px"
					href="javascript:void(0)" onclick="submit()">查询</a>
			</div>
		</fieldset>
	</div>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<table id="dataGrid"></table>
	</div>
</body>
</html>
<script type="text/javascript" charset="UTF-8">
$(function() {
	$("#userGroup").select2();
	$("#userActor").select2();
	$("#dataGrid")
			.datagrid(
					{
						fit : false,
						fitColumns : true,
						pagination : true,
						url : 'getUserList.php',
						idField : 'id',
						pageSize : 30,
						pageList : [ 10, 20, 30, 40, 50 ],
						striped : true,
						nowrap : true,
						rownumbers : true,
						singleSelect : false,
						columns : [ [
								{
									field : 'userName',
									title : '用户名',
									width : 60,
								},{
									field : 'groupName',
									title : '用户组',
									width : 60,
								},{
									field : 'actorName',
									title : '用户角色',
									width : 60,
								},{
									field : 'tel',
									title : '电话',
									width : 60,
								},{
									field : 'action',
									title : '操作',
									width : 60,
								}] ],
					});
});
(function($) {
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
				o[this.name] = o[this.name].join(",");
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
})(jQuery);
function submit(){
	$("#dataGrid").datagrid({url:'getUserList.php',queryParams:$('#queryForm').serializeObject()});
}
</script>