package com.gethobby.service.purchase.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.AuthData;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassDAO;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseDAO;
import com.gethobby.service.purchase.PurchaseService;
import com.gethobby.service.user.UserDAO;

//2020-02-24 Git Commit
@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
		//Field
		@Autowired
		@Qualifier("purchaseDAOImpl")
		private PurchaseDAO purchaseDAO;
		public void setPurchaseDAO(PurchaseDAO purchaseDAO) {
			this.purchaseDAO = purchaseDAO;
		}
		@Autowired
		@Qualifier("openHobbyClassDAOImpl")
		private OpenHobbyClassDAO openHobbyClassDAO;
		public void setOpenHobbyClassDAO(OpenHobbyClassDAO openHobbyClassDAO) {
			this.openHobbyClassDAO = openHobbyClassDAO;
		}
		@Autowired
		@Qualifier("openHobbyClassServiceImpl")
		private OpenHobbyClassService openHobbyClassService;
		public void setOpenHobbyClassService(OpenHobbyClassService openHobbyClassService) {
			this.openHobbyClassService = openHobbyClassService;
		}
		@Autowired
		@Qualifier("userDAOImpl")
		private UserDAO userDAO;
		public void setUserDAO(UserDAO userDAO) {
			this.userDAO = userDAO;
		}
		@Value("#{apiKeyProperties}")
		private Properties apiKey;
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
			
		//Constructor
		public PurchaseServiceImpl() {
			System.out.println(this.getClass());
		}
			
		public HobbyClass getPaymentOption(int hobbyClassNo, HttpSession session) throws Exception {			
			return purchaseDAO.getComponentOption(hobbyClassNo);
		}

		public Purchase getPayment(String userId) throws Exception {

			Purchase purchase = purchaseDAO.getDelivery(userId);
			if(purchase == null) {
				Purchase userPurchase = purchaseDAO.getPayment(userId);
				userPurchase.setReceiverName(userDAO.getUser(userId).getName());
				return userPurchase;
			}
			return purchase;
		}

		public int addPayment(Purchase purchase) throws Exception {
			openHobbyClassService.updateTotalMoney(purchase.getHobbyClass().getHobbyClassNo(), purchase.getPurchasePrice(), "1");
			openHobbyClassService.updateTotalStudent(purchase.getHobbyClass().getHobbyClassNo(), 1, "1");
			return purchaseDAO.addPayment(purchase);
		}
		
		public Purchase getPurchase(String purchaseId) throws Exception {
			Purchase purchase = purchaseDAO.getPurchase(purchaseId);
			purchase.setHobbyClass( purchaseDAO.getComponentOption(purchase.getHobbyClass().getHobbyClassNo()) );			
			return purchase;
		}
		
		public int getLessonNoASC(int hobbyClassNo) throws Exception {
			return purchaseDAO.getLessonNoASC(hobbyClassNo);
		}

		public Map getPaymentHistoryList(String userId, Search search) throws Exception {
			if( search.getCurrentPage() == 0 ) {
				search.setCurrentPage(1);
			}
			search.setPageSize(10); // 무한스크롤 10개
			search.setSearchKeyword(userId);
			
			List returnList = new ArrayList();		
			List<Purchase> purchaseList = purchaseDAO.getPaymentHistoryList(search);
			Map paymentHistoryMap = new HashMap();			
			for(int i=0; i<purchaseList.size(); i++) {
				Purchase purchase = purchaseList.get(i);
				purchase.setHobbyClass( purchaseDAO.getPurchaseHobbyClass(purchase.getHobbyClass().getHobbyClassNo()) );
				returnList.add(purchase);
				
			}
			paymentHistoryMap.put("purchaseList", returnList);
			int totalCount = purchaseDAO.getTotalPurchase(userId);
			int maxPage = new Page(search.getCurrentPage(), totalCount, pageUnit, 10).getMaxPage();
			paymentHistoryMap.put("totalCount", totalCount);
			paymentHistoryMap.put("maxPage", maxPage);
			return paymentHistoryMap;
		}

		public Purchase getDelivery(String userId) throws Exception {
			return purchaseDAO.getDelivery(userId);
		}

		public Purchase requestRefund(String purchaseId) throws Exception {			
			purchaseDAO.requestRefund(purchaseId);
			return purchaseDAO.getPurchase(purchaseId);
		}
		
		public boolean paymentComplete(Purchase purchase, HttpSession session) throws Exception {
			boolean everythingsFine = false;
			String API_URL = "https://api.iamport.kr";
			String imp_key = apiKey.getProperty("imp_key");
			String imp_secret = apiKey.getProperty("imp_secret");
			
			//Get AccessToken
			HttpClient httpClient = new DefaultHttpClient();
			String url = "https://api.iamport.kr";
			HttpPost httpPost = new HttpPost(API_URL+"/users/getToken");
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Connection","keep-alive");
			httpPost.setHeader("Content-Type", "application/json");
			
			ObjectMapper objectMapper = new ObjectMapper();
			AuthData authData = new AuthData(imp_key, imp_secret);
			String data = objectMapper.writeValueAsString(authData);
			StringEntity httpEntity = new StringEntity(data);
			httpPost.setEntity(httpEntity);

			HttpResponse httpResponse = httpClient.execute(httpPost);
			HttpEntity responseHttpEntity = httpResponse.getEntity();
			InputStream is = responseHttpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));

			String temp="";
			String response="";
			while( (temp = br.readLine()) != null) {
				response += temp;
			}
			JSONObject jsonObj = (JSONObject)JSONValue.parse(((JSONObject)JSONValue.parse(response)).get("response").toString());
			String token  = jsonObj.get("access_token").toString();
			
			//Get Payment
			HttpClient paymentHttpClient = new DefaultHttpClient();
			String paymentUrl = API_URL+"/payments/"+purchase.getPurchaseId();
			HttpGet paymentHttpGet = new HttpGet(paymentUrl);
			paymentHttpGet.addHeader("Accept", "application/json");
			paymentHttpGet.addHeader("Authorization", token);
			
			HttpResponse paymentHttpResponse = paymentHttpClient.execute(paymentHttpGet);
			HttpEntity paymentHttpEntity = paymentHttpResponse.getEntity();
			InputStream paymentIs = paymentHttpEntity.getContent();
			BufferedReader paymentBr = new BufferedReader(new InputStreamReader(paymentIs,"UTF-8"));
			
			// check everythings_fine
			if (paymentHttpResponse.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
				   + paymentHttpResponse.getStatusLine().getStatusCode());
			}
			
			String paymentTemp="";
			String paymentResponse="";
			while( (paymentTemp = paymentBr.readLine()) != null) {
				paymentResponse+= paymentTemp;
			}
			JSONObject jsonObj11 = (JSONObject)JSONValue.parse(paymentResponse);
			ObjectMapper finalObjectMapper = new ObjectMapper();
			HashMap paymentMap = finalObjectMapper.readValue(jsonObj11.get("response").toString(), HashMap.class);
			String payMethod = paymentMap.get("pay_method").toString();
			
			if( payMethod.equals("card") ) {
				payMethod = "0";
			}else if( payMethod.equals("phone") ) {
				payMethod = "1";
			}
			purchase.setPayMethod(payMethod);
			purchase.setPurchasePrice((Integer)paymentMap.get("amount"));
			System.out.println(purchase.toString());
			
			User user = new User();
			user.setUserId(((User)session.getAttribute("user")).getUserId());
			purchase.setUser(user);
				
			if( purchaseDAO.addPayment(purchase) == 1) {
				everythingsFine = true;
			}
			
			
			return everythingsFine;
		}
		
		public boolean mobileComplete(HttpServletRequest request, HttpSession session) throws Exception {
			request.setCharacterEncoding("UTF-8");

			if( request.getParameter("imp_success").equals("true") ) {
				Purchase purchase = new Purchase();
				HobbyClass hobbyClass = new HobbyClass();
				hobbyClass.setHobbyClassNo(Integer.parseInt(request.getParameter("hobbyClassNo")));
				
				purchase.setPurchaseId(request.getParameter("imp_uid"));
				purchase.setHobbyClass(hobbyClass);
				purchase.setReceiverName(request.getParameter("receiverName"));
				purchase.setReceiverPhone(request.getParameter("receiverPhone"));
				purchase.setDlvyAddr(request.getParameter("dlvyAddr"));
				purchase.setDlvyDetailAddr(request.getParameter("dlvyDetailAddr"));
				purchase.setDlvyPostcode(request.getParameter("dlvyPostcode"));
				purchase.setDlvyRequest(request.getParameter("dlvyRequest"));
				purchase.setPayMethod(request.getParameter("payMethod"));
				purchase.setPurchasePrice(Integer.parseInt(request.getParameter("purchasePrice")));
				purchase.setComponentOption(request.getParameter("componentOption"));
	
				if ( this.paymentComplete(purchase, session) ) {
					return true;
				}
				
			}
			return false;
		}

		public Map<String, Object> getPaymentHistoryListAdmin(Search search) throws Exception {
			if( search.getCurrentPage() == 0 ) {
				search.setCurrentPage(1);
			};
			search.setPageSize(10);
			Map<String, Object> purchaseMap = new HashMap<String, Object>();
			Map<String, Object> totalCountMap = new HashMap<String, Object>();
			purchaseMap.put("purchase", purchaseDAO.getPaymentHistoryListAdmin(search));
			
			List tempList = (List) purchaseMap.get("purchase");
			for( int index=0; index<tempList.size(); index++) {
				int hobbyClassNo = ((Purchase)tempList.get(index)).getHobbyClass().getHobbyClassNo();
				((Purchase)tempList.get(index)).setHobbyClass(openHobbyClassService.getHobbyClass(hobbyClassNo, "530"));
			}
			
			// 전체 구매 개수
			totalCountMap.put("totalCountPurchase", "전체");
			purchaseMap.put("purchaseTotalCount", purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap));
			totalCountMap.put("totalCountPurchase", "구매");
			purchaseMap.put("purchasePaymentCount", purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap));
			totalCountMap.put("totalCountPurchase", "환불");
			purchaseMap.put("purchaseRefundCount", purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap));

			// 정렬기능 maxPage 
			if(search.getSearchCondition() != null && search.getSearchCondition().equals("purchaseState")) {
				totalCountMap.clear();
				totalCountMap.put("purchaseState", search.getSearchKeyword());
				totalCountMap.put("category", search.getCategory());
				int totalCount = purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap);
				purchaseMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 10));

			}else if(search.getSearchCondition() != null && search.getSearchCondition().equals("all")) {
				totalCountMap.clear();
				totalCountMap.put("all", "1");
				totalCountMap.put("searchKeyword", search.getSearchKeyword());
				totalCountMap.put("category", search.getCategory());
				int totalCount = purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap);

				purchaseMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 10));

			}else {
				totalCountMap.clear();
				totalCountMap.put("totalCountPurchase", "전체");
				totalCountMap.put("category", search.getCategory());
				int totalCount = purchaseDAO.getPurchaseTotalCountAdmin(totalCountMap);
				purchaseMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 10));

			}

			return purchaseMap;
		}

		public Purchase updateRefund(Purchase purchase) throws Exception {
			
			String API_URL = "https://api.iamport.kr";
			String imp_key = apiKey.getProperty("imp_key");
			String imp_secret = apiKey.getProperty("imp_secret");
			
			//Get AccessToken
			HttpClient httpClient = new DefaultHttpClient();
			String url = "https://api.iamport.kr";
			HttpPost httpPost = new HttpPost(API_URL+"/users/getToken");
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Connection","keep-alive");
			httpPost.setHeader("Content-Type", "application/json");
			
			ObjectMapper objectMapper = new ObjectMapper();
			AuthData authData = new AuthData(imp_key, imp_secret);
			String data = objectMapper.writeValueAsString(authData);
			StringEntity httpEntity = new StringEntity(data);
			httpPost.setEntity(httpEntity);

			HttpResponse httpResponse = httpClient.execute(httpPost);
			HttpEntity responseHttpEntity = httpResponse.getEntity();
			InputStream is = responseHttpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));

			String temp="";
			String response="";
			while( (temp = br.readLine()) != null) {
				response += temp;
			}
			JSONObject jsonObj = (JSONObject)JSONValue.parse(((JSONObject)JSONValue.parse(response)).get("response").toString());
			String token  = jsonObj.get("access_token").toString();
			
			System.out.println(token);
			
			//Get Payment
			HttpClient paymentHttpClient = new DefaultHttpClient();
			String paymentUrl = API_URL+"/payments/cancel";
			HttpPost paymentHttpPost = new HttpPost(paymentUrl);
			paymentHttpPost.addHeader("Accept", "application/json");
			paymentHttpPost.addHeader("Connection", "keep-alive");
			paymentHttpPost.addHeader("Content-Type", "application/json");
			paymentHttpPost.addHeader("Authorization", token);
			StringEntity requestStringEntity = new StringEntity("{\"imp_uid\":\""+purchase.getPurchaseId()+"\"}","UTF-8");
			paymentHttpPost.setEntity(requestStringEntity);
			
			HttpResponse paymentHttpResponse = paymentHttpClient.execute(paymentHttpPost);
			// check everythings_fine
			if (paymentHttpResponse.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
				   + paymentHttpResponse.getStatusLine().getStatusCode());
			}
				
			openHobbyClassService.updateTotalMoney(purchase.getHobbyClass().getHobbyClassNo(), purchase.getPurchasePrice(), "0");
			openHobbyClassService.updateTotalStudent(purchase.getHobbyClass().getHobbyClassNo(), 1, "0");
			purchaseDAO.updateRefund(purchase.getPurchaseId());
			return purchaseDAO.getPurchase(purchase.getPurchaseId());
		}

		public int addDeliveryInfo(Purchase purchase) throws Exception {
			return purchaseDAO.addDeliveryInfo(purchase);
		}

		public Map getMoneyAnalysisSum() throws Exception {
			Map analysisMap = new HashMap();
			Map yearMap = new HashMap();
			Map lastYearMap = new HashMap();
			int year = Calendar.getInstance().get(Calendar.YEAR);
			int lastYear = year - 1;
			int theYear = year;
			
			// 이번년도와 작년도 통계데이터 구하기 위한 for문
			for(int compare=0; compare<=1; compare++) {
				
				int endDay = 30;
				// 년도에 따른 해당 월의 통계데이터 구하기 위한 for문
				for(int month=1; month<=12; month++) {
					List monthList = new ArrayList(); // 매월 리스트 생성
					List dayList = new ArrayList();
					
					// 해당 월의 마지막 날 구하기
					switch(month) {
					case 2: 
						if( (theYear%4 == 0 && theYear%100 != 0) || (theYear%400 == 0)) { // 윤달일 경우
							endDay = 29;
						}else {
							endDay = 28;
						}
						break;
					case 1: case 3: case 5: case 7: case 8: case 10: case 12:
						endDay = 31;
						break;
					default:
						endDay = 30;
					}//end of switch
					
					// 해당월에 따른 하루 단위의 통계데이터 구하기 위한 for문
					for(int day=1; day<=endDay; day++) {
						String totalSum = purchaseDAO.getMoneyAnalysisSum(theYear+"-"+month+"-"+day);
						if( totalSum != null ) {
							monthList.add(totalSum);
						}else {
							monthList.add(0);
						}// 해당 일의 데이터가 없을 경우 0 입력			

					}//end of day for
					
					// 년도에 따른 Map에 데이터 넣는 곳
					if( theYear == year) {
						yearMap.put("month"+month, monthList);
					}else if( theYear == lastYear ) {
						lastYearMap.put("month"+month, monthList);
					}
					
					
					
				}//end of month for
				theYear = lastYear; // 올해 통계데이터 값을 얻고 난 후 작년 통계데이터를 위해 년도 변경
			}//end of year for
			analysisMap.put("yearMap", yearMap);
			analysisMap.put("lastYearMap", lastYearMap);
			
			return analysisMap;
		}

		public int getMoneyAnalysisAvg(Map<String, Object> keyWordAndWhat) throws Exception {
			return purchaseDAO.getMoneyAnalysisAvg(keyWordAndWhat);
		}
		
		public int getMoneyAnalysisCount(Map<String, Object> keyWordAndWhat) throws Exception {
			return purchaseDAO.getMoneyAnalysisCount(keyWordAndWhat);
		}
		
		public void startingPurchaseData() throws Exception {
			
			for(int i=0; i<100; i++) {
				User user = new User();
				user.setUserId("user01@naver.com");
				HobbyClass hobbyClass = new HobbyClass();
				hobbyClass.setHobbyClassNo(10000);
				Purchase purchase = new Purchase();
				if( i<=10 ) {
					purchase.setPurchaseId("imp_01234567890"+i);
				}else{
					purchase.setPurchaseId("imp_0123456789"+i);
				}
				purchase.setUser(user);
				purchase.setHobbyClass(hobbyClass);
				purchase.setPurchasePrice(1000000-(i+1)*10000);
				purchase.setPayMethod("0");
				purchase.setReceiverName("홍길동");
				purchase.setReceiverPhone("010-1234-5678");
				purchase.setComponentOption("0");
				
				if( i<=28 ) {
					Date date = Date.valueOf("2019-01-"+(i+1));
					purchase.setPurchaseDate(date);
				}else if( i<=56 ) {
					Date date = Date.valueOf("2019-02-"+(i-28));
					purchase.setPurchaseDate(date);
				}else if( i<=84 ) {
					Date date = Date.valueOf("2019-03-"+(i-56));
					purchase.setPurchaseDate(date);
				}else {
					Date date = Date.valueOf("2019-04-"+(i-84));
					purchase.setPurchaseDate(date);
				}
				int success = purchaseDAO.startingPurchaseData(purchase);
			}
			
			for(int i=0; i<100; i++) {
				User user = new User();
				user.setUserId("user01@naver.com");
				HobbyClass hobbyClass = new HobbyClass();
				hobbyClass.setHobbyClassNo(10000);
				Purchase purchase = new Purchase();
				if( i<=10 ) {
					purchase.setPurchaseId("imp_"+i+"01234567890");
				}else{
					purchase.setPurchaseId("imp_"+i+"0123456789");
				}
				purchase.setUser(user);
				purchase.setHobbyClass(hobbyClass);
				purchase.setPurchasePrice((i+1)*10000);
				purchase.setPayMethod("0");
				purchase.setReceiverName("홍길동");
				purchase.setReceiverPhone("010-1234-5678");
				purchase.setComponentOption("0");
				
				if( i<=28 ) {
					Date date = Date.valueOf("2020-01-"+(i+1));
					purchase.setPurchaseDate(date);
				}else if( i<=56 ) {
					Date date = Date.valueOf("2020-02-"+(i-28));
					purchase.setPurchaseDate(date);
				}else if( i<=84 ) {
					Date date = Date.valueOf("2020-03-"+(i-56));
					purchase.setPurchaseDate(date);
				}else {
					Date date = Date.valueOf("2020-04-"+(i-84));
					purchase.setPurchaseDate(date);
				}
				int success = purchaseDAO.startingPurchaseData(purchase);		
			}
			System.out.println("purchaseDB Success");
		}

}
