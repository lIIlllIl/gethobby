package com.gethobby.service.article.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.article.ArticleService;
import com.gethobby.service.article.ReplyService;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 "classpath:config/context-mybatis.xml",
		 "classpath:config/context-transaction.xml"})
public class ReplyTest {
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	@Autowired
	@Qualifier("articleServiceImpl")
	private ArticleService articleSerivce;
	
//	@Autowired
//	@Qualifier("userServiceImpl")
//	private UserService userSerivce;
	
	
//	@Test
	public void testAddBoardReply() throws Exception {
		
		Reply reply = new Reply();
		User user = new User();
		user.setUserId("a@google.com");
		
		
		reply.setArticle(articleSerivce.getBoardArticle(3));
		reply.setUser(user);
		reply.setReplyContent("댓글 테스트 중중중주웆웆");
		replyService.addBoardReply(reply);
		
	}
	
//	@Test
	public void testGetBoardReply() throws Exception{
		
		Reply reply = replyService.getBoardReply(1);
		
		Assert.assertEquals(3, reply.getArticle().getArticleNo());
		Assert.assertEquals("a@google.com", reply.getUser().getUserId());
		Assert.assertEquals("첫번째로 작성하는 댓글 입니다.", reply.getReplyContent());
		Assert.assertEquals("2020-01-28 20:28", reply.getRegDate());
		
	}
	
	
//	@Test
	public void testUpdateBoardReply() throws Exception {
		
		Reply reply = replyService.getBoardReply(2);
		
		reply.setReplyContent("두번째 댓글은 수정되었다.");
		
		replyService.updateBoardReply(reply);
		
		reply = replyService.getBoardReply(2);
		Assert.assertEquals("두번째 댓글은 수정되었다.", reply.getReplyContent());
				
	}
	
//	@Test
	public void testDeleteBoardReply() throws Exception {
		
		replyService.deleteBoardReply(11);
		
		Assert.assertNull(replyService.getBoardReply(11));
		
	}
	
	
	
	
	@Test
	public void testGetBoardReplyList() throws Exception {
		Search search = new Search();
//		search.setStartRowNum(3);
//		search.setEndRowNum(6);
		search.setCurrentPage(1);
		search.setPageSize(3);
		System.out.println(search.getEndRowNum());
		
//		List<Reply> replyList = replyService.getBoardReplyList(3, search);
		
		Map<String, Object> map = replyService.getBoardReplyList(3, search);
		List<Reply> replyList = (List<Reply>)map.get("list");
		System.out.println("\n\n\n\n\n\n\n");
		for(Reply reply : replyList) {
			System.out.println("\t\t\t\t\t 게시글에 달린 댓글들" + reply);
		}
		System.out.println(replyService.getBoardReplyTotalCount(3));
		System.out.println("\n\n\n\n\n\n\n");
		
	}

}
