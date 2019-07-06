package cn.xkjs.model;

public class CompetitionType {
	private int id;
	private String competitionClass;
	
	public CompetitionType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompetitionType(int id, String competitionClass) {
		super();
		this.id = id;
		this.competitionClass = competitionClass;
	}

	public CompetitionType(String competitionClass) {
		super();
		this.competitionClass = competitionClass;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompetitionClass() {
		return competitionClass;
	}

	public void setCompetitionClass(String competitionClass) {
		this.competitionClass = competitionClass;
	}
	
	
	

}
