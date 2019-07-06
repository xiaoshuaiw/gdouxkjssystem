package cn.xkjs.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xkjs.model.Comment;
import cn.xkjs.model.Game;
import cn.xkjs.model.User;
import cn.xkjs.service.CommentServcie;
import cn.xkjs.service.ReplyService;
import cn.xkjs.service.impl.CommentServiceImpl;
import cn.xkjs.service.impl.ReplyServiceImpl;
import cn.xkjs.util.PageUtil;
import cn.xkjs.util.ResponseUtil;
import cn.xkjs.vo.MsgVo;

public class CommentController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		if (cmd.equals("addComment")) {
			addComment(request, response);
		} else if (cmd.equals("findPageComment")) {
			findPageComment(request, response);
		} else if (cmd.equals("editcommentbefore")) {
			editcommentbefore(request, response);
		} else if (cmd.equals("editcommentafter")) {
			editcommentafter(request, response);
		} else if (cmd.equals("deletecomment")) {
			deletecomment(request, response);
		} else if (cmd.equals("findPageReply")) {
			findPageReply(request, response);
		} else if (cmd.equals("deleteReply")) {
			deleteReply(request, response);
		} else if(cmd.equals("getComment")){
			getComment(request,response);
		} 

	}

	private void getComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentServcie commentService = new CommentServiceImpl();
		List list = commentService.findAllComment();

		if (list != null && list.size() > 0) {
			request.setAttribute("commentlist", list);
			request.getRequestDispatcher("article.jsp").forward(request, response);
		}
	}

	private void deleteReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ReplyService replyService = new ReplyServiceImpl();
		String replyid = request.getParameter("replyid");
		int rid = Integer.parseInt(replyid);

		int flg = replyService.deleteReply(rid);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "回复删除成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "回复删除失败"));
		}

	}

	private void findPageReply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService replyService = new ReplyServiceImpl();

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

		int totalData = replyService.getReplyCount();
		PageUtil pu = new PageUtil(pageSize, currPage, navCount, totalData);

		List list = replyService.getPageData(pu.getStartRow(), pu.getPageSize());
		pu.setPageData(list);
		request.setAttribute("page", pu);
		request.getRequestDispatcher("view/reply/replypagedetail.jsp").forward(request, response);

	}

	private void deletecomment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommentServcie commentService = new CommentServiceImpl();

		String commentid = request.getParameter("commentid");
		int cid = Integer.parseInt(commentid);

		int flg = commentService.deleteComment(cid);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "评论删除成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "评论删除失败"));
		}

	}

	private void editcommentafter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentServcie commentService = new CommentServiceImpl();
		String title = request.getParameter("title");
		String competitionName = request.getParameter("competitionName");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		Comment comment = new Comment(title, competitionName, content, author, new Date());
		int flg = commentService.updatecommentByCid(comment);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "修改成功"));
		} else if (flg == 0) {
			ResponseUtil.Write2User(response, new MsgVo(2, "修改失败"));
		}
	}

	private void editcommentbefore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentServcie commentService = new CommentServiceImpl();
		String commentid = request.getParameter("commentid");
		int cid = Integer.parseInt(commentid);

		Comment comment = commentService.getCommentByCid(cid);
		request.setAttribute("comment", comment);
		request.getRequestDispatcher("view/comment/commentdit.jsp").forward(request, response);
	}

	private void findPageComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentServcie commentService = new CommentServiceImpl();

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

		int totalData = commentService.getCommentCount();
		PageUtil pu = new PageUtil(pageSize, currPage, navCount, totalData);

		List list = commentService.getPageData(pu.getStartRow(), pu.getPageSize());

		pu.setPageData(list);
		request.setAttribute("page", pu);
		request.getRequestDispatcher("view/comment/commentpagedetail.jsp").forward(request, response);
	}

	private void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommentServcie commentService = new CommentServiceImpl();
		String content = request.getParameter("contentVal");
		String gameid = request.getParameter("gameid");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		Comment comment = new Comment(content, user.getRealName(), new Date(), Integer.parseInt(gameid));
		
		int flg = commentService.addComment(comment);
		if (flg == 1) {
			ResponseUtil.Write2User(response, new MsgVo(1, "评论添加成功"));
		} else if (flg == 2) {
			ResponseUtil.Write2User(response, new MsgVo(2, "评论添加失败"));
		}

	}

}
