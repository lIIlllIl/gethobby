package com.gethobby.service.delivery.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.service.delivery.DeliveryDAO;
import com.gethobby.service.domain.Purchase;


@Repository("deliveryDAOImpl")
public class DeliveryDAOImpl implements DeliveryDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public DeliveryDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Purchase getDeliveryInfo(String purchaseId) throws Exception {
		
		return sqlSession.selectOne("DeliveryMapper.getDeliveryInfo", purchaseId);
	}

	@Override
	public void addDeliveryInfo(Purchase purchase) throws Exception {
		sqlSession.update("DeliveryMapper.addDeliveryInfo", purchase);
		
	}

}
