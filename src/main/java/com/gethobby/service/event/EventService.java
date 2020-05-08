package com.gethobby.service.event;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;

@Service
public interface EventService {

	public Map<String, Object>getEventList(Search search)throws Exception;
	
	public Event getEvent(int eventId)throws Exception;
	
	public void addEventAdmin(Event event)throws Exception;
	
	public Map<String, Object>getEventListAdmin(Search search)throws Exception;
	
	public int updateEventAdmin(Event event)throws Exception;
	
	//추가된 메서드
	//public void deleteNoCategory(int eventId, int rowNo)throws Exception;	
	
	public Map<String, Object> getEventListGroupBYId(Search search)throws Exception;
	
	public void deleteSelectedEvent(ArrayList<Integer> eventIdList)throws Exception;
	
	public void deleteOneEvent(int eventId)throws Exception;
}
