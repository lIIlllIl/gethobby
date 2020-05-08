package com.gethobby.service.questionreport.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Report;
import com.gethobby.service.domain.User;
import com.gethobby.service.questionreport.QuestionReportService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 							 "classpath:config/context-mybatis.xml",
		 							 "classpath:config/context-transaction.xml"})

public class questionReportTest {
	@Autowired
	@Qualifier("questionReportServiceImpl")
	private QuestionReportService questionReportService;
	
	//@Test
	public void testGetQuestion() throws Exception {
		Question question = questionReportService.getQuestion(10000);
		
		System.out.println("-----question ? : " + question);
	}
	
	//@Test
	public void testGetQuestionList() throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		
		inputData.put("search", search);
		inputData.put("userId", "a@a.a");
		
		Map<String, Object> resultMap = questionReportService.getQuestionList(inputData);
		
		List<Question> questionList = (List<Question>)resultMap.get("list");

	}
	
	@Test
	public void testAddAnswerAdmin() throws Exception {
		Question question = new Question();
		question.setQuestionNo(10000);
		question.setAnswerContent("문의 답변입니다. 답변답변");
		
		questionReportService.addAnswerAdmin(question);
	}
	
	//@Test
	public void testAddQuestion() throws Exception {
		Question question = new Question();
		question.setQuestionTitle("문의 제목");
		question.setQuestionContent("문의 본문");
		question.setQuestionType("2");
		
		User user = new User();
		user.setUserId("b@b.b");
		
		question.setUser(user);
		
		questionReportService.addQuestion(question);
	}

	//@Test 
	public void testDeleteQuestion() throws Exception {
		questionReportService.deleteQuestion(10007);
	}
	
	//@Test
	public void testAddReport() throws Exception {
		Report report = new Report();
		
		User user = new User();
		user.setUserId("a@a.a");
		
		report.setUser(user);

		report.setReplyNo(10000);
		report.setReportCode("1");
		
		questionReportService.addReport(report);
	}

	//@Test 
	public void testProgressReportAdmin() throws Exception {
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		inputData.put("reportNo", 10000);
		inputData.put("reportState", "2");
		
		questionReportService.processReportAdmin(inputData);
	}
}
