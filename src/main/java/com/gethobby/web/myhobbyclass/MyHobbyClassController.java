package com.gethobby.web.myhobbyclass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;
import com.gethobby.service.myhobbyclass.MyHobbyClassService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;

@Controller
@RequestMapping("/myHobbyClass/*")
public class MyHobbyClassController {
	@Autowired
	@Qualifier("myHobbyClassServiceImpl")
	private MyHobbyClassService myHobbyClassService;
	
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public MyHobbyClassController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "getSteamHobbyClassList" )
	public String getSteamHobbyClassList(HttpSession session, Model model) throws Exception {
		User user = (User)session.getAttribute("user");

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
		inputData.put("search", search);
		
		Map<String, Object> map = myHobbyClassService.getSteamHobbyClassList(inputData);

		model.addAttribute("steamHobbyClassList", map.get("list"));
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		return "forward:/myhobbyclass/listSteamHobbyClass.jsp";    
	}
	
	@RequestMapping( value = "getHobbyClassBuyerStats" )
	public String getHobbyClassBuyerStats(@RequestParam("hobbyClassNo") int hobbyClassNo, Model model) throws Exception {
		
		model.addAttribute("hobbyClassNo", hobbyClassNo);
		
		return "forward:/myhobbyclass/getHobbyClassBuyerStats.jsp";
	}
	
	@RequestMapping( value = "getPurchaseHobbyClassSchedule" ) 
	public String getPurchaseHobbyClassSchedule() throws Exception {
		return "forward:/myhobbyclass/getPurchaseHobbyClassSchedule.jsp";
	}
	
}
