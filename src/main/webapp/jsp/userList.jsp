<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="curUser" value='<%=(UserInfo)request.getSession().getAttribute("user") %>'/>
<title>用户列表</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
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
				<c:if test="${curUser.groupId eq 1 }">
					<a class="easyui-linkbutton" style="width: 80px; margin-top: 124px"
						href="javascript:void(0)" onclick="addUser()">新增用户</a>
				</c:if>
			</div>
		</fieldset>
	</div>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<table id="dataGrid"></table>
	</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
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
									field : 'id',
									title : '用户名',
									width : 60,
									hidden : true,
								},
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
									field : 'email',
									title : 'E-Mail',
									width : 60,
								},{
									field : 'createDateTime',
									title : '创建日期',
									width : 60,
									formatter : function(value, row, index){
										return formatDatebox(value,"yyyy-MM-dd hh:mm:ss")
									}
								},{
									field : 'action',
									title : '操作',
									width : 60,
									formatter : function(value, row, index){
										var str="";
										str+="<a href='${path}/userModule/toEditUser.php?userID="+row.id+"'>编辑</a>";
										str+="&nbsp;&nbsp;<a href='${path}/userModule/toUserDetail.php?userID="+row.id+"'>详情</a>";
										return str;
									}
								}] ],
					});
});
function submit(){
	$("#dataGrid").datagrid({url:'getUserList.php',queryParams:$('#queryForm').serializeObject()});
}
var openTimes=0;
var smallPanel;
function addUser() {
	//获取浏览器显示区域的高度   
	var h=$(window).height();   
	//获取浏览器显示区域的宽度   
	var w=$(window).width();  
	smallPanel=$.messager.show({
                id : "addUser",
                title : '新增用户',
                msg : '<div style="margin-top:12px"><form id="newUserInfo">'
        			+'<div style="height: 48px"><div style="width: 28%;margin-top:5px;float: left;font-family: 幼圆;font-size: 16px">用户名：</div>'
        			+'<input class="easyui-textbox" id="newUserName" name="userName" style="width: 72%; height: 64%"></div>'
        			+'<div style="height: 48px"><div style="width: 28%;margin-top:5px;float: left;font-family: 幼圆;font-size: 16px">邮箱：</div>'
        			+'<input class="easyui-textbox" id="newUserEmail" name="userEmail" style="width: 72%; height: 64%"></div>'
        			+'<div style="height: 48px"><div style="width: 28%;margin-top:5px;float: left;font-family: 幼圆;font-size: 16px">用户组别：</div>'
        			+'<select id="newUserGroup" name="userGroup" class="js-example-basic-single" style="width: 72%; height: 64%">'
        			+'<option value="-1">请选择</option>'
        			+'<c:forEach items="${userGroup }" var="item">'
        			+'<option value="${item.id }">${item.name }</option>'
        			+'</c:forEach>'
        			+'</select></div>'
        			+'<div style="height: 48px"><div style="width: 28%;margin-top:5px;float: left;font-family: 幼圆;font-size: 16px">用户角色：</div>'
        			+'<select id="newUserActor" name="userActor" class="js-example-basic-single" style="width: 72%; height: 64%">'
        			+'<option value="-1">请选择</option>'
        			+'<c:forEach items="${userActor }" var="item">'
        			+'<option value="${item.id }">${item.name }</option>'
        			+'</c:forEach>'
        			+'</select></div>'
        			+'<div style="height: 48px;text-align: center;margin-top:12px"><a class="easyui-linkbutton" style="width:96px;height:32px"'
					+'href="javascript:void(0)" onclick="confirmUser()">新增用户</a></div>'
        			+'</form></div>',
                closable : true,
                modal : true,
                draggable : true,
                timeout : 0,
                inline : false,
                width : 360,
                height : 340,
                style : {
                    left : w/2-180,
                    top : h/2
                },
                onBeforeOpen : function(){
                	$("#newUserGroup").select2();
                	$("#newUserActor").select2();
                },
                onClose : function(){
                	window.location.reload();
                }
            });
};
function confirmUser(){
	$.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: "addUser.php?"+$("#newUserInfo").serialize(),
        success: function(data){
        	if(data=='success'){
        		refreshAfterCloseShow("添加成功",800);
        	}else if(data=='exist'){
        		refreshAfterCloseShow("用户名已存在",800);
        	}else if(data=='failed'){
        		refreshAfterCloseShow("添加失败",800);
        	}else{
        		refreshAfterCloseShow("未知错误",800);
        	}
        }
    });
}
</script>