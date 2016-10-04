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
		<legend>新建项目</legend>
		<form id="newProject">
			<table>
				<tbody>
					<tr>
						<td>项目名称</td><td><input class="easyui-textbox"
							id="title" name="title" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>分配组别</td><td><select id="userGroup"
							name="userGroup" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="status"
							name="status" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1">新建</option>
							<option value="2">开发中</option>
							<option value="3">已上线</option>
							<option value="4">已关闭</option>
							</select></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea id="describe" name="describe" rows="12" cols="126"></textarea></td>
					</tr>
					<!-- <tr>
						<td>上传文件</td><td><input type="file"></td>
					</tr> -->
				</tbody>
			</table>
		</form>
		<div align="right"><a class="easyui-linkbutton" style="width: 80px;"
					href="javascript:void(0)" onclick="submit()">添加项目</a></div>
	</fieldset>
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
function submit(){
	$.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: "addProject.php?"+$("#newProject").serialize(),
        success: function(data){
        	if(data=='success'){
        		refreshAfterCloseShow("添加成功",800);
        		window.location.href="${path}/projectModule/toProjectList.php";
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