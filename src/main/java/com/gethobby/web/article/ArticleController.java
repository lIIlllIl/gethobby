package com.gethobby.web.article;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.article.ArticleService;
import com.gethobby.service.article.ReplyService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Favor;
import com.gethobby.service.domain.User;

@Controller
@RequestMapping("/article/*")
public class ArticleController {
	
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

	public ArticleController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addFreeArticle", method=RequestMethod.GET)
	public String addFreeArticleView() throws Exception {
		
		
		return "forward:/article/addFreeArticle.jsp";
	}
	
	
	@RequestMapping(value="addBoardArticle", method=RequestMethod.POST)
	public String addBoardArticle(@ModelAttribute("article") Article article, Model model, HttpSession session) throws Exception {
		
		Search search = new Search();
		search.setBoardCode(article.getBoardCode());
		
		System.out.println("게시글이 등록될 게시판은??" + search.getBoardCode());
		
//		if(search.getBoardCode().equals("1")) {			
//			article.setArticleImage(articleService.saveImage(image, search));
//		}
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		article.setUser(user);
		
		System.out.println("파일이름>>>>>>>>>" + article.getArticleImage());
		
		
		Article newArticle = articleService.addBoardArticle(article, userId);
		
		model.addAttribute("article", newArticle);
		
		String address = null;
		
		if(search.getBoardCode().equals("0")) {			
			address = "redirect:/article/getBoardArticle?boardCode=0&articleNo=" + newArticle.getArticleNo();
		} else if(search.getBoardCode().equals("1")) {
			
			address = "redirect:/article/getBoardArticleList?boardCode=1";
		}
		return address;
	}
	
	
	
	
	@RequestMapping( value = "getSavedImage" )
	// 외부 경로에 있는 이미지를 읽어오기 위한 Method 
	// fileName을 query string으로 받아옴 
	public void getSavedImage( @RequestParam("fileName") String fileName, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = "C:\\images\\sol\\free_board\\" + fileName;
		
		// 외부 경로에 있는 네이버 캡차 이미지 객체 생성 
		File file = new File(path);
		
		// Response로 네이버 캡차 이미지를 보내기 위해 네이버 캡차 이미지 크기 Header에 저장 
		res.setHeader("Content-Length", String.valueOf(file.length()));
		
		// Content-Disposition를 Header에 설정할 경우 바로 browser에 다운로드 
		// inline :: browser에서 바로 이미지 파일 확인 가능 
		// filename :: 파일 경로 + 이름 
        res.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
        
        // Files.copy :: java.nio.file로 파일 복사 
        // Files.copy(복사할 대상(원본), 복사한 파일을 보낼 OutputStream);
        // HttpServletResponse로 복사한 파일을 보내므로 /user/loginView.jsp에서 이미지 파일 확인 가능 
        Files.copy(file.toPath(), res.getOutputStream());
	}
	
	
	
	@RequestMapping(value="getBoardArticleList")
	public String getBoardArticleList(HttpServletResponse response, @RequestParam("boardCode") String boardCode, @ModelAttribute("search") Search search, Model model) throws Exception {
//	public String getBoardArticleList(@ModelAttribute("search") Search search, Model model) throws Exception {
		System.out.println("\t\t\t\t getBoardArticleList Start");
		System.out.println("\t\t\t\t search" + search);
		System.out.println("--------boardCode ? : " + boardCode);
		
		if(search.getBoardCode() == null) {			
			search.setBoardCode(boardCode);
		}
		System.out.println(search.getBoardCode());
		String board = null;
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		if(search.getBoardCode().equals("0")) {
			System.out.println("\n\n\\n\n\n\n\n search boardcode = 0");
			search.setPageSize(articlePageSize);
//			pageSize = 10;
			
			map = articleService.getFreeBoardList(search);
			board = "listFreeArticle";
			
			if(search.getArticleType() != null) {
				search.setArticleType(search.getArticleType());
			}
			
		}
		
		
		if(search.getBoardCode().equals("1")) {
			System.out.println("\n\n\\n\n\n\n\n search boardcode = 1");
			search.setPageSize(articlePageSize);
//			pageSize = 10;
			
			map = articleService.getPhotoBoardList(search);
			board = "listPhotoArticle";
			
		}
		//search.setPageSize(pageSize);
		
		System.out.println("\n\n\n\n \t\t\t\t" + search);
		System.out.println( "\n\n\n\n \t\t\t\t" + map.get("totalCount") + pageUnit + pageSize);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, articlePageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("totalCount", map.get("totalCount"));
//		model.addAttribute("totalReply", arg1)



		
		return "forward:/article/" + board + ".jsp";
	}
	
	
	
	
	
