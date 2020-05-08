package com.gethobby.service.domain;

public class Favor {

	/// Field
	private User user;
	private Article article;
	private int favorNo;
	
	/// Constructor
	public Favor() {
	}

	/// Getter, Setter 
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public int getFavorNo() {
		return favorNo;
	}

	public void setFavorNo(int favorNo) {
		this.favorNo = favorNo;
	}

	@Override
	public String toString() {
		return "Favor [user=" + user + ", article=" + article + ", favorNo=" + favorNo + "]";
	}

	

}