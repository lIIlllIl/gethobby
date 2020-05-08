package com.gethobby.web.article;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.article.ArticleService;
import com.gethobby.service.article.ReplyService;
import com.gethobby.service.domain.Favor;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;

@RestController
@RequestMapping("/article/*")
public class ArticleRestController {
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['articlePageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int articlePageSize;
	
	
	@Autowired
	@Qualifier("articleServiceImpl")
	private ArticleService articleService;
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	public ArticleRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/saveImage", method=RequestMethod.POST)
	public Map<String, Object> saveImage(@RequestParam("file") MultipartFile image, @RequestParam("boardCode") String boardCode) throws Exception {
		Search search = new Search();
		search.setBoardCode(boardCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String fileName = articleService.saveImage(image, search);
		
		map.put("fileName", fileName);
		
		return map;
		
	}
	
	
	@RequestMapping(value="json/addBoardReply", method=RequestMethod.POST)
	public Map<String, String> addBoardReply(@RequestBody Reply reply, HttpSession session) throws Exception {
		System.out.println("\n\n\n\n\n\n ajax로 받은 댓글: " + reply + "\n\n\n\n\n\n ");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonString = objectMapper.writeValueAsString(reply);
		System.out.println("\n\n\n\n\n\n String으로 변환된 댓글: " + jsonString + "\n\n\n\n\n\n ");
		
		Reply addedReply = objectMapper.readValue(jsonString, Reply.class);
		System.out.println("\n\n\n\n\n\n Reply 객체로 변환된 댓글: " + addedReply + "\n\n\n\n\n\n ");
		
		replyService.addBoardReply(addedReply);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("status", "ok");
//		Reply reply
		return map;
		
	}
	
	@RequestMapping(value="json/getBoardReplyList")
	public Map<String, Object> getBoardReplyList(@RequestBody Map<String, Object> jsonMap) throws Exception {
		System.out.println(jsonMap);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(jsonMap.get("search"));
		
		Search search = objectMapper.readValue(jsonString, Search.class);
		
		//Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("-----------search ? : " + search);
//		Search search = (Search)jsonMap.get("search");
		int articleNo = Integer.parseInt((String)jsonMap.get("articleNo"));
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(50);
		Map<String, Object> replyMap = new HashMap<String, Object>();
		replyMap = replyService.getBoardReplyList(articleNo, search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)replyMap.get("totalCount")).intValue(), pageUnit, 50);
		//model.addAttribute("resultPage", resultPage);
		System.out.println("page??? \n\n\n\n\n\n" + resultPage + "\n\n\n\n\n\n");
		replyMap.put("resultPage", resultPage);
		return replyMap;
		
//		return null;
	}
	
	@RequestMapping(value="json/deleteBoardReply/{replyNo}", method=RequestMethod.GET)
	public Map<String, String> deleteBoardReply(@PathVariable("replyNo") int replyNo) throws Exception {
		
		replyService.deleteBoardReply(replyNo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("status", "ok");
//		Reply reply
		return map;
	}
	
	
	@RequestMapping(value="json/updateBoardReply", method=RequestMethod.POST)
	public Map<String, String> updateBoardReply(@RequestBody Reply reply) throws Exception {
		
		System.out.println("\n\n\n\n\n\n ajax로 받은 댓글: " + reply + "\n\n\n\n\n\n ");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonString = objectMapper.writeValueAsString(reply);
		System.out.println("\n\n\n\n\n\n String으로 변환된 댓글: " + jsonString + "\n\n\n\n\n\n ");
		
		Reply addedReply = objectMapper.readValue(jsonString, Reply.class);
		System.out.println("\n\n\n\n\n\n Reply 객체로 변환된 댓글: " + addedReply + "\n\n\n\n\n\n ");
		
		replyService.updateBoardReply(addedReply);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("status", "ok");
		
		return map;
		
		
	}
	

	@RequestMapping(value="json/addFavor", method=RequestMethod.POST)
	public String addFavor(@RequestBody Favor favor) throws Exception {


		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonString = objectMapper.writeValueAsString(favor);
		System.out.println("\n\n\n\n\n\n String으로 변환된 댓글: " + jsonString + "\n\n\n\n\n\n ");
		
		Favor addedFavor = objectMapper.readValue(jsonString, Favor.class);
		System.out.println("\n\n\n\n\n\n Favor 객체로 변환된 댓글: " + addedFavor + "\n\n\n\n\n\n ");
		
		
		System.out.println("\n\n\n\n\n\t\t\t\t\t" + favor);
		articleService.addFavor(favor);
		
		
		return "{\"result\":\"ok\"}";
	}
	
	
	
	@RequestMapping(value="json/deleteFavor", method=RequestMethod.POST)
	public String deleteFavor(@RequestBody Favor favor) throws Exception {


		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonString = objectMapper.writeValueAsString(favor);
		//System.out.println("\n\n\n\n\n\n String으로 변환된 댓글: " + jsonString + "\n\n\n\n\n\n ");
		
		Favor addedFavor = objectMapper.readValue(jsonString, Favor.class);
		//System.out.println("\n\n\n\n\n\n Favor 객체로 변환된 댓글: " + addedFavor + "\n\n\n\n\n\n ");
		
		
		System.out.println("\n\n\n\n\n\t\t\t\t\t" + favor);
		articleService.deleteFavor(favor);
		
		
		return "{\"result\":\"ok\"}";
	}
	

	@RequestMapping(value="json/getBoardArticleList")
	public Map<String, Object> getBoardArticleList(@RequestBody Map<String, Object> jsonMap) throws Exception {
		System.out.println(jsonMap);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(jsonMap.get("search"));
		
		Search search = objectMapper.readValue(jsonString, Search.class);
		
		//Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("-----------search ? : " + search);
//		Search search = (Search)jsonMap.get("search");
		//int articleNo = Integer.parseInt((String)jsonMap.get("articleNo"));
		
		if(search.getCurrentPage() == 2) {
			search.setCurrentPage(10);
		}
		search.setPageSize(1);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		//replyMap = replyService.getBoardReplyList(articleNo, search);
		
		articleMap = articleService.getPhotoBoardList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)articleMap.get("totalCount")).intValue(), pageUnit, 1);
		//model.addAttribute("resultPage", resultPage);
		System.out.println("page??? \n\n\n\n\n\n" + resultPage + "\n\n\n\n\n\n");
		articleMap.put("resultPage", resultPage);
		return articleMap;
		
//		return null;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="json/getMyBoardArticleList")
	public Map<String, Object> getMyBoardArticleList(@RequestBody Map<String, Object> jsonMap, HttpSession session) throws Exception {
		System.out.println(jsonMap);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(jsonMap.get("search"));
		
		Search search = objectMapper.readValue(jsonString, Search.class);
		
		//Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("-----------search ? : " + search);
//		Search search = (Search)jsonMap.get("search");
		//int articleNo = Integer.parseInt((String)jsonMap.get("articleNo"));
		
		if(search.getCurrentPage() == 2) {
			search.setCurrentPage(10);
		}
		search.setBoardCode("1");
		search.setPageSize(1);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		//replyMap = replyService.getBoardReplyList(articleNo, search);
		String userId = ((User)(session.getAttribute("user"))).getUserId();
		articleMap = articleService.getMyBoardArticleList(search, userId);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)articleMap.get("totalCount")).intValue(), pageUnit, 1);
		//model.addAttribute("resultPage", resultPage);
		System.out.println("page??? \n\n\n\n\n\n" + resultPage + "\n\n\n\n\n\n");
		articleMap.put("resultPage", resultPage);
		return articleMap;
		
//		return null;
	}

}
