package com.gethobby.service.domain;

public class Report {
	/// Field
	private int reportNo;
	private User user;
	private int replyNo;
	private int articleNo;
	private String reportCode;
	private String regDate;
	private String reportState; 
	
	/// Constructor
	public Report() {
	}
	
	/// Getter, Setter 
	public int getReportNo() {
		return reportNo;
	}
	
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getReplyNo() {
		return replyNo;
	}
	
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	
	public int getArticleNo() {
		return articleNo;
	}
	
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	
	public String getReportCode() {
		return reportCode;
	}
	
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getReportState() {
		return reportState;
	}

	public void setReportState(String reportState) {
		this.reportState = reportState;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", user=" + user + ", replyNo=" + replyNo + ", articleNo=" + articleNo
				+ ", reportCode=" + reportCode + ", regDate=" + regDate + "]";
	}
	
	
	
}
