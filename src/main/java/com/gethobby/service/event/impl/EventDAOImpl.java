package com.gethobby.service.event.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.event.EventDAO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//Constructor
	public EventDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass()+" default ");
	}

	public void setSqlSession(SqlSession sqlSession) {
		//this.sqlSession = sqlSession;
		System.out.println(getClass()+".setSqlSession ");
	}
	
	@Override
	public void deleteSelectedEvent(ArrayList<Integer> eventIdList) throws Exception {
		System.out.println("///////////////////n/n/n/n"+eventIdList);
		sqlSession.delete("EventMapper.deleteSelectedEvent", eventIdList);
	}

	@Override
	public List<Event> getEventListAdmin(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		System.out.println(map);
		//위처럼 통채로 넣어보고 Mapper에서 꺼내서 안써지면 아래처럼 빼서 넣어줄것.
		//map.put("pagesize", search.getPageSize());
		
		
		//Date객체로 SYSDATE뽑아냄. => String 문자열 형식(yy/mm/dd)으로 형변환.
		
		//List<Event> li = sqlSession.selectList("EventMapper.get", map);
		//System.out.println("::::"+li);
		List<Event> list = sqlSession.selectList("EventMapper.getEventListNewest", map);
		//==> 최신순으로 뽑아오는 건 똑같으니까 이걸로 뽑아오돼 eventImage는 쓰지않음.(View에서)
		System.out.println(list);
		
		return list;
	}
	
	
	//일반회원, 비회원이 보는 리스트출력 메서드
	@Override
	public List<Event> getEventList(Search search) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Event> list = new ArrayList<Event>();
		
		//Date객체로 SYSDATE뽑아냄. => String 문자열 형식(yy/mm/dd)으로 형변환.
		//Mapper로 들고가기위한 SYSDATE얻는 코드
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		
		String today = date.format(System.currentTimeMillis());
		//System.out.println("today:"+today);
		
		map.put("search", search);
		map.put("today", today);
		
		//////////////if문을 Mapper에서 처리하기위한 Test
		list = sqlSession.selectList("EventMapper.getEventList", map);
		
		System.out.println("DAOImpl List:"+list);
		return list;
	}

	//각 리스트의 총 갯수를 가져오는 메서드
	@Override
	public int getTotalCount(Search search) throws Exception {
		
		//System.out.println("sesesese:"+search);
		int totalCount = 0;
		//System.out.println("DAOImpl의 정렬확인:"+search.getSearchCondition());
		
		//Mapper로 들고가기위한 SYSDATE얻는 코드
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		
		Calendar c = Calendar.getInstance();
		String today = date.format(c.getTime());
		System.out.println("today:"+today); //=>Mapper에서 SYSDATE으로 해결
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("today", today);
		map.put("search", search);
		totalCount = sqlSession.selectOne("EventMapper.getEventListTotalCount",map);
		
		return totalCount;
	}
	
	@Override
	public List<String> getEventCategory(int eventId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("EventMapper.getEventCategory", eventId);
	}
	
	@Override
	public Event getEventWithoutCategory(int eventId) throws Exception {
		
		//System.out.println("DAOImpl로 넘어온 eventId: "+eventId);
		
		Event event = new Event(); 
		//eventId에 해당하는 이벤트의 상세정보 가져오는 쿼리
		return sqlSession.selectOne("EventMapper.getEventWithoutCategory", eventId);
		//System.out.println("확인:"+event);
		
//		List<String> categorys = new ArrayList<String>();
//		List<String> eventCategory = new ArrayList<String>();
//		
//		//한 이벤트에 설정된 여러개의 카테고리 가지고오는 쿼리
//		categorys = sqlSession.selectList("EventMapper.getEventCategory", eventId);
//		//System.out.println("::"+categorys);
//			
//		for (int i = 0; i < categorys.size(); i++) {
//			
//			eventCategory.add(i, categorys.get(i));
//		}
//		
//		event.setCategory(eventCategory);
//		System.out.println("getEvent: "+event);
//		return event; 
	}

	
	@Override
	public List<Event> getInsertClassNo(String category) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("EventMapper.getInsertClassNo", category);
	}
	
	@Override
	public void insertEventAdmin(Map<String, Object> map) throws Exception {
//		
//		System.out.println("///////////////////////////////////////");
//		System.out.println("insertEventAdmin 실행");
//		
//		//insert하려는 이벤트의 카테고리
//		List<String> InsertCategory = event.getCategory();
//		System.out.println("Insert할 모든 category: "+InsertCategory);
//		
//		Map<String, Object> addMap = new HashMap<String, Object>() ;
//		//table에 있는 마지막 eventId가져와서 거기에 +1해줘서 겹치는 일 없게 / 유니크한 값 가지게 설정하는 과정//////
//		//단일 category 때문에 HobbyClass Domain사용.
//		List<HobbyClass> lastEvent = new ArrayList<HobbyClass>();
//		lastEvent = sqlSession.selectList("EventMapper.getLastEvent"); //처음에는 마지막Row에 해당하는 eventId만 사용
//		System.out.println("테이블의 마지막EventId확인: "+lastEvent.get(0).getEvent().getEventId());
//		System.out.println("1111"+lastEvent);
//		event.setEventId(lastEvent.get(0).getEvent().getEventId()+1); //list의 몇번째이던 event_id는 같으므로 상관없음
//		System.out.println("들어갈 eventId: "+event.getEventId());
//		for (int i = 0; i < InsertCategory.size(); i++) {
//			
//			addMap.put("sendCategory", InsertCategory.get(i)); //카테고리가 여러개이기때문에 이렇게 굳이 따로 넣어줌.
//			addMap.put("event", event);
//			System.out.println(i+"번째 insert:"+addMap);
//			sqlSession.insert("EventMapper.addEventAdmin", addMap);
//		}
		sqlSession.insert("EventMapper.addEventAdmin", map);
		
//		////////////////////////////////////////////////
//		//event_class table에 insert하는 과정/////////////
//		lastEvent = sqlSession.selectList("EventMapper.getLastEvent"); //마지막Row에 해당하는 eventNo,category 사용
////		System.out.println("2222"+lastEvent);
//		List<Event> makeClassNoList = new ArrayList<Event>();
//		List<Integer> classNoList = new ArrayList<Integer>();
//		Map<String, Object> eventclassMap = new HashMap<String, Object>();
//
//		for (int i = 0; i < lastEvent.size(); i++) {
//			
//			//event_class table에 들어갈 eventNo
//			int event_classEventNo = lastEvent.get(i).getEvent().getEventNo();
//			System.out.println("event_classEventNo:"+event_classEventNo);
//			eventclassMap.put("event_classEventNo", event_classEventNo);  //event_class의 EventNo
//
//			String upperCategory = lastEvent.get(i).getCategory().toUpperCase();
//			System.out.println("대문자로 변환:"+upperCategory);
//			//클래스table에 카테고리 하나씩 들고감.
//			makeClassNoList = sqlSession.selectList("EventMapper.getInsertClassNo", upperCategory);
//			
//			//event_class의 ClassNo
//			for (int j = 0; j < makeClassNoList.size(); j++) {
//			//classNoList.add(i, (makeClassNoList.get(j).getHobbyClass() ).getHobbyClassNo() );
//			System.out.println(j+"번째 classNoList:"+makeClassNoList.get(j).getHobbyClass().getHobbyClassNo());
//			eventclassMap.put("classNo", makeClassNoList.get(j).getHobbyClass().getHobbyClassNo());	//event_class의 ClassNo
//			sqlSession.insert("EventMapper.addIntoEvent_Class", eventclassMap);
//			}
//			
//			System.out.println("일단 과정 끝");
//		}

	}
	
	@Override
	public void addIntoEventClass(Map<String, Object> map) throws Exception {
		
		sqlSession.insert("EventMapper.addIntoEvent_Class", map);		
	}

	
	
	@Override
	public void deleteEvent(int eventId) throws Exception {
		sqlSession.delete("EventMapper.deleteEvent", eventId);
	}
	
	@Override
	public List<HobbyClass> getLastEvent() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("EventMapper.getLastEvent");
	}
	
	@Override
	public List<Integer> getDeleteEventNoList(int eventId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("EventMapper.getDeleteEventNoList", eventId);
	}
	
	@Override
	public void updateEventAdminExceptCategory(Event event) throws Exception {
		
		System.out.println("updateEventAdminExceptCategory DAOImpl확인:"+event);
		
		//들고온 카테고리 List에 저장
		List<String> categorys = new ArrayList<String>();
		for (int i = 0; i < event.getCategory().size(); i++) {
			categorys.add(i, event.getCategory().get(i));
		}
		
		//eventId에 해당하는 이벤트 update
		sqlSession.update("EventMapper.updateEventAdminExceptCategory", event);
		
		
		///////////ServiceImpl로 이전//////////////
		////////////////////////////////////////////////
//		//getEvent(eventId)해서 카테고리 제외 모든 내용 가져옴.
//		event = sqlSession.selectOne("EventMapper.getEvent", event.getEventId());
//		System.out.println("수정된 내용:"+event);
		
//		//eventId에 해당하는 모든 row 삭제
//		sqlSession.delete("EventMapper.deleteEvent", event.getEventId());
		
//		//insertEvent 호출
//		event.setCategory(categorys);
//		insertEventAdmin(event);
		
//		//insertEvent하면서 부득이하게 eventId가 바뀜.=> 시퀀스로 마지막에 추가된 eventId 가져옴.
//		List<HobbyClass> lastEvent = new ArrayList<HobbyClass>();
//		lastEvent = sqlSession.selectList("EventMapper.getLastEvent");
//		//수정내용을 뿌려줘야 하기때문에 UPDATE지만 수정된 eventId를 리턴해줌.
//		return lastEvent.get(0).getEvent().getEventId();	 
		
			///방법1
			//updateEvent(eventId) 수정하기 클릭시
			//들고온 카테고리 List에 저장해놓고  => 1(DAO)
			//eventId에 해당하는 이벤트 update (Mapper)
			//getEvent(eventId) 해서 카테고리 제외 모든 내용 가져옴. (Mapper) => event에 저장해놓고 (DAO)
			//eventId에 해당하는 모든 row 삭제 (Mapper)
			//insertEvent (Mapper)
			
			//방법2
			///카테고리 제외 업데이트 (Mapper)
			///카테고리 업데이트 (Mapper)
			//카테고리 필요없어진 row수 만큼 삭제(Mapper)
			
		
	}
	
	@Override
	public List<Event> getEventListGroupBYId(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Event> list = new ArrayList<Event>();
		
		//Date객체로 SYSDATE뽑아냄. => String 문자열 형식(yy/mm/dd)으로 형변환.
		//Mapper로 들고가기위한 SYSDATE얻는 코드
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		
		String today = date.format(System.currentTimeMillis());
		//System.out.println("today:"+today);
		
		map.put("search", search);
		map.put("today", today);
		list = sqlSession.selectList("EventMapper.getEventListGroupBYId", map);
		System.out.println("\n\n\nDAOImpl의 getEventListGroupBYId\n----"+list);

		return list;
		
	}
	
	@Override
	public int getTotalEventListGroupBYId(Search search) throws Exception {
		
		int totalCount = 0;
		//Mapper로 들고가기위한 SYSDATE얻는 코드
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
				
		Calendar c = Calendar.getInstance();
		String today = date.format(c.getTime());
		System.out.println("today:"+today); //=>Mapper에서 SYSDATE으로 해결
				
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("today", today);
		map.put("search", search);
		totalCount =	sqlSession.selectOne("EventMapper.getTotalEventListGroupBYId", map);
		System.out.println("\n\n\nDAOImpl의 getTotalEventListGroupBYId----"+totalCount);
		return totalCount;
		
	}


}
