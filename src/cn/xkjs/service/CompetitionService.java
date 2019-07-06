package cn.xkjs.service;

import java.util.List;

import cn.xkjs.model.Competition;

public interface CompetitionService {

	int addCompetition(Competition competition);

	int getCompeititionCount();

	List getPageData(int startRow, int pageSize);

	Competition getCompetitionByCid(int cid);

	int updateCompetitionByCid(Competition competition);

	int deleteCompetition(int cid);

}
