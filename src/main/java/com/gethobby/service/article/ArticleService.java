package com.gethobby.service.article;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Favor;

public interface ArticleService {
	
	public Article addBoardArticle(Article article, String userId) throws Exception;

	public Article getBoardArticle(int articleNo) throws Exception;
	
	public void updateTotalView(int articleNo) throws Exception;
	 
	public void updateBoardArticle(Article article) throws Exception;
	
	public void deleteBoardArticle(int articleNo) throws Exception;
	
	public int getFreeBoardTotalCount(Search search) throws Exception; 
	
//	public List<Article> getFreeBoardList(Search search) throws Exception;

//	public List<Article> getPhotoBoardList(Search search) throws Exception;
	
	public int getPhotoBoardTotalCount(Search search) throws Exception; 
	
	public Map<String, Object> getFreeBoardList(Search search) throws Exception;
 
	public Map<String, Object> getPhotoBoardList(Search search) throws Exception;
	
	public void addFavor(Favor favor) throws Exception;
	
	public void deleteFavor(Favor favor) throws Exception;
	
	public Map<String, Object> getMyBoardArticleList(Search search, String userId) throws Exception;
	
	public int getMyBoardArticleTotalCount(Search search, String userId) throws Exception;
	
	public Map<String, Object> getMyFavorArticleList(Search search, String userId) throws Exception;
	
	public int getMyFavorArticleTotalCount(Search search, String userId) throws Exception;
	
	public String saveImage(MultipartFile image, Search search) throws Exception;
	
	public Article getMyRecentArticle(String userId) throws Exception;
	
	public Favor getFavor(Favor favor) throws Exception;
}
