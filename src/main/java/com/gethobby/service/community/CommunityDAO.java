package com.gethobby.service.community;

import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Reply;

public interface CommunityDAO {
	
	public Article getCommunityArticle(int articleNo)throws Exception;
	
	public void addCommunityArticle(Article article)throws Exception;
	
	public void updateCommunityArticle(Article article)throws Exception;
	
	public void deleteCommunityArticle(int articleNo)throws Exception;
	
	public Reply getCommunityReply(int replyNo)throws Exception;
	
	public void addCommunityReply(Reply reply)throws Exception;
	
	public void updateCommunityReply(Reply reply)throws Exception;
	
	public void deleteCommunityReply(int replyNo)throws Exception;

	//articleNo에 해당하는 댓글 리스트 가져오는 메서드
	public List<Reply>getReplyListUnderArticle(int articleNo)throws Exception;
	//크리에이터가 커뮤니티에서 글과 댓글 선택 삭제(실제로는 업데이트)하는 메서드
	public void updateSelectedCreator(List<Integer> list)throws Exception;
	//Community Main화면 구성할 ArticleList가져오는 메서드
	public List<Article> getCommunityArticleList(Map<String, Object> serviceMap)throws Exception;
	//Community Main화면 구성할 글의 총 갯수 가져오는 메서드
	public int getTotalCountCommunityArticle(int hobbyClassNo)throws Exception; 
	//Community Main화면 구성할 한개의 글에 달린 댓글의  갯수 가져오는 메서드
	public int getTotalCountCommunityReply(int articleNo)throws Exception; 
	
	public String getCreatorAtHobbyClass(int hobbyClassNo)throws Exception;
	
}
