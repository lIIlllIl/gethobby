package com.gethobby.service.domain;

public class ClassAssess {
	
	/// Field 
	private int assessNo;
	private HobbyClass hobbyClass;
	private User user;
	private int assessStar;
	private String assessContent;
	private String regDate;
	
	/// Constructor 
	public ClassAssess() {
	}
	
	/// Getter, Setter 
	public int getAssessNo() {
		return assessNo;
	}

	public void setAssessNo(int assessNo) {
		this.assessNo = assessNo;
	}

	public HobbyClass getHobbyClass() {
		return hobbyClass;
	}

	public void setHobbyClass(HobbyClass hobbyClass) {
		this.hobbyClass = hobbyClass;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getAssessStar() {
		return assessStar;
	}

	public void setAssessStar(int assessStar) {
		this.assessStar = assessStar;
	}

	public String getAssessContent() {
		return assessContent;
	}

	public void setAssessContent(String assessContent) {
		this.assessContent = assessContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ClassAssess [assessNo=" + assessNo + ", hobbyClass=" + hobbyClass + ", user=" + user + ", assessStar="
				+ assessStar + ", assessContent=" + assessContent + ", regDate=" + regDate + "]";
	}
	
	

}
