package cn.xkjs.service;

import java.util.List;

import cn.xkjs.model.Comment;
import cn.xkjs.model.Game;

public interface CommentServcie {

	int addComment(Comment comment);

	int getCommentCount();

	List getPageData(int startRow, int pageSize);

	Comment getCommentByCid(int cid);

	int updatecommentByCid(Comment comment);

	int deleteComment(int cid);

	List findAllComment();


}
