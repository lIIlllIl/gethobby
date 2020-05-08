package com.gethobby.service.community.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityDAO;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Reply;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	@Qualifier("communityDAOImpl")
	CommunityDAO communityDAO;
	
	public CommunityServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Article getCommunityArticle(int articleNo) throws Exception {
		// TODO Auto-generated method stub
		return communityDAO.getCommunityArticle(articleNo);
		
	}

	@Override
	public void addCommunityArticle(Article article) throws Exception {
		//System.out.println("ServiceImpl:"+article);
		communityDAO.addCommunityArticle(article);
	}

	@Override
	public void updateCommunityArticle(Article article) throws Exception {
		
		communityDAO.updateCommunityArticle(article);

	}

	@Override
	public void deleteCommunityArticle(int articleNo) throws Exception {
		
		System.out.println("delete하려는 ArticleNo: "+articleNo);
		communityDAO.deleteCommunityArticle(articleNo);
	}

	@Override
	public Reply getCommunityReply(int replyNo) throws Exception {
		return communityDAO.getCommunityReply(replyNo);
	}
	
	@Override
	public void addCommunityReply(Reply reply) throws Exception {
			communityDAO.addCommunityReply(reply);
	}
	
	@Override
	public void deleteCommunityReply(int replyNo) throws Exception {
		communityDAO.deleteCommunityReply(replyNo);
	}
	
	@Override
	public void updateCommunityReply(Reply reply) throws Exception {
		
		communityDAO.updateCommunityReply(reply);
	}
	
	@Override
	public Map<String, Object> getCommunity(int articleNo) throws Exception {

		System.out.println("가져올 articleNo:"+articleNo);
		Map<String, Object> map = new HashMap<String, Object>();
		Article article = communityDAO.getCommunityArticle(articleNo);
		
		List<Reply>replyList = communityDAO.getReplyListUnderArticle(articleNo);
		for (int i = 0; i < replyList.size(); i++) {
			//System.out.println(replyList.get(i).getRegDate());
			//System.out.println(replyList.get(i).getUser().getName());
		}
		int totalCountCommunityReply = communityDAO.getTotalCountCommunityReply(articleNo);
		
		map.put("article", article);
		map.put("replyList", replyList);
		map.put("totalCountCommunityReply", totalCountCommunityReply);
		return map;
	}
	
	@Override
	public Map<String, Object> getReplyListUnderArticle(int articleNo) throws Exception {

		List<Reply>replyList = communityDAO.getReplyListUnderArticle(articleNo);
		int totalCountCommunityReply = communityDAO.getTotalCountCommunityReply(articleNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyList", replyList);
		map.put("totalCountCommunityReply", totalCountCommunityReply);
		return map;
	}
	
	@Override
	public void updateSelectedCreator(List<Integer> list) throws Exception {
		
		//System.out.println("update할 글,댓글 list:"+list);
		communityDAO.updateSelectedCreator(list);
	}
	
	@Override
	public Map<String, Object> getCommunityList(Map serviceMap) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//글 List
		List<Article>articlelist = communityDAO.getCommunityArticleList(serviceMap);
		//댓글 List
		List<Reply>replylistUnderOneArticle = new ArrayList<Reply>();
		List<List<Reply>> array = new ArrayList<List<Reply>>();
		
		for (int i = 0; i < articlelist.size(); i++) {
			
			//글 내용 가독성있게 적당히 띄워쓰기하는 파트
			articlelist.get(i).setArticleContent( articlelist.get(i).getArticleContent().replace("\n", "<br>"));
			
			replylistUnderOneArticle = communityDAO.getReplyListUnderArticle(articlelist.get(i).getArticleNo());
			
			//댓글 갯수
			int total = communityDAO.getTotalCountCommunityReply(articlelist.get(i).getArticleNo());
			System.out.println("\n\n\ntotal----"+total);
			articlelist.get(i).setTotalReport( total );
			
			if( !replylistUnderOneArticle.isEmpty() ) {
				for(int j = 0; j <replylistUnderOneArticle.size(); j++) {
					//댓글 내용 가독성있게 적당히 띄워쓰기하는 파트
					replylistUnderOneArticle.get(j).setReplyContent( replylistUnderOneArticle.get(j).getReplyContent().replace("\n", "<br>"));
					//System.out.println("확인--\n"+replylistUnderOneArticle.get(j).getReplyContent());

					//replylistUnderOneArticle.get(j).setTotalReport( communityDAO.getTotalCountCommunityReply(articlelist.get(i).getArticleNo()));
				
				}
			}
			
			array.add(i, replylistUnderOneArticle);
		}
		
		//글 총갯수
		int totalCountCommunityArticle =communityDAO.getTotalCountCommunityArticle((Integer)serviceMap.get("hobbyClassNo"));
		//System.out.println("totalCountCommunityArticle확인:"+totalCountCommunityArticle);
		
		//해당클래스의 크리에이터이름 가져오기
		String creatorName = communityDAO.getCreatorAtHobbyClass((Integer)serviceMap.get("hobbyClassNo"));
		System.out.println("\n\ncreatorName::\n"+creatorName);
		
		map.put("creatorName", creatorName);
		map.put("totalCountCommunityArticle", totalCountCommunityArticle );
		map.put("articleList", articlelist);
		map.put("array", array);
		return map;
	}

}
