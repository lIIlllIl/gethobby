package com.gethobby.service.article;

import java.util.List;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Favor;

public interface ArticleDAO {
	
	public void addBoardArticle(Article article) throws Exception;
	
	public Article getBoardArticle(int articleNo) throws Exception;
	
	public void updateTotalView(int articleNo) throws Exception;
	
	public void updateBoardArticle(Article article) throws Exception;
	
	public void deleteBoardArticle(int articleNo) throws Exception;
	
	public int getFreeBoardTotalCount(Search search) throws Exception;
	
	public List<Article> getFreeBoardList(Search search) throws Exception;
	
	public List<Article> getPhotoBoardList(Search search) throws Exception;
	
	public int getPhotoBoardTotalCount(Search search) throws Exception;
	
	public void addFavor(Favor favor) throws Exception;
	
	public void deleteFavor(Favor favor) throws Exception;
	
	public List<Article> getMyBoardArticleList(Search search, String userId) throws Exception;
	
	public int getMyBoardArticleTotalCount(Search search, String userId) throws Exception;
	
	public List<Article> getMyFavorArticleList(Search search, String userId) throws Exception;
	
	public int getMyFavorArticleTotalCount(Search search, String userId) throws Exception;
	
	public Article getMyRecentArticle(String userId) throws Exception;
	
	public Favor getFavor(Favor favor) throws Exception;

}
