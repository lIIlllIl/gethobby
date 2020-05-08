package com.gethobby.service.community.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {  "classpath:config/context-common.xml",
									 "classpath:config/context-mybatis.xml",
									 "classpath:config/context-transaction.xml"} )

public class CommunityServiceTest {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public CommunityServiceTest() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Test
	public void testaddCommunityArticle()throws Exception{
		
		Article article = new Article();
		HobbyClass hobbyClass = new HobbyClass();
		User user = new User();
		
		article.setArticleContent("<h2>Article 내용</h2>");
		article.setBoardCode("2");
		//컨트롤러에서는 세션에 들어있을 것.
		user.setUserId("d@d.d"); //현재로그인된 user
		article.setUser(user);
		hobbyClass.setHobbyClassNo(10013);
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		//hobbyClass.setUser(user); //해당 hobbyClass를 구매한 user임.
		article.setHobbyClass(hobbyClass);
		System.out.println("test확인:"+article);
		communityService.addCommunityArticle(article);
		communityService.getCommunityArticle(article.getArticleNo());
		System.out.println("확인:"+article);
		
	}
	
	//@Test
	public void testGetCommunityArticle()throws Exception{
		
		Article article = new Article();
		//세션에 UserId 정보 담겨있을것...
		article.setArticleNo(1010);
		
		article = communityService.getCommunityArticle(article.getArticleNo());
		//System.out.println("결과확인:"+article.getUser());
		//System.out.println("결과확인:"+article);
	}
	
	//@Test
	public void testupdateCommunityArticle()throws Exception{
		
		Article article = new Article();
		User user = new User();
		HobbyClass hobbyClass = new HobbyClass();
		
		article.setArticleNo(1001);
		article.setArticleContent("<h2></h2>이미지 포함된 내용임...");
		article.setBoardCode("2");
		//컨트롤러에서는 세션에 들어있을 것.
		user.setUserId("d@d.d"); //현재로그인된 user
		article.setUser(user);
		hobbyClass.setHobbyClassNo(10013);
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		//hobbyClass.setUser(user); //해당 hobbyClass를 구매한 user임.
		article.setHobbyClass(hobbyClass);
		System.out.println("test확인:"+article);
		communityService.updateCommunityArticle(article);
		communityService.getCommunityArticle(article.getArticleNo());
		System.out.println("확인:"+article);
		
	}	
	
	//@Test
	public void testDeleteCommunityArticle()throws Exception{
		
		Article article = new Article();
		HobbyClass hobbyClass = new HobbyClass();
		
		article.setArticleNo(1001);
		//컨트롤러에서는 세션에 들어있을 것. 
		hobbyClass.setHobbyClassNo(10013);
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		article.setHobbyClass(hobbyClass);
		System.out.println("test확인:"+article);
		communityService.deleteCommunityArticle(article.getArticleNo());
		
	}
	
	/////////////////////////////////////////
	///댓글댓글댓글
	
	//@Test
	public void testGetCommunityReply() throws Exception{
		
		Reply reply = new Reply();
		Article article = new Article();
		HobbyClass hobbyClass = new HobbyClass();
		
		reply.setReplyNo(1013);
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		hobbyClass.setHobbyClassNo(10013);
		article.setHobbyClass(hobbyClass);
		System.out.println("test확인:"+article);
		reply = communityService.getCommunityReply(reply.getReplyNo());
		System.out.println("확인:"+reply);
	}
	
	//@Test
	public void testAddCommunityReply() throws Exception{
		
		Reply reply = new Reply();
		HobbyClass hobbyClass = new HobbyClass();
		Article article = new Article();
		User user = new User();
		
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		//컨트롤러에서는 세션에 들어있을 것.
		user.setUserId("c@c.c"); //현재로그인된 user
		hobbyClass.setHobbyClassNo(10013);
		article.setHobbyClass(hobbyClass);
		article.setArticleNo(1010);
		article.setBoardCode("2");
		reply.setArticle(article);
		reply.setUser(user);
		reply.setReplyContent("<>댓글댓글<>");
		
		System.out.println("test확인:"+reply);
		communityService.addCommunityReply(reply);
	}
	
