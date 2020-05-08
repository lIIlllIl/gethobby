package com.gethobby.web.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ant.ListTask;
import org.apache.catalina.tribes.transport.RxTaskPool;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.user.UserService;

//ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;
	
	@Value("#{apiKeyProperties['captchaClientId']}")
	String captchaClientId;
	
	@Value("#{apiKeyProperties['captchaClientSecret']}")
	String captchaClientSecret;
	
	@Value("#{apiKeyProperties['NaverClientId']}")
	String NaverClientId;
	
	@Value("#{apiKeyProperties['NaverClientclientPw']}")
	String NaverClientclientPw;
	
	@Value("#{apiKeyProperties['kakaoClientId']}")
	String kakaoClientId;
	
	@Value("#{apiKeyProperties['mailId']}")
	String mailId;
	
	@Value("#{apiKeyProperties['mailPw']}")
	String mailPw;
	
	@Value("#{apiKeyProperties['bluehouselabNickName']}")
	String bluehouselabNickName;
	
	@Value("#{apiKeyProperties['bluehouselabAppId']}")
	String bluehouselabAppId;
	
	@Value("#{apiKeyProperties['sender']}")
	String sender;

	public UserController() {
		System.out.println(this.getClass());
	}
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	@RequestMapping(value="addUser", method = RequestMethod.GET)
	public String addUser() throws Exception{
		
		
		System.out.println("addUser() GET ::::::::::::::");
		
		return "redirect:/user/addUser.jsp";
	}
	
	@RequestMapping(value="addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, @RequestParam("file") List<MultipartFile> file , HttpSession session) throws Exception{
		
	System.out.println("addUser() POST  ::::::::::::::::::::"+user);		
	
//		String temDir = "C:/Users/user/git/gethobby/GetHobby/WebContent/resources/image/logo/";
		String temDir = "C:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GetHobby/resources/image/logo/";
		String fileName = "";
		System.out.println("file::::::::::::::::"+file);
	
		if(file.get(0).getSize() !=0) {
			for (int i = 0; i < file.size(); i++) {
				
				File saveFile = new File(temDir + file.get(i).getOriginalFilename());
				file.get(i).transferTo(saveFile);
				
				fileName += file.get(i).getOriginalFilename();
				
					if((file.size() -1) != i) {
						fileName += "/";
					}
			}
		}
		
		user.setProfileImage(fileName);
		
		if(user.getNickName().equals("")) {
			user.setNickName(user.getName());
		}
		
		System.out.println("fileName:::::::::::::::::"+fileName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("userId" ,user.getUserId());
		map.put("list", user.getHashtag());		
		
		userService.addUser(map);
		return "redirect:/user/captcha";
	}
	
//	@RequestMapping(value="login", method = RequestMethod.POST)
//	public String login(@ModelAttribute("user")User user, HttpSession session, Model model) throws Exception{
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map = userService.getUser(user.getUserId());
//		
//		User dbUser = new User();
//		dbUser = (User)map.get("user");
//		
//		if(user.getPassword().equals(dbUser.getPassword())) {
//			session.setAttribute("user", dbUser);
//			System.out.println("로긴 성공");
//			if(dbUser.getUserId() == "admin@naver.com") {
//				
//				Map<String, Object> listUserAdmin	= new HashMap<String, Object>();
//				Search search = new Search();
//				search.setPageSize(pageSize);
//				search.setCurrentPage(1);
//				
//				listUserAdmin = userService.getUserListAdmin(search);
//				
//				model.addAttribute("userList", listUserAdmin.get("userList"));
//				model.addAttribute("totalCount", listUserAdmin.get("totalCount"));
//				model.addAttribute("userCount", listUserAdmin.get("userCount"));
//				model.addAttribute("creatorCount", listUserAdmin.get("creatorCount"));
//				model.addAttribute("stopUserCount", listUserAdmin.get("stopUserCount"));
//				model.addAttribute("retireUserCount", listUserAdmin.get("retireUserCount"));		
//				return "forward:/admin/listUserAdmin.jsp";
//			}
//		}else {
//			System.out.println("패스워드 맞지 않습니다.");
//		}
//		
//		return "forward:/index.jsp";
//	}
	@RequestMapping(value ="login", method = RequestMethod.GET)
	public String login(HttpSession session) throws Exception{
		
		session.setAttribute("user", session.getAttribute("user"));
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "logout" , method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception{
		
		Map<String, Object> map = new HashMap<String,Object>();
		map = userService.getUser(userId);
		
		
		model.addAttribute("user", map.get("user"));
		model.addAttribute("list", map.get("list"));
		
		return "forward:/user/getUser.jsp";
	}
	@RequestMapping(value="mypageUser", method = RequestMethod.GET)
	public String mypageUser(HttpSession session) throws Exception{
		session.setAttribute("user", session.getAttribute("user"));
		
		return "forward:/user/mypageUser.jsp";
	}
	
	@RequestMapping(value="checkDuplication", method = RequestMethod.POST)
	public String checkDuplication(@RequestParam("userId") String userId , Model model) throws Exception{
		boolean result = false;
		
		result = userService.checkDuplication(userId);
		
		model.addAttribute("result", result);
		model.addAttribute("userId", userId);
		
		return "forward:/user/checkDuplication.jsp";		

	}
	@RequestMapping(value="captcha")
	public String captcha(Model model)throws Exception{
		
		System.out.println("cptcha:::::::::::::::::::::start");
		
		
		try {
			String code= "0";
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-naver-Client-Id", captchaClientId);
			con.setRequestProperty("X-Naver-Client-Secret", captchaClientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));				
			}else {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
			
			JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
			
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> map = objectMapper.readValue(jsonobj.toString(), new TypeReference<Map<String, String>>(){});
			String key = map.get("key");
			String imageURL= "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+key;
			
			url = new URL(imageURL);
			con =(HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-naver-Client-Id", captchaClientId);
			con.setRequestProperty("X-Naver-Client-Secret", captchaClientSecret);
			
			responseCode = con.getResponseCode();
			
			if(responseCode == 200) {
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				
				String imageName = Long.valueOf(new Date().getTime()).toString();
//				File file = new File("C:/Users/user/git/gethobby/GetHobby/WebContent/resources/image/woo/"+imageName+".jpg");
				File file = new File("C:/images/woo/"+imageName+".jpg");
				file.createNewFile();
				
				OutputStream outputStream = new FileOutputStream(file);
				while ((read=is.read(bytes)) != -1) {
					outputStream.write(bytes,0,read);
				}
				
				model.addAttribute("key", key);
				model.addAttribute("image", imageName);
				is.close();
			}else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				while((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString());
			}			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return "forward:/user/login.jsp";
	}
	@RequestMapping(value = "captchaCopy")
	public void captchaCopy(@RequestParam("fileName") String fileName, HttpServletRequest req, HttpServletResponse res ) throws Exception{
		System.out.println("cptchaCopy:::::::::::::::::::::start");
		System.out.println("fileName"+fileName);
		String path="C:/images/woo/"+fileName+".jpg";
		
		File file = new File(path);
		
		res.setHeader("Content-Length", String.valueOf(file.length()));
		res.setHeader("Content-Disposition", "inline; filename=\""+file.getName()+"\"");
		
		Files.copy(file.toPath(), res.getOutputStream());
		
	}
	
	@RequestMapping(value="naverCallback")
	public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session) throws Exception{
		
		String naverURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
				+ "&client_id="+NaverClientId+"&client_secret="+NaverClientclientPw
				+ "&code="+code
				+ "&state="+state;
		
		
		URL url = new URL(naverURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br ;
		
		if(con.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		}else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		String jsonData;
		StringBuffer response = new StringBuffer();
		
		while((jsonData =br.readLine()) != null) {
			response.append(jsonData);
		}
		
		br.close();
		System.out.println("response json Data ::::::::"+response.toString());
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(response.toString());
		
		 ObjectMapper objectMapper = new ObjectMapper();
		 
		 Map<String, String> tokenMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>() {});
		
		 System.out.println("//////////////"+tokenMap);
		 
		 String token = tokenMap.get("access_token");
		 String header = "Bearer " + token;
		 
		 Map<String, String> profileMap = new HashMap<String, String>();
		 
		 try {
			 String apiURL = "https://openapi.naver.com/v1/nid/me";
			url = new URL(apiURL);
			System.out.println("URLURLURLURL"+url);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			
			BufferedReader bbr;
			
			if(con.getResponseCode() ==200 ) {
				bbr = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			}else {
				bbr = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			response = new StringBuffer();
			while((jsonData = bbr.readLine()) != null){
				response.append(jsonData);
			}
			br.close();
			System.out.println("response.toString():::::::"+response.toString());
			
			jsonObject = (JSONObject)JSONValue.parse(response.toString());
			System.out.println("jsonObject::::::::::::::::"+jsonObject);
			profileMap = objectMapper.readValue(jsonObject.get("response").toString(), new TypeReference<Map<String, String>>() {});
			
		 }catch (Exception e) {
			 e.printStackTrace();
		}
		 
		 System.out.println("------------------profileMap" + profileMap);
		 
		 String password = profileMap.get("id");
		 String userId = profileMap.get("email");
		 User user = new User();
		 if(userService.checkDuplication(userId)) {
			
			 user.setUserId(userId);
			 user.setPassword(password);	 
			 session.setAttribute("snsInfo", user);
			 return "forward:/user/pathSNSLoginInfo.jsp";
		 }else {
			Map<String, Object> map = userService.getUser(userId);
			user = (User)map.get("user");
			 session.setAttribute("user", user);
			 return "forward:/user/pathSNSLogin.jsp";
		 }		
		
		
		
	}
	
	@RequestMapping(value="/addUserSNSInfo" , method = RequestMethod.POST)
	public String addUserSNSInfo(@ModelAttribute("user")User user, @RequestParam("file") List<MultipartFile> file,HttpSession session )throws Exception{
		
		
//		String temDir = "C:/Users/user/git/gethobby/GetHobby/WebContent/resources/image/logo/";
		String temDir = "C:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GetHobby/resources/image/logo/";
		String fileName = "";
	
		if(file.get(0).getSize() !=0) {
			for (int i = 0; i < file.size(); i++) {
				
				File saveFile = new File(temDir + file.get(i).getOriginalFilename());
				file.get(i).transferTo(saveFile);
				
				fileName += file.get(i).getOriginalFilename();
				
					if((file.size() -1) != i) {
						fileName += "/";
					}
			}
		}
		
		user.setProfileImage(fileName);
		if(user.getNickName().equals("") ) {
			user.setNickName(user.getName());
		}
		System.out.println("user::::::::::"+user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("userId", user.getUserId());
		map.put("list", user.getHashtag());
		
		userService.addUser(map);
		session.setAttribute("user", user);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="kakaoCallBack" , method = RequestMethod.GET)
	public String kakoCallBack(@RequestParam("code") String code, HttpSession session) throws Exception{
		String redirectURL = "http://192.168.0.144:8080/user/kakaoCallBack";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		Map<String,Object> userInfo = new HashMap<String, Object>();
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+kakaoClientId);
			sb.append("&redirect_uri="+redirectURL);
			sb.append("&code="+code);
			
			bw.append(sb.toString());
			bw.flush();
			
			int responseCode = con.getResponseCode();
			BufferedReader br ;
			
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));				
			}
				String line = "";
				String result = "";
				
				while((line =br.readLine()) != null) {
					result += line;
				}
			
				JSONObject jsonObject = (JSONObject)JSONValue.parse(result);
				
				Map<String,String>resultdata = new HashMap<String, String>();
				ObjectMapper objectMapper = new ObjectMapper();
				resultdata = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>() {});
				
				String access_Token = resultdata.get("access_token");
				String refresh_Token = resultdata.get("refresh_token");
				
				br.close();
				bw.close();
				
				String resultURL = "https://kapi.kakao.com/v2/user/me";
				
				URL requestURL = new URL(resultURL);
				
				HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer "+access_Token);
				
				responseCode = conn.getResponseCode();
				
				if(responseCode == 200) {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));	
				}else {
					br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));					
				}
				
				result ="";
				line = "";
				while((line = br.readLine()) != null) {
					result += line;
				}
				
				br.close();
				
				jsonObject = (JSONObject)JSONValue.parse(result);
				
				userInfo = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, Object>>() {});
				
				System.out.println("userInfo::::::::::::::::::::::"+userInfo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		String userId = (String)((Map)userInfo.get("kakao_account")).get("email");
		String password =Integer.toString((int)userInfo.get("id"));
		
		
		 User user = new User();
		 if(userService.checkDuplication(userId)) {
			 user.setUserId(userId);
			 user.setPassword(password); 
			 System.out.println("user::::::::::::::::::::::::::"+user);
			 session.setAttribute("snsInfo", user);
			 return "forward:/user/pathSNSLoginInfo.jsp";
		 }else {
			Map<String, Object> map = userService.getUser(userId);
			user = (User)map.get("user");
			 session.setAttribute("user", user);
			 return "forward:/user/pathSNSLogin.jsp";
		 }	
	}
	@RequestMapping(value = "newPassword/{userId}", method = RequestMethod.GET)
	public String newPassword(@PathVariable String userId, Model model) throws Exception{
		
		model.addAttribute("userId", userId+".com");
		System.out.println("newPassword :::::::::::::::::userId"+userId);
		return "forward:/user/newPassword.jsp";
	}
	
	@RequestMapping(value = "updateNewPassword" , method = RequestMethod.POST)
	public String updateNewPassword(@RequestParam("userId")String userId, @RequestParam("password") String password) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map =userService.getUser(userId);
		User user = new User();
		user = (User)map.get("user");
		
		user.setPassword(password);
		userService.updateNewPassword(user);		
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="mypage")
	public String mypage() throws Exception{		
		
		return "forward:/user/mypageUser.jsp";
	}
	@RequestMapping(value="changeUserCreator" , method = RequestMethod.GET)
	public String changeUserCreator(HttpSession session)throws Exception{		
		
		session.setAttribute("user", session.getAttribute("user"));
		
		return "/user/changeUserCreator.jsp";
	}
	@RequestMapping(value = "changeUserCreator" , method = RequestMethod.POST)
	public String changeUserCreator(@ModelAttribute User user, HttpSession session) throws Exception{
		System.out.println("User:::::::::::::::"+user);
		Map<String,Object> map = new HashMap<String, Object>();
		map = userService.getUser(user.getUserId());
		user = (User)map.get("user");
		
		userService.changeUserCreator(user);
		
		Map returnMap = userService.getUser(user.getUserId());
		User resultUser = new User();		
		resultUser = (User)returnMap.get("user");
		session.setAttribute("user", resultUser);
		oepnhobbyClassService.addHobbyClass(((User)session.getAttribute("user")).getUserId());
		System.out.println("changeUserCreator ::::::::::::::" + resultUser);
		return "redirect:/openhobbyclass/listMyHobbyClass.jsp";
	}
	@RequestMapping(value ="addNotice", method = RequestMethod.GET)
	public String addNotice(HttpSession session)throws Exception{
		
		session.setAttribute("user", session.getAttribute("user"));
		
		return "forward:/user/addNotice.jsp";
	}
	
	@RequestMapping(value = "addNotice", method = RequestMethod.POST)
	public String addNotice(@ModelAttribute Article article, @RequestParam("userId") String userId, Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();		
		map = userService.getUser(userId);
		
		User user = new User();
		user = (User)map.get("user");
		
		article.setUser(user);
		int articleNo = userService.addNotice(article);
		model.addAttribute("article", userService.getNotice(articleNo));
		model.addAttribute("articleNo", articleNo);
		
		System.out.println("article:::::"+article);
		return "forward:/user/getNotice.jsp";
	}
	
	@RequestMapping(value="getNotice/{articleNo}", method = RequestMethod.GET)
	public String getNotice(@PathVariable int articleNo , Model model) throws Exception{		
		Article article = new Article();
		article = userService.getNotice(articleNo);
		int view = article.getTotalView();
		view  = view+1;
		System.out.println("view::::::::::::::::"+view);
		article.setTotalView(view);
		System.out.println(article);
		userService.updateNoticeView(article);
		
		
		System.out.println("::::::::::::::::::::::::::::"+userService.getNotice(articleNo));
		model.addAttribute("article", userService.getNotice(articleNo))	;
		model.addAttribute("articleNo", articleNo);
		
		
		return "forward:/user/getNotice.jsp"; 
	}
	
	@RequestMapping(value="deleteNotice/{articleNo}")
	public String deleteNotice(@PathVariable int articleNo , HttpSession session) throws Exception{
		userService.deleteNotice(articleNo);
		session.setAttribute("user", session.getAttribute("user"));
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value ="updateNoticeView" , method = RequestMethod.POST)
	public String updateNoticeView(@ModelAttribute Article article, Model model) throws Exception{
		article = userService.getNotice(article.getArticleNo());
		model.addAttribute("article", article)	;
		return "forward:/user/updateNotice.jsp";
	}
	
	@RequestMapping(value="updateNotice" , method = RequestMethod.POST)
	public String updateNotice(@ModelAttribute Article article)throws Exception{
		System.out.println("updateArticle::::::"+article);
		userService.updateNotice(article);
		return "forward:/user/listNotice";
	}
	
	@RequestMapping(value="listNotice")
	public String listNotice(@ModelAttribute("search") Search search, Model model, HttpSession session)throws Exception{
		if(search.getCurrentPage() == 0) {
			int current = 1;
			search.setCurrentPage(current) ;
		}
		search.setPageSize(pageSize);
		Map<String, Object> map = new HashMap<String, Object>();		
		map= userService.getNoticeList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		
		User user = new User();		
		user = (User)session.getAttribute("user");
		System.out.println("user:::::::::::"+user);
		if(user.getRole().equals("2")) {
			return "forward:/admin/listNoticeAdmin.jsp";
		}else {
			return "forward:/user/listNotice.jsp";
		}
		
	}

	@RequestMapping(value="deleteUser")
	public String deleteUser(@ModelAttribute User user, HttpSession session) throws Exception{
		userService.deleteUser(user);
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, @RequestParam("file") List<MultipartFile> file , HttpSession session,@RequestParam("beforefile") String beforeName) throws Exception{
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		System.out.println("updateUser::::::::::::::::::::::::::"+user);
//		String temDir = "C:/Users/user/git/gethobby/GetHobby/WebContent/resources/image/logo/";
		String temDir = "C:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GetHobby/resources/image/logo/";
		String fileName = "";
		
		if(file.get(0).getSize() !=0) {
				for (int i = 0; i < file.size(); i++) {
					
					//File saveFile = new File(temDir + file.get(i).getOriginalFilename()); update
					//file.get(i).transferTo(saveFile); update
					//fileName += file.get(i).getOriginalFilename(); update
					
					// 수정된 부분 : fileName 프로토콜 (currentTimeMills + .확장자 ==> 17자리)
					String fileExtension = file.get(i).getOriginalFilename().substring(file.get(i).getOriginalFilename().lastIndexOf("."));
					fileName = System.currentTimeMillis() + fileExtension;
					file.get(i).transferTo(new File(temDir,fileName));
					// 수정된 부분 끝
					
						if((file.size() -1) != i) {
							fileName += "/";
						}
				}
				user.setProfileImage(fileName);
			}else {
				user.setProfileImage(beforeName);
			}
		
		
		System.out.println("fileName:::::::::::::::::"+fileName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("userId" ,user.getUserId());
		map.put("list", user.getHashtag());		
		
		userService.updateUser(map);
		
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap = userService.getUser(user.getUserId());
		session.setAttribute("user", resultmap.get("user"));
		return "forward:/user/mypageUser.jsp";
	}
	
	// 수정한 부분 ////////////////////////////////////////////////////////
	@RequestMapping( value = "noLogonUser" ) 
	public String noLogonUser() throws Exception {
		return null;
	}
	// 수정한 부분 ////////////////////////////////////////////////////////
}
