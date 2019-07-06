package cn.xkjs.model;

public class Game {
	private int gameid;
	private String competitionName;
	private String competitionClass;
	private String introduction;
	private String demand;
	private String time;
	private String hostunit;
	public Game(int gameid, String competitionName, String competitionClass, String introduction,String demand, String time, String hostunit) {
		super();
		this.gameid = gameid;
		this.competitionName = competitionName;
		this.competitionClass = competitionClass;
		this.introduction = introduction;
		this.demand = demand;
		this.time = time;
		this.hostunit = hostunit;
	}
	public Game() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Game(String competitionName, String competitionClass, String introduction,String demand, String time, String hostunit) {
		super();
		this.competitionName = competitionName;
		this.competitionClass = competitionClass;
		this.introduction = introduction;
		this.demand = demand;
		this.time = time;
		this.hostunit = hostunit;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getCompetitionName() {
		return competitionName;
	}
	public void setCompetitionName(String competitionName) {
		this.competitionName = competitionName;
	}
	public String getCompetitionClass() {
		return competitionClass;
	}
	public void setCompetitionClass(String competitionClass) {
		this.competitionClass = competitionClass;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHostunit() {
		return hostunit;
	}
	public void setHostunit(String hostunit) {
		this.hostunit = hostunit;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
}
