package com.gethobby.service.myhobbyclass;

import java.util.List;
import java.util.Map;

import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;

public interface MyHobbyClassDAO {
	public List<HobbyClass> getSteamHobbyClassList(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getRecentlyHobbyClassList(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getPurchaseHobbyClassSchedule(String userId) throws Exception; 
	
//	public List<User> getHobbyClassBuyerStats(int hobbyClassNo) throws Exception; 
	public List<Purchase> getHobbyClassBuyerStats(String hobbyClassNo) throws Exception; 
	
	public void addSteamHobbyClass(Map<String, Object> inputData) throws Exception;
	
	public void updateHobbyClassSteam(Map<String, Object> inputData) throws Exception;
	
	public void deleteSteamHobbyClass(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getRecommendHobbyClassList(Map<String, Object> inputData) throws Exception;
	
	public int getSteamHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception;
	
	public int getRecommendHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getListenHobbyClass(String userId) throws Exception;
	
	public HobbyClass getHobbyClassStateStartDate(String hobbyClassNo) throws Exception;
}
