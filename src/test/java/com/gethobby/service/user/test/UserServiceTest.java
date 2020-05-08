package com.gethobby.service.user.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.User;
import com.gethobby.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
//		"classpath:config/context-aspect.xml",
//		"classpath:config/context-mybatis.xml",
//		"classpath:config/context-transaction.xml" })
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 "classpath:config/context-mybatis.xml",
		 "classpath:config/context-transaction.xml"})


public class UserServiceTest {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;	
	
	@Test
	public void testAddUser() throws Exception{
		
		Map map = new HashMap<String, Object>();
		User user = new User();
		user.setUserId("lp@naver.com");
		user.setName("자두");
		user.setPassword("2222");
//		user.setPhone("01056781111");
//		user.setBirth("11111111");
//		user.setSex("0");
		 
		List list = new ArrayList<String>();
		list.add("A01");
		list.add("A02");
		list.add("A03");
		list.add("A04");
		list.add("A05");
		
		map.put("user", user);
		map.put("list", list);
		map.put("userId" , user.getUserId());
		
//		userService.addUser(map);
		
		map = userService.getUser("lp@naver.com");
		user = (User)map.get("user");
		Assert.assertEquals("lp@naver.com",user.getUserId());
		Assert.assertEquals("자두",user.getName());
		Assert.assertEquals("2222",user.getPassword());
//		Assert.assertEquals("010-0000-0000", user.getPhone());
//		Assert.assertEquals("00000000",user.getBirth());
//		Assert.assertEquals("0", user.getSex());
		
	}
	
	//@Test
	public void testGetUser() throws Exception{
		
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = userService.getUser("korea");
		user = (User)map.get("user");		
		
		List<String> list = new ArrayList<String>();
		list = (List)map.get("list");
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("getUserHashtag::::::::::::::::::"+list.get(i));
		}		
		
		Assert.assertEquals("korea",user.getUserId());
		Assert.assertEquals("한국",user.getName());
		Assert.assertEquals("9999",user.getPassword());
		Assert.assertEquals("01056781111", user.getPhone());
		Assert.assertEquals("11111111",user.getBirth());
		Assert.assertEquals("0", user.getSex());
	}
	
	//@Test
	public void deleteUser() throws Exception{
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		map = userService.getUser("abc");
		user = (User)map.get("user");
			
		user.setRole("9");
		user.setReasonCode("2");
		userService.deleteUser(user);
		
		Assert.assertEquals("9", user.getRole());
	}
	//@Test
	public void updateUser() throws Exception{
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		map = userService.getUser("abc");
		user = (User)map.get("user");
		
		user.setAddress("광진구");
		user.setDetailAddress("중곡동");
		user.setPostCode("123-456");
		user.setPhone("01099999999");
		user.setNickName("고길동");
		user.setProfileImage("1111.jpg");
		
		List<String> list = new ArrayList<String>();
		list.add("C01");
		list.add("C02");
		list.add("C03");
		list.add("C04");
		list.add("C05");
		
		map.put("user", user);
		map.put("list", list);
		
		userService.updateUser(map);
		
		Assert.assertEquals("광진구", user.getAddress());
		Assert.assertEquals("중곡동", user.getDetailAddress());
		Assert.assertEquals("123-456", user.getPostCode());
		Assert.assertEquals("01099999999", user.getPhone());
		Assert.assertEquals("고길동", user.getNickName());
		Assert.assertEquals("1111.jpg", user.getProfileImage());
		
	}
	
	//@Test
	public void changeUserCreator()throws Exception{
		
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		map = userService.getUser("abc");
		user = (User)map.get("user");
		user.setRole("1");
		
		Assert.assertEquals("1", user.getRole());
	}
	
	//@Test
	public void TestgetUserListAdmin() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(2);
		
		Map<String,Object> map = userService.getUserListAdmin(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(2, list.size());
	}
	
	
	//@Test
	public void TestUpdateNewPassword() throws Exception{
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		map = userService.getUser("korea");		
		user = (User) map.get("user");
		
		user.setPassword("9999");
		userService.updateNewPassword(user);		
		
	}
	
	//@Test
	public void TestAddNotice()throws Exception{
		
		Article article = new Article();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User();
		map = userService.getUser("abc");
		
		user = (User)map.get("user");
		article.setBoardCode("4");
		article.setArticleTitle("알립니다");
		article.setArticleContent("집에가자");		
		article.setUser(user);
		
		userService.addNotice(article);		
		
	}
	
	//@Test
	public void TestgetNotice() throws Exception{
		
		Article article = new Article();
		User user = new User();
		
		article = userService.getNotice(2);
		System.out.println("@@@"+article);
		
		Assert.assertEquals("korea", article.getUser().getUserId());
		Assert.assertEquals("28일 오전 서울 영등포구 대림동 일대에서 만난 카페 등 서비스업 종업원들은 대부분 마스크를 착용하지 않은 채 근무하고 있었다.", article.getArticleContent());
		Assert.assertEquals("4", article.getBoardCode());
		Assert.assertEquals("2020-01-29 15:55", article.getRegDate());
	}
	
	//@Test
	public void TestUpdateNotice() throws Exception{
		Article article = new Article();
		article = userService.getNotice(2);
		
		article.setArticleTitle("우한폐렴");
		article.setArticleContent("3월이 정점이라는 논문도 있고, 앞으로 1∼2주를 말하는 학자도 있어 상황을 예의주시할 수밖에 없다");
		
		userService.updateNotice(article);
		article = userService.getNotice(2);
		
		Assert.assertEquals("우한폐렴", article.getArticleTitle());
		Assert.assertEquals("3월이 정점이라는 논문도 있고, 앞으로 1∼2주를 말하는 학자도 있어 상황을 예의주시할 수밖에 없다", article.getArticleContent());
	}
	//@Test
//	public void TestGetNoticeList() throws Exception{
//		Search search  = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(4);
//		
//		List<Article>list = new ArrayList<Article>();
//		list = userService.getNoticeList(search);
//		
//		Assert.assertEquals(4,list.size());
//	}
	
	//@Test
	public void TestDeleteNotice() throws Exception{
		userService.deleteNotice(2);	
		
	}
	
	public void TestcheckDuplication() throws Exception{
		
	}
}
