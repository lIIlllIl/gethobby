package com.gethobby.service.myhobbyclass.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.myhobbyclass.MyHobbyClassDAO;
import com.gethobby.service.myhobbyclass.MyHobbyClassService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassDAO;

@Service("myHobbyClassServiceImpl")
public class MyHobbyClassServiceImpl implements MyHobbyClassService {
	@Autowired
	@Qualifier("myHobbyClassDAOImpl")
	private MyHobbyClassDAO myHobbyClassDAO;
	
	@Autowired
	@Qualifier("searchHobbyClassDAOImpl")
	private SearchHobbyClassDAO searchHobbyClassDAO; 
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;

	@Override
	public Map<String, Object> getSteamHobbyClassList(Map<String, Object> inputData) throws Exception {
		List<HobbyClass> hobbyClassList = myHobbyClassDAO.getSteamHobbyClassList(inputData);
		
		for ( int i = 0; i < hobbyClassList.size(); i++ ) {
			HobbyClass hobbyClass = hobbyClassList.get(i);
			
			List<String> hashtagList = searchHobbyClassDAO.getHobbyClassHashtag(hobbyClass.getHobbyClassNo());
			
			List<String> setHashtagList = new ArrayList<String>();
			
			for (int j = 0; j < hashtagList.size(); j++) {
				String hashtagString = new String(hashtag.getProperty(hashtagList.get(j)).getBytes("ISO-8859-1"), "utf-8");
				setHashtagList.add(hashtagString);
			}
			
			hobbyClass.setHashtag(setHashtagList);
			
			hobbyClass.setTotalGrade( Math.round(hobbyClass.getTotalGrade() * 10) / 10.0 );
			
			if ( hobbyClass.getEvent() != null ) {
				List<Event> eventList = new ArrayList<Event>();
				
				String[] eventNoArray = hobbyClassList.get(i).getEvent().getEventNoString().split("/");
				String[] eventStartDateArray = hobbyClassList.get(i).getEvent().getEventStartDateString().split("/");
				String[] eventEndDateArray = hobbyClassList.get(i).getEvent().getEventEndDateString().split("/");
				String[] eventDiscountArray = hobbyClassList.get(i).getEvent().getEventDiscountString().split("/");
				String[] eventTitleArray = hobbyClassList.get(i).getEvent().getEventTitleString().split("/");
				
				for(int j = 0; j < eventNoArray.length; j++) {
					Event event = new Event();
					event.setEventNo(Integer.parseInt(eventNoArray[j]));
					event.setEventDiscount(Integer.parseInt(eventDiscountArray[j]));
					event.setEventTitle(eventTitleArray[j]);
					
					event.setEventStartDate(Date.valueOf(eventStartDateArray[j]));
					event.setEventEndDate(Date.valueOf(eventEndDateArray[j]));
					
					eventList.add(event);
				}
				
				hobbyClass.setEventList(eventList);
				
				Event event = new Event();
				
				event.setEventNo(Integer.parseInt(eventNoArray[0]));
				event.setEventDiscount(Integer.parseInt(eventDiscountArray[0]));
				event.setEventTitle(eventTitleArray[0]);
				event.setEventStartDate(Date.valueOf(eventStartDateArray[0]));
				event.setEventEndDate(Date.valueOf(eventEndDateArray[0]));
				
				hobbyClass.setEvent(event);
			}
		}
		
		int totalCount = myHobbyClassDAO.getSteamHobbyClassListTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", hobbyClassList);
		returnMap.put("total", totalCount);
		return returnMap;
	}

