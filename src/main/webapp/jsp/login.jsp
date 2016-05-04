<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/jsp/header.jsp"%>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>登录</title>
<style type="text/css">
.alpha {
	background-color: #F0F0F0;
	filter: alpha(opacity = 90);
	-moz-opacity: 0.9;
	-khtml-opacity: 0.9;
	opacity: 0.9;
}
</style>
</head>
<html>
<body background="${path}/pic/loginBackground.jpg">
	<div align="center" style="padding-top: 120px">
		<font size="20" color="#FFFFFF"
			style="font-weight: bold; font-family: '幼圆'">凯&nbsp;&nbsp;撒
			&nbsp;项 &nbsp;目 &nbsp;管 &nbsp;理 &nbsp;系&nbsp;&nbsp;统</font>
	</div>
	<div
		style="height: auto; width: 32%; margin-left: auto; margin-right: auto; margin-top: 6%">
		<form id="loginInfo">
			<div id="p" class="easyui-panel" title="请登录" fit="true"
				style="padding-left: 60px; padding-right: 60px; padding-top: 10px; padding-bottom: 10px"
				data-options="footer:'#ft',cls:'alpha'">
				<div style="margin-bottom: 20px">
					<div>
						<font size="3">用户名:</font>
					</div>
					<input class="easyui-textbox" id="userName" name="userName"
						data-options="prompt:'请输入用户名',validType:'length[3,12]',iconCls:'icon-man'"
						style="width: 100%; height: 32px">
				</div>
				<div style="margin-bottom: 20px">
					<div>
						<font size="3">密码:</font>
					</div>
					<input class="easyui-textbox" id="passWord" name="passWord"
						type="password"
						data-options="prompt:'请输入密码',validType:'length[3,12]',iconCls:'icon-lock'"
						style="width: 100%; height: 32px">
				</div>
				<div style="margin-bottom: 20px">
					<div>
						<font size="3">验证码:</font>
					</div>
					<input class="easyui-textbox" id="inputCode" name="inputCode"
						data-options="prompt:'请输入验证码'"
						style="width: 71%; height: 32px; float: left;">
					<div style="float: right;">
						<img alt="验证码看不清，换一张"
							src="${path}/captcha/draw.php?createTypeFlag=n"
							id="validateCodeImg" onclick="changeCAPTCHA()">
					</div>
				</div>
				<div>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-ok" style="width: 100%; height: 32px"
						onclick="login()">登录</a>
				</div>
			</div>
			<div id="ft" style="padding: 5px; text-align: right">
				<font size="2" color="gray">没有账号？请联系管理员申请</font>
			</div>
		</form>
	</div>
</body>
</html>
<script type="text/javascript" charset="UTF-8">
	var level = 0;
	function changeCAPTCHA() {
		level++;
		var prop = new Array();
		prop[0] = 'n';
		prop[1] = 'l';
		prop[2] = 'nl';
		prop[3] = 'ch';
		prop[4] = 'ch';
		$("#validateCodeImg").attr(
				"src",
				"${path}/captcha/draw.php?createTypeFlag=" + prop[level % 4]
						+ "&id=" + parseInt(1000 * Math.random()));
	}
	function login() {
		if ($("#userName").val() != '') {
			if ($("#passWord").val() != '') {
				if ($("#inputCode").val() != '') {
					$
							.ajax({
								url : '${path}/loginModule/login.php',
								type : 'POST',
								async : false,
								data : $("#loginInfo").serialize(),
								dataType : 'text',
								success : function(data) {
									if (data == '"captchafailed"') {
										changeCAPTCHA();
										show('验证码输入错误');
										$("#inputCode").val('');
									} else if (data == '"failed"') {
										show('用户名或密码错误');
									} else if (data == '"success"') {
										window.location.href = "../userModule/toUserList.php";
									}
								}
							});
				} else {
					show('请填写验证码');
				}
			} else {
				show('请填写密码');
			}
		} else {
			show('请填写用户名');
		}
	}
	function show(text) {
		$.messager.show({
			title : '提示',
			msg : text,
			timeout : 800,
			width : 320,
			height : 160,
			showType : 'show',
			style : {
				right : '',
				bottom : ''
			}
		});
	}
</script>