package com.gethobby.service.lesson.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;
import com.gethobby.service.lesson.LessonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 							 "classpath:config/context-mybatis.xml",
		 							 "classpath:config/context-transaction.xml"})
public class LessonTest {
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	//@Test
	public void testGetLesson() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "e@f.g");
		inputData.put("lessonNo", 10004);
		inputData.put("hobbyClassNo", 10000);
			
		LessonTimes lesson = lessonService.getLesson(inputData);
		
		System.out.println("------lesson ? : " + lesson);
	} 
	
	//@Test 
	public void testGetArrowLesson() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "e@f.g");
		inputData.put("lessonNo", 10004);
		inputData.put("hobbyClassNo", 10000);
		
		Search search = new Search();

		int currentCount = 4;
		search.setCurrentPage(currentCount + 1);
		
		inputData.put("search", search);
			
		LessonTimes lesson = lessonService.getLesson(inputData);
		
	}
	
	//@Test
	public void testAddLessonReply() throws Exception {
		Reply reply = new Reply();
		
		User user = new User();
		user.setUserId("a@a.a");
		
		reply.setUser(user);
		
		Lesson lesson = new Lesson();
		lesson.setLessonNo(10000);
		
		reply.setLesson(lesson);
		
		reply.setReplyContent("테ㅅ트댓글");
		
		lessonService.addLessonReply(reply);
	}
	
	//@Test
	public void testUpdateLessonReply() throws Exception {
		Reply reply = new Reply();
		
		reply.setReplyNo(10000);
		reply.setReplyContent("테스트댓글");
		
		lessonService.updateLessonReply(reply);

	}
	
	//@Test
	public void testDeleteLessonReply() throws Exception {
		lessonService.deleteLessonReply(10000);
	}
	
	//@Test
	public void testAddLessonTimes() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", "a@a.a");
		inputData.put("lessonNo", 10003);
		inputData.put("hobbyClassNo", 10000);
		inputData.put("totalTimes", 80);
		
		lessonService.addLessonTimes(inputData);
	}
	
	//@Test
	public void testUpdateLessonTimes() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		int currentTimes = 25;
		int maxTimes = 10;
		
		inputData.put("currentTimes", currentTimes);
		inputData.put("maxTimes", currentTimes >= maxTimes ? currentTimes : maxTimes);
		inputData.put("lessonNo", 10003);
		inputData.put("userId", "a@a.a");
		inputData.put("hobbyClassNo", 10000);
		
		lessonService.updateLessonTimes(inputData);
	}
	
	//@Test 
	public void testGetLessonReply() throws Exception {
		Reply lessonReply = lessonService.getLessonReply(10000);
	}
}
