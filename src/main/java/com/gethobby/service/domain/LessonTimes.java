package com.gethobby.service.domain;

public class LessonTimes {
	
	/// Field
	private int timeNo;
	private User user;
	private Lesson lesson;
	private int currentTimes;
	private int totalTimes;
	private int maxTimes;
	private HobbyClass hobbyClass;
	
	/// Constructor 
	public LessonTimes() {
	}
	
	/// Getter, Setter 
	public int getTimeNo() {
		return timeNo;
	}

	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
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

	public int getCurrentTimes() {
		return currentTimes;
	}

	public void setCurrentTimes(int currentTimes) {
		this.currentTimes = currentTimes;
	}

	public int getTotalTimes() {
		return totalTimes;
	}

	public void setTotalTimes(int totalTimes) {
		this.totalTimes = totalTimes;
	}

	public int getMaxTimes() {
		return maxTimes;
	}

	public void setMaxTimes(int maxTimes) {
		this.maxTimes = maxTimes;
	}
	
	public HobbyClass getHobbyClass() {
		return hobbyClass;
	}

	public void setHobbyClass(HobbyClass hobbyClass) {
		this.hobbyClass = hobbyClass;
	}

	@Override
	public String toString() {
		return "LessonTimes [timeNo=" + timeNo + ", user=" + user + ", lesson=" + lesson + ", currentTimes="
				+ currentTimes + ", totalTimes=" + totalTimes + ", maxTimes=" + maxTimes + "]";
	}
	
	
}
