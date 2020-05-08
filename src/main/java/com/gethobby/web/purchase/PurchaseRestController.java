package com.gethobby.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	//Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	//Constructor
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	//Method
	@RequestMapping( value="json/complete", method=RequestMethod.POST )
	public boolean paymentComplete (@RequestBody Purchase purchase, HttpSession session) throws Exception {
		return purchaseService.paymentComplete(purchase, session);
	}//end of paymentComplete

	@RequestMapping( value="json/getPaymentHistory", method=RequestMethod.POST )
	public Purchase getPaymentHistory(@RequestBody Purchase purchase) throws Exception {
		return purchaseService.getPurchase(purchase.getPurchaseId());
	}//end of getPaymentHistory
	
	@RequestMapping( value="json/getPaymentHistoryList", method=RequestMethod.POST )
	public Map getPaymentHistoryList(@RequestBody Search search, HttpSession session) throws Exception {
		return purchaseService.getPaymentHistoryList( ((User)session.getAttribute("user")).getUserId(), search );
	}//end of getPaymentHistoryList
	
	@RequestMapping( value="json/requestRefund", method=RequestMethod.POST )
	public Purchase requestRefund(@RequestBody Purchase purchase) throws Exception {
		return purchaseService.requestRefund(purchase.getPurchaseId());
	}//end of requestRefund

}
