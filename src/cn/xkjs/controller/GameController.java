package cn.xkjs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.impl.BaseDaoImpl;
import cn.xkjs.model.Comment;
import cn.xkjs.model.CompetitionType;
import cn.xkjs.model.Game;
import cn.xkjs.service.GameService;
import cn.xkjs.service.impl.GameServiceImpl;
import cn.xkjs.util.DButil;
import cn.xkjs.util.PageUtil;
import cn.xkjs.util.ResponseUtil;
import cn.xkjs.vo.MsgVo;

public class GameController extends HttpServlet {
	private GameService gameService = new GameServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		if (cmd.equals("type")) {
			getCompetitionType(request, response);
		} else if (cmd.equals("addgame")) {
			addgame(request, response);
		} else if (cmd.equals("findtype")) {
			findType(request, response);
		} else if (cmd.equals("typeadd")) {
			typeadd(request, response);
		} else if (cmd.equals("typeDelete")) {
			typeDelete(request, response);
		} else if (cmd.equals("findPageGame")) {
			findPageGame(request, response);
		} else if (cmd.equals("editgamebefore")) {
			editgamebefore(request, response);
		} else if (cmd.equals("editgameafter")) {
			editgameafter(request, response);
		} else if (cmd.equals("deletegame")) {
			deletegame(request, response);
		} else if(cmd.equals("getAllGame")){
			getAllGame(request,response);
		} else if(cmd.equals("getCompetition")){
			getCompetition(request,response);
		}

	}

	private void getCompetition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gameid = request.getParameter("gameid");
		int gid = Integer.parseInt(gameid);
		
		List commentList = gameService.getComment(gid);
		request.setAttribute("commentList", commentList);
		Game game = gameService.getGameByGid(gid);
		request.setAttribute("game", game);
		request.getRequestDispatcher("article.jsp").forward(request, response);
	}

	private void getAllGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list = gameService.findAllGame();

		if (list != null && list.size() > 0) {
			request.setAttribute("gamelist", list);
			request.getRequestDispatcher("xkjs.jsp").forward(request, response);
		}
	}

	// 删除竞赛信息
	private void deletegame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gameid = request.getParameter("gameid");
		int gid = Integer.parseInt(gameid);

		int flg = gameService.deleteGame(gid);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛删除成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "竞赛删除失败"));
		}
	}
	//修改竞赛信息，编辑竞赛信息，获取修改后的竞赛信息，更新保存到数据库中
	private void editgameafter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gameid = request.getParameter("id");
		String competitionName = request.getParameter("competitionName");
		String competitionClass = request.getParameter("competitionClass");
		String introduction = request.getParameter("introduction");
		String demand = request.getParameter("demand");
		String time = request.getParameter("time");
		String hostunit = request.getParameter("hostunit");

		Game game = new Game(Integer.parseInt(gameid), competitionName, competitionClass, introduction, demand, time, hostunit);

		int flg = gameService.updateGameByGid(game);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "修改成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "修改失败"));
		}
	}
	//根据竞赛信息的id来获取竞赛信息，显示在页面中。
	private void editgamebefore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gameid = request.getParameter("gameid");
		int gid = Integer.parseInt(gameid);

		Game game = gameService.getGameByGid(gid);
		request.setAttribute("game", game);
		request.getRequestDispatcher("view/game/gamedit.jsp").forward(request, response);
	}
	//分页显示发布的竞赛信息
	private void findPageGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currpageStr = request.getParameter("currPage");
		int currPage = 0;
		try {
			currPage = Integer.parseInt(currpageStr);
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
		int navCount = 10;

		int totalData = gameService.getGameCount();
		PageUtil pu = new PageUtil(pageSize, currPage, navCount, totalData);

		List list = gameService.getPageData(pu.getStartRow(), pu.getPageSize());

		pu.setPageData(list);
		request.setAttribute("page", pu);
		request.getRequestDispatcher("view/game/gamepagedetail.jsp").forward(request, response);
	}
	//删除竞赛分类
	private void typeDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("typeid");
		int cid = Integer.parseInt(id);

		int flg = gameService.deleteType(cid);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛分类删除成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "竞赛分类删除失败"));
		}

	}
	//添加竞赛分类
	private void typeadd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String competitionClass = request.getParameter("competitionClass");

		CompetitionType competitionType = new CompetitionType(competitionClass);

		int flg = gameService.saveType(competitionType);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛类别添加成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "竞赛类别添加失败"));
		}
	}
	//查找竞赛分类
	private void findType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list = gameService.findType();

		if (list != null & list.size() > 0) {
			request.setAttribute("typelist", list);
			request.getRequestDispatcher("view/game/type.jsp").forward(request, response);

		}
	}
	//添加竞赛类别
	private void addgame(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String competitionName = request.getParameter("competitionName");
		String competitionClass = request.getParameter("competitionClass");
		String introduction = request.getParameter("introduction");
		String demand = request.getParameter("demand");
		String time = request.getParameter("time");
		String hostunit = request.getParameter("hostunit");

		Game game = new Game(competitionName, competitionClass, introduction, demand, time, hostunit);

		int flg = gameService.addGame(game);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛信息添加成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "竞赛信息添加失败"));
		}
	}
	//获取竞赛类别
	private void getCompetitionType(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 创建一个容器来盛放竞赛类别对象
		List typelist = new ArrayList();

		Connection conn = DButil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement("select * from t_competitionType");
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String competitionClass = rs.getString("competitionClass");
				CompetitionType ct = new CompetitionType(id, competitionClass);
				typelist.add(ct);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps, rs);
		}

		// 将数组变化为json格式的字符串
		String jsonString = JSON.toJSONString(typelist);
		response.setContentType("text/html;charset=utf-8");
		// 将数据发送到ajax引擎中
		PrintWriter out = response.getWriter();
		out.write(jsonString);
		out.flush();
		out.close();

	}

}
