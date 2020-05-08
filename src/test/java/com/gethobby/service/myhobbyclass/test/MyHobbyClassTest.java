package com.gethobby.service.myhobbyclass.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.User;
import com.gethobby.service.myhobbyclass.MyHobbyClassService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 							 "classpath:config/context-mybatis.xml",
		 							 "classpath:config/context-transaction.xml"})

public class MyHobbyClassTest {
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
	
	//@Test
	public void testGetSteamHobbyClassList() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "a@a.a";
		
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> returnMap = myHobbyClassService.getSteamHobbyClassList(inputData);
		List<HobbyClass> list = (List<HobbyClass>)returnMap.get("list");
	}

	//@Test
	public void testGetPurchaseHobbyClassSchedult() throws Exception {
		List<HobbyClass> purchaseHobbyClassList = myHobbyClassService.getPurchaseHobbyClassSchedult("a@a.a");
		
	}
	
	//@Test
	public void testAddSteam() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "a@a.a");
		inputData.put("hobbyClassNo", 10002);
		
		int steamCount = searchHobbyClassService.getHobbyClass(inputData).getSteamCount();
		
		inputData.put("steamCount", steamCount + 1);
		
		myHobbyClassService.addSteamHobbyClass(inputData);
	}
	
	//@Test
	public void testdeleteSteam() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "a@a.a");
		inputData.put("hobbyClassNo", 10002);
		
		int steamCount = searchHobbyClassService.getHobbyClass(inputData).getSteamCount();
		
		inputData.put("steamCount", steamCount - 1);
		
		myHobbyClassService.deleteSteamHobbyClass(inputData);
	}

	//@Test
	public void testRecommendHobbyClassList() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "a@a.a";
		
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> returnMap = myHobbyClassService.getRecommendHobbyClassList(inputData);
		List<HobbyClass> list = (List<HobbyClass>)returnMap.get("list");
	}
	
}
