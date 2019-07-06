package cn.xkjs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import cn.xkjs.model.User;


public class LoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 拦截登录请求，判断用户是否登录
		HttpServletRequest req = (HttpServletRequest) request;

		System.out.println("loginFilter的chain.doFilter之前");

		User user = (User) req.getSession().getAttribute("user");

		String cmd = req.getParameter("cmd");

		String reqUri = req.getRequestURI();
		// 我们还需要判断如果这次请求是登录，就放行不要拦截
		//登录请求为login.jsp/image.jsp的请求不要拦截
		//请求servlet为：user.action且cmd=login的请求不要拦截
		if (user != null 
				|| reqUri.indexOf("login.jsp") != -1 
				|| reqUri.indexOf("image.jsp") != -1 
				|| (reqUri.indexOf("user.action") != -1 && cmd.equals("login"))) {
			chain.doFilter(request, response);
		}

		System.out.println("loginFilter的chain.doFilter之后");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
