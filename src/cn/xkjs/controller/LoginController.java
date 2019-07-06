package cn.xkjs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xkjs.model.User;
import cn.xkjs.service.UserService;
import cn.xkjs.service.impl.UserServiceImpl;

public class LoginController extends HttpServlet {
	private UserService userService = new UserServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String passwd = request.getParameter("password");
		
		//用户输入的验证码
		String vcode = request.getParameter("verifycode");
		
		//获取来自服务器的验证码
		HttpSession session = request.getSession();
		String sysoCode = (String) session.getAttribute("rand");
		
		//1、判断验证码
		if(sysoCode.equalsIgnoreCase(vcode)){
			//验证码正确
			User user = userService.login(uname, passwd);
			if(user != null){
				//用户登陆成功
				//登陆成功需要将user对象放入到session，其目的为了在这个用户访问网站保存用户的信息
				session.setAttribute("user",user);
				response.sendRedirect("index.jsp");
				if(request.getParameter("out") != null){
					session.invalidate();
					response.sendRedirect("login.jsp");
				}
			}else{
				//用户登录失败
				request.setAttribute("msg", "用户名或者密码错误，请重新输入！！！");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else {
			//验证码错误
			request.setAttribute("msg", "验证码错误，请重新输入！！！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
}

