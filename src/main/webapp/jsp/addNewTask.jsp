<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>添加新项目</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>新建任务</legend>
		<form id="newTask">
			<table>
				<tbody>
					<tr>
						<td>任务类别</td><td><select id="category"
							name="category" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">功能研发</option>
							<option value="2">BUG修复</option>
							</select></td>
					</tr>
					<tr>
						<td>任务名称</td><td><input class="easyui-textbox"
							id="taskTitle" name="taskTitle" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>所属项目</td><td><select id="projectID"
							name="projectID" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${projectList }" var="item">
									<option value="${item.id }">${item.title }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>指派给</td><td><select id="currentUserId"
							name="currentUserId" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userList }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="status"
							name="status" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">新建</option>
							<option value="2">开发/修复中</option>
							<option value="3">已完成</option>
							<option value="4">已废弃</option>
							</select></td>
					</tr>
					<tr>
						<td>优先级</td><td><select id="priority"
							name="priority" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">紧急</option>
							<option value="2">高</option>
							<option value="3">普通</option>
							<option value="4">低</option>
							</select></td>
					</tr>
					<tr>
								<td>预计完成</td>
								<td><input class="easyui-datebox"
									id="expectTime" name="expectTime" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>工时</td><td><input class="easyui-textbox"
							id="taskTime" name="taskTime" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea id="describe" name="describe" rows="12" cols="126"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div align="right"><a class="easyui-linkbutton" style="width: 80px;"
					href="javascript:void(0)" onclick="submit()">添加任务</a></div>
	</fieldset>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#category").select2();
	$("#projectID").select2();
	$("#currentUserId").select2();
	$("#status").select2();
	$("#priority").select2();
});
function submit(){
	$.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: "addTask.php?"+$("#newTask").serialize(),
        success: function(data){
        	if(data=='success'){
        		refreshAfterCloseShow("添加成功",800);
        		window.location.href="${path}/taskModule/toTaskList.php";
        	}else if(data=='failed'){
        		refreshAfterCloseShow("添加失败",800);
        	}else{
        		refreshAfterCloseShow("未知错误",800);
        	}
        }
	});
}
</script>
</html>