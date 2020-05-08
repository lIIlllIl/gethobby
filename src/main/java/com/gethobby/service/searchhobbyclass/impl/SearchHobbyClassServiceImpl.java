package com.gethobby.service.searchhobbyclass.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassDAO;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;

@Service("searchHobbyClassServiceImpl")
public class SearchHobbyClassServiceImpl implements SearchHobbyClassService {
	
	@Autowired
	@Qualifier("searchHobbyClassDAOImpl")
	private SearchHobbyClassDAO searchHobbyClassDAO;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Override
	public HobbyClass getHobbyClass(Map<String, Object> inputData) throws Exception {

		HobbyClass hobbyClass = searchHobbyClassDAO.getHobbyClass(inputData);
		
		hobbyClass.setTotalGrade( Math.round(hobbyClass.getTotalGrade() * 10) / 10.0 );
		
		List<String> setHashtagList = new ArrayList<String>();
		List<String> hashtagList = hobbyClass.getHashtag();
		
		for(int i = 0; i < hashtagList.size(); i++) {
			String hashtagString = new String(hashtag.getProperty(hashtagList.get(i)).getBytes("ISO-8859-1"), "utf-8");
			setHashtagList.add(hashtagString);
		}
		
		if ( hobbyClass.getEvent() != null ) {
			List<Event> eventList = new ArrayList<Event>();
			
			String[] eventNoArray = hobbyClass.getEvent().getEventNoString().split("/");
			String[] eventStartDateArray = hobbyClass.getEvent().getEventStartDateString().split("/");
			String[] eventEndDateArray = hobbyClass.getEvent().getEventEndDateString().split("/");
			String[] eventDiscountArray = hobbyClass.getEvent().getEventDiscountString().split("/");
			String[] eventTitleArray = hobbyClass.getEvent().getEventTitleString().split("/");
			
			for(int j = 0; j < eventNoArray.length; j++) {
				Event event = new Event();
				event.setEventNo(Integer.parseInt(eventNoArray[j]));
				event.setEventDiscount(Integer.parseInt(eventDiscountArray[j]));
				event.setEventTitle(eventTitleArray[j]);
				
				event.setEventStartDate(Date.valueOf(eventStartDateArray[j]));
				event.setEventEndDate(Date.valueOf(eventEndDateArray[j]));
				
				event.setResultPrice( (int)Math.round( ( (100 - event.getEventDiscount() ) / 100.0 ) * hobbyClass.getHobbyClassPrice() ) );
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
		
		return hobbyClass;
	}

	@Override
	public List<String> getHobbyClassHashtag(int hobbyClassNo) throws Exception {
		return searchHobbyClassDAO.getHobbyClassHashtag(hobbyClassNo);
	}

	@Override
	public Map<String, Object> getHobbyClassList(Map<String, Object> inputData) throws Exception {
		
		List<HobbyClass> hobbyClassList = searchHobbyClassDAO.getHobbyClassList(inputData);

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
		
		int totalCount = searchHobbyClassDAO.getHobbyClassListTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("total", totalCount);
		returnMap.put("list", hobbyClassList);
		
		return returnMap;
	}

	@Override
	public Map<String, Object> getHobbyClassAssessContent(Map<String, Object> inputData) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", searchHobbyClassDAO.getHobbyClassAssessContent(inputData));
		returnMap.put("total", searchHobbyClassDAO.getHobbyClassAssessContentTotalCount(inputData));
		return returnMap;
	}

	@Override
	public List<LessonTimes> getHobbyClassLessonContent(Map<String, Object> inputData) throws Exception {
		return searchHobbyClassDAO.getHobbyClassLessonContent(inputData);
	}

	@Override
	public List<LessonTimes> getLessonTimesList(Map<String, Object> inputData) throws Exception {
		return searchHobbyClassDAO.getLessonTimesList(inputData);
	}

	@Override
	public Map<String, Object> getPopularHobbyClassList(Map<String, Object> inputData) throws Exception {
		List<HobbyClass> hobbyClassList = searchHobbyClassDAO.getPopularHobbyClassList(inputData);
		
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
		
		int totalCount = searchHobbyClassDAO.getPopularHobbyClassListTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", hobbyClassList);
		returnMap.put("total", totalCount);
		
		return returnMap;
	}

	@Override
	public Map<String, Object> getRegisterHobbyClassList(Map<String, Object> inputData) throws Exception {
		List<HobbyClass> hobbyClassList = searchHobbyClassDAO.getRegisterHobbyClassList(inputData);
		
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
		
		int totalCount = searchHobbyClassDAO.getRegisterHobbyClassListTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", hobbyClassList);
		returnMap.put("total", totalCount);
		
		return returnMap;
	}

	@Override
	public int addHobbyClassAssess(ClassAssess classAssess) throws Exception {
		searchHobbyClassDAO.addHobbyClassAssess(classAssess);
		return searchHobbyClassDAO.getHobbyClassAssessSeqNo();
	}

	@Override
	public List<String> getUserSelectHashtag(String userId) throws Exception {
		return searchHobbyClassDAO.getUserSelectHashtag(userId);
	}

	@Override
	public ClassAssess getClassAssess(int assessNo) throws Exception {
		return searchHobbyClassDAO.getClassAssess(assessNo);
	}

	@Override
	public int getPurchaseClassCheck(Map<String, Object> inputData) throws Exception {
		return searchHobbyClassDAO.getPurchaseClassCheck(inputData);
	}

	@Override
	public ClassAssess getUserClassAssess(Map<String, Object> inputData) throws Exception {
		return searchHobbyClassDAO.getUserClassAssess(inputData);
	}

	@Override
	public List<Event> getNowEventList() throws Exception {
		return searchHobbyClassDAO.getNowEventList();
	}

	@Override
	public Article getClassCommunityArticleContent(String communityNo) throws Exception {
		return searchHobbyClassDAO.getClassCommunityArticleContent(communityNo);
	}

	@Override
	public List<Reply> getClassCommunityReplyContent(String communityNo) throws Exception {
		return searchHobbyClassDAO.getClassCommunityReplyContent(communityNo);
	}

	@Override
	public List<LessonTimes> getHobbyClassEncodingLessonList(int hobbyClassNo) throws Exception {
		return searchHobbyClassDAO.getHobbyClassEncodingLessonList(hobbyClassNo);
	}

}
