package com.gethobby.service.lesson;

import java.util.List;
import java.util.Map;

import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;


public interface LessonDAO {
	public LessonTimes getLesson(Map<String, Object> inputData) throws Exception;
	
	public LessonTimes getArrowLesson(Map<String, Object> inputData) throws Exception; 
	
	public void addLessonReply(Reply reply) throws Exception;
	
	public void updateLessonReply(Reply reply) throws Exception;
	
	public void deleteLessonReply(int replyNo) throws Exception; 
	
	public List<Reply> getLessonReplyList(Map<String, Object> inputData) throws Exception;
	
	public void addLessonTimes(Map<String, Object> inputData) throws Exception;
	
	public void updateLessonTimes(Map<String, Object> inputData) throws Exception;
	
	public Reply getLessonReply(int replyNo) throws Exception;
	
	public void updateLesssonReplyTotalReport(Map<String, Object> updateData) throws Exception;
	
	public int getLessonReplyListTotalCount(Map<String, Object> inputData) throws Exception;
	
	public List<Lesson> getLessonList(int hobbyClassNo) throws Exception;
	
	public int getLessonListTotalCount(int hobbyClassNo) throws Exception;
	
	public LessonTimes getLessonTimesCheck(Map<String, Object> inputData) throws Exception;
	
	public void updateLessonDummyData(Lesson lesson) throws Exception;
}
