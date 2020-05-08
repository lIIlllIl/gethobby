package com.gethobby.service.domain;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class HobbyClass {

	/// Field
	private int hobbyClassNo;
	private User user;
	private Event event;
	private List<Lesson> lesson;
	private String hobbyClassName;
	private String hobbyClassImage;
	private String hobbyClassIntro;
	private int hobbyClassPrice;
	private String kitName;
	private String kitImage;
	private int kitPrice;
	private String kitIntro;
	private Date startDate;
	private Date endDate;
	private Date lessonDate;
	private String category;
	private List<String> hashtag;
	private int lessonTotalCount;
	private int hobbyClassPersonnel;
	private String hobbyClassState;
	private int totalMoney;
	private int steamCount;
	private double totalGrade;
	private String steamCheck;
	private List tempFile;
	
	private List<Event> eventList;
	
	/// Constructor
	public HobbyClass() {
	}
	
	/// Method
	public User getUser() {
		return user;
	}
	
	public int getHobbyClassNo() {
		return hobbyClassNo;
	}

	public void setHobbyClassNo(int hobbyClassNo) {
		this.hobbyClassNo = hobbyClassNo;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Event getEvent() {
		return event;
	}
	
	public void setEvent(Event event) {
		this.event = event;
	}
	
	public List<Lesson> getLesson() {
		return lesson;
	}

	public void setLesson(List<Lesson> lesson) {
		this.lesson = lesson;
	}

	public String getHobbyClassName() {
		return hobbyClassName;
	}
	
	public void setHobbyClassName(String hobbyClassName) {
		this.hobbyClassName = hobbyClassName;
	}
	
	public String getHobbyClassImage() {
		return hobbyClassImage;
	}
	
	public void setHobbyClassImage(String hobbyClassImage) {
		this.hobbyClassImage = hobbyClassImage;
	}
	
	public String getHobbyClassIntro() {
		return hobbyClassIntro;
	}
	
	public void setHobbyClassIntro(String hobbyClassIntro) {
		this.hobbyClassIntro = hobbyClassIntro;
	}
	
	public int getHobbyClassPrice() {
		return hobbyClassPrice;
	}
	
	public void setHobbyClassPrice(int hobbyClassPrice) {
		this.hobbyClassPrice = hobbyClassPrice;
	}
	
	public String getKitName() {
		return kitName;
	}
	
	public void setKitName(String kitName) {
		this.kitName = kitName;
	}
	
	public String getKitImage() {
		return kitImage;
	}
	
	public void setKitImage(String kitImage) {
		this.kitImage = kitImage;
	}
	
	public int getKitPrice() {
		return kitPrice;
	}
	
	public void setKitPrice(int kitPrice) {
		this.kitPrice = kitPrice;
	}
	
	public String getKitIntro() {
		return kitIntro;
	}
	
	public void setKitIntro(String kitIntro) {
		this.kitIntro = kitIntro;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Date getLessonDate() {
		return lessonDate;
	}
	
	public void setLessonDate(Date lessonDate) {
		this.lessonDate = lessonDate;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	public List<String> getHashtag() {
		return hashtag;
	}

	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}

	public int getLessonTotalCount() {
		return lessonTotalCount;
	}
	
	public void setLessonTotalCount(int lessonTotalCount) {
		this.lessonTotalCount = lessonTotalCount;
	}
	
	public int getHobbyClassPersonnel() {
		return hobbyClassPersonnel;
	}
	
	public void setHobbyClassPersonnel(int hobbyClassPersonnel) {
		this.hobbyClassPersonnel = hobbyClassPersonnel;
	}
	
	public String getHobbyClassState() {
		return hobbyClassState;
	}
	
	public void setHobbyClassState(String hobbyClassState) {
		this.hobbyClassState = hobbyClassState;
	}
	
	public int getTotalMoney() {
		return totalMoney;
	}
	
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	public int getSteamCount() {
		return steamCount;
	}
	
	public void setSteamCount(int steamCount) {
		this.steamCount = steamCount;
	}
	

	public String getSteamCheck() {
		return steamCheck;
	}
	
	public void setSteamCheck(String steamCheck) {
		this.steamCheck = steamCheck;
	}
	
	public double getTotalGrade() {
		return totalGrade;
	}

	public void setTotalGrade(double totalGrade) {
		this.totalGrade = totalGrade;
	}

	public List getTempFile() {
		return tempFile;
	}

	public void setTempFile(List tempFile) {
		this.tempFile = tempFile;
	}

	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	@Override
	public String toString() {
		return "HobbyClass [hobbyClassNo=" + hobbyClassNo + ", user=" + user + ", event=" + event + ", hobbyClassName="
				+ hobbyClassName + ", hobbyClassImage=" + hobbyClassImage + ", hobbyClassIntro=" + hobbyClassIntro
				+ ", hobbyClassPrice=" + hobbyClassPrice + ", kitName=" + kitName + ", kitImage=" + kitImage
				+ ", kitPrice=" + kitPrice + ", kitIntro=" + kitIntro + ", startDate=" + startDate + ", endDate="
				+ endDate + ", lessonDate=" + lessonDate + ", category=" + category + ", hashtag=" + hashtag
				+ ", lessonTotalCount=" + lessonTotalCount + ", hobbyClassPersonnel=" + hobbyClassPersonnel
				+ ", hobbyClassState=" + hobbyClassState + ", totalMoney=" + totalMoney + ", steamCount=" + steamCount
				+ ", totalGrade=" + totalGrade + ", steamCheck=" + steamCheck + "]";
	}
	
	
}//end of Domain