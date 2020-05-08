package com.gethobby.web.lesson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;
import com.gethobby.service.lesson.LessonService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;


@RestController
@RequestMapping("/lesson/*")
public class LessonRestController {
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	public LessonRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "json/addLessonTimes" )
	public Map<String, Object> addLessonTimes(@RequestBody Map<String, String> jsonMap, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");

		Map<String, Object> inputData = new HashMap<String, Object>();
		
		inputData.put("lessonNo", jsonMap.get("lessonNo"));
		inputData.put("userId", user.getUserId());
		inputData.put("totalTimes", 0);
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		
		LessonTimes checkLessonTimes = lessonService.getLessonTimesCheck(inputData);
		
		if ( checkLessonTimes != null ) {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("result", "error : 이미 존재함");
			return errorMap;
		}
		lessonService.addLessonTimes(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "ok");
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/updateLessonTimes" ) 
	public Map<String, Object> updateLessonTimes(@RequestBody Map<String, String> jsonMap, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
	
		
		int currentTimes = Integer.parseInt(jsonMap.get("currentTimes"));
		int maxTimes = Integer.parseInt(jsonMap.get("maxTimes"));
		int totalTimes = Integer.parseInt(jsonMap.get("totalTimes"));
		
		if ( currentTimes > maxTimes ) {
			maxTimes = currentTimes;
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("currentTimes", currentTimes);
		inputData.put("maxTimes", maxTimes);
		inputData.put("userId", user.getUserId());
		inputData.put("lessonNo", jsonMap.get("lessonNo"));
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		inputData.put("totalTimes", totalTimes);
		lessonService.updateLessonTimes(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "ok");
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getLessonReplyList" )
	public Map<String, Object> getLessonReplyList( @RequestBody Map<String, String> jsonMap, HttpSession session ) throws Exception {
		Search search = new Search();
		
		int currentPage = Integer.parseInt(jsonMap.get("currentPage"));
		
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		inputData.put("userId", user.getUserId());
		inputData.put("lessonNo", jsonMap.get("lessonNo"));
		
		Map<String, Object> resultMap = lessonService.getLessonReplyList(inputData);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("replyList", resultMap.get("list"));

		returnMap.put("userId", user.getUserId());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		
		returnMap.put("resultPage", resultPage);
		
		return returnMap;
	}
	
	@RequestMapping( value = "json/getLessonReply" ) 
	public Map<String, Object> getLessonReply( @RequestBody Map<String, String> jsonMap, HttpSession session) throws Exception {		
		Reply reply = lessonService.getLessonReply(Integer.parseInt(jsonMap.get("replyNo")));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reply", reply);
		return returnMap;
	}
	
	@RequestMapping( value = "json/updateLessonReply" )
	public Map<String, Object> updateLessonReply( @RequestBody Map<String, String> jsonMap, HttpSession session ) throws Exception {
		Reply reply = new Reply();
		reply.setReplyNo(Integer.parseInt(jsonMap.get("replyNo")));
		reply.setReplyContent(jsonMap.get("replyContent"));
		
		lessonService.updateLessonReply(reply);
		reply = lessonService.getLessonReply(Integer.parseInt(jsonMap.get("replyNo")));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reply", reply);
		return returnMap;
	}
	
	@RequestMapping( value = "json/deleteLessonReply" ) 
	public Map<String, Object> deleteLessonReply( @RequestBody Map<String, String> jsonMap, HttpSession session) throws Exception {	
		lessonService.deleteLessonReply(Integer.parseInt(jsonMap.get("replyNo")));
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize( Integer.parseInt(jsonMap.get("currentPage")) * pageSize );
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		inputData.put("lessonNo", Integer.parseInt(jsonMap.get("lessonNo")));
		
		Map<String, Object> resultMap = lessonService.getLessonReplyList(inputData);
		
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("replyList", resultMap.get("list"));
		
		Page resultPage = new Page( Integer.parseInt(jsonMap.get("currentPage")), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		returnMap.put("resultPage", resultPage);
		return returnMap;
	}
	
	@RequestMapping( value = "json/getHobbyClassLessonContent" )
	public Map<String, Object> getHobbyClassLessonContent( @RequestBody Map<String, String> jsonMap, HttpSession session ) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", jsonMap.get("hobbyClassNo"));
		inputData.put("userId", user.getUserId());
		
		List<LessonTimes> lessonTimesList = searchHobbyClassService.getHobbyClassLessonContent(inputData);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lessonList", lessonTimesList);
		
		return returnMap;
	}
	
	@RequestMapping( value ="json/addLessonReply" )
	public Map<String, Object> addLessonReply( @RequestBody Reply reply, HttpSession session ) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		User user = (User)session.getAttribute("user");
		String userId = null;
		
		try {
			userId = user.getUserId();
		} catch (Exception e) {
			returnMap.put("result", "error");
			return returnMap;
		}
		
		User replyUser = new User();
		replyUser.setUserId(userId);
		
		reply.setUser(replyUser);
		
		lessonService.addLessonReply(reply);
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		inputData.put("lessonNo", reply.getLesson().getLessonNo());
		
		Map<String, Object> resultMap = lessonService.getLessonReplyList(inputData);
		
		returnMap.put("replyList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		
		returnMap.put("resultPage", resultPage);
		returnMap.put("result", "ok");
		return returnMap;
	}
	
	@RequestMapping( value = "json/getLessonList" )
	public Map<String, Object> getLessonList(@RequestBody Map<String, Integer> jsonMap) throws Exception {
		Map<String, Object> resultMap = lessonService.getLessonList(jsonMap.get("hobbyClassNo"));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lessonList", resultMap.get("list"));
		Page resultPage = new Page( 1, ((Integer)resultMap.get("total")).intValue(), 10, 3);
		
		returnMap.put("resultPage", resultPage);
		return returnMap;
	}
}
