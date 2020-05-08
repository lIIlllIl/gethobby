package com.gethobby.web.myhobbyclass;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.myhobbyclass.MyHobbyClassService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;


@RestController
@RequestMapping("/myHobbyClass/*")
public class MyHobbyClassRestController {
	
	@Autowired
	@Qualifier("myHobbyClassServiceImpl")
	private MyHobbyClassService myHobbyClassService;
	
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	public MyHobbyClassRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "json/addSteamHobbyClass" )
	public Map<String, Object> addSteamHobbyClass(@RequestBody Map<String, String> jsonMap, HttpSession session) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		User user = (User)session.getAttribute("user");
		String userId = null;
		
		try {
			userId = user.getUserId();
		} catch (Exception e) {
			returnMap.put("result", "error");
			return returnMap;
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData); 
		
		int steamCount = hobbyClass.getSteamCount() + 1;
		
		inputData = new HashMap<String, Object>();
		
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		inputData.put("steamCount", steamCount);

		myHobbyClassService.addSteamHobbyClass(inputData);
		
		hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		returnMap.put("hobbyClass", hobbyClass);
		returnMap.put("result", "ok");
		return returnMap;
	}
	
	@RequestMapping( value = "json/deleteSteamHobbyClass" ) 
	public Map<String, Object> deleteSteamHobbyClass( @RequestBody Map<String, String> jsonMap, HttpSession session ) throws Exception {
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}

		int steamCount = Integer.parseInt(jsonMap.get("steamCount")) + - 1;
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		inputData.put("steamCount", steamCount);
		
		myHobbyClassService.deleteSteamHobbyClass(inputData);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("hobbyClass", hobbyClass);
		returnMap.put("result", "ok");
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getSteamHobbyClassList" )
	public Map<String, Object> getSteamHobbyClassList(HttpSession session) throws Exception {
		Search search = new Search();

		search.setCurrentPage(1);

		search.setPageSize(10000);

		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) { 
			userId = user.getUserId();
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> map = myHobbyClassService.getSteamHobbyClassList(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("steamHobbyClassList", map.get("list"));
		return returnMap;
	}
	
	@RequestMapping( value = "json/getPurchaseHobbyClassSchedule" )
	public Map<String, Object> getPurchaseHobbyClassSchedule(HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		if (user != null) {
			userId = user.getUserId();
		}
		
		List<HobbyClass> hobbyClassList = myHobbyClassService.getPurchaseHobbyClassSchedult(userId);
		
		List<Map<String, Object>> eventRegisterMapList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> eventStartMapList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < hobbyClassList.size(); i++) {
			Map<String, Object> eventMap = new HashMap<String, Object>();
			
			eventMap.put("id", i);
			
			eventMap.put("title", hobbyClassList.get(i).getHobbyClassName());
			
			eventMap.put("start", hobbyClassList.get(i).getStartDate());
			eventMap.put("end", hobbyClassList.get(i).getEndDate());
			
			Map<String, Object> extendedProps = new HashMap<String, Object>();
			extendedProps.put("hobbyClassNo", hobbyClassList.get(i).getHobbyClassNo());
			
			if ( hobbyClassList.get(i).getHobbyClassState().equals("3") ) {
				eventMap.put("color", "rgb(42, 143, 180)");

				extendedProps.put("classState", "수요조사 중");
			}
			else if ( hobbyClassList.get(i).getHobbyClassState().equals("5") ) {
				eventMap.put("color", "rgb(253, 126, 20)");

				extendedProps.put("classState", "개강 중");
			}

			extendedProps.put("startDate", hobbyClassList.get(i).getStartDate());
			extendedProps.put("endDate", hobbyClassList.get(i).getEndDate());
			extendedProps.put("title", hobbyClassList.get(i).getHobbyClassName());

			eventMap.put("extendedProps", extendedProps);
			
			if ( hobbyClassList.get(i).getHobbyClassState().equals("5") ) {
				eventStartMapList.add(eventMap);
			}
			else if ( hobbyClassList.get(i).getHobbyClassState().equals("3") ) {
				eventRegisterMapList.add(eventMap);
			}
			
			
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("eventRegister", eventRegisterMapList);
		returnMap.put("eventStart", eventStartMapList);
		return returnMap;
	}
	
	@RequestMapping( value = "json/getHobbyClassBuyerStats" ) 
	public Map<String, Object> getHobbyClassBuyerStats( @RequestBody Map<String, String> jsonMap, HttpSession session ) throws Exception {
		
		String hobbyClassNo = jsonMap.get("hobbyClassNo");
		
		List<Purchase> userPurchase = myHobbyClassService.getHobbyClassBuyerStats(hobbyClassNo);

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < 4; i++) {
			Calendar hobbyClassDate = Calendar.getInstance();
			hobbyClassDate.setTime(myHobbyClassService.getHobbyClassStateStartDate(hobbyClassNo).getStartDate());
			
			Calendar checkDate = hobbyClassDate;

			checkDate.add(Calendar.MONTH, i);
			
			String checkDateString = checkDate.get(Calendar.YEAR) + "-" + ( checkDate.get(Calendar.MONTH) + 1 ) + "-" + checkDate.get(Calendar.DAY_OF_MONTH);
			
			int male = 0;
			int female = 0;
			
			int one = 0;
			int two = 0;
			int three = 0;
			int four = 0;
			int overFive = 0;
			
			int totalCount = 0;
			
			Map<String, Object> outerMap = new HashMap<String, Object>();
			
			for (int j = 0; j < userPurchase.size(); j++) {
				
				Date purchaseDate = userPurchase.get(j).getPurchaseDate();
				Calendar purchaseCalendar = Calendar.getInstance();
				purchaseCalendar.setTime(purchaseDate);
				
				String userBirth = userPurchase.get(j).getUser().getBirth();
				
				Calendar current = Calendar.getInstance();
				int currentYear  = current.get(Calendar.YEAR);
				int currentMonth = current.get(Calendar.MONTH) + 1;
				int currentDay   = current.get(Calendar.DAY_OF_MONTH);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				Date date = formatter.parse(userBirth);
				Calendar userBirthCalendar = Calendar.getInstance();
				userBirthCalendar.setTime(date);
				
				int birthMonth = userBirthCalendar.get(Calendar.MONTH);
				int birthDay = userBirthCalendar.get(Calendar.DAY_OF_MONTH);
				
				int age = currentYear - Integer.parseInt(userBirth.substring(0, 4));
				
				if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
					age--;
				}
				
				if ( ( purchaseCalendar.get(Calendar.MONTH) == checkDate.get(Calendar.MONTH) ) && ( purchaseCalendar.get(Calendar.YEAR) == checkDate.get(Calendar.YEAR) ) ) {
					
					if ( userPurchase.get(j).getUser().getSex().equals("M") ) {
						male++;
						totalCount++;
					}
					else {
						female++;
						totalCount++;
					}
					
					if ( age / 10 == 1 ) {
						one++;
					}
					else if ( age / 10 == 2 ) {
						two++;
					}
					else if ( age / 10 == 3 ) {
						three++; 
					}
					else if ( age / 10 == 4 ) {
						four++;
					}
					else if ( age / 10 >= 5 ) {
						overFive++;
					}
				}
						
				
			}
			
			Map<String, Object> innerMap = new HashMap<String, Object>();
			
			innerMap.put("male", male);
			innerMap.put("female", female);
			innerMap.put("one", one);
			innerMap.put("two", two);
			innerMap.put("three", three);
			innerMap.put("four", four);
			innerMap.put("overFive", overFive);
			innerMap.put("total", totalCount);
			
			outerMap.put("calendar", checkDateString);
			outerMap.put("data", innerMap);
			
			returnList.add(outerMap);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("statsList", returnList);
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getHobbyClassBuyerAgeStats" ) 
	public Map<String, Object> getHobbyClassBuyerAgeStats( @RequestBody Map<String, String> jsonMap ) throws Exception {
		String hobbyClassNo = jsonMap.get("hobbyClassNo");
		
		List<Purchase> userPurchase = myHobbyClassService.getHobbyClassBuyerStats(hobbyClassNo);
		
		Calendar target = Calendar.getInstance();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		
		SimpleDateFormat targetFormatter = new SimpleDateFormat("yyyy-MM-dd");
		Date targetDate = targetFormatter.parse(jsonMap.get("dateTarget"));
		
		target.setTime(targetDate);
		int one = 0;
		int two = 0;
		int three = 0;
		int four = 0;
		int overFive = 0;
		
		int male = 0;
		int female = 0;
		
		int checkValue = 0; 
		
		for (int i = 0; i < userPurchase.size(); i++) {
			Date purchaseDate = userPurchase.get(i).getPurchaseDate();
			Calendar purchaseCalendar = Calendar.getInstance();
			purchaseCalendar.setTime(purchaseDate);
			
			String userBirth = userPurchase.get(i).getUser().getBirth();
			
			Calendar current = Calendar.getInstance();
			int currentYear  = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay   = current.get(Calendar.DAY_OF_MONTH);
			
			Date date = formatter.parse(userBirth);
			Calendar userBirthCalendar = Calendar.getInstance();
			userBirthCalendar.setTime(date);
			
			int birthMonth = userBirthCalendar.get(Calendar.MONTH);
			int birthDay = userBirthCalendar.get(Calendar.DAY_OF_MONTH);
			
			int age = currentYear - Integer.parseInt(userBirth.substring(0, 4));
			
			if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
				age--;
			}
			
			if ( ( purchaseCalendar.get(Calendar.MONTH) == target.get(Calendar.MONTH) ) && ( purchaseCalendar.get(Calendar.YEAR) == target.get(Calendar.YEAR) ) ) {
				checkValue++;
				
				if ( userPurchase.get(i).getUser().getSex().equals("M") ) {
					male++;
				}
				else {
					female++;
				}
				
				if ( age / 10 == 1 ) {
					one++;
				}
				else if ( age / 10 == 2 ) {
					two++;
				}
				else if ( age / 10 == 3 ) {
					three++; 
				}
				else if ( age / 10 == 4 ) {
					four++;
				}
				else if ( age / 10 >= 5 ) {
					overFive++;
				}
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("one", one);
		returnMap.put("two", two);
		returnMap.put("three", three);
		returnMap.put("four", four);
		returnMap.put("overFive", overFive);
		returnMap.put("male", male);
		returnMap.put("female", female);
		returnMap.put("checkValue", checkValue);
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getHobbyClassBuyerDateStats" ) 
	public Map<String, Object> getHobbyClassBuyerDateStats( @RequestBody Map<String, String> jsonMap ) throws Exception {
		String hobbyClassNo = jsonMap.get("hobbyClassNo");

		List<Purchase> userPurchase = myHobbyClassService.getHobbyClassBuyerStats(hobbyClassNo);
		
		List<String> calendarList = new ArrayList<String>();
		List<String> calendarNameList = new ArrayList<String>();
		for(int i = 0; i < 4; i++) {
			Calendar hobbyClassDate = Calendar.getInstance();
			hobbyClassDate.setTime(myHobbyClassService.getHobbyClassStateStartDate(hobbyClassNo).getStartDate());
			
			Calendar checkDate = hobbyClassDate;

			checkDate.add(Calendar.MONTH, i);
			
			String checkDateString = checkDate.get(Calendar.YEAR) + "년 " + ( checkDate.get(Calendar.MONTH) + 1 ) + "월";
			
			String checkDateCalendarString = checkDate.get(Calendar.YEAR) + "-" + ( checkDate.get(Calendar.MONTH) + 1) + "-" + checkDate.get(Calendar.DAY_OF_MONTH);
			calendarList.add( checkDate.get(Calendar.YEAR) + "-" + ( checkDate.get(Calendar.MONTH) + 1) + "-" + checkDate.get(Calendar.DAY_OF_MONTH) );
			calendarNameList.add(checkDateString);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("calendarList", calendarList);
		returnMap.put("calendarNameList", calendarNameList);
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getHobbyClassBuyerAllAgeStats" ) 
	public Map<String, Object> getHobbyClassBuyerAllAgeStats( @RequestBody Map<String, String> jsonMap ) throws Exception {
		String hobbyClassNo = jsonMap.get("hobbyClassNo");
		
		List<Purchase> userPurchase = myHobbyClassService.getHobbyClassBuyerStats(hobbyClassNo);

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		
		int male = 0;
		int female = 0;
		
		int one = 0;
		int two = 0;
		int three = 0;
		int four = 0;
		int overFive = 0;
		
		for(int i = 0; i < 7; i++) {
			Calendar hobbyClassDate = Calendar.getInstance();
			hobbyClassDate.setTime(myHobbyClassService.getHobbyClassStateStartDate(hobbyClassNo).getStartDate());
			
			Calendar checkDate = hobbyClassDate;

			checkDate.add(Calendar.MONTH, i);
			
			for (int j = 0; j < userPurchase.size(); j++) {
				
				Date purchaseDate = userPurchase.get(j).getPurchaseDate();
				Calendar purchaseCalendar = Calendar.getInstance();
				purchaseCalendar.setTime(purchaseDate);
				
				String userBirth = userPurchase.get(j).getUser().getBirth();
				
				Calendar current = Calendar.getInstance();
				int currentYear  = current.get(Calendar.YEAR);
				int currentMonth = current.get(Calendar.MONTH) + 1;
				int currentDay   = current.get(Calendar.DAY_OF_MONTH);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				Date date = formatter.parse(userBirth);
				Calendar userBirthCalendar = Calendar.getInstance();
				userBirthCalendar.setTime(date);
				
				int birthMonth = userBirthCalendar.get(Calendar.MONTH);
				int birthDay = userBirthCalendar.get(Calendar.DAY_OF_MONTH);
				
				int age = currentYear - Integer.parseInt(userBirth.substring(0, 4));
				
				if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
					age--;
				}
				
				if ( ( purchaseCalendar.get(Calendar.MONTH) == checkDate.get(Calendar.MONTH) ) && ( purchaseCalendar.get(Calendar.YEAR) == checkDate.get(Calendar.YEAR) ) ) {
					
					if ( userPurchase.get(j).getUser().getSex().equals("M") ) {
						male++;
					}
					else {
						female++;
					}

					if ( age / 10 == 1 ) {
						one++;
					}
					else if ( age / 10 == 2 ) {
						two++;
					}
					else if ( age / 10 == 3 ) {
						three++; 
					}
					else if ( age / 10 == 4 ) {
						four++;
					}
					else if ( age / 10 >= 5 ) {
						overFive++;
					}
				}
						
			}
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("male", male);
		returnMap.put("female", female);
		returnMap.put("one", one);
		returnMap.put("two", two);
		returnMap.put("three", three);
		returnMap.put("four", four);
		returnMap.put("overFive", overFive);
		returnMap.put("statsList", returnList);
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getRecentlyHobbyClassList" )
	public Map<String, Object> getRecentlyHobbyClassList(HttpServletRequest request, HttpSession session) throws Exception {
		String history = null;

		List<HobbyClass> hobbyClassList = new ArrayList<HobbyClass>(); 
		User user = (User)session.getAttribute("user");
		
		Cookie[] cookies = request.getCookies();
		if ( cookies != null && cookies.length > 0 ) {
			for (int i = 0; i < cookies.length; i++) {
				
				Cookie cookie = cookies[i];
				
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
			if ( history != null ) {
				String[] h = history.split(",");
				
				for ( int i = 0; i < h.length; i++ ) {
					int hobbyClassNo = Integer.parseInt(h[i]);
					HobbyClass hobbyClass = new HobbyClass(); 
					
					Map<String, Object> inputData = new HashMap<String, Object>();
					inputData.put("hobbyClassNo", hobbyClassNo);
					inputData.put("userId", user.getUserId());
					hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
					
					hobbyClassList.add(hobbyClass);
				}
			}
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("recentlyHobbyClassList", hobbyClassList);
		return returnMap;
	}
	
	@RequestMapping( value = "json/addCookies" )
	public Map<String, Object> addCookies(@RequestBody Map<String, String> jsonMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String hobbyClassNo = jsonMap.get("hobbyClassNo");

		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			
			if (cookies[i] == null) {
				cookies[i] = new Cookie("history", hobbyClassNo);
				cookies[i].setMaxAge(-1);
				response.addCookie(cookies[i]);
			}
			else if ( cookies[i] != null && cookies[i].getName().equals("history") ) {
				System.out.println("cookie before value : " + cookies[i].getValue());
				String[] c = cookies[i].getValue().split(",");
				boolean checkCookies = true;
				
				for(int j = 0; j < c.length; j++) {
					if ( c[j].equals(hobbyClassNo) ) {
						checkCookies = false;
						cookies[i] = new Cookie("history", cookies[i].getValue());
						break;
					}
				}
				
				if ( checkCookies ) {
					cookies[i] = new Cookie("history", cookies[i].getValue() + "," + hobbyClassNo);
					cookies[i].setMaxAge(-1);
					response.addCookie(cookies[i]);
					break;
				}
				else {
					cookies[i] = new Cookie("history", cookies[i].getValue());
					cookies[i].setMaxAge(-1);
					response.addCookie(cookies[i]);
				}
			}
			else {
				System.out.println("else : " + hobbyClassNo);
				cookies[i] = new Cookie("history", hobbyClassNo);
				cookies[i].setMaxAge(-1);
				response.addCookie(cookies[i]);
			}
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "ok");
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getRecommendHobbyClassList" )
	public Map<String, Object> getRecommendHobbyClassList(HttpSession session) throws Exception {
		Search search = new Search();

		search.setCurrentPage(1);

		search.setPageSize(12);

		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) { 
			userId = user.getUserId();
		}
		
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> map = myHobbyClassService.getRecommendHobbyClassList(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("recommendHobbyClassList", map.get("list"));
		return returnMap;
	}
	
	@RequestMapping( value = "json/getListenHobbyClassList" )
	public Map<String, Object> getListenHobbyClassList(HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("listenHobbyClassList", myHobbyClassService.getListenHobbyClassList(user.getUserId()));
		
		return returnMap;
	}
}
