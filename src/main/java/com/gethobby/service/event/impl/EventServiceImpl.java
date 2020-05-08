package com.gethobby.service.event.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.event.EventDAO;
import com.gethobby.service.event.EventService;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	@Qualifier("eventDAOImpl")
	EventDAO eventDAO;
	
	//Constructor
	public EventServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass()+" default Constructor");
	}
	

	public void setEventDAO(EventDAO eventDAO) {
		//this.eventDAO = eventDAO;
		System.out.println(getClass()+" .setEventDAO");
	}


	@Override
	public void deleteOneEvent(int eventId) throws Exception {
		
		eventDAO.deleteEvent(eventId);
	}
	
	@Override
	public void deleteSelectedEvent(ArrayList<Integer> eventIdList) throws Exception {
		
		eventDAO.deleteSelectedEvent(eventIdList);
	}
	

	@Override
	public Event getEvent(int eventId) throws Exception {
		
		Event event = new Event();
		//eventId에 해당하는 이벤트의 상세정보 가져오는 쿼리
		event = eventDAO.getEventWithoutCategory(eventId);
		
		List<String> categorys = new ArrayList<String>();
		List<String> eventCategory = new ArrayList<String>();
		
		//한 이벤트에 설정된 여러개의 카테고리 가지고오는 쿼리
		categorys = eventDAO.getEventCategory(eventId);
		//System.out.println("::"+categorys);
		
		for (int i = 0; i < categorys.size(); i++) {
			
			eventCategory.add(i, categorys.get(i));
		}
		
		event.setCategory(eventCategory);
		System.out.println("getEvent: "+event);
		return event; 
	}
	
	@Override
	public void addEventAdmin(Event event) throws Exception {
		
		System.out.println("/////addEventAdmin Service실행///////");
		//insert하려는 이벤트의 카테고리
		List<String> InsertCategory = event.getCategory();
		System.out.println("Insert할 모든 category: "+InsertCategory);
		
		Map<String, Object> addMap = new HashMap<String, Object>() ;
		//table에 있는 마지막 eventId가져와서 거기에 +1해줘서 겹치는 일 없게 / 유니크한 값 가지게 설정하는 과정//////
		//단일 category 때문에 HobbyClass Domain사용.
		List<HobbyClass> lastEvent = new ArrayList<HobbyClass>();
		lastEvent = eventDAO.getLastEvent();
		System.out.println("테이블의 마지막EventId확인: "+lastEvent.get(0).getEvent().getEventId());
		event.setEventId(lastEvent.get(0).getEvent().getEventId()+1); //list의 몇번째이던 event_id는 같으므로 상관없음
//		System.out.println("들어갈 eventId: "+event.getEventId());
		for (int i = 0; i < InsertCategory.size(); i++) {
			
			addMap.put("sendCategory", InsertCategory.get(i)); //카테고리가 여러개이기때문에 이렇게 굳이 따로 넣어줌.
			addMap.put("event", event);
			System.out.println(i+"번째 insert:"+addMap);
			eventDAO.insertEventAdmin(addMap);;
		}
		
		////////////////////////////////////////////////
		//event_class table에 insert하는 과정/////////////
		lastEvent = eventDAO.getLastEvent(); //마지막Row에 해당하는 eventNo,category 사용
		System.out.println("2222"+lastEvent);
		List<Event> makeClassNoList = new ArrayList<Event>();
		List<Integer> classNoList = new ArrayList<Integer>();
		Map<String, Object> eventclassMap = new HashMap<String, Object>();

		for (int i = 0; i < lastEvent.size(); i++) {
			
			//event_class table에 들어갈 eventNo
			int event_classEventNo = lastEvent.get(i).getEvent().getEventNo();
			System.out.println("event_classEventNo:"+event_classEventNo);
			eventclassMap.put("event_classEventNo", event_classEventNo);  //event_class의 EventNo

			String upperCategory = lastEvent.get(i).getCategory().toUpperCase();
			System.out.println("대문자로 변환:"+upperCategory);
			//클래스table에 카테고리 하나씩 들고감.
			makeClassNoList = eventDAO.getInsertClassNo(upperCategory);
			
			//event_class의 ClassNo
			for (int j = 0; j < makeClassNoList.size(); j++) {
			//classNoList.add(i, (makeClassNoList.get(j).getHobbyClass() ).getHobbyClassNo() );
			System.out.println(j+"번째 classNoList:"+makeClassNoList.get(j).getHobbyClass().getHobbyClassNo());
			eventclassMap.put("classNo", makeClassNoList.get(j).getHobbyClass().getHobbyClassNo());	//event_class의 ClassNo
			eventDAO.addIntoEventClass(eventclassMap);
			
			}
			
			System.out.println("일단 과정 끝");
		}
		
	}

	@Override
	public Map<String, Object> getEventList(Search search) throws Exception {
		
		List<Event> list = eventDAO.getEventList(search);
		int totalCount = eventDAO.getTotalCount(search); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		System.out.println("ServiceImpl::"+map);
		
		return map;
	}
	
	@Override
	public Map<String, Object> getEventListAdmin(Search search) throws Exception {
		 
		 List<Event> list = eventDAO.getEventListAdmin(search);
		 int totalCount = eventDAO.getTotalCount(search);
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("list", list);
		 map.put("totalCount", totalCount);
		 System.out.println("ServiceImpl확인:\n"+map);
		 
		 return map;
	}

	@Override
	public int updateEventAdmin(Event event) throws Exception {
		
		//들고온 카테고리 List에 저장
		List<String> categorys = new ArrayList<String>();
		for (int i = 0; i < event.getCategory().size(); i++) {
			categorys.add(i, event.getCategory().get(i));
		}
		
		//Category제외 event도메인 UPDATE
		eventDAO.updateEventAdminExceptCategory(event);
		
		//getEvent(eventId)해서 모든 내용 가져옴.(카테고리 제외한 Event 가져옴)
		event = eventDAO.getEventWithoutCategory(event.getEventId());
		System.out.println("수정된 내용:"+event);
		
		//eventClass table에서 삭제할 eventNo List가져옴. //필요없을듯...
		List<Integer> deleteEventNoList = new ArrayList<Integer>();
		eventDAO.getDeleteEventNoList(event.getEventId());
		
		//event table에서 eventId에 해당하는 모든 row 삭제
		System.out.println("삭제할 eventId:"+event.getEventId());
		eventDAO.deleteEvent(event.getEventId());
		//event_class table에서 eventId의 eventNo에 해당하는 모든 row 삭제
		//==> event_no를 외래키로 갖고 해당 키가 삭제되면 설정으로 
		
		//들고온 카테고리 event에 SET!!!
		event.setCategory(categorys); 
		//addEvent 호출 바뀐내용 INSERT
		addEventAdmin(event);
		
		//insertEvent하면서 부득이하게 eventId가 바뀜.=> 시퀀스로 마지막에 추가된 eventId 가져옴.
		List<HobbyClass> lastEvent = new ArrayList<HobbyClass>();
		lastEvent = eventDAO.getLastEvent();
		//수정내용을 뿌려줘야 하기때문에 UPDATE지만 수정된 eventId를 리턴해줌.
		return lastEvent.get(0).getEvent().getEventId();
		
	}
	
	@Override
	public Map<String, Object> getEventListGroupBYId(Search search) throws Exception {
		
		List<Event> list =  eventDAO.getEventListGroupBYId(search);
		int total = eventDAO.getTotalEventListGroupBYId(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

}
