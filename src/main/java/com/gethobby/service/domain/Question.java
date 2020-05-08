package com.gethobby.service.domain;

public class Question {
	/// Field
	private int questionNo;
	private String questionType;
	private User user;
	private String questionTitle;
	private String questionContent;
	private String questionDate;
	private String answerContent;
	private String answerDate;
	private String questionState;
	
	/// Constructor 
	public Question() {
	}
	
	/// Getter, Setter 
	public int getQuestionNo() {
		return questionNo;
	}
	
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	
	public String getQuestionType() {
		return questionType;
	}
	
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getQuestionTitle() {
		return questionTitle;
	}
	
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	
	public String getQuestionContent() {
		return questionContent;
	}
	
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	
	public String getQuestionDate() {
		return questionDate;
	}
	
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	
	public String getAnswerContent() {
		return answerContent;
	}
	
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	
	public String getAnswerDate() {
		return answerDate;
	}
	
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	
	public String getQuestionState() {
		return questionState;
	}
	
	public void setQuestionState(String questionState) {
		this.questionState = questionState;
	}

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", questionType=" + questionType + ", user=" + user
				+ ", questionTitle=" + questionTitle + ", questionContent=" + questionContent + ", questionDate="
				+ questionDate + ", answerContent=" + answerContent + ", answerDate=" + answerDate + ", questionState="
				+ questionState + "]";
	}
	
	
	
	
}
