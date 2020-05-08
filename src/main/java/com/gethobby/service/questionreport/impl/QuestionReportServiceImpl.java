package com.gethobby.service.questionreport.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.Report;
import com.gethobby.service.lesson.LessonDAO;
import com.gethobby.service.questionreport.QuestionReportDAO;
import com.gethobby.service.questionreport.QuestionReportService;

@Service("questionReportServiceImpl")
public class QuestionReportServiceImpl implements QuestionReportService {
	@Autowired
	@Qualifier("questionReportDAOImpl")
	private QuestionReportDAO questionReportDAO;
	
	@Autowired
	@Qualifier("lessonDAOImpl")
	private LessonDAO lessonDAO;
	
	@Override
	public Question getQuestion(int questionNo) throws Exception {
		return questionReportDAO.getQuestion(questionNo);
	}

	@Override
	public Map<String, Object> getQuestionList(Map<String, Object> inputData) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int totalCount = questionReportDAO.getQuestionListTotalCount(inputData);
		List<Question> questionList = questionReportDAO.getQuestionList(inputData);
		
		returnMap.put("list", questionList);
		returnMap.put("total", totalCount);
		
		return returnMap;
	}

	@Override
	public void addAnswerAdmin(Question question) throws Exception {
		questionReportDAO.addAnswerAdmin(question);
	}

	@Override
	public void addQuestion(Question question) throws Exception {
		questionReportDAO.addQuestion(question);
	}

	@Override
	public Map<String, Object> getTotalQuestionAdmin(Map<String, Object> inputData) throws Exception {
		List<Question> questionAdminList = questionReportDAO.getTotalQuestionAdmin(inputData);
		int totalCount = questionReportDAO.getTotalQuestionAdminTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("total", totalCount);
		returnMap.put("list", questionAdminList);
		
		return returnMap;
	}

	@Override
	public void deleteQuestion(int questionNo) throws Exception {
		questionReportDAO.deleteQuestion(questionNo);
	}

	@Override
	public void addReport(Report report) throws Exception {
		questionReportDAO.addReport(report);
	}

	@Override
	public Map<String, Object> getTotalReportAdmin(Map<String, Object> inputData) throws Exception {
		List<Report> reportList = questionReportDAO.getTotalReportListAdmin(inputData);
		int totalCount = questionReportDAO.getTotalReportListAdminTotalCount(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", reportList);
		returnMap.put("total", totalCount);
		
		return returnMap;
	}

	@Override
	public void processReportAdmin(Map<String, Object> inputData) throws Exception {
		String checkResult = (String)inputData.get("reportState");
		
		
		Report report = questionReportDAO.getReport(inputData);
		
		int articleNo = report.getArticleNo();
		int replyNo = report.getReplyNo();
		String userId = "";
		
		if ( checkResult.equals("2") ) {
			if ( articleNo == 0 && replyNo >= 10000 ) {
				Reply lessonReply = lessonDAO.getLessonReply(replyNo);
				
				int totalReport = lessonReply.getTotalReport() + 1;
				userId = lessonReply.getUser().getUserId();
				
				if ( totalReport < 5 ) {
					Map<String, Object> updateData = new HashMap<String, Object>();
					updateData.put("totalReport", totalReport);
					updateData.put("replyNo", replyNo);
					
					lessonDAO.updateLesssonReplyTotalReport(updateData);
				}

			}
		}
		
		questionReportDAO.processReportAdmin(inputData);
	}

	@Override
	public Report getUserReport(Map<String, Object> inputData) throws Exception {
		return questionReportDAO.getUserReport(inputData);
	}

	@Override
	public Map<String, Object> getTotalReportCount() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int all = questionReportDAO.getReportAdminAll();
		int refusal = questionReportDAO.getReportAdminRefusal();
		int atomosphere = questionReportDAO.getReportAdminAtmosphere();
		int approval = questionReportDAO.getReportAdminApproval();
		
		returnMap.put("all", all);
		returnMap.put("refusal", refusal);
		returnMap.put("atomosphere", atomosphere);
		returnMap.put("approval", approval);
		
		return returnMap;
	}

	@Override
	public Article getReportTargetArticle(int articleNo) throws Exception {
		return questionReportDAO.getReportTargetArticle(articleNo);
	}

}
