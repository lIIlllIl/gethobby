package com.gethobby.service.community;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Reply;

@Service
public interface CommunityService {
	
	public Article getCommunityArticle(int articleNo)throws Exception;
	
	public void addCommunityArticle(Article article)throws Exception;
	
	public void updateCommunityArticle(Article article)throws Exception;
	
	public void deleteCommunityArticle(int articleNo)throws Exception;
	
	public Reply getCommunityReply(int replyNo)throws Exception;
	
	public void addCommunityReply(Reply reply)throws Exception;
	
	public void updateCommunityReply(Reply reply)throws Exception;
	
	public void deleteCommunityReply(int replyNo)throws Exception;
	
	//해당글과 글에 달린 댓글 상세보기
	public Map<String, Object> getCommunity(int articleNo)throws Exception;
	
	public void updateSelectedCreator(List<Integer> list)throws Exception;
	
	public Map<String, Object> getCommunityList(Map<String, Object> serviceMap)throws Exception;
	
	public Map<String, Object> getReplyListUnderArticle(int articleNo)throws Exception;

}
