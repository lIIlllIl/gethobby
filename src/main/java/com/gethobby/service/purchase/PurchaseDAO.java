package com.gethobby.service.purchase;

import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
//2020-02-24 Git Commit
public interface PurchaseDAO {
	
	public HobbyClass getComponentOption(int hobbyClassNo) throws Exception;  
	
	public Purchase getPayment(String userId) throws Exception; 
	
	public int addPayment(Purchase purchase) throws Exception; 
	
	public Purchase getPurchase(String purchaseId) throws Exception;
	
	public List getPaymentHistoryList(Search search) throws Exception;
	
	public int getTotalPurchase(String userId) throws Exception;
	
	public HobbyClass getPurchaseHobbyClass(int hobbyClassId) throws Exception;
	
	public Purchase getDelivery(String userId) throws Exception; 
	
	public int requestRefund(String purchaseId) throws Exception;
	
	public int getLessonNoASC(int hobbyClassNo) throws Exception;
	
	// Admin
	public List getPaymentHistoryListAdmin(Search search) throws Exception; 
	
	public int getPurchaseTotalCountAdmin(Map<String, Object> totalCountMap) throws Exception;
	
	public int updateRefund(String purchaseId) throws Exception; 
	
	public int addDeliveryInfo(Purchase purchase) throws Exception;
	
	public String getMoneyAnalysisSum(String date) throws Exception;
	
	public int getMoneyAnalysisAvg(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public int getMoneyAnalysisCount(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public List getCreatorList() throws Exception; 
	
	public int startingPurchaseData(Purchase purchase) throws Exception;
	
}//end of interface PurchaseDAO
