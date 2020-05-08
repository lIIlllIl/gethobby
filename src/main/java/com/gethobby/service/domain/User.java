package com.gethobby.service.domain;

import java.util.Date;
import java.util.List;

public class User {

	/// Field
	private String userId;
	private String sex;
	private String role;
	private String phone;
	private String name;
	private String profileImage;
	private int totalReport;
	private String birth;
	private String password;
	private String rePassword;
	private String beforePassword;
	private String nickName;
	private String postCode;
	private String address;
	private String detailAddress;
	private String reasonCode;
	private Date retireDate;
	private Date stopDate;
	private Date addDate;
	private List<String> hashtag;
	
	/// Constructor
	public User() {
	}
	
	/// Getter, Setter 
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public int getTotalReport() {
		return totalReport;
	}

	public void setTotalReport(int totalReport) {
		this.totalReport = totalReport;
	}

	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getBeforePassword() {
		return beforePassword;
	}

	public void setBeforePassword(String beforePassword) {
		this.beforePassword = beforePassword;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getReasonCode() {
		return reasonCode;
	}

	public void setReasonCode(String reasonCode) {
		this.reasonCode = reasonCode;
	}

	public Date getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public List<String> getHashtag() {
		return hashtag;
	}

	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", sex=" + sex + ", role=" + role + ", phone=" + phone + ", name=" + name
				+ ", profileImage=" + profileImage + ", totalReport=" + totalReport + ", birth=" + birth + ", password="
				+ password + ", rePassword=" + rePassword + ", beforePassword=" + beforePassword + ", nickName="
				+ nickName + ", postCode=" + postCode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", reasonCode=" + reasonCode + ", retireDate=" + retireDate + ", stopDate=" + stopDate + ", addDate="
				+ addDate + ", hashtag=" + hashtag + "]";
	}

	


	
}
