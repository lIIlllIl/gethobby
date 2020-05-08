package com.gethobby.web.community;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {

	//field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public CommunityRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	@RequestMapping(value = "json/makeArticleFileUpload", method = RequestMethod.POST )
	public String makeArticleFileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("email--\n"+email+"\nfile---\n"+file);
		
		String path = "c:\\images\\kyung";
		
		System.out.println("Upload File Name: " + file.getOriginalFilename());
		String originalFileName = file.getOriginalFilename();
	//	long fileSize = multipartFile.getSize();
		String saveImageName = System.currentTimeMillis() + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		try {
			
			file.transferTo(new File(path, saveImageName));

			
		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		return saveImageName;
	}
	
	@RequestMapping(value = "json/addCommunityReply", method = RequestMethod.POST)
	public Map<String, Object> addCommunityReply(HttpSession session,
								//@RequestBody Map<String, Object> jsonMap
								@RequestBody Reply reply
								)throws Exception{
		
		System.out.println("\n\n\n /community/json/addCommunityReply\n\n\n");
//		System.out.println("-------------------jsonMap ? : " + jsonMap);
		/*	ajax에서 아래처럼 보낼시  => Map으로 받는다.
		 * 	data : JSON.stringify({ 
		 * 			data : data 
		 		})		*/

		System.out.println("\n\n\n user--\n\n"+reply.getUser().getUserId());
		
		User user = (User)session.getAttribute("user");
		System.out.println("\n\n\n session User \n\n "+user);
		if(reply.getUser().getUserId().equals(user.getUserId())) {
			
			reply.setUser(user);
		}
		
		//System.out.println("댓글인코딩전 내용 확인:"+reply.getReplyContent());
		String replyContent = URLDecoder.decode(reply.getReplyContent(), "UTF-8");
		reply.setReplyContent(replyContent);
		System.out.println("댓글인코딩 내용 확인:"+reply.getReplyContent());
		
		//System.out.println(reply);
		//System.out.println(reply.getUser());
		//System.out.println(reply.getArticle().getArticleNo());
		communityService.addCommunityReply(reply);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", "200");
		return map;
	}
	
	@RequestMapping(value = "json/getReplyListUnderArticle/{articleNo}", method = RequestMethod.GET)
	public Map<String, Object> getReplyListUnderArticle(@PathVariable int articleNo)throws Exception{
		
		System.out.println("\n\n/getReplyListUnderArticle");
		System.out.println("articleNo확인:"+articleNo);

		Map<String, Object> map = communityService.getReplyListUnderArticle(articleNo);
		List<Reply> replyList = (List<Reply>)map.get("replyList");
		int totalCountCommunityReply = (Integer)map.get("totalCountCommunityReply");
		
		for (int i = 0; i < replyList.size(); i++) {
			System.out.println("댓글이 참고하는 articleNo: "+replyList.get(i).getArticle().getArticleNo());
		}
		
		System.out.println("확인:"+replyList);
		System.out.println("댓글 갯수:"+replyList.size());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", replyList);
		resultMap.put("totalCountCommunityReply", totalCountCommunityReply);
		return resultMap;
		
	}
	
	@RequestMapping(value = "json/deleteReply", method = RequestMethod.POST)
	public Map<String, Object> deleteReply(@RequestBody Reply reply)throws Exception{
		
		System.out.println("\n\n\n\n\njson/deleteReply");
		System.out.println("\n\n\n삭제할 replyNo\n\n: "+reply.getReplyNo());
		communityService.deleteCommunityReply(reply.getReplyNo());
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("success", "200");
		return map;
	}
	
	@RequestMapping(value = "json/updateReply", method = RequestMethod.POST)
	public Map<String, Object> updateReply(//@PathVariable int replyNo, 
									@RequestBody Reply reply)throws Exception{
		
		System.out.println("\njson/updateReply/{replyNo}");
		System.out.println("수정할 replyNo: "+reply.getReplyNo());
		System.out.println("수정할 replyNo: "+reply.getReplyContent());
		
		communityService.updateCommunityReply(reply);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("success", "200");
		return map;
	}
	
	//더보기 클릭시
	@RequestMapping(value = "json/listCommunity/{hobbyClassNo}", method = RequestMethod.POST)
	public Map<String, Object> listCommunity(HttpSession session, @PathVariable int hobbyClassNo,
										@RequestBody Search search)throws Exception{
		
		System.out.println("\n\n\n json/listCommunity/{hobbyClassNo}");
		System.out.println("\n\n Service에서 가져와야되는 hobbyClassNo:"+hobbyClassNo);
		System.out.println("\n\n Service에서 가져와야되는 search:"+search+"\n\n\n");
		
		search.setPageSize(pageSize);
		
		Map<String, Object> serviceMap = new HashMap<String, Object>();
		serviceMap.put("search", search);
		serviceMap.put("hobbyClassNo", hobbyClassNo);
		
		Map<String , Object> map = communityService.getCommunityList(serviceMap);
		List<Article> articleList = (List<Article>)map.get("articleList");
		List<List<Reply>> array = (List<List<Reply>>)map.get("array");
		//int totalReplyCount = articleList.get(0).getTotalReport();

		
		//array.get(0).get(0).getUser().
		
		map.put("articleList", articleList);
		map.put("array", array);
		map.put("success", "200");
		return map;
	}

}
