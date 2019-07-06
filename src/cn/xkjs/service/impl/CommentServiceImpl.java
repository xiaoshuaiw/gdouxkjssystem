package cn.xkjs.service.impl;

import java.util.List;

import cn.xkjs.dao.CommentDao;
import cn.xkjs.dao.impl.CommentDaoImpl;
import cn.xkjs.model.Comment;
import cn.xkjs.service.CommentServcie;

public class CommentServiceImpl implements CommentServcie{
	private CommentDao commentDao = new CommentDaoImpl();

	@Override
	public int addComment(Comment comment) {
		return commentDao.addComment(comment);
	}

	@Override
	public int getCommentCount() {
		return commentDao.getCommentCount();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return commentDao.getPageData(startRow,pageSize);
	}

	@Override
	public Comment getCommentByCid(int cid) {
		return commentDao.getCommentByCid(cid);
	}

	@Override
	public int updatecommentByCid(Comment comment) {
		return commentDao.updateCommentByCid(comment);
	}

	@Override
	public int deleteComment(int cid) {
		return commentDao.deleteCommentByCid(cid);
	}

	@Override
	public List findAllComment() {
		return commentDao.findAllComment();
	}


}
