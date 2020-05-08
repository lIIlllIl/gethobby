package com.gethobby.web.purchase;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Search;
import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	//Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	
	@Value("#{apiKeyProperties['smartTracking']}")
	private String apiKey;
	
	//Constructor
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	//Method
	@RequestMapping( value="getSelectOption", method=RequestMethod.GET )
	public String getSelectOption(@RequestParam("hobbyClassNo") int hobbyClassNo,
			@RequestParam("eventDiscount") int eventDiscount, HttpSession session, Model model) throws Exception {
		model.addAttribute("purchase", purchaseService.getPayment(((User)session.getAttribute("user")).getUserId()));
		model.addAttribute("hobbyClass", purchaseService.getPaymentOption(hobbyClassNo, session));
		model.addAttribute("discountPrice", eventDiscount);
		return "/purchase/getSelectOption.jsp";
	}//end of getSelectOption

	@RequestMapping( value="getPaymentHistoryList", method=RequestMethod.GET )
	public String getPaymentHistoryList(HttpSession session, Model model) throws Exception {
		model.addAttribute("purchaseMap", purchaseService.getPaymentHistoryList(((User)session.getAttribute("user")).getUserId(), new Search()));
		
		
		//////////////////// 운송장 입력 ////////////////////
		String reqUrl = "https://info.sweettracker.co.kr/api/v1/companylist?t_key=" + apiKey;
		
		URL url = new URL(reqUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("accept", "application/json");
		con.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String result = "";
		String line = "";
		
		while((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response result:::::::::::" + result);
		br.close();
		
		JSONObject json = (JSONObject) JSONValue.parse(result);
		
		System.out.println("json:::::::::: " + json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> companyListMap = objectMapper.readValue(json.get("Company").toString(), new TypeReference<List<Map<String, Object>>>(){});
		
		System.out.println("map 안에 들어있는 것들::::::::::" + companyListMap);
		
		
		model.addAttribute("companyListMap", companyListMap);
		model.addAttribute("jsonString", json);
		System.out.println(companyListMap.get(0).get("Code"));
		////////////////////운송장 입력 ////////////////////
		
		
		
		
		return "/purchase/getPaymentHistory.jsp";
	}
		
	@RequestMapping( value="getLessonPage", method=RequestMethod.GET )
	public String getLessonPage(@RequestParam("hobbyClassNo") int hobbyClassNo) throws Exception {
		return "redirect:/lesson/getLesson?hobbyClassNo="+hobbyClassNo+"&lessonNo="+purchaseService.getLessonNoASC(hobbyClassNo);
	}//end of getLessonPage
	
	@RequestMapping( value="startDB", method=RequestMethod.GET )
	public String startingstartingPurchaseData() throws Exception{
		purchaseService.startingPurchaseData();
		return "/admin/getMoneyAnalysisAdmin.jsp";
	}//end of startingstartingPurchaseData
	
	@RequestMapping( value="mobileComplete", method=RequestMethod.GET )
	public String mobileComplete(HttpServletRequest request, HttpSession session) throws Exception{
		String hobbyClassNo = request.getParameter("hobbyClassNo");
		if( !purchaseService.mobileComplete(request, session) ) {
			return "/index.jsp";
		}
		System.out.println(hobbyClassNo);
		return "redirect:/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo="+hobbyClassNo;
	}//end of mobileComplete
}
