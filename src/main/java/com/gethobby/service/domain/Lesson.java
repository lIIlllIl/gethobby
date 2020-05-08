package com.gethobby.service.domain;

import java.util.List;

public class Lesson {
	
	/// Field
	private int lessonNo;
	private HobbyClass hobbyClass;
	private String lessonTitle;
	private String lessonImage;
	private String lessonIntro;
	private String lessonContent;
	private String lessonProject;
	private String lessonVideo;
	private int totalCount;
	private int currentCount;
	private List tempFile;
	
	/// Constructor 
	public Lesson() {
	}
	
	/// Getter, Setter
	public HobbyClass getHobbyClass() {
		return hobbyClass;
	}

	public void setHobbyClass(HobbyClass hobbyClass) {
		this.hobbyClass = hobbyClass;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public String getLessonImage() {
		return lessonImage;
	}

	public void setLessonImage(String lessonImage) {
		this.lessonImage = lessonImage;
	}

	public String getLessonIntro() {
		return lessonIntro;
	}

	public void setLessonIntro(String lessonIntro) {
		this.lessonIntro = lessonIntro;
	}

	public String getLessonContent() {
		return lessonContent;
	}

	public void setLessonContent(String lessonContent) {
		this.lessonContent = lessonContent;
	}

	public String getLessonProject() {
		return lessonProject;
	}

	public void setLessonProject(String lessonProject) {
		this.lessonProject = lessonProject;
	}

	public String getLessonVideo() {
		return lessonVideo;
	}

	public void setLessonVideo(String lessonVideo) {
		this.lessonVideo = lessonVideo;
	}
	
	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	
	public List getTempFile() {
		return tempFile;
	}

	public void setTempFile(List tempFile) {
		this.tempFile = tempFile;
	}
	

	@Override
	public String toString() {
		return "Lesson [lessonNo=" + lessonNo + ", hobbyClass=" + hobbyClass + ", lessonTitle=" + lessonTitle
				+ ", lessonImage=" + lessonImage + ", lessonIntro=" + lessonIntro + ", lessonContent=" + lessonContent
				+ ", lessonProject=" + lessonProject + ", lessonVideo=" + lessonVideo + ", totalCount=" + totalCount
				+ ", currentCount=" + currentCount + "]";
	}

	
	
	
	

}