	@RequestMapping(value="getBoardArticle", method=RequestMethod.GET)
	public String getBoardArticle(@RequestParam("articleNo") int articleNo, Model model, @ModelAttribute("search") Search search, HttpSession session, @RequestParam("boardCode") String boardCode) throws Exception {
		
//		if(search.getCurrentPage() == 0 ){
//			search.setCurrentPage(1);
//		}
		//search.setPageSize(10);
		
		
		search.setBoardCode(boardCode);
		System.out.println(search.getBoardCode());
		String board = null;
		
		
		if(search.getBoardCode().equals("0")) {
			System.out.println("\n\n\\n\n\n\n\n search boardcode = 0");
			
			board = "getFreeArticle";
		}
		
		
		if(search.getBoardCode().equals("1")) {
			
			board = "getPhotoArticle";
			
		}
		
		
		
		Article article = articleService.getBoardArticle(articleNo);
		
		Map<String, Object> map = replyService.getBoardReplyList(articleNo, search);

		if(session != null) {
			Favor favor = new Favor();
			User user = ((User) session.getAttribute("user"));
			favor.setArticle(article);
			favor.setUser(user);
			Favor favored = articleService.getFavor(favor);
			model.addAttribute("favored", favored);
		}
		
		
		model.addAttribute("article", article);
//		model.addAttribute("list", map.get("list"));
		articleService.updateTotalView(articleNo);
		
		return "forward:/article/" + board + ".jsp";
	}
	
	
	
	
	
	@RequestMapping(value="updateBoardArticle", method=RequestMethod.GET)
	public String updateBoardArticleView(@RequestParam("articleNo") int articleNo, Model model) throws Exception {
		
		Article article = articleService.getBoardArticle(articleNo);
		
		model.addAttribute("article", article);		
		
		return "forward:/article/updateFreeArticle.jsp";
	}
	
	@RequestMapping(value="updateBoardArticle", method=RequestMethod.POST)
	public String updateBoardArticle(@ModelAttribute("article") Article article, @RequestParam("boardCode") String boardCode) throws Exception {
		
		articleService.updateBoardArticle(article);
		
		System.out.println("\t\t\t\t\t\t \n\n\n\n\n\n 게시글 번호>>>>>>>>>");
		
		return "redirect:/article/getBoardArticle?boardCode=" + boardCode +  "&articleNo=" + article.getArticleNo();
	}
	
	
	@RequestMapping(value="deleteBoardArticle", method=RequestMethod.GET)
	public String deleteBoardArticle(@RequestParam("articleNo") int articleNo) throws Exception {
		
		Article article = articleService.getBoardArticle(articleNo);
		
		String boardCode = article.getBoardCode();


		
		
		articleService.deleteBoardArticle(articleNo);
				
		
		return "redirect:/article/getBoardArticleList?boardCode=" + boardCode;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="getMyBoardArticleList")
	public String getMyBoardArticleList(@RequestParam("boardCode") String boardCode, @ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception {
//	public String getBoardArticleList(@ModelAttribute("search") Search search, Model model) throws Exception {
		System.out.println("\t\t\t\t getMyBoardArticleList Start");
		System.out.println("\t\t\t\t search" + search);
		System.out.println("--------boardCode ? : " + boardCode);
		
		String userId = ((User)(session.getAttribute("user"))).getUserId();
		if(search.getBoardCode() == null) {			
			search.setBoardCode(boardCode);
		}
		System.out.println(search.getBoardCode());
		String board = null;
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		search.setPageSize(articlePageSize);			
		map = articleService.getMyBoardArticleList(search, userId);
		
		
		if(search.getBoardCode().equals("0")) {
			System.out.println("\n\n\\n\n\n\n\n search boardcode = 0");
//			search.setPageSize(articlePageSize);			
//			map = articleService.getMyBoardArticleList(search, userId);
			
			board = "listMyFreeArticle";

		}
		
		
		if(search.getBoardCode().equals("1")) {
			System.out.println("\n\n\\n\n\n\n\n search boardcode = 1");
//			search.setPageSize(articlePageSize);			
//			map = articleService.getPhotoBoardList(search);
			
			board = "listMyPhotoArticle";	
		}
		
		System.out.println("\n\n\n\n \t\t\t\t" + search);
		System.out.println( "\n\n\n\n \t\t\t\t" + map.get("totalCount") + pageUnit + pageSize);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, articlePageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("totalCount", map.get("totalCount"));
//		model.addAttribute("totalReply", arg1)



		
		return "forward:/article/" + board + ".jsp";
	}
	

}
