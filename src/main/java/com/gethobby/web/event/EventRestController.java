package com.gethobby.web.event;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.Event;
import com.gethobby.service.domain.User;
import com.gethobby.service.event.EventService;

@RestController
@RequestMapping("/event/*")
public class EventRestController {

	//field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	public EventRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@RequestMapping(value = "json/makeFileUpload", method = RequestMethod.POST )
	public String makeFileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		
		System.out.println("email--\n"+email+"\nfile---\n"+file);
		// 업로드할 폴더 경로
		//String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		//System.out.println("realFolder:\n"+realFolder);
		
		String path = "c:\\images\\kyung";
		//uuid로 유일한 식별자 생성.
		//UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		//String org_filename = file.getOriginalFilename();
		//System.out.println("원본 파일명 : " + org_filename);
		//반한되는 객체가 UUID 객체이므로 문자열 표현을 얻기 위해 toString() 메소드로 출력
		//String str_filename = uuid.toString() + org_filename;
		//System.out.println("저장할 파일명 : " + str_filename);

		//String filepath = realFolder + "\\" + email + "\\" + str_filename;
		//String filepath = path +"\\" + str_filename;
		//System.out.println("파일경로 : " + filepath);

		//File f = new File(filepath);
		//해당 파일 없으면 만드는 메서드
//		if (!f.exists()) {
//			f.mkdirs();
//		}
//		file.transferTo(f);
		//out.println("profileUpload/"+email+"/"+str_filename);
		//response.getWriter().println(str_filename);
		//response.getWriter().close();
		//out.println(str_filename);
		//out.close();
		
//		Map<String, Object>map = new HashMap<String, Object>();
//		map.put("url", str_filename);
//		
//		return map;
//		return str_filename;
		
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
	
	
	@RequestMapping(value = "json/eventList", method = RequestMethod.POST)
	public Map<String, Object> eventList( @RequestBody Search search,
			HttpSession session)throws Exception{
		
		System.out.println("\n\n\n\n\n\n===============================\n\n\n\n");
		System.out.println("\n\n\n\n\n\njson/eventList\n\n\n\n");
		User user = (User)session.getAttribute("user");
		System.out.println("세션의 User--"+user);
		System.out.println("\n\nsearchCondition--\n"+search);
		
		
		
		search.setPageSize(pageSize);
		  
		if(user != null) { 
			if(user.getUserId().equals("admin@naver.com")) {
				search.setPageSize(pageSize*3);
			} 
		}
		 
		System.out.println("\n\n\n\n\n searchCondition__"+search.getSearchCondition()+"__\n\n");
		
		if(search.getSearchCondition()==null || search.getSearchCondition().equals("0")) {
			search.setSearchCondition("전체"); //==>얘가 기본
		}else if(search.getSearchCondition().equals("1") || search.getSearchCondition().equals("진행중")) {
			search.setSearchCondition("진행중"); //==>얘가 기본
		}else if(search.getSearchCondition().equals("2") || search.getSearchCondition().equals("종료")) {
			search.setSearchCondition("종료"); //==>얘가 기본

		}
		
		System.out.println("CurrentPage---"+search.getCurrentPage()+"\npageSize---"+search.getPageSize()+
				"\nSearchCondition---"+search.getSearchCondition());
		
		
		Map<String, Object>map = eventService.getEventListGroupBYId(search);
		System.out.println(map.get("list")+"\n"+map.get("total"));
		System.out.println("size--"+((List<Event>)(map.get("list") )) .size());
		
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, search.getPageSize());
		
//		if(user != null) {
//			if(user.getUserId().equals("admin@naver.com")) {
//				
//				 resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize*3);
//			}
//		}
		
		System.out.println("\n\nresultPage==\n"+resultPage);
		
		map.put("list", (List<Event>)map.get("list"));
		map.put("total", map.get("total"));
		map.put("success", "200");
		map.put("resultPage", resultPage);
		
		return map;
		
	}
		

}
