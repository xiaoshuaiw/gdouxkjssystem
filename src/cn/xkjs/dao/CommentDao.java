package cn.xkjs.dao;

import java.util.List;

import cn.xkjs.model.Comment;

public interface CommentDao {

	int addComment(Comment comment);

	int getCommentCount();

	List getPageData(int startRow, int pageSize);

	Comment getCommentByCid(int cid);

	int updateCommentByCid(Comment comment);

	int deleteCommentByCid(int cid);

	List findAllComment();


}
