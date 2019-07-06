package cn.xkjs.service.impl;

import java.util.List;

import cn.xkjs.dao.UserDao;
import cn.xkjs.dao.impl.UserDaoImpl;
import cn.xkjs.model.User;
import cn.xkjs.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao = new UserDaoImpl();

	@Override
	public User login(String uname, String passwd) {
		return userDao.getUserByUnameAndPasswd(uname,passwd);
	}

	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public int checkUsername(String username) {
		return userDao.checkUname(username);
	}

	@Override
	public int getUserCount() {
		return userDao.getUserCount();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return userDao.getPageData(startRow,pageSize);
	}

	@Override
	public int deleteUser(int uid) {
		return userDao.deleteUserByUid(uid);
	}

	@Override
	public User getUserByUid(int uid) {
		return userDao.getUserByUid(uid);
	}

	@Override
	public int updateUserByUid(User user) {
		return userDao.updateUserByUid(user);
	}

}
