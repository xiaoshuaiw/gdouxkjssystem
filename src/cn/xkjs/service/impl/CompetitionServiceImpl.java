package cn.xkjs.service.impl;

import java.util.List;

import javax.servlet.jsp.tagext.PageData;

import cn.xkjs.dao.CompetitionDao;
import cn.xkjs.dao.impl.CompetitionDaoImpl;
import cn.xkjs.model.Competition;
import cn.xkjs.service.CompetitionService;

public class CompetitionServiceImpl implements CompetitionService{
	private CompetitionDao competitionDao = new CompetitionDaoImpl();

	@Override
	public int addCompetition(Competition competition) {
		return competitionDao.addCompetition(competition);
	}

	@Override
	public int getCompeititionCount() {
		return competitionDao.getCompetitionCount();
	}

	@Override
	public List getPageData(int startRow, int pageSize) {
		return competitionDao.getPageData(startRow,pageSize);
	}

	@Override
	public Competition getCompetitionByCid(int cid) {
		return competitionDao.getCompetitionByCid(cid);
	}

	@Override
	public int updateCompetitionByCid(Competition competition) {
		return competitionDao.updateCompetitionByCid(competition);
	}

	@Override
	public int deleteCompetition(int cid) {
		return competitionDao.deleteCompetitionByCid(cid);
	}

}
