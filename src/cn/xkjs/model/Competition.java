package cn.xkjs.model;

import java.util.Date;

public class Competition {
	private int id;
	private String competitionName;
	private String competitionClass;
	private String department;
	private String allStudent;
	private String teacher;
	private String phone;
	private String work;
	private Date updateTime;
	
	public Competition() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Competition(String competitionName, String competitionClass, String department, String allStudent, String teacher, String phone, String work, Date updateTime) {
		super();
		this.competitionName = competitionName;
		this.competitionClass = competitionClass;
		this.department = department;
		this.allStudent = allStudent;
		this.teacher = teacher;
		this.phone = phone;
		this.work = work;
		this.updateTime = updateTime;
	}
	
	public Competition(int id, String competitionName, String competitionClass, String department, String allStudent, String teacher, String phone, String work, Date updateTime) {
		super();
		this.id = id;
		this.competitionName = competitionName;
		this.competitionClass = competitionClass;
		this.department = department;
		this.allStudent = allStudent;
		this.teacher = teacher;
		this.phone = phone;
		this.work = work;
		this.updateTime = updateTime;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getAllStudent() {
		return allStudent;
	}
	public void setAllStudent(String allStudent) {
		this.allStudent = allStudent;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

}
