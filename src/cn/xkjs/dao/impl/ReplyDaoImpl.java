package cn.xkjs.dao.impl;

import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.ReplyDao;
import cn.xkjs.model.Game;
import cn.xkjs.model.Reply;

public class ReplyDaoImpl implements ReplyDao {
	private BaseDao baseDao = new BaseDaoImpl();

	@Override
	public int getReplyCount() {
		Number number = (Number) baseDao.getCount("select count(*) from t_reply ", new Object[] {});
		return number.intValue();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return baseDao.getRowsFields("select * from t_reply limit ?,?", new Object[] { startRow, pageSize }, Reply.class);
	}

	@Override
	public int deleteReplyByRid(int rid) {
		return baseDao.executeSQL("delete from t_reply where id = ?", new Object[] { rid });
	}

}
