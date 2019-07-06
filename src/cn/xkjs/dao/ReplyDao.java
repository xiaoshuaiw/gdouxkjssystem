package cn.xkjs.dao;

import java.util.List;

public interface ReplyDao {

	int getReplyCount();

	List getPageData(int startRow, int pageSize);

	int deleteReplyByRid(int rid);

}
