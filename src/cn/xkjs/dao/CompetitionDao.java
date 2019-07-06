package cn.xkjs.dao;

import java.util.List;

import cn.xkjs.model.Competition;

public interface CompetitionDao {

	int addCompetition(Competition competition);

	int getCompetitionCount();

	List getPageData(int startRow, int pageSize);

	Competition getCompetitionByCid(int cid);

	int updateCompetitionByCid(Competition competition);

	int deleteCompetitionByCid(int cid);

}
