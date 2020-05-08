package com.gethobby.web.delivery;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.service.delivery.DeliveryService;

@RestController
@RequestMapping("/delivery/*")
public class DeliveryRestController {

	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	
	public DeliveryRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getDeliveryDetailInfo/{code}/{num}", method=RequestMethod.GET)
	public String getDeliveryDetailInfo(Model model, @PathVariable("code") String code, @PathVariable("num") String num) throws Exception {
		
		String apiKey = "kGvHpXU7vAct6AgT1CmlLg";
		String reqUrl = "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+apiKey+"&t_code="+code+"&t_invoice="+num;
		
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
		
		JSONObject json = (JSONObject)JSONValue.parse(result);
		System.out.println("json::::::::::" + json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(json.toString(), new TypeReference<Map<String, Object>>() {});
		
		String receiverName = (String) map.get("receiverName");
		String senderName = (String) map.get("senderName");
		String receiverAddr = (String) map.get("receiverAddr");
		
		Map<String, Object> firstDetailMap = objectMapper.readValue(json.get("firstDetail").toString(), new TypeReference<Map<String, Object>>() {});
		String timeString = firstDetailMap.get("timeString").toString();
		
		List<Map<String, Object>> list = objectMapper.readValue(json.get("trackingDetails").toString(), new TypeReference<List<Map<String, Object>>>() {} );
		
		model.addAttribute("deliveryNum", num);
		model.addAttribute("receiverName", receiverName);
		model.addAttribute("senderName", senderName);
		model.addAttribute("receiverAddr", receiverAddr);
		model.addAttribute("timeString", timeString);
		model.addAttribute("list", list);
		
		return "forward:/delivery/getDeliveryInfoDetail.jsp";
	}

}
