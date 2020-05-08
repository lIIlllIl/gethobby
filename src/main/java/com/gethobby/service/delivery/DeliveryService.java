package com.gethobby.service.delivery;

import com.gethobby.service.domain.Purchase;

public interface DeliveryService {
	public Purchase getDeliveryInfo(String purchaseId) throws Exception;
	
	public void addDeliveryInfo(Purchase purchase) throws Exception;

}
