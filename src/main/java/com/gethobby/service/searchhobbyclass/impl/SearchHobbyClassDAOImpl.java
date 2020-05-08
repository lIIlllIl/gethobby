package com.gethobby.service.searchhobbyclass.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassDAO;

@Repository("searchHobbyClassDAOImpl")
public class SearchHobbyClassDAOImpl implements SearchHobbyClassDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public SearchHobbyClassDAOImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public HobbyClass getHobbyClass(Map<String, Object> inputData) throws Exception { 
		HobbyClass returnClass = sqlSession.selectOne("HobbyClassMapper.getSearchHobbyClass", inputData);
		
		returnClass.setHashtag(sqlSession.selectList("HobbyClassMapper.getHobbyClassHashtag", inputData.get("hobbyClassNo")));
		return returnClass;
	}


	@Override
	public List<String> getHobbyClassHashtag(int hobbyClassNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassHashtag", hobbyClassNo);
	}


	@Override
	public List<HobbyClass> getHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getSearchHobbyClassList", inputData);
	}


	@Override
	public List<ClassAssess> getHobbyClassAssessContent(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassAssessContent", inputData);
	}


	@Override
	public List<LessonTimes> getHobbyClassLessonContent(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassLessonContent", inputData);
	}


	@Override
	public List<LessonTimes> getLessonTimesList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getLessonTimesList", inputData);
	}


	@Override
	public List<HobbyClass> getPopularHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getpopularHobbyClassList", inputData);
	}


	@Override
	public List<HobbyClass> getRegisterHobbyClassList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getRegisterHobbyClassList", inputData);
	}


	@Override
	public void addHobbyClassAssess(ClassAssess classAssess) throws Exception {
		sqlSession.insert("HobbyClassMapper.addClassAssess", classAssess);
		
	}


	@Override
	public List<String> getUserSelectHashtag(String userId) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getUserSelectHashtag", userId);
	}


	@Override
	public int getHobbyClassAssessContentTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClassAssessContentTotalCount", inputData);
	}


	@Override
	public int getHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getSearchHobbyClassListTotalCount", inputData);
	}


	@Override
	public int getPopularHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getPopularHobbyClassListTotalCount", inputData);
	}


	@Override
	public int getRegisterHobbyClassListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getRegisterHobbyClassListTotalCount", inputData);
	}


	@Override
	public int getHobbyClassAssessSeqNo() throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClassAssessSeqNo");
	}


	@Override
	public ClassAssess getClassAssess(int assessNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getClassAssess", assessNo);
	}


	@Override
	public int getPurchaseClassCheck(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getPurchaseClassCheck", inputData);
	}

	@Override
	public ClassAssess getUserClassAssess(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getUserClassAssess", inputData);
	}


	@Override
	public List<Event> getNowEventList() throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getNowEventList");
	}


	@Override
	public Article getClassCommunityArticleContent(String communityNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getClassCommunityArticleContent", communityNo);
	}


	@Override
	public List<Reply> getClassCommunityReplyContent(String communityNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getClassCommunityReplyContent", communityNo);
	}


	@Override
	public List<LessonTimes> getHobbyClassEncodingLessonList(int hobbyClassNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassEncodingLessonList", hobbyClassNo);
	}

}
