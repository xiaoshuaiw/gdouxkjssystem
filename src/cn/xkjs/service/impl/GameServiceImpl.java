package cn.xkjs.service.impl;

import java.util.List;

import cn.xkjs.dao.GameDao;
import cn.xkjs.dao.impl.GameDaoImpl;
import cn.xkjs.model.CompetitionType;
import cn.xkjs.model.Game;
import cn.xkjs.service.GameService;

public class GameServiceImpl implements GameService{
	private GameDao gameDao = new GameDaoImpl();

	@Override
	public int addGame(Game game) {
		return gameDao.addGame(game);
	}

	@Override
	public List findType() {
		return gameDao.findType();
	}

	@Override
	public int saveType(CompetitionType competitionType) {
		return gameDao.saveType(competitionType);
	}

	@Override
	public int deleteType(int cid) {
		return gameDao.deleteType(cid);
	}

	@Override
	public int getGameCount() {
		return gameDao.getGameCount();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return gameDao.getPageData(startRow,pageSize);
	}

	@Override
	public Game getGameByGid(int gid) {
		return gameDao.getGameByGid(gid);
	}

	@Override
	public int updateGameByGid(Game game) {
		return gameDao.updateGameByGid(game);
	}

	@Override
	public int deleteGame(int gid) {
		return gameDao.deleteGameByGid(gid);
	}

	@Override
	public List findAllGame() {
		return gameDao.findAllGame();
	}

	@Override
	public List getComment(int gid) {
		return gameDao.getComment(gid);
	}

}
