package cn.xkjs.vo;

public class UserRateVo {
	private int teacher;
	private int student;
	
	public UserRateVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserRateVo(int teacher, int student) {
		super();
		this.teacher = teacher;
		this.student = student;
	}

	public int getTeacher() {
		return teacher;
	}

	public void setTeacher(int teacher) {
		this.teacher = teacher;
	}

	public int getStudent() {
		return student;
	}

	public void setStudent(int student) {
		this.student = student;
	}
	
	

}
