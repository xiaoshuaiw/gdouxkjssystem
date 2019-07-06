package cn.xkjs.service.impl;

import java.util.List;

import cn.xkjs.dao.BaseDao;
import cn.xkjs.dao.ReplyDao;
import cn.xkjs.dao.impl.ReplyDaoImpl;
import cn.xkjs.service.ReplyService;

public class ReplyServiceImpl implements ReplyService{
	private ReplyDao replyDao = new ReplyDaoImpl();

	@Override
	public int getReplyCount() {
		return replyDao.getReplyCount();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return replyDao.getPageData(startRow, pageSize);
	}

	@Override
	public int deleteReply(int rid) {
		return replyDao.deleteReplyByRid(rid);
	}

}
