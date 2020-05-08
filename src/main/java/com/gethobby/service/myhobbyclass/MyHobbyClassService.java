package com.gethobby.service.myhobbyclass;

import java.util.List;
import java.util.Map;

import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;

public interface MyHobbyClassService {
	public Map<String, Object> getSteamHobbyClassList(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getRecentlyHobbyClass(Map<String, Object> inputData) throws Exception; // 기존거
	
	public List<HobbyClass> getPurchaseHobbyClassSchedult(String userId) throws Exception; 
	
	public List<Purchase> getHobbyClassBuyerStats(String hobbyClassNo) throws Exception;
	
	public void addSteamHobbyClass(Map<String, Object> inputData) throws Exception;
	
	public void updateHobbyClassSteam(Map<String, Object> inputData) throws Exception;
	
	public void deleteSteamHobbyClass(Map<String, Object> inputData) throws Exception;
	
	public Map<String, Object> getRecommendHobbyClassList(Map<String, Object> inputData) throws Exception;
	
	public List<HobbyClass> getListenHobbyClassList(String userId) throws Exception;
	
	public HobbyClass getHobbyClassStateStartDate(String hobbyClassNo) throws Exception;
}
