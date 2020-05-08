package com.gethobby.service.openhobbyclass;

import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;

public interface OpenHobbyClassDAO {
	
	public List getHobbyClassList(Search search) throws Exception;  
	
	public int getHobbyClassTotalCount(String userId) throws Exception;
	
	public int addMyHobbyClass(String userId) throws Exception; 
	
	public HobbyClass getNewHobbyClass(String userId) throws Exception;
	
	public int deleteHobbyClass(int hobbyClassNo) throws Exception;
	
	public HobbyClass getSaveHobbyClass(int hobbyClassNo) throws Exception;
	
	public HobbyClass getHobbyClass(Map hobbyClassIdAndWhat) throws Exception; 
	
	public int saveHobbyClassInfo(HobbyClass hobbyClass) throws Exception; 
	
	public int saveKit(HobbyClass hobbyClass) throws Exception; 
	
	public int saveCheckHobbyClass(int hobbyClassNo) throws Exception; 
	
	public HobbyClass getPreview(Map hobbyClassNoAndWhat) throws Exception; 
								
	public String getNickName(String userIdValue) throws Exception;
	
	public int saveLesson(Lesson lesson) throws Exception; 
	
	public Lesson getLesson(int lessonNo) throws Exception;
	
	public int updateClassState(Map stateMap) throws Exception;
	
	public List getLessonList(int hobbyClassNo) throws Exception;
	
	public int addLesson(int hobbyClassNo) throws Exception;
	
	public int getLessonNo(int hobbyClassNo) throws Exception;
	
	public int deleteLesson(int hobbyClassNo) throws Exception;
	
	public int addHashtag(Map<String, Object> hashtagMap) throws Exception;
	
	public List getHashtag(int hobbyClassNo) throws Exception; 
	
	public int updateTotalMoney(Map<String, Object> hobbyClassNoAndTotalMoeny) throws Exception;
	
	public int updateTotalStudent(Map<String, Object> hobbyClassNoAndTotalStudent) throws Exception;
	
	public int updateTotalLesson(Map<String, Object> hobbyClassNoAndTotalLesson) throws Exception;
	
	public int getTotalStudent(int hobbyClassNo) throws Exception;
	
	public int getTotalLesson(int hobbyClassNo) throws Exception;
	
	public int getTotalMoney(int hobbyClassNo) throws Exception;
	
	// Admin
	public List getHobbyClassListAdmin(Search search) throws Exception; 
	
	public int getHobbyClassTotalCountAdmin(Map<String, Object> totalCountMap) throws Exception;
	
	public int saveCheckHobbyClassAdmin(int hobbyClassNo) throws Exception; 

}//end of interface HobbyClassDAO
