package cn.xkjs.dao;

import java.util.List;

import cn.xkjs.model.User;

public interface UserDao {
	User getUserByUnameAndPasswd(String uname,String passwd);

	int addUser(User user);

	int checkUname(String username);

	int getUserCount();

	List getPageData(int startRow, int pageSize);

	int deleteUserByUid(int uid);

	User getUserByUid(int uid);

	int updateUserByUid(User user);

}
