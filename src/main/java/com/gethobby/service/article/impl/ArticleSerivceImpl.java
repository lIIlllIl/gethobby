package com.gethobby.service.article.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Search;
import com.gethobby.service.article.ArticleDAO;
import com.gethobby.service.article.ArticleService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Favor;

@Service("articleServiceImpl")
public class ArticleSerivceImpl implements ArticleService {

	@Autowired
	@Qualifier("articleDAOImpl")
	private ArticleDAO articleDAO;
	public void setArticleDAO(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	
	public ArticleSerivceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Article addBoardArticle(Article article, String userId) throws Exception {
		articleDAO.addBoardArticle(article);
		
		return articleDAO.getMyRecentArticle(userId);

	}

	@Override
	public Article getBoardArticle(int articleNo) throws Exception {
		
		return articleDAO.getBoardArticle(articleNo);
	}

	@Override
	public void updateTotalView(int articleNo) throws Exception {
		articleDAO.updateTotalView(articleNo);
		
	}

	@Override
	public void updateBoardArticle(Article article) throws Exception {
		articleDAO.updateBoardArticle(article);
		
	}

	@Override
	public void deleteBoardArticle(int articleNo) throws Exception {
		articleDAO.deleteBoardArticle(articleNo);
		
	}

	@Override
	public int getFreeBoardTotalCount(Search search) throws Exception {
		
		return articleDAO.getFreeBoardTotalCount(search);
	}

	@Override
	public Map<String, Object> getFreeBoardList(Search search) throws Exception {
		
		List<Article> articleList = articleDAO.getFreeBoardList(search);
		
		
//		for (int i = 0; i < articleList.size(); i++) {
//			articleList.get(i).setPurchaseProd((Product)sqlSession.selectOne("ProductMapper.getProduct", list.get(i).getPurchaseProd().getProdNo()));
//		}
		
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("totalCount", articleDAO.getFreeBoardTotalCount(search));
		map.put("list", articleList);

		return map;
		
	}

	@Override
	public Map<String, Object> getPhotoBoardList(Search search) throws Exception {
		
		List<Article> articleList = articleDAO.getPhotoBoardList(search);
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("totalCount", articleDAO.getPhotoBoardTotalCount(search));
		map.put("list", articleList);

		return map;	
	}

	@Override
	public int getPhotoBoardTotalCount(Search search) throws Exception {
		return articleDAO.getPhotoBoardTotalCount(search);
	}

	@Override
	public void addFavor(Favor favor) throws Exception {
		articleDAO.addFavor(favor);
		
	}

	@Override
	public void deleteFavor(Favor favor) throws Exception {
		articleDAO.deleteFavor(favor);
		
	}

	@Override
	public Map<String, Object> getMyBoardArticleList(Search search, String userId) throws Exception {
		
		List<Article> articleList = articleDAO.getMyBoardArticleList(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", articleList);
		map.put("totalCount", articleDAO.getMyBoardArticleTotalCount(search, userId));
		
		return map;
	}

	@Override
	public int getMyBoardArticleTotalCount(Search search, String userId) throws Exception {
		
		return articleDAO.getMyBoardArticleTotalCount(search, userId);
	}

	@Override
	public Map<String, Object> getMyFavorArticleList(Search search, String userId) throws Exception {
		List<Article> articleList = articleDAO.getMyFavorArticleList(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", articleList);
		map.put("totalCount", articleDAO.getMyFavorArticleTotalCount(search, userId));
		
		return map;
	}

	@Override
	public int getMyFavorArticleTotalCount(Search search, String userId) throws Exception {
		return articleDAO.getMyFavorArticleTotalCount(search, userId);
	}

	
	private static final String freeBoardImageSavePath = "C:\\images\\sol\\free_board";
	private static final String photoBoardImageSavePath = "C:\\images\\sol\\photo_board";
	
	@Override
	public String saveImage(MultipartFile image, Search search) throws Exception {
		

		
		System.out.println("Upload File Name: " + image.getOriginalFilename());
		String originalFileName = image.getOriginalFilename();
	//	long fileSize = multipartFile.getSize();
		String saveImageName = System.currentTimeMillis() + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		try {
			
			if(search.getBoardCode().equals("0")) {
				
				image.transferTo(new File(freeBoardImageSavePath, saveImageName));
				
			} else if(search.getBoardCode().equals("1")) {

				image.transferTo(new File(photoBoardImageSavePath, saveImageName));

			} 
			
		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		return saveImageName;
		
	}

	@Override
	public Article getMyRecentArticle(String userId) throws Exception {
		
		return articleDAO.getMyRecentArticle(userId);
	}

	@Override
	public Favor getFavor(Favor favor) throws Exception {
		
		return articleDAO.getFavor(favor);
	}



}
