package cn.xkjs.model;

import java.util.Date;

public class Reply {
	private int id;
	private String topic;
	private String content;
	private String replier;
	private Date updatetime;
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(String topic, String content, String replier, Date updatetime) {
		super();
		this.topic = topic;
		this.content = content;
		this.replier = replier;
		this.updatetime = updatetime;
	}

	public Reply(int id, String topic, String content, String replier, Date updatetime) {
		super();
		this.id = id;
		this.topic = topic;
		this.content = content;
		this.replier = replier;
		this.updatetime = updatetime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReplier() {
		return replier;
	}

	public void setReplier(String replier) {
		this.replier = replier;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	

}