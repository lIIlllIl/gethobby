package com.gethobby.web.delivery;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;

@Controller
@RequestMapping("/delivery/*")
public class DeliveryController {
	
	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	
	@Value("#{apiKeyProperties['smartTracking']}")
	private String apiKey;

	
	public DeliveryController() {
		System.out.println("DeliveryController");
	}
	
//	택배회사 정보 가져오기
	@RequestMapping(value="addDeliveryInfo", method=RequestMethod.GET)
	public String addDeliveryInfoView(Model model) throws Exception {
		
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
//		JSONArray jsonArray = new JSONArray();
//		jsonArray.add(json);
		
		System.out.println("json:::::::::: " + json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> companyListMap = objectMapper.readValue(json.get("Company").toString(), new TypeReference<List<Map<String, Object>>>(){});
		
		System.out.println("map 안에 들어있는 것들::::::::::" + companyListMap);
		
		
		model.addAttribute("companyListMap", companyListMap);
		System.out.println(companyListMap.get(0).get("Code"));
//		
//		List<String> list = new ArrayList<String>();
//		
//		list.add("123123");
//		list.add("444444");
//		list.add("777777");
//		list.add("131313131");
//		
//		model.addAttribute(arg0, arg1)
		
		
		return "forward:/delivery/addDeliveryInfo.jsp";
	}
	
	
//	배송 정보 등록
	@RequestMapping(value="addDeliveryInfo", method=RequestMethod.POST)
	public String addDeliveryInfo(@ModelAttribute("purchase") Purchase delivery) throws Exception {
		
		deliveryService.addDeliveryInfo(delivery);
		
		return "redirect:/delivery/getDeliveryPurchase.jsp";
	}
	
	
	
//  배송 정보 확인 페이지
	@RequestMapping(value="getDeliveryPurchase", method=RequestMethod.GET) 
	public String getDeliveryPurchase() throws Exception{
		
		return "forward:/delivery/getDeliveryPurchase.jsp";
	}
	
	
//	배송정보 조회
	@RequestMapping(value="getDeliveryInfo", method=RequestMethod.GET)
	public String getDeliveryInfo(@RequestParam("purchaseId") String purchaseId, Model model) throws Exception {
		
		Purchase delivery = deliveryService.getDeliveryInfo(purchaseId);
		System.out.println(delivery);
		model.addAttribute("delivery", delivery);
		
		return "forward:/delivery/getDeliveryInfo.jsp";
	}
	
	
	
// 배송 정보 상세 조회(스마트택배 배송조회 api)	
	@RequestMapping(value="getDeliveryInfoDetail/{dlvyCompany}/{trackingNo}", method=RequestMethod.GET)
	public String getDeliveryInfoDetail(Model model, @PathVariable("dlvyCompany") String dlvyCompany, @PathVariable("trackingNo") String trackingNo) throws Exception {
		
//		String apiKey = "kGvHpXU7vAct6AgT1CmlLg";
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
		
		model.addAttribute("deliveryNum", trackingNo);
		model.addAttribute("receiverName", receiverName);
		model.addAttribute("senderName", senderName);
		model.addAttribute("receiverAddr", receiverAddr);
		model.addAttribute("timeString", timeString);
		model.addAttribute("list", list);
		
		return "forward:/delivery/getDeliveryInfoDetail.jsp";
	}
}
