package com.gethobby.service.domain;

public class Steam {
	/// Field
	private User user;
	private int steamNo;
	private HobbyClass hobbyClass;
	
	/// Constructor
	public Steam() {
	}

	/// Getter, Setter 
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getSteamNo() {
		return steamNo;
	}

	public void setSteamNo(int steamNo) {
		this.steamNo = steamNo;
	}

	public HobbyClass getHobbyClass() {
		return hobbyClass;
	}

	public void setHobbyClass(HobbyClass hobbyClass) {
		this.hobbyClass = hobbyClass;
	}

	@Override
	public String toString() {
		return "Steam [user=" + user + ", steamNo=" + steamNo + ", hobbyClass=" + hobbyClass + "]";
	}
	
}
