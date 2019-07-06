package cn.xkjs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.CommentDao;
import cn.xkjs.model.Comment;
import cn.xkjs.util.DButil;

public class CommentDaoImpl implements CommentDao{
	private BaseDao baseDao = new BaseDaoImpl();

	@Override
	public int addComment(Comment comment) {
		return baseDao.save(comment);
	}

	@Override
	public int getCommentCount() {
		Number number = (Number)baseDao.getCount("select count(*) from t_comment ", new Object[]{});
		return number.intValue();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return baseDao.getRowsFields("select * from t_comment limit ?,?", new Object[]{startRow,pageSize}, Comment.class);
	}

	@Override
	public Comment getCommentByCid(int cid) {
		return (Comment) baseDao.getRowFields("select * from t_comment where id=?", new Object[]{cid}, Comment.class);
	}

	@Override
	public int updateCommentByCid(Comment comment) {
		Connection conn = DButil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("update t_comment set title = ?,competitionName = ?,content=? ,author=?,updatetime= ? where id = ?");
			ps.setString(1,comment.getTitle());
			ps.setString(2,comment.getCompetitionName());
			ps.setString(3,comment.getContent());
			ps.setString(4,comment.getAuthor());
			ps.setTimestamp(5,new java.sql.Timestamp(comment.getUpdatetime().getTime()));
			ps.setInt(6, comment.getId());
			return ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps);
		}
		return 0;
	}

	@Override
	public int deleteCommentByCid(int cid) {
		return baseDao.executeSQL("delete from t_comment where id = ?", new Object[]{cid});
	}

	@Override
	public List findAllComment() {
		return baseDao.getRowsFields("select * from t_comment", new Object[]{}, Comment.class);
	}

}
