package com.gethobby.service.delivery.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.service.delivery.DeliveryDAO;
import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;

@Service("deliveryServiceImpl")
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	@Qualifier("deliveryDAOImpl")
	private DeliveryDAO deliveryDAO;
	public void setDeliveryDAO(DeliveryDAO deliveryDAO) {
		this.deliveryDAO = deliveryDAO;
	}
	
	public DeliveryServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Purchase getDeliveryInfo(String purchaseId) throws Exception {
		
		return deliveryDAO.getDeliveryInfo(purchaseId);
	}

	@Override
	public void addDeliveryInfo(Purchase purchase) throws Exception {
		deliveryDAO.addDeliveryInfo(purchase);
	}

}
