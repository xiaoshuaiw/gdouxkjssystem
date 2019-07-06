package cn.xkjs.model;

import java.util.Date;

public class User {
	private int id;
	private String userName;
	private String password;
	private String realName;
	private String phone;
	private String role;
	private Date updateTime;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String userName, String password, String realName, String phone, String role, Date updateTime) {
		super();
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.phone = phone;
		this.role = role;
		this.updateTime = updateTime;
	}
	

	public User(int id, String userName, String password, String realName, String phone, String role, Date updateTime) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.phone = phone;
		this.role = role;
		this.updateTime = updateTime;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
	

}
