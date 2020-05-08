package com.gethobby.service.openhobbyclass.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.openhobbyclass.OpenHobbyClassDAO;

@Repository("openHobbyClassDAOImpl")
public class OpenHobbyClassDAOImpl implements OpenHobbyClassDAO{
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public OpenHobbyClassDAOImpl() {
		System.out.println(this.getClass());
	}

	//Method
	public List getHobbyClassList(Search search) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassList", search);
	}
	
	public int getHobbyClassTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClassTotalCount", userId);
	}

	public int addMyHobbyClass(String userId) throws Exception {
		return sqlSession.insert("HobbyClassMapper.addHobbyClass", userId);
	}

	public HobbyClass getNewHobbyClass(String userId) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getNewHobbyClass", userId);
	}
	
	public int deleteHobbyClass(int hobbyClassNo) throws Exception {
		return sqlSession.delete("HobbyClassMapper.deleteHobbyClass", hobbyClassNo);
	}
	
	public HobbyClass getSaveHobbyClass(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getSaveHobbyClass", hobbyClassNo);
	}
	
	public HobbyClass getHobbyClass(Map hobbyClassNoAndWhat) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClass", hobbyClassNoAndWhat);
	}

	public int saveHobbyClassInfo(HobbyClass hobbyClass) throws Exception {
		return sqlSession.update("HobbyClassMapper.saveHobbyClassInfo", hobbyClass);
	}

	public int saveKit(HobbyClass hobbyClass) throws Exception {
		return sqlSession.update("HobbyClassMapper.saveKit", hobbyClass);
	}

	public int saveCheckHobbyClass(int hobbyClassNo) throws Exception {
		return sqlSession.update("HobbyClassMapper.saveCheckHobbyClass", hobbyClassNo);
	}

	public HobbyClass getPreview(Map hobbyClassNoAndWhat) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getPreview", hobbyClassNoAndWhat);
	}

	public int saveLesson(Lesson lesson) throws Exception {
		return sqlSession.update("HobbyClassMapper.saveLesson", lesson);
	}
	
	public int updateClassState(Map stateMap) throws Exception {
		return sqlSession.update("HobbyClassMapper.updateClassState", stateMap);
	}
	
	public List getLessonList(int hobbyClassNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getLessonList", hobbyClassNo);
	}
	
	public Lesson getLesson(int lessonNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getLesson", lessonNo);
	}

	public int addLesson(int hobbyClassNo) throws Exception {
		return sqlSession.insert("HobbyClassMapper.addLesson", hobbyClassNo);
	}
	
	public int getLessonNo(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getLessonNo", hobbyClassNo);
	}

	public int deleteLesson(int hobbyClassNo) throws Exception {
		return sqlSession.delete("HobbyClassMapper.deleteLesson", hobbyClassNo);
	}
	
	public int addHashtag(Map<String, Object> hashtagMap) throws Exception {
		return sqlSession.insert("HobbyClassMapper.addHashtag", hashtagMap);
	}
	
	public List getHashtag(int hobbyClassNo) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHashtag", hobbyClassNo);
	}
	
	public String getNickName(String userIdValue) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getNickName", userIdValue);
	}
	
	public int updateTotalMoney(Map<String, Object> hobbyClassNoAndTotalMoeny) throws Exception {
		return sqlSession.update("HobbyClassMapper.updateTotalMoney", hobbyClassNoAndTotalMoeny);
	}
	
	public int updateTotalStudent(Map<String, Object> hobbyClassNoAndTotalStudent) throws Exception {
		return sqlSession.update("HobbyClassMapper.updateTotalStudent", hobbyClassNoAndTotalStudent);
	}
	
	public int updateTotalLesson(Map<String, Object>  hobbyClassNoAndTotalLesson) throws Exception {
		return sqlSession.update("HobbyClassMapper.updateTotalLesson", hobbyClassNoAndTotalLesson);
	}
	
	public int getTotalStudent(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getTotalStudent", hobbyClassNo);
	}
	
	public int getTotalLesson(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getTotalLesson", hobbyClassNo);
	}
	
	public int getTotalMoney(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getTotalMoney", hobbyClassNo);
	}
	
	public List getHobbyClassListAdmin(Search search) throws Exception {
		return sqlSession.selectList("HobbyClassMapper.getHobbyClassListAdmin", search);
	}
	
	public int getHobbyClassTotalCountAdmin(Map<String, Object> totalCountMap) throws Exception {
		return sqlSession.selectOne("HobbyClassMapper.getHobbyClassTotalCountAdmin", totalCountMap);
	}

	public int saveCheckHobbyClassAdmin(int hobbyClassNo) throws Exception {
		return sqlSession.update("HobbyClassMapper.saveCheckHobbyClassAdmin", hobbyClassNo);
	}
		
}//end of DAOImpl

