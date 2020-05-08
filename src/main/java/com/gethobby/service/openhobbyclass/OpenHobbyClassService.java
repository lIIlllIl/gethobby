package com.gethobby.service.openhobbyclass;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;

public interface OpenHobbyClassService {
	
	public Map<String, Object> getHobbyClassList(Search search, HttpSession session) throws Exception; 
	
	public List changeHobbyClassState(List list) throws Exception;
	
	public void addHobbyClass(String userId) throws Exception;
	
	public HobbyClass getHobbyClassInfo(String userId) throws Exception;
	
	public int deleteHobbyClass(int hobbyClassNo) throws Exception;
	
	public HobbyClass getSaveHobbyClass(int hobbyClassNo) throws Exception;
	
	public HobbyClass getHobbyClass(int hobbyClassNo, String what) throws Exception; 
	
	public int saveHobbyClassInfo(HobbyClass hobbyClass, HttpSession session) throws Exception; 
	
	public int saveKit(HobbyClass hobbyClass) throws Exception;
	
	public int saveCheckHobbyClass(int hobbyClassNo) throws Exception; 
	
	public Lesson getLesson(int lessonNo) throws Exception;
	
	public HobbyClass getPreview(int hobbyClassNo, String what) throws Exception; 

	public int saveLesson(Lesson lesson, HttpSession session) throws Exception; 
	
	public Lesson addLesson(int hobbyClassNo) throws Exception;
	
	public int deleteLesson(int lessonNo) throws Exception;
	
	public int addHashtag(HobbyClass hobbyClass) throws Exception;
	
	public List getHashtag(int hobbyClassNo) throws Exception; 
	
	public int updateTotalMoney(int hobbyClassNo, int money, String what) throws Exception;
	
	public int updateTotalStudent(int hobbyClassNo, int count, String what) throws Exception;
	
	public int updateTotalLesson(int hobbyClassNo, int count, String what) throws Exception;
	
	public List getFileName(MultipartFile file, HttpSession session) throws Exception;
	
	public void fileDelete(HttpSession session, List tempFile) throws Exception;
	
	public void sessionDelete(HttpSession session, List tempFile) throws Exception;
	
	public void updateClassState() throws Exception;
	
	// Admin
	public Map<String, Object> getHobbyClassListAdmin(Search search) throws Exception;
	
	public int saveCheckHobbyClassAdmin(int hobbyClassNo) throws Exception; 
	
	public int updateHobbyClassAdmin(HobbyClass hobbyClass, String what, HttpSession session) throws Exception; 
	
}//end of interface HobbyClassService
