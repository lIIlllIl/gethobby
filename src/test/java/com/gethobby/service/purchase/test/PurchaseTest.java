package com.gethobby.service.purchase.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.purchase.PurchaseService;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class PurchaseTest {
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Test
	public void dateTest() throws Exception{
		System.out.println("d");
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println(time1);
	}
	
	//@Test
	public void getComponentOption() throws Exception {	
		//System.out.println(purchaseService.getComponentOption(10002));
	}// Success
	
	//@Test
	public void getPayment() throws Exception {	
		System.out.println(purchaseService.getPayment("creator@bitcamp.com").getDlvyAddr());
	}// Success
	
	//@Test
	public void addPayment() throws Exception {	
		Purchase purchase = new Purchase();
		purchase.setPurchaseId("imp_1234567890");
		
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassNo(10002);
		purchase.setHobbyClass(hobbyClass);
		User user = new User();
		user.setUserId("creator@bitcamp.com");
		purchase.setUser(user);
		
		purchase.setComponentOption("1");
		purchase.setPayMethod("0");
		purchase.setPurchasePrice(500000);
		purchase.setReceiverName("ȫ�浿");
		purchase.setReceiverPhone("010-1234-1234");
		purchase.setDlvyAddr("addPaymet Test JUNIT");
		purchase.setDlvyDetailAddr("test");
		purchase.setDlvyPostcode("123123");
		purchase.setDlvyRequest("�׽�Ʈ�Դϴ�");

		System.out.println(purchaseService.addPayment(purchase));
	}// Success
	
	//@Test
	public void getPaymentHistoryList() throws Exception {	
		//List resultList = purchaseService.getPaymentHistoryList("creator@bitcamp.com");
		//for(Object obj : resultList) {
		//	System.out.println(resultList);
		//}
	}// Success
	
	//@Test
	public void getDelivery() throws Exception {	
		System.out.println(purchaseService.getDelivery("creator@bitcamp.com").getDlvyAddr());
	}// Success
	
	//@Test
	public void requestRefund() throws Exception {	
		Purchase purchase = new Purchase();
		purchase.setPurchaseId("imp_1234567890");
		purchase.setPurchasePrice(500000);
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassNo(10002);
		purchase.setHobbyClass(hobbyClass);
		//System.out.println(purchaseService.requestRefund(purchase));
	}// Success
	
	//@Test
	public void getPaymentHistoryListAdmin() throws Exception {	
		
	}
	
	//@Test
	public void updateRefund() throws Exception {	
		//System.out.println(purchaseService.updateRefund("imp_1234567890"));
	}// Success
	
	//@Test
	public void addDeliveryInfo() throws Exception {	
		Purchase purchase = new Purchase();
		purchase.setDlvyCompany("test");
		purchase.setTrackingNo("test");
		purchase.setPurchaseId("imp_085479007205");
		purchaseService.addDeliveryInfo(purchase);
	}// Success
	
	//@Test
	public void getMoneyAnalysisSum() throws Exception {	
		Map<String, Object> keyWordAndWhat = new HashMap<String, Object>();
		keyWordAndWhat.put("what", "800");
		keyWordAndWhat.put("keyWord", "m");
		//System.out.println(purchaseService.getMoneyAnalysisSum(keyWordAndWhat));
	}// Success
	
	//@Test
	public void getMoneyAnalysisAvg() throws Exception {	
		Map<String, Object> keyWordAndWhat = new HashMap<String, Object>();
		keyWordAndWhat.put("what", "800");
		keyWordAndWhat.put("keyWord", "m");
		System.out.println(purchaseService.getMoneyAnalysisAvg(keyWordAndWhat));
	}// Success
	
	//@Test
	public void getMoneyAnalysisCount() throws Exception {	
		Map<String, Object> keyWordAndWhat = new HashMap<String, Object>();
		keyWordAndWhat.put("what", "800");
		keyWordAndWhat.put("keyWord", "m");
		System.out.println(purchaseService.getMoneyAnalysisCount(keyWordAndWhat));
	}// Success
}
