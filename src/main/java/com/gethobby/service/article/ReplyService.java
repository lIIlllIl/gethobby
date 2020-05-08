package com.gethobby.service.article;

import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Reply;

public interface ReplyService {
	
	public void addBoardReply(Reply reply) throws Exception;
	
	public Reply getBoardReply(int replyNo) throws Exception;
	
	public void updateBoardReply(Reply reply) throws Exception;
	
	public void deleteBoardReply(int replyNo) throws Exception;
	
//	public List<Reply> getBoardReplyList(int articleNo, Search search) throws Exception;
	public Map<String, Object> getBoardReplyList(int articleNo, Search search) throws Exception;
	
	public int getBoardReplyTotalCount(int articleNo) throws Exception;
}
