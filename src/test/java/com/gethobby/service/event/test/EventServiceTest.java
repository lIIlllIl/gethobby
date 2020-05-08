package com.gethobby.service.event.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.event.EventService;

/*
 *	FileName :  EventServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {  "classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
		 							"classpath:config/context-transaction.xml"} )
public class EventServiceTest {
	
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;

	public EventServiceTest() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Test
	public void testaddEventAdmin()throws Exception{
		
		Event event = new Event();
		event.setEventTitle("0000이벤트"); // 
		//event.setEventId(15); //검색할 떄(getEvent) 쓰려고  Unique한 eventId 
		//==> jsp에서 저장하는거 말이 안됨. 로직으로 +1 되게 만들어야함.==>DAOImpl에서......
		event.setEventStartDate( Date.valueOf("2020-01-11")); //DATE 타입
		//Date startDate = Date.valueOf("2020-02-10");
		//System.out.println("startDate: "+event.getEventStartDate());
		//System.out.println(Date.valueOf("2020-02-10"));
		event.setEventEndDate( Date.valueOf("2020-01-11")); //DATE 타입
		//Date endDate = Date.valueOf("2020-02-29");
		//System.out.println("endDate: "+event.getEventEndDate());
		event.setEventContent("이벤트 내용내용");
		event.setEventDiscount(20);
		event.setEventImage("hhh.jpg");
	
		
		List<String> list = new ArrayList<String>();
		
//		for (int i = 0; i < 6 ; i++) {
//			list.add(i, selectedCategory);
//		}
		list.add(0, "e"); //exercise
		list.add(1, "m"); //music
		//list.add(2, "h"); //handcraft
		//list.add(3, "c"); //cook
		
		event.setCategory(list); //
		
		//System.out.println(event);
		
		eventService.addEventAdmin(event);
		
		System.out.println("성공");
		
	}
	
	//@Test
	public void testGetEvent()throws Exception{
		
		Event event = new Event();
		//event.setEventTitle("이벤트Test"); //찾으려는 이벤트 이름
		
		event = eventService.getEvent(13);
		
		System.out.println("성공확인: "+event);
		
		Assert.assertEquals("zzz.jpg", event.getEventImage());
		//Assert.assertEquals("20-02-29", event.getEventStartDate());
		
	}
	
	//@Test
	public void testGetEventListAdmin()throws Exception{
		
		Search search = new Search();

		//searchCondition이 "전체"인것만 출력.
		search.setSearchCondition("전체");
		
		search.setPageSize(pageSize*3);
		search.setCurrentPage(1);
		
		Map<String, Object> map = eventService.getEventListAdmin(search);
		List<Event> list = (List<Event>) map.get("list");
		int totalCount = (Integer) map.get("totalCount");
		
		System.out.println("성공\n"+list+"\ntotalCount:"+totalCount);
		//Event event = new Event();
		
	}
	
	//@Test
	public void testGetEventList()throws Exception{
		
		Search search = new Search();
		search.setPageSize(pageSize*3);
		search.setCurrentPage(1);
		
		//searchCondition이 "전체"인것
		search.setSearchCondition("전체");
		
		//searchCondition이 "종료"인것
		//search.setSearchCondition("종료");
		
		//searchCondition이 "진행중"인것
		//search.setSearchCondition("진행중");
		
		//매개변수:
		Map<String, Object> map = eventService.getEventList(search);
		List<Event> list = (List<Event>) map.get("list");
		int totalCount = (Integer) map.get("totalCount");
		
		System.out.println("성공\n"+list+"\ntotalCount:"+totalCount);
		
	}
	
	@Test
	public void testUpdateEventAdmin()throws Exception{
		
		Event event = eventService.getEvent(34);
		Assert.assertNotNull(event);
		
		//Assert.assertEquals("새해 이벤트", event.getEventTitle());
		//Assert.assertEquals("zzz.jpg", event.getEventImage());
		
//		//카테고리 작업
//		int before = 0; //update전 카테고리 갯수
//		int after = 0;  //update할 카테고리 갯수
//		before = (event.getCategory() ).size() ;
		
		//update할 내용 SET
		event.setEventContent("수정되는 내용임");
		event.setEventDiscount(20);
		List<String> categorys = new ArrayList<String>();
		categorys.add(0, "h");
		categorys.add(1, "m");
		event.setCategory(categorys);
		
//		after = (event.getCategory()).size();
//		if(before > after) {
//			eventService.deleteNoCategory(event.getEventId(), before - after);
//		}
		
		
		System.out.println("update전:"+event);
		int newEventId = eventService.updateEventAdmin(event);
		
		event = eventService.getEvent(newEventId);
		System.out.println("update후:"+event);
		
		
	}
	
	

}
