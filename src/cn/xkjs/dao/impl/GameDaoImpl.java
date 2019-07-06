package cn.xkjs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.GameDao;
import cn.xkjs.model.Comment;
import cn.xkjs.model.CompetitionType;
import cn.xkjs.model.Game;
import cn.xkjs.util.DButil;

public class GameDaoImpl implements GameDao {
	private BaseDao baseDao = new BaseDaoImpl();

	@Override
	public int addGame(Game game) {
		return baseDao.save(game);
	}

	@Override
	public List findType() {
		return baseDao.getRowsFields("select * from t_competitionType", new Object[] {}, CompetitionType.class);
	}

	@Override
	public int saveType(CompetitionType competitionType) {
		return baseDao.save(competitionType);
	}

	@Override
	public int deleteType(int cid) {
		return baseDao.executeSQL("delete from t_competitionType where id = ?", new Object[] { cid });
	}

	@Override
	public int getGameCount() {
		Number num = (Number) baseDao.getCount("select count(*) from t_game", new Object[] {});
		return num.intValue();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return baseDao.getRowsFields("select * from t_game limit ?,?", new Object[]{startRow,pageSize}, Game.class);
	}

	@Override
	public Game getGameByGid(int gid) {
		return (Game) baseDao.getRowFields("select * from t_game where gameid = ?", new Object[]{gid}, Game.class);
	}

	@Override
	public int updateGameByGid(Game game) {
		Connection conn = DButil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("update t_game set competitionName=?,competitionClass=?,introduction =?,demand=?,time=?,hostunit = ? where gameid = ?");
			ps.setString(1,game.getCompetitionName());
			ps.setString(2,game.getCompetitionClass());
			ps.setString(3,game.getIntroduction());
			ps.setString(4,game.getDemand());
			ps.setString(5,game.getTime());
			ps.setString(6,game.getHostunit());
			ps.setInt(7, game.getGameid());
			return ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps);
		}
		return 0;
	}

	@Override
	public int deleteGameByGid(int gid) {
		return baseDao.executeSQL("delete from t_game where gameid= ?", new Object[]{gid});
	}

	@Override
	public List findAllGame() {
		return baseDao.getRowsFields("select * from t_game",new Object[]{}, Game.class);
	}

	@Override
	public List getComment(int gid) {
		List<Comment> commentList = new ArrayList();
		Connection conn = DButil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement("select * from t_comment where gameid= ?");
			ps.setInt(1, gid);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setTitle(rs.getString("title"));
				comment.setCompetitionName(rs.getString("competitionName"));
				comment.setContent(rs.getString("content"));
				comment.setAuthor(rs.getString("author"));
				comment.setUpdatetime(rs.getTimestamp("updatetime"));
				comment.setGameid(rs.getInt("gameid"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DButil.close(conn, ps ,rs);
		}
		return commentList;
	}

}
