package com.gethobby.service.article.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.common.Search;
import com.gethobby.service.article.ReplyDAO;
import com.gethobby.service.domain.Reply;

@Repository("replyDAOImpl")
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReplyDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBoardReply(Reply reply) throws Exception {
		sqlSession.insert("BoardReplyMapper.addBoardReply", reply);

	}

	@Override
	public Reply getBoardReply(int replyNo) throws Exception {
		
		return sqlSession.selectOne("BoardReplyMapper.getBoardReply", replyNo);
	}

	@Override
	public void updateBoardReply(Reply reply) throws Exception {
		sqlSession.update("BoardReplyMapper.updateBoardReply", reply);
		
	}

	@Override
	public void deleteBoardReply(int replyNo) throws Exception {
		sqlSession.delete("BoardReplyMapper.deleteBoardReply", replyNo);
		
	}

	@Override
	public List<Reply> getBoardReplyList(int articleNo, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("articleNo", articleNo);
		map.put("search", search);
		return sqlSession.selectList("BoardReplyMapper.getBoardReplyList", map);
	}

	@Override
	public int getBoardReplyTotalCount(int articleNo) throws Exception {
		
		return sqlSession.selectOne("BoardReplyMapper.getBoardReplyTotalCount", articleNo);
	}


}
