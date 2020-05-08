package com.gethobby.service.delivery.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = { "classpath:config/context-common.xml",
		 "classpath:config/context-mybatis.xml",
		 "classpath:config/context-transaction.xml"})
public class DeliveryTest {

	
//	@Autowired
//	@Qualifier("purchaseServiceImpl")
//	private PurchaseSerivce purchaseService;
	
	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	public void setDeliveryService(DeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}
	
//	@Test
	public void testGetDeliveryInfo() throws Exception {
		
		String purchaseId = "imp_085479007205";
		
		Purchase purchase = deliveryService.getDeliveryInfo(purchaseId);
		
		Assert.assertEquals("감자면", purchase.getReceiverName());
		Assert.assertEquals("010-1234-5678", purchase.getReceiverPhone());
		Assert.assertEquals("06134", purchase.getDlvyPostcode());
		Assert.assertEquals("서울 강남구 테헤란로5길 11 YBM빌딩 2층", purchase.getDlvyAddr());
		Assert.assertEquals("비트캠프 5강의실 C조 사무실", purchase.getDlvyDetailAddr());
		Assert.assertEquals("플러그인 3종 세트", purchase.getHobbyClass().getKitName());
		Assert.assertNull(purchase.getDlvyCompany());
	}
	
	
	
//	@Test
	public void testAddDeliveryInfo() throws Exception {
		
		String purchaseId = "imp_085479007205";
		
		Purchase purchase = deliveryService.getDeliveryInfo(purchaseId);
	
		Assert.assertEquals("감자면", purchase.getReceiverName());
		Assert.assertEquals("010-1234-5678", purchase.getReceiverPhone());
		Assert.assertEquals("06134", purchase.getDlvyPostcode());
		Assert.assertEquals("서울 강남구 테헤란로5길 11 YBM빌딩 2층", purchase.getDlvyAddr());
		Assert.assertEquals("비트캠프 5강의실 C조 사무실", purchase.getDlvyDetailAddr());
		Assert.assertEquals("플러그인 3종 세트", purchase.getHobbyClass().getKitName());

		purchase.setDlvyCompany("04");
		purchase.setTrackingNo("626587697782");
		
		deliveryService.addDeliveryInfo(purchase);
		
		purchase = deliveryService.getDeliveryInfo(purchaseId);
		
		Assert.assertEquals("04", purchase.getDlvyCompany());
//		Assert.assertEquals("628245557784", purchase.getTrackingNo());
	}
}










