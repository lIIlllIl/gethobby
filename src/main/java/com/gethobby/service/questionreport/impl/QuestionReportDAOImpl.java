package com.gethobby.service.questionreport.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Report;
import com.gethobby.service.questionreport.QuestionReportDAO;

@Repository("questionReportDAOImpl")
public class QuestionReportDAOImpl implements QuestionReportDAO {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Override
	public Question getQuestion(int questionNo) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getQuestion", questionNo);
	}

	@Override
	public List<Question> getQuestionList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("QuestionReportMapper.getQuestionList", inputData);
	}

	@Override
	public void addAnswerAdmin(Question question) throws Exception {
		sqlSession.update("QuestionReportMapper.addAnswerAdmin", question);
	}

	@Override
	public void addQuestion(Question question) throws Exception {
		sqlSession.insert("QuestionReportMapper.addQuestion", question);
	}

	@Override
	public List<Question> getTotalQuestionAdmin(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("QuestionReportMapper.getTotalQuestionAdmin", inputData);
	}

	@Override
	public void deleteQuestion(int questionNo) throws Exception {
		sqlSession.delete("QuestionReportMapper.deleteQuestion", questionNo);
	}

	@Override
	public void addReport(Report report) throws Exception {
		sqlSession.insert("QuestionReportMapper.addReport", report);
	}

	@Override
	public List<Report> getTotalReportListAdmin(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("QuestionReportMapper.getTotalReportListAdmin", inputData);
	}

	@Override
	public void processReportAdmin(Map<String, Object> inputData) throws Exception {
		sqlSession.update("QuestionReportMapper.progressReportAdmin", inputData);
	}

	@Override
	public Report getReport(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getReport", inputData);
	}

	@Override
	public int getQuestionListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.questionListTotalCount", inputData);
	}

	@Override
	public int getTotalQuestionAdminTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getTotalQuestionAdminTotalCount", inputData);
	}

	@Override
	public Report getUserReport(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getUserReport", inputData);
	}

	@Override
	public int getReportAdminAtmosphere() throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getReportAdminAtmosphere");
	}

	@Override
	public int getReportAdminRefusal() throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getReportAdminRefusal");
	}

	@Override
	public int getReportAdminApproval() throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getReportAdminApproval");
	}

	@Override
	public int getReportAdminAll() throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getReportAdminAll");
	}

	@Override
	public int getTotalReportListAdminTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getTotalReportListAdminTotalCount", inputData);
	}

	@Override
	public Article getReportTargetArticle(int articleNo) throws Exception {
		return sqlSession.selectOne("QuestionReportMapper.getTotalReportListAdminTotalCount", articleNo);
	}

}
