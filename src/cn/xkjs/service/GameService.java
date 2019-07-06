package cn.xkjs.service;

import java.util.List;

import cn.xkjs.model.CompetitionType;
import cn.xkjs.model.Game;

public interface GameService {

	int addGame(Game game);

	List findType();

	int saveType(CompetitionType competitionType);

	int deleteType(int cid);

	int getGameCount();

	List getPageData(int startRow, int pageSize);

	Game getGameByGid(int gid);

	int updateGameByGid(Game game);

	int deleteGame(int gid);

	List findAllGame();

	List getComment(int gid);


}
