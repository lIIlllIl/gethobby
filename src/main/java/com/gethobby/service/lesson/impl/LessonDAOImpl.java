package com.gethobby.service.lesson.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.lesson.LessonDAO;


@Repository("lessonDAOImpl")
public class LessonDAOImpl implements LessonDAO {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	@Override
	public LessonTimes getLesson(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("LessonMapper.getLesson", inputData);
	}

	@Override
	public LessonTimes getArrowLesson(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("LessonMapper.getArrowLesson", inputData);
	}

	@Override
	public void addLessonReply(Reply reply) throws Exception {
		sqlSession.insert("LessonMapper.addLessonReply", reply);
	}

	@Override
	public void updateLessonReply(Reply reply) throws Exception {
		sqlSession.update("LessonMapper.updateLessonReply", reply);
	}

	@Override
	public void deleteLessonReply(int replyNo) throws Exception {
		sqlSession.delete("LessonMapper.deleteLessonReply", replyNo);
	}

	@Override
	public List<Reply> getLessonReplyList(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectList("LessonMapper.getLessonReplyList", inputData);
	}

	@Override
	public void addLessonTimes(Map<String, Object> inputData) throws Exception {
		sqlSession.insert("LessonMapper.addLessonTimes", inputData);
	}

	@Override
	public void updateLessonTimes(Map<String, Object> inputData) throws Exception {
		sqlSession.update("LessonMapper.updateLessonTimes", inputData);
	}

	@Override
	public Reply getLessonReply(int replyNo) throws Exception {
		return sqlSession.selectOne("LessonMapper.getLessonReply", replyNo);
	}

	@Override
	public void updateLesssonReplyTotalReport(Map<String, Object> updateData) throws Exception {
		sqlSession.update("LessonMapper.updateLessonReplyTotalReport", updateData);
	}

	@Override
	public int getLessonReplyListTotalCount(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("LessonMapper.getLessonReplyListTotalCount", inputData);
	}

	@Override
	public List<Lesson> getLessonList(int hobbyClassNo) throws Exception {
		return sqlSession.selectList("LessonMapper.getLesssonList", hobbyClassNo);
	}

	@Override
	public int getLessonListTotalCount(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("LessonMapper.getLesssonListTotalCount", hobbyClassNo);
	}

	@Override
	public LessonTimes getLessonTimesCheck(Map<String, Object> inputData) throws Exception {
		return sqlSession.selectOne("LessonMapper.getLessonTimesCheck", inputData);
	}

	@Override
	public void updateLessonDummyData(Lesson lesson) throws Exception {
		sqlSession.selectOne("HobbyClassMapper.updateLessonDummyData", lesson);
		
	}

	
	
	
}
