package com.gethobby.service.myhobbyclass.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.myhobbyclass.MyHobbyClassDAO;

@Repository("myHobbyClassDAOImpl")
public class MyHobbyClassDAOImpl implements MyHobbyClassDAO {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MyHobbyClassDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<HobbyClass> getSteamHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getSteamHobbyClassList", inputData);
	}

	@Override
	public List<HobbyClass> getRecentlyHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getSteamHobbyClassList", inputData);
	}

	@Override
	public List<HobbyClass> getPurchaseHobbyClassSchedule(String userId) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getPurchaseHobbyClassSchedule", userId);
	}

	@Override
	public List<Purchase> getHobbyClassBuyerStats(String hobbyClassNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassBuyerStats", hobbyClassNo);
	}

	@Override
	public void addSteamHobbyClass(Map<String, Object> inputData) throws Exception {
		sqlSession.insert("HobbyClassMapper.addSteamHobbyClass", inputData);
	}

	@Override
	public void updateHobbyClassSteam(Map<String, Object> inputData) throws Exception {
		sqlSession.update("HobbyClassMapper.updateHobbyClassSteam", inputData);
	}

	@Override
	public void deleteSteamHobbyClass(Map<String, Object> inputData) throws Exception {
		sqlSession.delete("HobbyClassMapper.deleteSteamHobbyClass", inputData);
	}

	@Override
	public List<HobbyClass> getRecommendHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getRecommendHobbyClassList", inputData);
	}

	@Override
	public int getSteamHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getSteamHobbyClassListTotalCount", inputData);
	}

	@Override
	public int getRecommendHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getRecommendHobbyClassListTotalCount", inputData);
	}
	
	@Override
	public List<HobbyClass> getListenHobbyClass(String userId) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getListenHobbyClassList", userId);
	}

	@Override
	public HobbyClass getHobbyClassStateStartDate(String hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClassStateStartDate", hobbyClassNo);
	}

}
