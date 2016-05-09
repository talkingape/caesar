package edu.sdut.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sdut.model.UserInfo;

public class LoginFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9052710114495480228L;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		UserInfo userInfo = (UserInfo) req.getSession().getAttribute("user");
		String servletPath = req.getServletPath();
		if (userInfo!=null||servletPath.endsWith("draw.php")
				||servletPath.endsWith("loginBackground.jpg")||servletPath.endsWith(".js")
				||servletPath.endsWith("png")||servletPath.endsWith(".gif")
				||servletPath.endsWith(".css")||servletPath.endsWith("loginModule/toLogin.php")
				||servletPath.endsWith("loginModule/login.php")) {
			if (req.getAttribute("userName")!=null&&userInfo!=null) {
				req.setAttribute("userName", userInfo.getName());
			}
			chain.doFilter(req, resp);
		}else {
			/*RequestDispatcher dispatcher = req.getRequestDispatcher("/loginModule/toLogin.php");
			dispatcher.forward(req, resp);*/
			String path=req.getContextPath()+"/loginModule/toLogin.php";
			System.out.println(path);
			resp.sendRedirect(path);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {

	}

}
