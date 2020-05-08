package com.gethobby.web.questionreport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Question;
import com.gethobby.service.domain.Report;
import com.gethobby.service.domain.User;
import com.gethobby.service.questionreport.QuestionReportService;

@Controller 
@RequestMapping("/questionReport/*")
public class QuestionReportController {
	@Autowired
	@Qualifier("questionReportServiceImpl")
	private QuestionReportService questionReportService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	@RequestMapping( value = "getQuestion" )
	public String getQuestion(@RequestParam("questionNo") int questionNo, HttpSession session, Model model) throws Exception {
		
		Question question = questionReportService.getQuestion(questionNo);
		
		model.addAttribute("question", question);
		return "forward:/questionReport/getQuestion?questionNo=" + questionNo;
	}
	
	@RequestMapping( value = "getQuestionList" )
	public String getQuestionList(HttpSession session, Model model) throws Exception {

		User user = (User)session.getAttribute("user");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getQuestionList(inputData);
		model.addAttribute("questionList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage() , ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		return "forward:/questionreport/listQuestion.jsp";
	}
	
	@RequestMapping( value = "getTotalQuestionListAdmin" )
	public String getTotalQuestionListAdmin(@ModelAttribute Search search, Model model) throws Exception {
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getTotalQuestionAdmin(inputData);
		model.addAttribute("questionList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		return "forward:/admin/listTotalQuestionAdmin.jsp";
	}
	
	@RequestMapping( value = "addAnswerAdmin" )
	public String addAnswerAdmin(@ModelAttribute Question question) throws Exception {
		questionReportService.addAnswerAdmin(question);
		
		int questionNo = question.getQuestionNo();
		
		return "forward:/questionReport/getQuestion?questionNo=" + questionNo;
	}
	
	@RequestMapping( value = "getTotalReportListAdmin" )
	public String getTotalReportListAdmin(Model model) throws Exception {
		Search search = new Search();
		
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		search.setSearchCondition("3");
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getTotalReportAdmin(inputData);
		
		List<Report> reportList = (List<Report>)resultMap.get("list");
		
		for(int i = 0; i < reportList.size(); i++) {
			reportList.get(i).setRegDate(reportList.get(i).getRegDate().substring(0, 10));
		}
		
		model.addAttribute("reportList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), 10, pageSize);
		model.addAttribute("resultPage", resultPage);
		System.out.println("----------------resultPage ? : " + resultPage);
		model.addAttribute("count", questionReportService.getTotalReportCount());
		
		return "forward:/admin/lisetTotalReportAdmin.jsp";
	}
	
	@RequestMapping( value = "addReport" )
	public String addReport(@ModelAttribute Report report, HttpSession session, Model model) throws Exception {
		User user = (User)session.getAttribute("user");
		report.setUser(user);
		
		questionReportService.addReport(report);
		
		return "forward:/questionreport/addReport.jsp";
	}
	
	@RequestMapping( value = "addQuestion" )
	public String addQuestion(@ModelAttribute Question question, HttpSession session, Model model) throws Exception {
		question.setQuestionContent( question.getQuestionContent().replace("\r\n", "<br/>") );
		
		User user = (User)session.getAttribute("user");
		question.setUser(user);
		
		questionReportService.addQuestion(question);
		
		return "forward:/questionreport/addQuestion.jsp";
	}
	
	@RequestMapping( value = "deleteQuestion" )
	public String deleteQuestion(@RequestParam("questionNo") int questionNo, HttpSession session, Model model) throws Exception {
		
		questionReportService.deleteQuestion(questionNo);
		
		User user = (User)session.getAttribute("user");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getQuestionList(inputData);
		model.addAttribute("questionList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage() , ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/questionreport/listQuestion.jsp";
	}
	
	@RequestMapping( value = "getReportTargetArticle" )
	public String getReportTargetArticle(@RequestParam("articleNo") int articleNo, Model model) throws Exception {
		
		Article article = questionReportService.getReportTargetArticle(articleNo);
		model.addAttribute("article", article);
		
		if ( article.getBoardCode().equals("0") ) {
			return "forward:/article/getFreeArticle.jsp";
		}
		
		return "forward:/article/getFreeArticle.jsp";
	}
}
