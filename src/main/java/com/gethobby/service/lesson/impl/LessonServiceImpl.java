package com.gethobby.service.lesson.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.lesson.LessonDAO;
import com.gethobby.service.lesson.LessonService;

@Service("lessonServiceImpl")
public class LessonServiceImpl implements LessonService {
	@Autowired
	@Qualifier("lessonDAOImpl")
	private LessonDAO lessonDAO;

	@Override
	public LessonTimes getLesson(Map<String, Object> inputData) throws Exception {
		return lessonDAO.getLesson(inputData);
	}

	@Override
	public LessonTimes getArrowLesson(Map<String, Object> inputData) throws Exception {
		return lessonDAO.getArrowLesson(inputData);
	}

	@Override
	public void addLessonReply(Reply reply) throws Exception {
		lessonDAO.addLessonReply(reply);	
	}

	@Override
	public void updateLessonReply(Reply reply) throws Exception {
		lessonDAO.updateLessonReply(reply);
	}

	@Override
	public void deleteLessonReply(int replyNo) throws Exception {
		lessonDAO.deleteLessonReply(replyNo);
	}

	@Override
	public Map<String, Object> getLessonReplyList(Map<String, Object> inputData) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Reply> lessonReplyList = lessonDAO.getLessonReplyList(inputData);
		int totalCount = lessonDAO.getLessonReplyListTotalCount(inputData);
		
		returnMap.put("list", lessonReplyList);
		returnMap.put("total", totalCount);
		
		return returnMap;
	}

	@Override
	public void addLessonTimes(Map<String, Object> inputData) throws Exception {
		lessonDAO.addLessonTimes(inputData);
	}

	@Override
	public void updateLessonTimes(Map<String, Object> inputData) throws Exception {
		lessonDAO.updateLessonTimes(inputData);
	}

	@Override
	public Reply getLessonReply(int replyNo) throws Exception {
		return lessonDAO.getLessonReply(replyNo);
	}

	@Override
	public Map<String, Object> getLessonList(int hobbyClassNo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", lessonDAO.getLessonList(hobbyClassNo));
		returnMap.put("total", lessonDAO.getLessonListTotalCount(hobbyClassNo));
		
		return returnMap;
	}

	@Override
	public LessonTimes getLessonTimesCheck(Map<String, Object> inputData) throws Exception {
		return lessonDAO.getLessonTimesCheck(inputData);
	}

	@Override
	public void updateLessonDummyData(Lesson lesson) throws Exception {
		lessonDAO.updateLessonDummyData(lesson);
		
	}
}
