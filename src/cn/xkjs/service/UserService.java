package cn.xkjs.service;

import java.util.List;

import cn.xkjs.model.User;

public interface UserService {
	User login(String userName,String password);

	int addUser(User user);

	int checkUsername(String username);

	int getUserCount();

	List getPageData(int startRow, int pageSize);

	int deleteUser(int uid);

	User getUserByUid(int uid);

	int updateUserByUid(User user);

}
