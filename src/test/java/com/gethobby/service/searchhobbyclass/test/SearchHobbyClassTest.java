package com.gethobby.service.searchhobbyclass.test;

import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.User;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 							 "classpath:config/context-mybatis.xml",
		 							 "classpath:config/context-transaction.xml"})
public class SearchHobbyClassTest {

	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;

	//@Test
	public void testHobbyClassList() throws Exception {
		Search search = new Search();
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		search.setSearchCondition("1");
		search.setSearchKeyword("t");

		List<String> hashtagList = new ArrayList<String>();
		hashtagList.add("M01");
		hashtagList.add("E03");

		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search); 
		inputData.put("userId", "a@a.a");

		inputData.put("classState", "3");
		
		Map<String, Object> map = searchHobbyClassService.getHobbyClassList(inputData);
		List<HobbyClass> hobbyClassList = (List<HobbyClass>)map.get("list");
		int total = (Integer)map.get("total");
	}
	
	//@Test 
	public void testAssessContent() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		inputData.put("hobbyClassNo", 10000);

		Map<String, Object> resultMap = searchHobbyClassService.getHobbyClassAssessContent(inputData);
		List<ClassAssess> listAssessContent = (List<ClassAssess>)resultMap.get("list");

	}

	//@Test
	public void testLessonTimes() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "d@d.d");
		inputData.put("hobbyClassNo", 10000);
		
		List<LessonTimes> lessonTimesList = searchHobbyClassService.getLessonTimesList(inputData);
		
	}
	
	//@Test
	public void testPopularHobbyClassList() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "a@a.a";
		
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> returnMap = searchHobbyClassService.getPopularHobbyClassList(inputData);
		List<HobbyClass> list = (List<HobbyClass>)returnMap.get("list");
	}
	
	//@Test
	public void testRegisterHobbyClassList() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "a@a.a";
		
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> returnMap = searchHobbyClassService.getPopularHobbyClassList(inputData);
		List<HobbyClass> list = (List<HobbyClass>)returnMap.get("list");
	}
	
	//@Test
	public void testAddHobbyClassAssess() throws Exception {
		ClassAssess classAssess = new ClassAssess();
		
		User user = new User();
		user.setUserId("a@a.a");
		
		classAssess.setUser(user);
		
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassNo(10000);
		
		classAssess.setHobbyClass(hobbyClass);
		
		classAssess.setAssessStar(4);
		classAssess.setAssessContent("이거 좋아요");
		
		searchHobbyClassService.addHobbyClassAssess(classAssess);
	}
	
	
	
}
