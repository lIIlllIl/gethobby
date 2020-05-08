package com.gethobby.service.domain;

import java.sql.Date;

public class Purchase {

	/// Field
	private String purchaseId;
	private User user;
	private HobbyClass hobbyClass;
	private String dlvyCompany; 
	private String trackingNo;
	private String receiverName;
	private String receiverPhone;
	private String dlvyAddr;
	private String dlvyDetailAddr;
	private String dlvyPostcode;
	private String dlvyRequest;
	private String payMethod;
	private int purchasePrice;
	private Date purchaseDate;
	private Date refundDate;
	private String purchaseState;
	private String componentOption;
	
	/// Constructor
	public Purchase() {
	}
	
	/// Getter, Setter
	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
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

	public String getDlvyCompany() {
		return dlvyCompany;
	}

	public void setDlvyCompany(String dlvyCompany) {
		this.dlvyCompany = dlvyCompany;
	}

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getDlvyAddr() {
		return dlvyAddr;
	}

	public void setDlvyAddr(String dlvyAddr) {
		this.dlvyAddr = dlvyAddr;
	}

	public String getDlvyDetailAddr() {
		return dlvyDetailAddr;
	}

	public void setDlvyDetailAddr(String dlvyDetailAddr) {
		this.dlvyDetailAddr = dlvyDetailAddr;
	}

	public String getDlvyPostcode() {
		return dlvyPostcode;
	}

	public void setDlvyPostcode(String dlvyPostcode) {
		this.dlvyPostcode = dlvyPostcode;
	}

	public String getDlvyRequest() {
		return dlvyRequest;
	}

	public void setDlvyRequest(String dlvyRequest) {
		this.dlvyRequest = dlvyRequest;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public String getPurchaseState() {
		return purchaseState;
	}

	public void setPurchaseState(String purchaseState) {
		this.purchaseState = purchaseState;
	}
	
	public String getComponentOption() {
		return componentOption;
	}

	public void setComponentOption(String componentOption) {
		this.componentOption = componentOption;
	}
	

	@Override
	public String toString() {
		return "Purchase [purchaseId=" + purchaseId + ", user=" + user + ", hobbyClass=" + hobbyClass + ", dlvyCompany="
				+ dlvyCompany + ", trackingNo=" + trackingNo + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + ", dlvyAddr=" + dlvyAddr + ", dlvyDetailAddr=" + dlvyDetailAddr + ", dlvyPostcode="
				+ dlvyPostcode + ", dlvyRequest=" + dlvyRequest + ", payMethod=" + payMethod + ", purchasePrice="
				+ purchasePrice + ", purchaseDate=" + purchaseDate + ", refundDate=" + refundDate + ", purchaseState="
				+ purchaseState + ",componentOption="+componentOption+"]";
	}
}
