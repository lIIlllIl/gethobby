package com.gethobby.service.article.test;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Search;
import com.gethobby.service.article.ArticleService;
import com.gethobby.service.article.ReplyService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Favor;
import com.gethobby.service.domain.User;
import com.gethobby.service.user.UserService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 "classpath:config/context-mybatis.xml",
		 "classpath:config/context-transaction.xml"})
public class ArticleTest {
	
	@Autowired
	@Qualifier("articleServiceImpl")
	private ArticleService articleService;
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
//	@Test
	public void testAddArticle() throws Exception {
		Article article = new Article();
		User user = new User();
		user.setUserId("c@c.c");
		article.setUser(user);
		article.setBoardCode("0");
		article.setArticleType("002");
		article.setArticleTitle("c가 쓰는 게시글");
		article.setArticleContent("c가 처음으로 쓰는 게시글");
		
//		articleService.addBoardArticle(article);
		
	}
	
//	@Test
	@Rollback(value = false)
	public void testGetArticle() throws Exception {
		int articleNo = 10;
		Article article = articleService.getBoardArticle(articleNo);
//		Assert.assertEquals(10, article.getTotalView());
		articleService.updateTotalView(article.getArticleNo());
		
		
//		Assert.assertEquals("a@google.com", article.getUser().getUserId());
//		Assert.assertNull("Null 아님", article.getArticleImage());
		article = articleService.getBoardArticle(articleNo);
		System.out.println("게시글 조회수: " + article.getTotalView() );
		System.out.println("\n\n\n\n 게시글: " + article + "\n\n\n\n ");
	}
	
//	@Test
	public void testUpdateArticle() throws Exception {
		
		Article article = articleService.getBoardArticle(2);
		article.setArticleTitle("두번째 게시글 제목은 수정되었다...");
//		article.setArticleContent(article.getArticleContent());
		articleService.updateBoardArticle(article);
		
		
		Assert.assertEquals("두번째 게시글 제목은 수정되었다...", article.getArticleTitle());
		
	}
	
//	@Test
	public void testDeleteArticle() throws Exception {
		
//		Article article = articleService.getArticle(2);
		
		int articleNo = 15;
		
		articleService.getBoardArticle(articleNo);
		Assert.assertEquals(1, replyService.getBoardReplyTotalCount(articleNo));
		
		
		articleService.deleteBoardArticle(articleNo);
		
		Assert.assertNull(articleService.getBoardArticle(articleNo));
		Assert.assertEquals(0, replyService.getBoardReplyTotalCount(articleNo));
		
	}
	
//	@Test
	public void testGetFreeBoardTotalCount() throws Exception {
		
		Search search = new Search();
		
//		search.setArticleType("000");
//		search.setSearchCondition("0");
//		search.setSearchKeyword("자유");
		
		System.out.println("\n\n\n\n\n\n " + articleService.getFreeBoardTotalCount(search));
		
		
		
	}

	
	
	
	
//	@Test
	public void testGetFreeBoardList() throws Exception {
		Search search = new Search();
		
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		search.setArticleType("000");
		search.setSearchCondition("0");
		search.setSearchKeyword("자유");
		
		Map<String, Object> map = articleService.getFreeBoardList(search);
		
		List<Article> articleList = (List<Article>) map.get("list");
//		System.out.println("\n\n\n\n\n\n " + articleList + "\n\n\n\n\n\n ");
		
		System.out.println("\n\n\n\n\n\n ");
//		for(int i = 0; i < articleList.size(); i++) {
		for(Article article : articleList) {
			System.out.println("\t\t\t\t\t " + article);
		}
		System.out.println(articleService.getFreeBoardTotalCount(search));
		System.out.println("\n\n\n\n\n\n ");
	}
	
	
	
	
//	@Test
	public void testGetPhotoBoardList() throws Exception {
		Search search = new Search();
		
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		
		Map<String, Object> map = articleService.getPhotoBoardList(search);
		
		System.out.println("\n\n\n\n\n\n " + map.get("list") + "\n\n\n\n\n\n ");
		
//		search.setSearchCondition("0");
//		search.setSearchKeyword("사진");
//		
//		List<Article> articleList = articleService.getPhotoBoardList(search);
////		System.out.println("\n\n\n\n\n\n " + articleList + "\n\n\n\n\n\n ");
//		
//		System.out.println("\n\n\n\n\n\n ");
////		for(int i = 0; i < articleList.size(); i++) {
//		for(Article article : articleList) {
//			System.out.println("\t\t\t\t\t " + article);
//		}
		System.out.println(articleService.getPhotoBoardTotalCount(search));
		System.out.println("\n\n\n\n\n\n ");
	}
	
//	@Test
	@Rollback(value=false)
	public void testAddFavor() throws Exception {
		
		Favor favor = new Favor();
		Map<String, Object> map = userService.getUser("user01@naver.com");
		User user = (User)map.get("user");
		
		int articleNo = 14;
		Article article = articleService.getBoardArticle(articleNo);
		
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(article.getTotalFavor());
		System.out.println("\n\n\n\n\n\n\n");
		
		Assert.assertEquals(0, article.getTotalFavor());
		
		favor.setArticle(article);
		favor.setUser(user);
		articleService.addFavor(favor);
		
		article = articleService.getBoardArticle(articleNo);
		Assert.assertEquals(1, article.getTotalFavor());
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(article.getTotalFavor());
		System.out.println("\n\n\n\n\n\n\n");
		
		
	}
	
//	@Test
	public void testDeleteFavor() throws Exception {
		Favor favor = new Favor();
		Map<String, Object> map = userService.getUser("a@google.com");
		User user = (User)map.get("user");
		
		int articleNo = 12;
		Article article = articleService.getBoardArticle(articleNo);
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(article.getTotalFavor());
		System.out.println("\n\n\n\n\n\n\n");
		
		Assert.assertEquals(1, article.getTotalFavor());
		
		favor.setArticle(article);
		favor.setUser(user);
		articleService.deleteFavor(favor);
		
		article = articleService.getBoardArticle(articleNo);
		Assert.assertEquals(0, article.getTotalFavor());
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(article.getTotalFavor());
		System.out.println("\n\n\n\n\n\n\n");
		
	}
	
	
	
//	@Test
	public void testGetMyBoardArticleList() throws Exception {
		
		String userId = "c@c.c";
		Search search = new Search();
		
		search.setBoardCode("0");
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String, Object> map = articleService.getMyBoardArticleList(search, userId);
		
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(map.get("totalCount"));
		
		List<Article> articleList = (List<Article>)map.get("list");
		for(Article article : articleList) {
			System.out.println(article);
		}
		System.out.println("\n\n\n\n\n\n\n");
		
	}
	
	
	
	
//	@Test
	public void testGetMyFavorArticleList() throws Exception{
		String userId = "a@google.com";
		Search search = new Search();
		
		search.setBoardCode("0");
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String, Object> map = articleService.getMyFavorArticleList(search, userId);
		
		
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println(map.get("totalCount"));
		
		List<Article> articleList = (List<Article>)map.get("list");
		for(Article article : articleList) {
			System.out.println(article);
		}
		System.out.println("\n\n\n\n\n\n\n");
				
	}
	
	
//	@Test
	public void testSaveImage() throws Exception {
		
		Search search = new Search();
		
		search.setBoardCode("1");
		
		File file = new File("C:\\Users\\User\\Downloads\\kotlin2.png");
		FileInputStream input = new FileInputStream(file);
		MultipartFile image = new MockMultipartFile("file", file.getName(), "text/plain", IOUtils.toByteArray(input));
		
		
		articleService.saveImage(image, search);
	}
	
//	@Test
	public void testGetMyRecentArticle() throws Exception {
		
		Article article = new Article();
		User user = new User();
		
		String userId = "creator@bitcamp.com";

		user.setUserId(userId);
		
		article.setUser(user);
		article.setBoardCode("0");
		article.setArticleType("003");
		article.setArticleTitle("최신 게시글 가져오기 테스트");
		article.setArticleContent("어쩌구 저쩌구 최신 게시글 가져오기");
		
		article = articleService.addBoardArticle(article, userId);
		
//		article = articleService.getMyRecentArticle(userId);
		
		System.out.println("\n\n\n\n\n\n\n\n\n" + article);
		
	}
	
	
	@Test
	public void testGetFavor() throws Exception {
		Favor favor = new Favor();
		Map<String, Object> map = userService.getUser("user02@naver.com");
		User user = (User)map.get("user");
		
		int articleNo = 14;
		Article article = articleService.getBoardArticle(articleNo);
		
		favor.setArticle(article);
		favor.setUser(user);
		
		Favor favored = articleService.getFavor(favor);
		
		
		map.put("favored", favored);
//		int favoredArticleNo = favored.getArticle().getArticleNo();
//		String favoredUserId = favored.getUser().getUserId();
		System.out.println("\n\n\n\n\n\n\t\t\t\t\t");
//		System.out.println("\t\t\t\t\t" + favoredArticleNo);
//		System.out.println("\t\t\t\t\t" + favoredUserId);
		System.out.println("\t\t\t\t\t" + map.get("favored"));
		System.out.println("\n\n\n\n\n\n\t\t\t\t\t");
		
	}
}














