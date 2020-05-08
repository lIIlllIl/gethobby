package com.gethobby.service.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Event {
	
	/// Field 
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private Date eventStartDate;
	private Date eventEndDate;
	private List<String> category;
	private int eventDiscount;
	private String eventImage;
	private HobbyClass hobbyClass;
	private User user;
	private int eventId; //추가된 컬럼
	
	private String eventStartDateString;
	private String eventEndDateString;
	private String eventDiscountString;
	private String eventNoString;
	private String eventTitleString;
	
	private int discountPrice; 
	private int resultPrice;
	
	
	
	/// Constructor 
	public Event() {
	}

	/// Getter, Setter 
	public int getEventNo() {

		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	
	///////추가
	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	
	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public List<String> getCategory() {
		return category;
	}

	public void setCategory(List<String> category) {
		this.category = category;
	}

	public int getEventDiscount() {
		return eventDiscount;
	}

	public void setEventDiscount(int eventDiscount) {
		this.eventDiscount = eventDiscount;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
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

	public String getEventStartDateString() {
		return eventStartDateString;
	}

	public void setEventStartDateString(String eventStartDateString) {
		this.eventStartDateString = eventStartDateString;
	}

	public String getEventEndDateString() {
		return eventEndDateString;
	}

	public void setEventEndDateString(String eventEndDateString) {
		this.eventEndDateString = eventEndDateString;
	}

	public String getEventDiscountString() {
		return eventDiscountString;
	}

	public void setEventDiscountString(String eventDiscountString) {
		this.eventDiscountString = eventDiscountString;
	}

	public String getEventNoString() {
		return eventNoString;
	}

	public void setEventNoString(String eventNoString) {
		this.eventNoString = eventNoString;
	}

	public String getEventTitleString() {
		return eventTitleString;
	}

	public void setEventTitleString(String eventTitleString) {
		this.eventTitleString = eventTitleString;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getResultPrice() {
		return resultPrice;
	}

	public void setResultPrice(int resultPrice) {
		this.resultPrice = resultPrice;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate + ", category=" + category
				+ ", eventDiscount=" + eventDiscount + ", eventImage=" + eventImage + ", hobbyClass=" + hobbyClass
				+ ", user=" + user + ", eventId=" + eventId + ", eventStartDateString=" + eventStartDateString
				+ ", eventEndDateString=" + eventEndDateString + ", eventDiscountString=" + eventDiscountString
				+ ", eventNoString=" + eventNoString + ", eventTitleString=" + eventTitleString + ", discountPrice="
				+ discountPrice + ", resultPrice=" + resultPrice + "]";

	}
}