	@Override
	public List<HobbyClass> getRecentlyHobbyClass(Map<String, Object> inputData) throws Exception {
		List<Integer> hobbyClassNoList = (ArrayList<Integer>)inputData.get("hobbyClassNoList");
		
		List<HobbyClass> hobbyClassList = new ArrayList<HobbyClass>(); 
		
		for (int i = 0; i < hobbyClassNoList.size(); i++) {
			HobbyClass hobbyClass = new HobbyClass(); 
			
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("hobbyClassNo", hobbyClassNoList.get(i));
			map.put("userId", inputData.get("userId"));
			
			hobbyClass = searchHobbyClassDAO.getHobbyClass(map);
			
			hobbyClass.setTotalGrade( Math.round(hobbyClass.getTotalGrade() * 10) / 10.0 );
			
			List<String> hashtagList = searchHobbyClassDAO.getHobbyClassHashtag(hobbyClass.getHobbyClassNo());
			List<String> setHashtagList = new ArrayList<String>();
			
			for (int j = 0; j < hashtagList.size(); j++) {
				String hashtagString = new String(hashtag.getProperty(hashtagList.get(j)).getBytes("ISO-8859-1"), "utf-8");
				setHashtagList.add(hashtagString);
			}
			
			if ( hobbyClass.getEvent() != null ) {
				List<Event> eventList = new ArrayList<Event>();
				
				String[] eventNoArray = hobbyClassList.get(i).getEvent().getEventNoString().split("/");
				String[] eventStartDateArray = hobbyClassList.get(i).getEvent().getEventStartDateString().split("/");
				String[] eventEndDateArray = hobbyClassList.get(i).getEvent().getEventEndDateString().split("/");
				String[] eventDiscountArray = hobbyClassList.get(i).getEvent().getEventDiscountString().split("/");
				String[] eventTitleArray = hobbyClassList.get(i).getEvent().getEventTitleString().split("/");
				
				for(int j = 0; j < eventNoArray.length; j++) {
					Event event = new Event();
					event.setEventNo(Integer.parseInt(eventNoArray[j]));
					event.setEventDiscount(Integer.parseInt(eventDiscountArray[j]));
					event.setEventTitle(eventTitleArray[j]);
					
					event.setEventStartDate(Date.valueOf(eventStartDateArray[j]));
					event.setEventEndDate(Date.valueOf(eventEndDateArray[j]));
					
					eventList.add(event);
				}
				
				hobbyClass.setEventList(eventList);
				
				Event event = new Event();
				
				event.setEventNo(Integer.parseInt(eventNoArray[0]));
				event.setEventDiscount(Integer.parseInt(eventDiscountArray[0]));
				event.setEventTitle(eventTitleArray[0]);
				event.setEventStartDate(Date.valueOf(eventStartDateArray[0]));
				event.setEventEndDate(Date.valueOf(eventEndDateArray[0]));
				
				hobbyClass.setEvent(event);
			}
			
			hobbyClass.setHashtag(setHashtagList);
			
			hobbyClassList.add(hobbyClass);
		}
		
		return hobbyClassList;
	}

	@Override
	public List<HobbyClass> getPurchaseHobbyClassSchedult(String userId) throws Exception {
		return myHobbyClassDAO.getPurchaseHobbyClassSchedule(userId);
	}

	@Override
	public List<Purchase> getHobbyClassBuyerStats(String hobbyClassNo) throws Exception {
		return myHobbyClassDAO.getHobbyClassBuyerStats(hobbyClassNo);
	}

	@Override
	public void addSteamHobbyClass(Map<String, Object> inputData) throws Exception {
		myHobbyClassDAO.addSteamHobbyClass(inputData);
		myHobbyClassDAO.updateHobbyClassSteam(inputData);
	}

	@Override
	public void updateHobbyClassSteam(Map<String, Object> inputData) throws Exception {
		myHobbyClassDAO.updateHobbyClassSteam(inputData);
	}

	@Override
	public void deleteSteamHobbyClass(Map<String, Object> inputData) throws Exception {
		myHobbyClassDAO.deleteSteamHobbyClass(inputData);
		myHobbyClassDAO.updateHobbyClassSteam(inputData);
	}

