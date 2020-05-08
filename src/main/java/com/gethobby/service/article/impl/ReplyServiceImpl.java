package com.gethobby.service.article.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.article.ReplyDAO;
import com.gethobby.service.article.ReplyService;
import com.gethobby.service.domain.Reply;

@Service("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	@Qualifier("replyDAOImpl")
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	
	public ReplyServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBoardReply(Reply reply) throws Exception {
		replyDAO.addBoardReply(reply);

	}


	@Override
	public Reply getBoardReply(int replyNo) throws Exception {
		
		return replyDAO.getBoardReply(replyNo);
	}


	@Override
	public void updateBoardReply(Reply reply) throws Exception {

		replyDAO.updateBoardReply(reply);
		
	}

	
	@Override
	public void deleteBoardReply(int replyNo) throws Exception {
		replyDAO.deleteBoardReply(replyNo);
		
	}

	@Override
	public Map<String, Object> getBoardReplyList(int articleNo, Search search) throws Exception {
	
		List<Reply> replyList = replyDAO.getBoardReplyList(articleNo, search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", replyList);
		map.put("totalCount", replyDAO.getBoardReplyTotalCount(articleNo));
		
		return map;
	}


	@Override
	public int getBoardReplyTotalCount(int articleNo) throws Exception {
		
		return replyDAO.getBoardReplyTotalCount(articleNo);
	}


}
