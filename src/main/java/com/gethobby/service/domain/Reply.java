package com.gethobby.service.domain;

import java.util.Date;

public class Reply {
	
	/// Field
	private Article article;
	private User user;
	private Lesson lesson;
	private int replyNo;
	private String replyContent;
	private String replyImage;
	private int totalReport;
	private String regDate;

	/// Constructor 
	public Reply() {
	}

	/// Getter, Setter 
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyImage() {
		return replyImage;
	}

	public void setReplyImage(String replyImage) {
		this.replyImage = replyImage;
	}

	public int getTotalReport() {
		return totalReport;
	}

	public void setTotalReport(int totalReport) {
		this.totalReport = totalReport;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Reply [article=" + article + ", replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyImage="
				+ replyImage + ", totalReport=" + totalReport + ", regDate=" + regDate + "]";
	}
}