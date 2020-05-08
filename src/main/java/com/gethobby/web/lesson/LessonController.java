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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.gethobby.service.lesson.LessonService;

@Controller
@RequestMapping("/lesson/*")
public class LessonController {
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	public LessonController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value ="getLesson" )
	public String getLesson(@RequestParam Map<String, Object> map, HttpSession session, Model model) throws Exception {

		String userId = null;
		
		User user = (User)session.getAttribute("user");
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
     	inputData.put("lessonNo", map.get("lessonNo"));
		inputData.put("hobbyClassNo", map.get("hobbyClassNo"));
     	
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		
		LessonTimes lesson = lessonService.getLesson(inputData);
		String videoSource = lesson.getLesson().getLessonVideo();
	
		videoSource = videoSource.substring(0, videoSource.indexOf(".")) + ".m3u8";
		lesson.getLesson().setLessonVideo(videoSource);
		model.addAttribute("lesson", lesson);
		Map<String, Object> replyMap = lessonService.getLessonReplyList(inputData);
		
		List<Reply> lessonReply = (List<Reply>)replyMap.get("list");
		model.addAttribute("replyList", lessonReply);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)replyMap.get("total")).intValue(), 10, pageSize);
		model.addAttribute("resultPage", resultPage);

		return "forward:/lesson/getHobbyClassLesson.jsp";
	}
	
	@RequestMapping( value = "getArrowLesson" )
	public String getArrowLesson( @RequestParam Map<String, String> map, HttpSession session, Model model ) throws Exception {

		User user = (User)session.getAttribute("user");

		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(map.get("currentPage")));
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		inputData.put("userId", user.getUserId());
		inputData.put("hobbyClassNo", map.get("hobbyClassNo"));
		
		LessonTimes lesson = lessonService.getArrowLesson(inputData);
		String videoSource = lesson.getLesson().getLessonVideo();
		
		videoSource = videoSource.substring(0, videoSource.indexOf(".")) + ".m3u8";
		lesson.getLesson().setLessonVideo(videoSource);
		model.addAttribute("lesson", lesson);
		
		inputData.put("lessonNo", lesson.getLesson().getLessonNo());
		
		search.setCurrentPage(1);
		inputData.put("search", search);
		Map<String, Object> replyMap = lessonService.getLessonReplyList(inputData);
		
		List<Reply> lessonReply = (List<Reply>)replyMap.get("list");
		model.addAttribute("replyList", lessonReply);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)replyMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/lesson/getHobbyClassLesson.jsp";
	}
	
	@RequestMapping( value = "getPreviewLesson" )
	public String getPreviewLesson(@RequestParam Map<String, Object> map, HttpSession session, Model model) throws Exception {
		System.out.println("----------map ? : " + map);

		String userId = null;
		
		User user = (User)session.getAttribute("user");
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
     	inputData.put("lessonNo", map.get("lessonNo"));
		inputData.put("hobbyClassNo", map.get("hobbyClassNo"));
     	
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		
		LessonTimes lesson = lessonService.getLesson(inputData);
		model.addAttribute("lesson", lesson);
		Map<String, Object> replyMap = lessonService.getLessonReplyList(inputData);
		
		List<Reply> lessonReply = (List<Reply>)replyMap.get("list");
		model.addAttribute("replyList", lessonReply);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)replyMap.get("total")).intValue(), 10, pageSize);
		model.addAttribute("resultPage", resultPage);

		return "forward:/openhobbyclass/getPreviewLesson.jsp";
	}
	
	@RequestMapping( value = "getPreviewArrow" )
	public String getPreviewArrow( @RequestParam Map<String, String> map, HttpSession session, Model model ) throws Exception {

		User user = (User)session.getAttribute("user");

		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(map.get("currentPage")));
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		inputData.put("userId", user.getUserId());
		inputData.put("hobbyClassNo", map.get("hobbyClassNo"));
		
		LessonTimes lesson = lessonService.getArrowLesson(inputData);

		model.addAttribute("lesson", lesson);
		
		inputData.put("lessonNo", lesson.getLesson().getLessonNo());
		
		search.setCurrentPage(1);
		inputData.put("search", search);
		Map<String, Object> replyMap = lessonService.getLessonReplyList(inputData);
		
		List<Reply> lessonReply = (List<Reply>)replyMap.get("list");
		model.addAttribute("replyList", lessonReply);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)replyMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/openhobbyclass/getPreviewLesson.jsp";
	}
}
