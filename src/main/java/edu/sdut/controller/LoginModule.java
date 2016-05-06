package edu.sdut.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sdut.model.UserInfo;
import edu.sdut.model.UserLoginLog;
import edu.sdut.service.UserService;
import edu.sdut.util.MD5Util;

@Controller
@RequestMapping("/loginModule")
public class LoginModule {

	@Resource
	UserService userService;

	@ResponseBody
	@RequestMapping("/login")
	public String validateLogin(HttpServletRequest request) {
		String inputCode = request.getParameter("inputCode");
		inputCode = inputCode.toUpperCase();
		String checkCode = (String) request.getSession().getAttribute("checkCode");
		if (!inputCode.equals(checkCode)) {
			return new String("captchafailed");
		}
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String md5pwd = MD5Util.MD5(passWord);
		HashMap<String, Object> loginInfo = new HashMap<String, Object>();
		loginInfo.put("name", userName);
		loginInfo.put("password", md5pwd);
		UserInfo userInfo = userService.validateLogin(loginInfo);
		if (userInfo == null) {
			return new String("failed");
		} else {
			request.getSession().setAttribute("user", userInfo);
			UserLoginLog log = new UserLoginLog();
			log.setLoginTime(new Date());
			log.setUserId(userInfo.getId());
			log.setLoginIp(request.getRemoteAddr());
			userService.insertLoginLog(log);
			return new String("success");
		}
	}

	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request) {
		request.getSession().setAttribute("user", null);
		return "login";
	}

}
