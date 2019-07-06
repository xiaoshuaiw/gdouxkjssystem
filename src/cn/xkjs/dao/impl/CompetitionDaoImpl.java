package cn.xkjs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.CompetitionDao;
import cn.xkjs.model.Competition;
import cn.xkjs.util.DButil;



public class CompetitionDaoImpl implements CompetitionDao{
	private BaseDao baseDao = new BaseDaoImpl();

	@Override
	public int addCompetition(Competition competition) {
		return baseDao.save(competition);
	}

	@Override
	public int getCompetitionCount() {
		Number num = (Number)baseDao.getCount("select count(*) from t_competition", new Object[]{});
		return num.intValue();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return baseDao.getRowsFields("select * from t_competition limit ?,?", new Object[]{startRow,pageSize}, Competition.class);
	}

	@Override
	public Competition getCompetitionByCid(int cid) {
		return (Competition)baseDao.getRowFields("select * from t_competition where id=?", new Object[]{cid}, Competition.class);
	}

	@Override
	public int updateCompetitionByCid(Competition competition) {
		Connection conn = DButil.getConnection();
		PreparedStatement ps = null ;
		try {
			ps = conn.prepareStatement("update t_competition set competitionName = ?,competitionClass = ?,department=? ,allStudent=?,teacher= ?,phone=?,work = ?,updateTime=? where id = ?");
			ps.setString(1,competition.getCompetitionName());
			ps.setString(2,competition.getCompetitionClass());
			ps.setString(3,competition.getDepartment());
			ps.setString(4,competition.getAllStudent());
			ps.setString(5,competition.getTeacher());
			ps.setString(6,competition.getPhone());
			ps.setString(7,competition.getWork());
			ps.setTimestamp(8,new java.sql.Timestamp(competition.getUpdateTime().getTime()));
			ps.setInt(9, competition.getId());
			return ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps);
		}
		return 0;
	}

	@Override
	public int deleteCompetitionByCid(int cid) {
		return (int)baseDao.executeSQL("delete from t_competition where id=?",new Object[]{cid});
	}

}
