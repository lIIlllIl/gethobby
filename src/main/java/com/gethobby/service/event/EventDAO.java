package com.gethobby.service.event;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;

public interface EventDAO {
	
	Event event = new Event();
	
	public List<Event> getEventList(Search search)throws Exception;
	
	public Event getEventWithoutCategory(int eventId)throws Exception;
	
	public List<String> getEventCategory(int eventId)throws Exception;
	
	public void insertEventAdmin(Map<String, Object> map)throws Exception;
	
	public List<Event> getInsertClassNo(String category)throws Exception;
	
	public void addIntoEventClass(Map<String, Object> map)throws Exception;
	
	public List<Event> getEventListAdmin(Search search)throws Exception;
	
	public int getTotalCount(Search search)throws Exception;
	
	public void updateEventAdminExceptCategory(Event event)throws Exception;
	
	public List<Integer> getDeleteEventNoList(int eventId)throws Exception;
	
	public void deleteEvent(int eventId)throws Exception;
	
	//public Event getEvent2(int eventId)throws Exception;
	
	public List<HobbyClass> getLastEvent()throws Exception;

	public List<Event> getEventListGroupBYId(Search search)throws Exception;
	
	public int getTotalEventListGroupBYId(Search search)throws Exception;
	
	//어드민이 선택삭제하는 메서드
	public void deleteSelectedEvent(ArrayList<Integer> eventIdList)throws Exception;


}
