package cn.xkjs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.UserDao;
import cn.xkjs.model.User;
import cn.xkjs.util.DButil;

public class UserDaoImpl implements UserDao {
	private BaseDao baseDao = new BaseDaoImpl();

	@Override
	public User getUserByUnameAndPasswd(String uname, String passwd) {
		return (User) baseDao.getRowFields("select * from t_user where userName=? and password=?", new Object[] { uname, passwd }, User.class);
	}

	@Override
	public int addUser(User user) {
		return baseDao.save(user);
	}

	@Override
	public int checkUname(String username) {
		Number num = (Number) baseDao.getCount("select count(1) from t_user where userName=?", new Object[] { username });
		return num.intValue();
	}

	@Override
	public int getUserCount() {
		Number number = (Number) baseDao.getCount("select count(*) from t_user", new Object[] {});
		return number.intValue();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return baseDao.getRowsFields("select * from t_user limit ?,?", new Object[] { startRow, pageSize }, User.class);
	}

	@Override
	public int deleteUserByUid(int uid) {
		return baseDao.executeSQL("delete from t_user where id=?", new Object[] { uid });
	}

	@Override
	public User getUserByUid(int uid) {
		return (User) baseDao.getRowFields("select * from t_user where id=?", new Object[] { uid }, User.class);
	}

	@Override
	public int updateUserByUid(User user) {
		Connection conn = DButil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("update t_user set userName = ?,password = ?,realName = ?,phone=? ,role=?,updateTime=? where id = ?");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRealName());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getRole());
			ps.setTimestamp(6, new java.sql.Timestamp(user.getUpdateTime().getTime()));
			ps.setInt(7, user.getId());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps);
		}
		return 0;
	}

}
