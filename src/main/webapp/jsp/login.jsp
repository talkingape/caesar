<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<title>登录</title>
<html>
<body>
	<div
		style="height: auto; width: 32%; margin-left: auto; margin-right: auto; margin-top: 6%">
		<form id="loginInfo">
		<div id="p" class="easyui-panel" title="请登录" style="padding: 10px;"
			data-options="footer:'#ft'">
			<div style="margin-bottom: 20px">
				<div>用户名:</div>
				<input class="easyui-textbox" id="userName" name="userName"
					data-options="prompt:'请输入用户名',validType:'length[3,12]'"
					style="width: 100%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<div>密码:</div>
				<input class="easyui-textbox" id="passWord" name="passWord"
					data-options="prompt:'请输入密码',validType:'length[3,12]'"
					style="width: 100%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<div>验证码:</div>
				<input class="easyui-textbox" id="inputCode" name="inputCode" onkeydown="inputComplete()"
					data-options="prompt:'请输入验证码'"
					style="width: 64%; height: 32px; float: left;">
				<div style="float: right;">
					<img alt="验证码看不清，换一张"
					src="${path}/captcha/draw.php?createTypeFlag=n" 
					id="validateCodeImg" onclick="changeCAPTCHA()">
				</div>
			</div>
			<div>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 100%; height: 32px" onclick="login()">登录</a>
			</div>
		</div>
		<div id="ft" style="padding: 5px; text-align: right">
			<font size="2" color="gray">没有账号？请直接联系管理员</font>
		</div>
		</form>
	</div>
</body>
</html>
<script>
var level=0;
function changeCAPTCHA(){
	level++;
	var prop=new Array();
	prop[0]='n';
	prop[1]='l';
	prop[2]='nl';
	prop[3]='ch';
	$("#validateCodeImg").attr("src","${path}/captcha/draw.php?createTypeFlag="+prop[level%4]);
}
function login(){
	alert(1);
	$.ajax({
		url : '${path}/login/login.php',
		type : 'POST',
		async : false,
		data : $("#loginInfo").serialize(),
		contentType : String,
		success : function(data){
			alert(data);
		}
	});
}
</script>