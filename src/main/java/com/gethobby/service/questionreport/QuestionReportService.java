package com.gethobby.service.questionreport;

import java.util.List;
import java.util.Map;

import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Report;

public interface QuestionReportService {
	public Question getQuestion(int questionNo) throws Exception;
	
	public Map<String, Object> getQuestionList(Map<String, Object> inputData) throws Exception;
	
	public void addAnswerAdmin(Question question) throws Exception;
	
	public void addQuestion(Question question) throws Exception;
	
	public Map<String, Object> getTotalQuestionAdmin(Map<String, Object> inputData) throws Exception;
	
	public void deleteQuestion(int questionNo) throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	public Map<String, Object> getTotalReportAdmin(Map<String, Object> inputData) throws Exception;
	
	public void processReportAdmin(Map<String, Object> inputData) throws Exception;
	
	public Report getUserReport(Map<String, Object> inputData) throws Exception;
	
	public Map<String, Object> getTotalReportCount() throws Exception;
	
	public Article getReportTargetArticle(int articleNo) throws Exception;
}