	//@Test
	public void testUpdateCommunityReply()throws Exception{
		
		Reply reply = new Reply();
		
		//해당 hobbyclass를 구매한 user정보를 hobbyclass Table에서 받아와서 그쪽의 userId와 
		//현재 로그인된 userId(세션의UserId)가 일치하면 이 hobbyclass에 접근허가.
		//컨트롤러에서는 세션에 들어있을 것.
		reply.setReplyNo(1014);
		reply.setReplyContent("<>수정된댓글<>");
		
		System.out.println("test확인:"+reply);
		communityService.updateCommunityReply(reply);
		
	}
	
	//@Test
	public void testDeleteCommunityReply()throws Exception{
		
		Reply reply = new Reply();
		reply.setReplyNo(1015);
		
		communityService.deleteCommunityReply(reply.getReplyNo());
		
	}
	
	//@Test
	public void testGetCommunity()throws Exception{
		
		Article article = new Article();
		article.setArticleNo(1010);
		
		Map<String, Object> getCommunityMap = communityService.getCommunity(article.getArticleNo());
		article = (Article)getCommunityMap.get("article");
		List<Reply> list = (List<Reply>)getCommunityMap.get("replyList");
		
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(i)+"\n");
			System.out.println(list.get(i).getReplyNo()+"////"+list.get(i).getReplyContent()+"////"+list.get(i).getRegDate()+"\n");
		}
	}

	
	//선택된 글과 댓글 : 부적절한 내용으로 삭제된 글(댓글)입니다 로 업데이트
	//@Test
	public void testUpdateSelectedAdmin()throws Exception{
		
		List<Integer> list = new ArrayList<Integer>();
		list.add(0, 1016); //댓글
		list.add(1, 1018); //댓글
		//list.add(2, 1012); //글
		//System.out.println(list);
			
		communityService.updateSelectedCreator(list);
		
	}
	
	//@Test
	public void testGetCommunityList()throws Exception{
		
		Search search = new Search();
		HobbyClass hobbyClass = new HobbyClass();
		search.setCurrentPage(1);
		search.setPageSize(pageSize*3);
		hobbyClass.setHobbyClassNo(10013);
		Map<String, Object> serviceMap = new HashMap<String, Object>();
		serviceMap.put("search", search);
		serviceMap.put("hobbyClassNo", hobbyClass.getHobbyClassNo());
		
		Map<String, Object> map = communityService.getCommunityList(serviceMap);
		
		int hobbyClassNo = (Integer)map.get("hobbyClassNo");
		List<Article> articleList = (List<Article>)map.get("articleList");
		List<List<Reply>> array = (List<List<Reply>>)map.get("array");
		for (int i = 0; i < articleList.size(); i++) {
			System.out.println(articleList.get(i).getArticleNo());
			System.out.println(articleList.get(i).getRegDate());
			System.out.println(articleList.get(i).getArticleContent());
				for (int j = 0; j <array.get(i).size(); j++) {
					System.out.println("=====>"+articleList.get(i).getArticleNo()+"에 달린 댓글임..");
					System.out.println("=====>"+array.get(i).get(j).getReplyNo());
					System.out.println("=====>"+array.get(i).get(j).getRegDate());
					System.out.println("=====>"+array.get(i).get(j).getReplyContent());
				}
		}
		
		System.out.println("==================================================================");
		System.out.println("==================================================================");
		System.out.println("TEST끝 확인!\n");

	}
	
//	@Test
//	public void testGetReplyListUnderArticle(int articleNo) throws Exception{
//		
//		Article article =new Article();
//		Reply reply = new Reply();
//		article.setArticleNo(1018);
//		reply.setArticle(article);
//		List<Reply> list = communityService.getReplyListUnderArticle(reply.getArticle().getArticleNo());
//		System.out.println(list);
//	}
	
}


