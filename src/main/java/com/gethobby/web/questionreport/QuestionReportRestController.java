package com.gethobby.web.questionreport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.Report;
import com.gethobby.service.domain.User;
import com.gethobby.service.questionreport.QuestionReportService;

@RestController
@RequestMapping("/questionReport/*")
public class QuestionReportRestController {
	@Autowired
	@Qualifier("questionReportServiceImpl")
	private QuestionReportService questionReportService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	@RequestMapping( value = "json/getQuestionList" )
	public Map<String, Object> getQuestionList(@RequestBody Search search, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", user.getUserId());
		
		if ( search.getSearchCondition().equals("2") ) {
			search.setSearchCondition(null);
		}
		
		search.setPageSize(pageSize);
		
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getQuestionList(inputData);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("questionList", resultMap.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage() , ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		
		returnMap.put("resultPage", resultPage);
		return returnMap;
	}
	
	@RequestMapping( value = "json/processReportAdmin" )
	public Map<String, Object> processReportAdmin(@RequestBody Map<String, String> jsonMap) throws Exception {
		
		String reportState = jsonMap.get("reportState");
		int reportNo = Integer.parseInt(jsonMap.get("reportNo"));
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("reportState", reportState);
		inputData.put("reportNo", reportNo);
		
		questionReportService.processReportAdmin(inputData);
		
		Search search = new Search();
		
		search.setPageSize(pageSize);
		search.setCurrentPage(Integer.parseInt(jsonMap.get("currentPage")));
		search.setSearchCondition(jsonMap.get("searchCondition"));
		
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getTotalReportAdmin(inputData);
		
		List<Report> reportList = (List<Report>)resultMap.get("list");
		
		for(int i = 0; i < reportList.size(); i++) {
			reportList.get(i).setRegDate(reportList.get(i).getRegDate().substring(0, 10));
		}
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reportList", resultMap.get("list"));
		returnMap.put("resultPage", resultPage);
		return returnMap;
	}
	
	@RequestMapping( value = "json/addReport" )
	public Map<String, Object> addReport(@RequestBody Report report, HttpSession session) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		User user = (User)session.getAttribute("user");
		
		report.setUser(user);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		inputData.put("userId", report.getUser().getUserId());
		inputData.put("articleNo", report.getArticleNo());
		inputData.put("replyNo", report.getReplyNo());
		
		Report getReport = questionReportService.getUserReport(inputData);
		
		if ( getReport != null ) {
			returnMap.put("result", "false");
			return returnMap;
		}
		else {
			questionReportService.addReport(report);
			returnMap.put("result", "true");
			return returnMap;
		}
	}
	
	@RequestMapping( value = "json/getReportList" )
	public Map<String, Object> getReportList(@RequestBody Search search) throws Exception {
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("search", search);
		
		Map<String, Object> resultMap = questionReportService.getTotalReportAdmin(inputData);
		
		List<Report> reportList = (List<Report>)resultMap.get("list");
		
		for(int i = 0; i < reportList.size(); i++) {
			reportList.get(i).setRegDate(reportList.get(i).getRegDate().substring(0, 10));
		}
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)resultMap.get("total")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reportList", resultMap.get("list"));
		returnMap.put("resultPage", resultPage);
		
		return returnMap;
	}
}