	@Override
	public Map<String, Object> getRecommendHobbyClassList(Map<String, Object> inputData) throws Exception {
		List<HobbyClass> hobbyClassList = myHobbyClassDAO.getRecommendHobbyClassList(inputData);
		
		for ( int i = 0; i < hobbyClassList.size(); i++ ) {
			HobbyClass hobbyClass = hobbyClassList.get(i);
			
			List<String> hashtagList = searchHobbyClassDAO.getHobbyClassHashtag(hobbyClass.getHobbyClassNo());
			
			List<String> setHashtagList = new ArrayList<String>();
			
			for (int j = 0; j < hashtagList.size(); j++) {
				String hashtagString = new String(hashtag.getProperty(hashtagList.get(j)).getBytes("ISO-8859-1"), "utf-8");
				setHashtagList.add(hashtagString);
			}
			
			hobbyClass.setHashtag(setHashtagList);
			
			hobbyClass.setTotalGrade( Math.round(hobbyClass.getTotalGrade() * 10) / 10.0 );
			
			if ( hobbyClass.getEvent() != null ) {
				List<Event> eventList = new ArrayList<Event>();
				
				String[] eventNoArray = hobbyClassList.get(i).getEvent().getEventNoString().split("/");
				String[] eventStartDateArray = hobbyClassList.get(i).getEvent().getEventStartDateString().split("/");
				String[] eventEndDateArray = hobbyClassList.get(i).getEvent().getEventEndDateString().split("/");
				String[] eventDiscountArray = hobbyClassList.get(i).getEvent().getEventDiscountString().split("/");
				String[] eventTitleArray = hobbyClassList.get(i).getEvent().getEventTitleString().split("/");
				
				for(int j = 0; j < eventNoArray.length; j++) {
					Event event = new Event();
					event.setEventNo(Integer.parseInt(eventNoArray[j]));
					event.setEventDiscount(Integer.parseInt(eventDiscountArray[j]));
					event.setEventTitle(eventTitleArray[j]);
					
					event.setEventStartDate(Date.valueOf(eventStartDateArray[j]));
					event.setEventEndDate(Date.valueOf(eventEndDateArray[j]));
					
					eventList.add(event);
				}
				
				hobbyClass.setEventList(eventList);
				
				Event event = new Event();
				
				event.setEventNo(Integer.parseInt(eventNoArray[0]));
				event.setEventDiscount(Integer.parseInt(eventDiscountArray[0]));
				event.setEventTitle(eventTitleArray[0]);
				event.setEventStartDate(Date.valueOf(eventStartDateArray[0]));
				event.setEventEndDate(Date.valueOf(eventEndDateArray[0]));
				
				hobbyClass.setEvent(event);
			}
		}
		
		int totalCount = myHobbyClassDAO.getRecommendHobbyClassListTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", hobbyClassList);
		returnMap.put("total", totalCount);
		return returnMap;
	}

	@Override
	public List<HobbyClass> getListenHobbyClassList(String userId) throws Exception {
		List<HobbyClass> hobbyClassList = myHobbyClassDAO.getListenHobbyClass(userId);
		
		for ( int i = 0; i < hobbyClassList.size(); i++ ) {
			HobbyClass hobbyClass = hobbyClassList.get(i);
			
			List<String> hashtagList = searchHobbyClassDAO.getHobbyClassHashtag(hobbyClass.getHobbyClassNo());
			
			List<String> setHashtagList = new ArrayList<String>();
			
			for (int j = 0; j < hashtagList.size(); j++) {
				String hashtagString = new String(hashtag.getProperty(hashtagList.get(j)).getBytes("ISO-8859-1"), "utf-8");
				setHashtagList.add(hashtagString);
			}
			
			hobbyClass.setHashtag(setHashtagList);
		}
		
		return hobbyClassList;
	}

	@Override
	public HobbyClass getHobbyClassStateStartDate(String hobbyClassNo) throws Exception {

		return myHobbyClassDAO.getHobbyClassStateStartDate(hobbyClassNo);
	}
}
