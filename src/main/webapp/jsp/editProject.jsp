<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>编辑项目</title>
</head>
<html>
<body>
<%@include file="/jsp/topBar.jsp"%>
<div style="height: auto; width: 91%; margin-left: auto; margin-right: auto; margin-top: 1%">
	<fieldset>
		<legend>编辑项目</legend>
		<form id="editProject">
			<table>
				<tbody>
					<tr hidden="true">
						<td>项目ID</td><td><input class="easyui-textbox"
							id="projectID" name="projectID" value="${projectDetail.id }" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>项目名称</td><td><input class="easyui-textbox"
							id="title" name="title" value="${projectDetail.title }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>项目编码</td><td><input class="easyui-textbox"
							id="code" name="code" value="${projectDetail.code }" disabled="disabled" style="width: 50%; height: 24px;"></td>
					</tr>
					<tr>
						<td>分配组别</td><td><select id="userGroup" disabled="disabled"
							name="userGroup" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
								<c:forEach items="${userGroup }" var="item">
									<c:if test="${item.id==projectDetail.userGroup }">
										<option value="${item.id }" selected="selected">${item.name }</option>
									</c:if>
									<c:if test="${item.id!=projectDetail.userGroup }">
										<option value="${item.id }">${item.name }</option>
									</c:if>
								</c:forEach>
							</select></td>
					</tr>
					<tr>
						<td>当前状态</td><td><select id="curStatus"
							name="curStatus" class="js-example-basic-single" style="width: 50%">
							<option value="-1">请选择</option>
							<option value="1" <c:if test="${projectDetail.status==1 }"> selected="selected"</c:if> >新建</option>
							<option value="2" <c:if test="${projectDetail.status==2 }"> selected="selected"</c:if> >开发中</option>
							<option value="3" <c:if test="${projectDetail.status==3 }"> selected="selected"</c:if> >已上线</option>
							<option value="4" <c:if test="${projectDetail.status==4 }"> selected="selected"</c:if> >已关闭</option>
							</select></td>
					</tr>
					<tr>
						<td>描述</td><td><textarea id="p_describe" name="p_describe" rows="12" cols="126">${projectDetail.p_describe }</textarea></td>
					</tr>
					<!-- <tr>
						<td>上传文件</td><td><input type="file"></td>
					</tr> -->
				</tbody>
			</table>
		</form>
		<div align="right" style="float: right;"><a class="easyui-linkbutton" style="width: 80px;"
					href="javascript:void(0)" onclick="submit()">确认编辑</a></div>
	</fieldset>
</div>
</body>
<footer>
<%@include file="/jsp/footer.jsp"%>
</footer>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$("#userGroup").select2();
	$("#curStatus").select2();
});
function submit(){
	$.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: "editProject.php?"+$("#editProject").serialize(),
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