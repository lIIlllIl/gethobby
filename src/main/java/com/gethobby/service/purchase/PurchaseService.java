package com.gethobby.service.purchase;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
//2020-02-24 Git Commit
public interface PurchaseService {
	
	public HobbyClass getPaymentOption(int hobbyClassNo, HttpSession session) throws Exception;  
	
	public Purchase getPayment(String userId) throws Exception; 
	
	public int addPayment(Purchase purchase) throws Exception; 
	
	public Purchase getPurchase(String purchaseId) throws Exception;
	
	public Map getPaymentHistoryList(String userId, Search search) throws Exception; 
	
	public Purchase getDelivery(String userId) throws Exception; 
	
	public Purchase requestRefund(String purchaseId) throws Exception;
	
	public boolean paymentComplete(Purchase purchase, HttpSession session) throws Exception;
	
	public boolean mobileComplete(HttpServletRequest request, HttpSession session) throws Exception;
	
	public int getLessonNoASC(int hobbyClassNo) throws Exception;
	
	// Admin
	public Map<String, Object> getPaymentHistoryListAdmin(Search search) throws Exception; 
	
	public Purchase updateRefund(Purchase purchase) throws Exception; 
	
	public int addDeliveryInfo(Purchase purchase) throws Exception;
	
	public Map getMoneyAnalysisSum() throws Exception;
	
	public int getMoneyAnalysisAvg(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public int getMoneyAnalysisCount(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public void startingPurchaseData() throws Exception;
	
}//end of interface PurchaseService
