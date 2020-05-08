package com.gethobby.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityDAO;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Reply;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public CommunityDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	
	
	@Override
	public Article getCommunityArticle(int articleNo) throws Exception {
		
		//System.out.println("DAOImpl GetArticle할 ArticleNo확인 :"+articleNo);
		
		//////
		//Article article = new Article();
		//article = sqlSession.selectOne("CommuArticleMapper.getCommunityArticle", articleNo);
		//System.out.println("////////DAOImpl::::"+article);
		return sqlSession.selectOne("CommuArticleMapper.getCommunityArticle", articleNo);
	}

	@Override
	public void addCommunityArticle(Article article) throws Exception {

		System.out.println("DAO Insert할 Article :"+article);
		sqlSession.insert("CommuArticleMapper.addCommunityArticle", article);
		
	}

	@Override
	public void updateCommunityArticle(Article article) throws Exception {
		
		System.out.println("DAO Update할 ArticleNo :"+article.getArticleNo());
		sqlSession.update("CommuArticleMapper.updateCommunityArticle", article);

	}

	@Override
	public void deleteCommunityArticle(int articleNo) throws Exception {

		sqlSession.delete("CommuArticleMapper.deleteCommunityArticle", articleNo);
	}

	@Override
	public Reply getCommunityReply(int replyNo) throws Exception {
		
		System.out.println("DAO get할 ReplyNo:"+replyNo);
		return sqlSession.selectOne("CommuReplyMapper.getCommunityReply", replyNo);
	}
	
	@Override
	public void addCommunityReply(Reply reply) throws Exception {
		
		System.out.println("DAO Insert할 Reply: "+reply);
		System.out.println("이 댓글의 ref_no가 될 ArticleNo:"+reply.getArticle().getArticleNo());
		System.out.println("이 댓글이 달릴 hobbyClassNo:"+reply.getArticle().getHobbyClass().getHobbyClassNo());
		System.out.println(reply.getUser().getUserId());
		sqlSession.insert("CommuReplyMapper.addCommunityReply", reply);
		
	}
	
	@Override
	public void deleteCommunityReply(int replyNo) throws Exception {
		
		System.out.println("DAOImpl replyNo:"+replyNo);
		sqlSession.delete("CommuReplyMapper.deleteCommunityReply", replyNo);
	}
	
	@Override
	public void updateCommunityReply(Reply reply) throws Exception {
		
		System.out.println("DAO update할 ReplyNo:"+reply.getReplyNo());
		sqlSession.update("CommuReplyMapper.updateCommunityReply", reply);
		
	}
	
	@Override
	public List<Reply> getReplyListUnderArticle(int articleNo) throws Exception {
		
		//System.out.println("getReplyListUnderArticle");
		//System.out.println(articleNo);
		return sqlSession.selectList("CommuReplyMapper.getReplyListUnderArticle", articleNo);
	}
	
	@Override
	public void updateSelectedCreator(List<Integer> list) throws Exception {
		
		System.out.println("DAO 크리에이터가 UPDATE할 글과 댓글 No:\n"+list);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("list", list);
		sqlSession.update("CommuArticleMapper.updateSelectedCreator", map);
		
	}
	
	@Override
	public List<Article> getCommunityArticleList(Map<String, Object> serviceMap) throws Exception {
		
		List<Article>list = sqlSession.selectList("CommuArticleMapper.getCommunityArticleList", serviceMap);
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("DAO\n"+"ArticleList:"+list.get(i).getUser());
//			
//		}
		return list;
	}
	
	@Override
	public int getTotalCountCommunityArticle(int hobbyClassNo) throws Exception {
		return sqlSession.selectOne("CommuArticleMapper.getTotalCountCommunityArticle", hobbyClassNo);
	}
	
	@Override
	public int getTotalCountCommunityReply(int articleNo) throws Exception {  
		
		return sqlSession.selectOne("CommuReplyMapper.getTotalCountCommunityReply", articleNo);
		
	}
	
	@Override
	public String getCreatorAtHobbyClass(int hobbyClassNo) throws Exception {
		
		return sqlSession.selectOne("CommuArticleMapper.getCreatorAtHobbyClass", hobbyClassNo);
	}
	
}
