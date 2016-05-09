<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>项目列表</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
	<div style="width: 81%; margin-left: auto; margin-right: auto;margin-top: 1%">
		<fieldset style="border: 1px blue dashed">
			<legend>查询条件</legend>
			<div style="float: left;width: 72%">
				<form id="queryForm">
					<table style="width: 72%">
						<tbody>
							<tr style="height: 36px">
								<td style="width: 8%">项目标题</td>
								<td style="width: 64%"><input class="easyui-textbox"
									id="projectName" name="projectName" style="width: 42%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td style="width: 8%">创建用户</td>
								<td style="width: 64%"><input class="easyui-textbox"
									id="userName" name="userName" style="width: 42%; height: 32px;"></td>
							</tr>
							<tr style="height: 36px">
								<td>所属组别</td>
								<td><select id="userGroup"
									name="userGroup" class="js-example-basic-single"
									style="width: 42%">
										<option value="-1">请选择</option>
										<c:forEach items="${userGroup }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr style="height: 36px">
								<td>项目状态</td>
								<td><select id="projectStatus"
									name="projectStatus" class="js-example-basic-single"
									style="width: 42%">
										<option value="-1">请选择</option>
										<option value="1">新建</option>
										<option value="2">开发中</option>
										<option value="3">已上线</option>
										<option value="4">已关闭</option>
								</select></td>
							</tr>
							<tr style="height: 36px">
								<td>创建时间</td>
								<td><input class="easyui-datebox"
									id="createTime" name="createTimeBegin" style="width: 32%; height: 32px;">至<input class="easyui-datetimebox"
									id="createTime" name="createTimeEnd" style="width: 32%; height: 32px;"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div style="float: right; height: 150px;">
				<a class="easyui-linkbutton" style="width: 80px; margin-top: 169px"
					href="javascript:void(0)" onclick="submit()">查询</a>
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
	$("#projectStatus").select2();
	$("#dataGrid")
			.datagrid(
					{
						fit : false,
						fitColumns : true,
						pagination : true,
						url : 'getProjectList.php',
						idField : 'id',
						pageSize : 30,
						pageList : [ 10, 20, 30, 40, 50 ],
						striped : true,
						nowrap : true,
						rownumbers : true,
						singleSelect : false,
						columns : [ [
								{
									field : 'code',
									title : '项目编码',
									width : 60,
								},{
									field : 'title',
									title : '项目标题',
									width : 60,
								},{
									field : 'createUserName',
									title : '创建用户',
									width : 60,
								},{
									field : 'userGroup',
									title : '所属用户组',
									width : 60,
								},{
									field : 'status',
									title : '项目状态',
									width : 60,
								},{
									field : 'createDateTime',
									title : '创建日期',
									width : 60,
									formatter : function(value, row, index){
										return formatDatebox(value,"yyyy-MM-dd")
									}
								},{
									field : 'action',
									title : '操作',
									width : 60,
									formatter : function(value, row, index){
										var str="";
										str+="<a href='javascript:void(0)'>编辑</a>";
										str+="&nbsp;&nbsp;<a href='javascript:void(0)'>详情</a>";
										return str;
									}
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
	$("#dataGrid").datagrid({url:'getProjectList.php',queryParams:$('#queryForm').serializeObject()});
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