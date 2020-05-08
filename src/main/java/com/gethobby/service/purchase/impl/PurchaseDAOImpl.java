package com.gethobby.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.purchase.PurchaseDAO;
//2020-02-24 Git Commit
@Repository("purchaseDAOImpl")
public class PurchaseDAOImpl implements PurchaseDAO{
		
		//Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		
		//Constructor
		public PurchaseDAOImpl() {
			System.out.println(this.getClass());
		}

		//Method
		public HobbyClass getComponentOption(int hobbyClassNo) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getComponentOption", hobbyClassNo);
		}

		public Purchase getPayment(String userId ) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getPayment", userId);
		}

		public int addPayment(Purchase purchase) throws Exception {
			return sqlSession.insert("PurchaseMapper.addPayment", purchase);
		}

		public Purchase getPurchase(String purchaseId) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getPurchase", purchaseId);
		}
		
		public List getPaymentHistoryList(Search search) throws Exception {
			return sqlSession.selectList("PurchaseMapper.getPaymentHistoryList", search);
		}
		
		public int getTotalPurchase(String userId) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getTotalPurchase", userId);
		}
		
		public HobbyClass getPurchaseHobbyClass(int hobbyClassId) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getPurchaseHobbyClass", hobbyClassId);

		}
		
		public Purchase getDelivery(String userId) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getDelivery", userId);
		}

		public int requestRefund(String purchaseId) throws Exception {
			return sqlSession.update("PurchaseMapper.requestRefund", purchaseId);
		}

		public List getPaymentHistoryListAdmin(Search search) throws Exception {
			return sqlSession.selectList("PurchaseMapper.getPaymentHistoryListAdmin", search);
		}
		
		public int getPurchaseTotalCountAdmin(Map<String, Object> totalCountMap) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getPurchaseTotalCountAdmin", totalCountMap);
		}

		public int updateRefund(String purchaseId) throws Exception {
			return sqlSession.update("PurchaseMapper.updateRefund", purchaseId);
		}

		public int addDeliveryInfo(Purchase purchase) throws Exception {
			return sqlSession.update("PurchaseMapper.addDeliveryInfo", purchase);
		}

		public String getMoneyAnalysisSum(String date) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getMoneyAnalysisSum", date);
		}

		public int getMoneyAnalysisAvg(Map<String, Object> keyWordAndWhat) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getMoneyAnalysisAvg", keyWordAndWhat);
		}

		public int getMoneyAnalysisCount(Map<String, Object> keyWordAndWhat) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getMoneyAnalysisCount", keyWordAndWhat);
		}

		public List getCreatorList() throws Exception {
			return sqlSession.selectList("PurchaseMapper.getCreatorList");
		}
		
		public int getLessonNoASC(int hobbyClassNo) throws Exception {
			return sqlSession.selectOne("PurchaseMapper.getLessonNoASC", hobbyClassNo);
		}
		
		public int startingPurchaseData(Purchase purchase) throws Exception {
			return sqlSession.insert("PurchaseMapper.startingPurchaseData", purchase);
		}
}//end of DAOImpl
