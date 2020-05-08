package com.gethobby.web.searchhobbyclass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;
import com.gethobby.service.lesson.LessonService;
import com.gethobby.service.openhobbyclass.OpenHobbyClassDAO;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;


@Controller
@RequestMapping("/searchHobbyClass/*")
public class SearchHobbyClassController {
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("openHobbyClassDAOImpl")
	private OpenHobbyClassDAO openHobbyClassDAO;
	public void setOpenHobbyClassDAO(OpenHobbyClassDAO openHobbyClassDAO) {
		this.openHobbyClassDAO = openHobbyClassDAO;
	}
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	public SearchHobbyClassController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "getSearchHobbyClassIntro" )
	public String getSearchHobbyClassIntro( @RequestParam("hobbyClassNo") String hobbyClassNo, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model ) throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();

		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
	
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", hobbyClassNo);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);

		if ( hobbyClass.getEvent() != null ) {
			hobbyClass.getEvent().setResultPrice( (int)Math.round( ( (100 - hobbyClass.getEvent().getEventDiscount() ) / 100.0 ) * hobbyClass.getHobbyClassPrice() ) );
		}
		
		model.addAttribute("hobbyClass", hobbyClass);

		int purchaseCheck = 0;
		
		if ( user != null ) {
			purchaseCheck = searchHobbyClassService.getPurchaseClassCheck(inputData);
		}
		model.addAttribute("purchaseCheck", purchaseCheck);

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("search", search);
		
		Map<String, Object> returnMap = searchHobbyClassService.getHobbyClassAssessContent(inputData); 
		
		List<ClassAssess> listAssessContent = (List<ClassAssess>)returnMap.get("list"); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)returnMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("listAssessContent", listAssessContent);
		model.addAttribute("resultPage", resultPage);
		
		Map<String, Object> resultMap = lessonService.getLessonList(Integer.parseInt(hobbyClassNo));
		
		List<Lesson> lessonList = (List<Lesson>)resultMap.get("list");
		int total = (Integer)resultMap.get("total");
		model.addAttribute("lessonList", resultMap.get("list"));

		Page lessonCountResultPage = new Page( 1, total, pageUnit, 3);
		model.addAttribute("lessonCountResultPage", lessonCountResultPage);

		model.addAttribute("eventList", hobbyClass.getEventList());

		inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("userId", userId);
		
		ClassAssess classAssess = searchHobbyClassService.getUserClassAssess(inputData);
		
		model.addAttribute("classAssess", classAssess);
		
		return "forward:/searchhobbyclass/getHobbyClassIntro.jsp";
	}

	@RequestMapping( value = "getHobbyClassAssessContent" )
	public String getHobbyClassAssessContent( @RequestParam("hobbyClassNo") String hobbyClassNo, Model model ) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("search", search);
		
		Map<String, Object> returnMap = searchHobbyClassService.getHobbyClassAssessContent(inputData); 
		
		List<ClassAssess> listAssessContent = (List<ClassAssess>)returnMap.get("list"); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)returnMap.get("total")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("listAssessContent", listAssessContent);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/hobbyclass/getHobbyClassAssessContent.jsp";
	}
	
	@RequestMapping( value = "getHobbyClassLessonContent" )
	public String getHobbyClassLessonContent( @RequestParam("hobbyClassNo") String hobbyClassNo, HttpSession session, Model model ) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if (user != null) {
			userId = user.getUserId();
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("userId", userId);
		
		List<LessonTimes> lessonTimesList = searchHobbyClassService.getHobbyClassLessonContent(inputData);
		
		model.addAttribute("lesson", lessonTimesList);
		
		return "forward:/hobbyclass/getHobbyClassLessonContent.jsp";
	}
	
	@RequestMapping( value = "getPopularHobbyClassList" )
	public String getPopularHobbyClassList(Model model, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
		
		Search search = new Search(); 
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", userId);
		inputData.put("search", search);
		
		Map<String, Object> map = searchHobbyClassService.getPopularHobbyClassList(inputData);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize);
		List<HobbyClass> hobbyClassList = (List<HobbyClass>)map.get("list");
		
		model.addAttribute("list", hobbyClassList);
		model.addAttribute("resultPage", resultPage);

		return "forward:/hobbyclass/listPopularHobbyClass.jsp";
	}
	
	@RequestMapping( value = "getRegisterHobbyClassList" ) 
	public String getRegisterHobbyClassList(HttpSession session, Model model) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>(); 
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> map = searchHobbyClassService.getRegisterHobbyClassList(inputData);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize);
		List<HobbyClass> hobbyClassList = (List<HobbyClass>)map.get("list");
		model.addAttribute("list", hobbyClassList);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/hobbyclass/listRegisterHobbyClass.jsp";
	}

	@RequestMapping( value = "getCommunityContent" )
	public String getCommunityContent(@RequestParam("articleNo") int articleNo, Model model) throws Exception {
		Map<String, Object> map = communityService.getCommunity(articleNo);
		Article article = (Article) map.get("article");
		
		article.setArticleContent( article.getArticleContent().replaceAll("\n", "<br>") );
		
		List<Reply> list = (List<Reply>)map.get("replyList");

		model.addAttribute("article", map.get("article"));
		model.addAttribute("replyList", list);
		
		for ( int i = 0; i < list.size(); i++ ) {
			list.get(i).setReplyContent( list.get(i).getReplyContent().replaceAll("\n", "<br>") );
		}
		
		return "forward:/searchhobbyclass/getCommunityTest2.jsp";
	}
	
	@RequestMapping(value = "getCommunity") 
	public String getCommunity(@RequestParam("articleNo") int articleNo, 
									Model model)throws Exception{
		
		
		Map<String, Object> map = communityService.getCommunity(articleNo);
		Article article = (Article) map.get("article");
		
		List<Reply> list = (List<Reply>)map.get("replyList");

		model.addAttribute("article", map.get("article"));
		model.addAttribute("replyList", list);
		return "forward:/questionreport/getReportTargetCommunityArticle.jsp";
	}

	
	@RequestMapping( value = "getPreview" )
	public String getPreview(@RequestParam("hobbyClassNo") String hobbyClassNo, Model model) throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();

		inputData.put("hobbyClassNo", hobbyClassNo);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		
		model.addAttribute("hobbyClass", hobbyClass);

		Map<String, Object> resultMap = lessonService.getLessonList(Integer.parseInt(hobbyClassNo));
		
		List<Lesson> lessonList = (List<Lesson>)resultMap.get("list");
		int total = (Integer)resultMap.get("total");
		model.addAttribute("lessonList", resultMap.get("list"));
		
		Page lessonCountResultPage = new Page( 1, total, pageUnit, 3);
		model.addAttribute("lessonCountResultPage", lessonCountResultPage);

		model.addAttribute("lesson", openHobbyClassDAO.getLessonList(Integer.parseInt(hobbyClassNo)));
		
		return "forward:/openhobbyclass/getPreview.jsp";
	}
	
}
