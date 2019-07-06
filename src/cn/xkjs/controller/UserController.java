package cn.xkjs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.impl.BaseDaoImpl;
import cn.xkjs.model.User;
import cn.xkjs.service.UserService;
import cn.xkjs.service.impl.UserServiceImpl;
import cn.xkjs.util.PageUtil;
import cn.xkjs.util.ResponseUtil;
import cn.xkjs.vo.MsgVo;
import cn.xkjs.vo.UserRateVo;

public class UserController extends HttpServlet {

	private UserService userService = new UserServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/htnl;charset=utf-8");

		String cmd = request.getParameter("cmd");
		if (cmd.equals("login")) {
			login(request, response);
		} else if (cmd.equals("logout")) {
			logout(request, response);
		} else if (cmd.equals("adduser")) {
			adduser(request, response);
		} else if (cmd.equals("checkUnameUnique")) {
			checkUnameUnique(request, response);
		} else if (cmd.equals("findPageUser")) {
			findPageUser(request, response);
		} else if (cmd.equals("deleteUser")) {
			deleteUser(request, response);
		} else if (cmd.equals("edituserbefore")) {
			edituserbefore(request, response);
		} else if (cmd.equals("edituserafter")) {
			edituserafter(request, response);
		} else if (cmd.equals("userrate")) {
			userrate(request, response);
		}

	}

	private void userrate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 BaseDao baseDao = new BaseDaoImpl();
		// 查询数据
		UserRateVo vo = (UserRateVo) baseDao.getRowFields("select max(tb.teacher) teacher,max(tb.student) student from (select count(case role when '教师' then role end) teacher, count(case role when '学生' then role end) student from t_user group by role) tb", null,UserRateVo.class);
		// 响应数据
		ResponseUtil.Write2User(response, JSON.toJSONString(vo));
	}

	private void edituserafter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ajax方式请求修改用户信息
		String userid = request.getParameter("id");
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String realname = request.getParameter("realName");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");

		User user = new User(Integer.parseInt(userid), username, password, realname, phone, role, new Date());

		int flag = userService.updateUserByUid(user);
		if (flag == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "用户修改成功"));
		} else if (flag == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "用户修改失败"));
		}
	}

	private void edituserbefore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		int uid = Integer.parseInt(userid);
		// 根据uid查询出一个user对象
		User user = userService.getUserByUid(uid);

		request.setAttribute("user", user);
		request.getRequestDispatcher("view/user/useredit.jsp").forward(request, response);
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 通常情况下，在数据库的表中设计一个字段：isDelete。1表示用户可以使用，2表示用户不能使用
		// 根据用户的id删除一个用户
		String userid = request.getParameter("userid");
		int uid = Integer.parseInt(userid);

		int flag = userService.deleteUser(uid);
		if (flag == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "用户删除成功"));
		} else if (flag == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "用户删除失败"));
		}

	}

	private void findPageUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取来自客户端的当前页及每个多少数据
		String currPageStr = request.getParameter("currPage");
		int currPage = 0;
		try {
			currPage = Integer.parseInt(currPageStr);
		} catch (Exception e) {
			currPage = 1;
		}

		String pageSizeStr = request.getParameter("pageSize");
		int pageSize = 0;
		try {
			pageSize = Integer.parseInt(pageSizeStr);
		} catch (Exception e) {
			pageSize = 10;
		}
		int navCount = 10; // 默认规定导航条的数目为10个

		int totalData = userService.getUserCount();

		PageUtil pu = new PageUtil(pageSize, currPage, navCount, totalData);

		// 根据startrow及pagesize查询分页的数据
		List list = userService.getPageData(pu.getStartRow(), pu.getPageSize());

		// 把上面查询的分页数据放到pageData属性中
		pu.setPageData(list);

		request.setAttribute("page", pu);

		// 跳转一个页面显示所有数据
		request.getRequestDispatcher("view/user/userpagedetail.jsp").forward(request, response);
	}

	private void checkUnameUnique(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 检验用户名的唯一性

		String username = request.getParameter("username");

		int flag = userService.checkUsername(username);
		if (flag == 0) {
			PrintWriter out = response.getWriter();
			out.write(JSON.toJSONString(new MsgVo(1, "用户名可以使用")));
			out.flush();
			out.close();
		} else if (flag == 1) {
			PrintWriter out = response.getWriter();
			out.write(JSON.toJSONString(new MsgVo(2, "用户名已存在，请换个使用")));
			out.flush();
			out.close();
		}
	}

	private void adduser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String realName = request.getParameter("realname");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		System.out.println(role);
		User user = new User(userName, password, realName, phone, role, new Date());
		System.out.println(user);
		int flag = userService.addUser(user);
		if (flag == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "用户添加成功"));
		} else if (flag == 2) {
			ResponseUtil.Write2User(response, new MsgVo(2, "用户添加失败"));
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.sendRedirect("login.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uname = request.getParameter("username");
		String passwd = request.getParameter("password");

		// 用户输入的验证码
		String vcode = request.getParameter("verifycode");
		// 获取来服务器的随机验证码
		HttpSession session = request.getSession();
		String sysCode = (String) session.getAttribute("rand");

		// 1.判断验证码
		if (sysCode.equalsIgnoreCase(vcode)) {
			// 验证码正确
			User user = userService.login(uname, passwd);
			if (user != null) {
				// 用户登录成功
				// 登录成功需要将user对象放入到session，其目的为了在这个用户访问网站保存该用户的信息
				session.setAttribute("user", user);
				PrintWriter out = response.getWriter();
				out.write(JSON.toJSONString(new MsgVo(1, "登录成功")));
				out.flush();
				out.close();

			} else {
				// 用户登录失败
				PrintWriter out = response.getWriter();
				out.write(JSON.toJSONString(new MsgVo(2, "用户名或密码错误")));
				out.flush();
				out.close();
			}
		} else {
			// 验证码错误
			// 把错误信息传回浏览器
			PrintWriter out = response.getWriter();
			out.write(JSON.toJSONString(new MsgVo(3, "验证码错误")));
			out.flush();
			out.close();
		}

	}

}
