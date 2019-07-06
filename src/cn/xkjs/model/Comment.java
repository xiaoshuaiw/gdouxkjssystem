package cn.xkjs.model;

import java.util.Date;

public class Comment {
	private int id;
	private String title;
	private String competitionName;
	private String content;
	private String author;
	private Date updatetime;
	private int gameid;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String title, String competitionName, String content, String author, Date updatetime, int gameid) {
		super();
		this.id = id;
		this.title = title;
		this.competitionName = competitionName;
		this.content = content;
		this.author = author;
		this.updatetime = updatetime;
		this.gameid = gameid;
	}
	
	public Comment(String title, String competitionName, String content, String author, Date updatetime) {
		super();
		this.title = title;
		this.competitionName = competitionName;
		this.content = content;
		this.author = author;
		this.updatetime = updatetime;
	}
	public Comment(String content, String author, Date updatetime, int gameid) {
		super();
		this.content = content;
		this.author = author;
		this.updatetime = updatetime;
		this.gameid = gameid;
	}
	public Comment(String title, String competitionName, String content, String author, Date updatetime, int gameid) {
		super();
		this.title = title;
		this.competitionName = competitionName;
		this.content = content;
		this.author = author;
		this.updatetime = updatetime;
		this.gameid = gameid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompetitionName() {
		return competitionName;
	}
	public void setCompetitionName(String competitionName) {
		this.competitionName = competitionName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
}
