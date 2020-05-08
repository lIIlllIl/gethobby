package com.gethobby.service.questionreport;

import java.util.List;
import java.util.Map;

import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Report;

public interface QuestionReportDAO {
	public Question getQuestion(int questionNo) throws Exception;
	
	public List<Question> getQuestionList(Map<String, Object> inputData) throws Exception;
	
	public void addAnswerAdmin(Question question) throws Exception;
	
	public void addQuestion(Question question) throws Exception;
	
	public List<Question> getTotalQuestionAdmin(Map<String, Object> inputData) throws Exception;
	
	public void deleteQuestion(int questionNo) throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	public List<Report> getTotalReportListAdmin(Map<String, Object> inputData) throws Exception;
	
	public void processReportAdmin(Map<String, Object> inputData) throws Exception;
	
	public Report getReport(Map<String, Object> inputData) throws Exception;
	
	public int getQuestionListTotalCount(Map<String, Object> inputData) throws Exception;
	
	public int getTotalQuestionAdminTotalCount(Map<String, Object> inputData) throws Exception;
	
	public Report getUserReport(Map<String, Object> inputData) throws Exception;
	
	public int getReportAdminAtmosphere() throws Exception;
	
	public int getReportAdminRefusal() throws Exception;
	
	public int getReportAdminApproval() throws Exception;
	
	public int getReportAdminAll() throws Exception;
	
	public int getTotalReportListAdminTotalCount(Map<String, Object> inputData) throws Exception;
	
	public Article getReportTargetArticle(int articleNo) throws Exception;
}
