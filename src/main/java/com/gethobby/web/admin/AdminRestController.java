package com.gethobby.web.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;
import com.gethobby.service.user.UserService;

//2020-02-24 Git Commit
@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
	
	//Field
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;

	@Value("#{apiKeyProperties['smartTracking']}")
	private String apiKey;
	
	
	

	//Constructor
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/purchase/getPaymentHistoryListAdmin", method=RequestMethod.POST )
	public Map getPaymentHistoryListAdmin(@RequestBody Search search) throws Exception {
		return purchaseService.getPaymentHistoryListAdmin(search);
	}
	
	
	@RequestMapping( value="json/purchase/addDeliveryInfo", method=RequestMethod.POST )
	public Purchase getPaymentHistoryAdmin(@RequestBody Purchase purchase) throws Exception {
		//return purchaseService.getPaymentHistoryListAdmin(search);
		deliveryService.addDeliveryInfo(purchase);
		
		return purchaseService.getPurchase(purchase.getPurchaseId());
	}
	
	
	
	
	
	
//	배송정보 조회
	@RequestMapping(value="json/purchase/getDeliveryInfo/{purchaseId}", method=RequestMethod.GET)
	public Purchase getDeliveryInfo(@PathVariable("purchaseId") String purchaseId) throws Exception {
		
		Purchase delivery = deliveryService.getDeliveryInfo(purchaseId);
		System.out.println(delivery);
		//model.addAttribute("delivery", delivery);
		
		return delivery;
	}
	
	// 배송 정보 상세 조회(스마트택배 배송조회 api)	
	@RequestMapping(value="json/purchase/getDeliveryInfoDetail/{dlvyCompany}/{trackingNo}", method=RequestMethod.GET)
	public Map<String, Object> getDeliveryInfoDetail(@PathVariable("dlvyCompany") String dlvyCompany, @PathVariable("trackingNo") String trackingNo) throws Exception {
		
//			String apiKey = "kGvHpXU7vAct6AgT1CmlLg";
		String reqUrl = "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+apiKey+"&t_code="+dlvyCompany+"&t_invoice="+trackingNo;
		
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
		
		System.out.println("dlvyCompany result::::::::::: " + dlvyCompany);
		System.out.println("trackingNo result::::::::::: " + trackingNo);
		System.out.println("response result::::::::::: " + result);
		br.close();
		
		JSONObject json = (JSONObject)JSONValue.parse(result);
		System.out.println("json:::::::::: " + json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(json.toString(), new TypeReference<Map<String, Object>>() {});
		
		String receiverName = (String) map.get("receiverName");
		String senderName = (String) map.get("senderName");
		String receiverAddr = (String) map.get("receiverAddr");
		
		Map<String, Object> firstDetailMap = objectMapper.readValue(json.get("firstDetail").toString(), new TypeReference<Map<String, Object>>() {});
		String timeString = firstDetailMap.get("timeString").toString();
		
		List<Map<String, Object>> list = objectMapper.readValue(json.get("trackingDetails").toString(), new TypeReference<List<Map<String, Object>>>() {} );
		
//		model.addAttribute("deliveryNum", trackingNo);
//		model.addAttribute("receiverName", receiverName);
//		model.addAttribute("senderName", senderName);
//		model.addAttribute("receiverAddr", receiverAddr);
//		model.addAttribute("timeString", timeString);
//		model.addAttribute("list", list);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="json/purchase/updateRefund", method=RequestMethod.POST )
	public Purchase updateRefund(@RequestBody Purchase purchase) throws Exception {
		return purchaseService.updateRefund(purchase);
	}
	
	@RequestMapping( value="json/hobbyClass/getHobbyClassListAdmin", method=RequestMethod.POST )
	public Map getHobbyClassListAdmin(@RequestBody Search search) throws Exception {
		return oepnhobbyClassService.getHobbyClassListAdmin(search);
	}
	
	@RequestMapping( value="json/hobbyClass/saveCheckHobbyClassAdmin", method=RequestMethod.POST )
	public int saveCheckHobbyClassAdmin(@RequestBody HobbyClass hobbyClass) throws Exception {
		List<LessonTimes> lessonTimesList = searchHobbyClassService.getHobbyClassEncodingLessonList(hobbyClass.getHobbyClassNo());
		
		for(int i = 0; i < lessonTimesList.size(); i++) {
			String url = "http://192.168.0.144:3000/videoEncoding/" + lessonTimesList.get(i).getLesson().getLessonVideo();
			URL encodingUrl = new URL(url);
			
			HttpURLConnection con = (HttpURLConnection)encodingUrl.openConnection();
			con.setRequestMethod("GET");
			con.getResponseCode();
		}
		
		return oepnhobbyClassService.saveCheckHobbyClassAdmin(hobbyClass.getHobbyClassNo());
	}
	
	@RequestMapping(value="json/user/getSearchlistUserAdmin" , method = RequestMethod.POST)
	public Map getSearchlistUserAdmin(@RequestBody HashMap<String, String> map) throws Exception{
		System.out.println(map);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setSearchCondition(map.get("searchCondition"));
		
		return userService.getUserListAdmin(search);
	}


}
