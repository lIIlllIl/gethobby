package com.gethobby.web.event;

import java.net.URLDecoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.User;
import com.gethobby.service.event.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {

	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	

	
	//Constructor
	public EventController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	@RequestMapping(value = "eventList")
	public String eventList( Model model, @ModelAttribute("search") Search search,
						HttpSession session)throws Exception{
		
		System.out.println("\n\n\n\n\\n\n\n/eventList\n");
		User user = (User)session.getAttribute("user");
		System.out.println("세션의 User--"+user);
		//System.out.println("\n\nsearchCondition--\n"+search.getSearchCondition());
		
		search.setPageSize(pageSize);
		search.setCurrentPage(1);
		 
		if(user != null) { 
			if(user.getUserId().equals("admin@naver.com")) {
				search.setPageSize(pageSize*3); 
			}
		}
		
		
		if(search.getSearchCondition()==null || search.getSearchCondition().equals("0") || search.getSearchCondition().equals("")) {
			search.setSearchCondition("전체"); //==>얘가 기본
		}else if(search.getSearchCondition().equals("1")) {
			search.setSearchCondition("진행중"); //==>얘가 기본
		}else if(search.getSearchCondition().equals("2")) {
			search.setSearchCondition("종료"); //==>얘가 기본

		}
		
		//System.out.println(".."+search.getSearchCondition()+"..");
		
		//jsp에서 받아온 search에 searchCondition들어있음. (진행중/ 종료/ 전체)
		//service갈때 들고가는 search에 (진행중/ 종료/ 전체)의 searchCondition도 들어있음.
		//searchCondition이 "전체"인것
		
		System.out.println("CurrentPage---"+search.getCurrentPage()+"\npageSize---"+search.getPageSize()+
					"\nSearchCondition---"+search.getSearchCondition());
		
		
		//searchCondition이 "종료"인것
		//search.setSearchCondition("종료");
		
		//searchCondition이 "진행중"인것
		//search.setSearchCondition("진행중");
		Map<String, Object>map = eventService.getEventListGroupBYId(search);
		System.out.println("\n\n\n\n\n\n\n"+map.get("list")+"\n"+map.get("total"));
		System.out.println("\n\n\n\n\n\nsize--"+((List<Event>)(map.get("list") )) .size());
		List<Event> list = (List<Event>)map.get("list");
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, search.getPageSize());
		
//		if(user != null) {
//			if(user.getUserId().equals("admin@naver.com")) {
//				
//				 resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize*3);
//			}
//		}
		
		System.out.println("\n\n\nresultPage=====\n"+resultPage);
		model.addAttribute("list", list);
		model.addAttribute("total", map.get("total"));
		model.addAttribute("resultPage", resultPage);

	
		  if(user != null) { 
			  if(user.getUserId().equals("admin@naver.com")) {
				  return  "forward:/event/listEventAdmin.jsp";
		  
			  }else {
		  
				  return "forward:/event/listEvent.jsp"; }
		  }
		  
		  	return "forward:/event/listEvent.jsp";
		  
		 
	}
	
	@RequestMapping(value = "getEvent")
	public String getEvent(@RequestParam int eventId, Model model)throws Exception{
		
		System.out.println("/getEvent");
		System.out.println("eventId----"+eventId);
		
		Event event = eventService.getEvent(eventId);
		model.addAttribute("event", event);
		
		return "forward:/event/getEvent.jsp";
	}
	
	@RequestMapping(value = "addEvent", method = RequestMethod.POST)
	public String addEvent(Model model, @ModelAttribute("event") Event event)throws Exception{
		
		System.out.println("\n\n\n/addEvent\n\n");
		//System.out.println("Controller확인---\n\neventContent:"+event.getEventContent());
		//System.out.println("Controller확인---\n\nevent:"+event);
		//return "forward:/event/getEvent" ==>get해서 이벤트 정보갖고 이벤트 다시 뿌려줄예정
		///임시로..
		//event.setEventStartDate( Date.valueOf("2020-02-16"));
		//event.setEventEndDate( Date.valueOf("2020-02-16"));
		//List<String> list = new ArrayList<String>();
		//list.add(0, "E");
		//list.add(1, "M");
		//event.setCategory(list);
		//event.setEventDiscount(20);
		
		System.out.println("\n\n이벤트카테고리---\n"+event.getCategory());
		System.out.println("\n\n이벤트카테고리---\n"+event.getCategory().get(0));
		
		System.out.println("\n\n이벤트내용---\n"+event.getEventContent());
		System.out.println("\n\n이벤트내용---\n"+event.getEventDiscount());
 
		////썸네일 이미지 만드는과정
		int startIndex = event.getEventContent().indexOf("/kyung/");
		int endIndex = event.getEventContent().indexOf("width");
		//System.out.println("index\n"+event.getEventContent().indexOf("/kyung/"));
		//System.out.println("index\n"+event.getEventContent().indexOf("width"));
		//System.out.println("index\n"+event.getEventContent().indexOf("src="));
		String thumbnail = event.getEventContent().substring(startIndex+7, endIndex-9);
		//System.out.println("thumbnail----\n"+thumbnail);
		event.setEventImage(thumbnail);
		
		System.out.println("Controller확인---\n\nevent:"+event);
//		
//		SimpleDateFormat start = new SimpleDateFormat("yy/MM/dd");
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String startDate = start.format(System.currentTimeMillis());
//		Date to = transFormat.parse(startDate);
//		event.setEventStartDate(start);

		eventService.addEventAdmin(event);
		System.out.println("이벤트등록 성공");
		return "forward:/event/eventList";
		//return null;
	}
	
	//admin이 선택한 항목들 일괄 삭제하는 메서드
	@RequestMapping(value = "deleteSelectedEvent", method = RequestMethod.GET)
	//public String deleteSelectedEvent(@RequestParam ArrayList<Integer> eventIds )throws Exception{
	public String deleteSelectedEvent(Model model, @ModelAttribute("search") Search search,
								HttpSession session, @RequestParam ArrayList<Integer> eventIds )throws Exception{
		
		System.out.println("\n\n선택삭제하는 Controller //deleteSelectedEvent--\n");
		System.out.println("삭제하려는 eventId\n"+eventIds);
		User user = (User)session.getAttribute("user");
		System.out.println("\nuser--\n"+user);
		
//		System.out.println("현재페이지 확인--\n"+search.getCurrentPage());
//		//페이지가져와서 유지시켜줘야할듯
		search.setPageSize(pageSize*3);
		
		eventService.deleteSelectedEvent(eventIds);
		
		search.setSearchCondition("종료");
		//model.addAttribute("search", search);
		return "forward:/event/eventList?searchCondition="+search.getSearchCondition();
		//return null;
		
	}
	
	@RequestMapping(value = "deleteOneEventAdmin", method = RequestMethod.GET)
	public String deleteOneEventAdmin(@RequestParam int eventId)throws Exception{
		
		System.out.println("/deleteOneEvent");
		System.out.println("들어온 eventId확인:\n"+eventId);
		
		eventService.deleteOneEvent(eventId);

		Search search = new Search();
		search.setSearchCondition("전체");
		return "forward:/event/eventList?searchCondition="+search.getSearchCondition();
		
	}
	
	@RequestMapping(value = "updateOneEventViewAdmin", method = RequestMethod.GET)
	public String updateOneEventViewAdmin(@RequestParam int eventId, Model model)throws Exception{
		
		System.out.println("\n\n\n/updateOneEventViewAdmin");
		System.out.println("들어온 eventId확인View:\n"+eventId);
		
		Event event = eventService.getEvent(eventId);
		System.out.println("가져온 Event----\n"+event);
		model.addAttribute("event", event);
		return "forward:/event/updateEventView.jsp";
		
	}
	
	@RequestMapping(value = "updateOneEventAdmin", method = RequestMethod.POST)
	public String updateOneEventAdmin(Model model, @ModelAttribute("event") Event event)throws Exception{
		
		System.out.println("\n\n\n/updateOneEventAdmin");
		System.out.println("\nevent=>"+event);
		
		////썸네일 이미지 만드는과정
		//이미지 새로 등록안하고 기존의 이미지 쓸경우=> 이름에 <img src= ...>  width가 없어서 에러발생.    src="/images/kyung/1581924834433.jpeg"
		if( event.getEventContent().contains("width") == false) { //width가 없으면
			System.out.println("\n\n기존 썸네일 이미지 사용\n\n");
		}else {
			int startIndex = event.getEventContent().indexOf("/kyung/");
			int endIndex = event.getEventContent().indexOf("width");
			System.out.println("\n\n썸네일 이미지 바뀜.\n width있음 \n\n");
			//System.out.println("index\n"+event.getEventContent().indexOf("/kyung/"));
			//System.out.println("index\n"+event.getEventContent().indexOf("width"));
			//System.out.println("index\n"+event.getEventContent().indexOf("src="));
			String thumbnail = event.getEventContent().substring(startIndex+7, endIndex-9);
			//System.out.println("thumbnail----\n"+thumbnail);
			event.setEventImage(thumbnail);
		}
		
		System.out.println("Controller확인---\n\nevent:"+event);
		
		return "forward:/event/getEvent?eventId="+event.getEventId();
		//return null;
	}
	

}
