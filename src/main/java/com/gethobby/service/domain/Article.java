package com.gethobby.service.domain;

public class Article {

	/// Field
	private int articleNo;
	private User user;
	private HobbyClass hobbyClass;
	private String boardCode;
	private String articleType;
	private String articleTitle;
	private String articleContent;
	private String articleImage;
	private int totalView;
	private int totalFavor;
	private int totalReport;
	private String regDate;
	private int totalReply;
	
	/// Constructor
	public Article() {
	}

	/// Getter, Setter 
	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public HobbyClass getHobbyClass() {
		return hobbyClass;
	}

	public void setHobbyClass(HobbyClass hobbyClass) {
		this.hobbyClass = hobbyClass;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getArticleImage() {
		return articleImage;
	}

	public void setArticleImage(String articleImage) {
		this.articleImage = articleImage;
	}

	public int getTotalView() {
		return totalView;
	}

	public void setTotalView(int totalView) {
		this.totalView = totalView;
	}

	public int getTotalFavor() {
		return totalFavor;
	}

	public void setTotalFavor(int totalFavor) {
		this.totalFavor = totalFavor;
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

	
	
	
	public int getTotalReply() {
		return totalReply;
	}

	public void setTotalReply(int totalReply) {
		this.totalReply = totalReply;
	}

	@Override
	public String toString() {
		return "Article [articleNo=" + articleNo + ", user=" + user + ", hobbyClass=" + hobbyClass + ", boardCode="
				+ boardCode + ", articleType=" + articleType + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", articleImage=" + articleImage + ", totalView=" + totalView + ", totalFavor="
				+ totalFavor + ", totalReport=" + totalReport + ", regDate=" + regDate + ", totalReply=" + totalReply
				+ "]";
	}



}