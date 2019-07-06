package cn.xkjs.service;

import java.util.List;

public interface ReplyService {

	int getReplyCount();

	List getPageData(int startRow, int pageSize);

	int deleteReply(int rid);

}
