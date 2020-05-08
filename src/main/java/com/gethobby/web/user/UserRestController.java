package com.gethobby.web.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gethobby.service.domain.User;
import com.gethobby.service.user.UserService;

import jdk.nashorn.internal.parser.JSONParser;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
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
	
	
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	@RequestMapping(value="json/login", method = RequestMethod.POST)
	public Map<String,Object> login(@RequestBody HashMap<String, Object> map, HttpSession session) throws Exception{
		
		String userId = (String)map.get("userId");
		String password = (String)map.get("password");
		String result = "";
		
		User user = new User();
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap = userService.getUser(userId);
		user = (User)userMap.get("user");		
		
		
		if(user  != null) {				
				if (user.getPassword().equals(password)) {
					session.setAttribute("user", user);
					if(user.getUserId().equals("admin@naver.com")) {
						map.put("result", "manager");
					}else if(user.getRole().equals("8") ){
						map.put("result","stopUser");
					}else if(user.getRole().equals("9")) {
						map.put("result","retireUser");
					}else {
						map.put("result", "success");
					}
				}else {
					map.put("result", "pwfail");
				}				
		}else {				
			result = "usernull";	
		}
		if(result == "usernull") {
			map.put("result", "usernull");
		}
		return map;
	}
	
	@RequestMapping(value ="json/checkDuplication" , method = RequestMethod.POST)
	public boolean checkDuplication(@RequestBody HashMap<String, String> map)throws Exception{
		System.out.println("중복체크 아이디:::::"+map.get("checkUserId"));
		String userId = map.get("checkUserId");	
		return userService.checkDuplication(userId);
	}
	
	@RequestMapping(value ="json/naverCaptcha")
	public Map<String,Object> naverCaptcha(@RequestBody HashMap<String, String> map , HttpSession session) throws Exception{
		System.out.println("naverCaptcha ::::::::::::::::::::::::::Start");
		
		
		String code = "1";
		String key = map.get("key");
		String value = map.get("captcha");
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code="+code+"&key="+key+"&value="+value;
		
		URL url = new URL(apiURL);
		
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", captchaClientId);
		con.setRequestProperty("X-Naver-Client-Secret", captchaClientSecret);
		
		int responseCode = con.getResponseCode();
		BufferedReader br ;
		if(responseCode == 200 ) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		
		while((inputLine = br.readLine()) != null){
			response.append(inputLine);
		}
		
		br.close();
		
		JSONObject json = (JSONObject)JSONValue.parse(response.toString());
		
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, String> resultMap = objMapper.readValue(json.toString(), new TypeReference<Map<String, String>>() {});
		
		resultMap.get("result");
		
		String userId = map.get("userId");
		String password = map.get("password");
		String result = "";
		User user = new User();
		Map<String,Object> finishResult = new HashMap<String, Object>();
		
		if (resultMap.get("result") == "true") {
			Map<String, Object> userMap = new HashMap<String, Object>();
			userMap = userService.getUser(userId);
			user = (User)userMap.get("user");
			if(user != null ) {
				if(user.getPassword().equals(password)) {
					session.setAttribute("user", user);
					if(user.getUserId().equals("admin@naver.com")) {
						finishResult.put("result", "manager");
					}else if(user.getRole().equals("8") ){
						finishResult.put("result","stopUser");
					}else if(user.getRole().equals("9")) {
						finishResult.put("result","retireUser");
					}else {
						finishResult.put("result", "success");
					}
				}else {
					finishResult.put("result", "pwfail");
				}
			}else {
				result = "usernull";				
			}
		}else {
			finishResult.put("result", "fail");
		}	
		if(result == "usernull") {
			finishResult.put("result", "usernull");
		}
		
		/////// 캡차 제외 테스트용/////////
//		Map<String, Object> userMap = new HashMap<String, Object>();
//		userMap = userService.getUser(userId);
//		user = (User)userMap.get("user");
//		session.setAttribute("user", user);
//		if(user.getUserId().equals("admin@naver.com")) {
//			finishResult.put("result", "manager");
//		}else {
//			finishResult.put("result", "success");
//		}					
		return finishResult;
	}
	
	@RequestMapping(value="json/naverLogin" , method = RequestMethod.GET)
	public Map<String,Object> naverLogin(HttpSession session) throws Exception{
		System.out.println("naverLogin :::::::::::::::::Start");
		
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130,random).toString(32);
		
		session.setAttribute("state", state);
		
		String redirectURL = URLEncoder.encode("http://192.168.0.144:8080/user/naverCallback","UTF-8");
		String loginURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+NaverClientId+"&redirect_uri="+redirectURL+"&state="+(String)session.getAttribute("state");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginURL", loginURL);
		
		return map;
	}
	@RequestMapping(value="json/kakaoLogin", method = RequestMethod.GET)
	public Map kakaoLogin() throws Exception{
		String redirectUrl = "http://192.168.0.144:8080/user/kakaoCallBack";
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+kakaoClientId+"&redirect_uri="+redirectUrl+"&response_type=code";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("kakaoURL", kakaoUrl);
		return map;
	}
	@RequestMapping(value = "json/mailSend", method = RequestMethod.POST)
	public Map mailSend(@RequestBody HashMap<String, String> map) throws Exception{
		
		String host = "smtp.naver.com";
		
		int port =465;
		
		String recipient = map.get("receiveMail");
		String body = "안녕하세요.\r\n" + 
				"\r\n" + 
				"다음 링크를 통해 "+recipient+" 계정의 Get취미 비밀번호를 재설정하세요.\r\n" + 
				"비밀번호 재설정을 요청하지 않았다면 이 이메일을 무시하셔도 됩니다.\r\n" +
				"http://192.168.0.144:8080/user/newPassword/"+recipient+
				"\r\n" + 
				"감사합니다.\r\n" + 
				"\r\n" + 
				"감자면";
		String subject = "Get취미의 비밀번호 재설정";
		
		Properties prop  = System.getProperties();
		
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port",port);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust",host);
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
					String un = mailId;
					String pw = mailPw;
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication(un, pw);
					}			
		});
		
		session.setDebug(true);
		
		MimeMessage mimemessage = new MimeMessage(session);
		mimemessage.setFrom(new InternetAddress("carwash8233@naver.com"));
		mimemessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimemessage.setSubject(subject);
		mimemessage.setText(body);
		
		Multipart	multi = new MimeMultipart("related");
		MimeBodyPart mbp = new MimeBodyPart();
		String htmlText = "<img src=\"cid:image\"><h2>안녕하세요.<h2><br><p>비밀번호 변경을 눌러 "+recipient+ "계정의 Get취미 비밀번호를 재설정하세요.<br>" + 
								"비밀번호 재설정을 요청하지 않았다면 이 이메일을 무시하셔도 됩니다.<br>" + 
								"<a href=http://192.168.0.144:8080/user/newPassword/"+recipient+">비밀번호 변경</a><br>감사합니다.<br>감자면</p>"; 						 
		mbp.setContent(htmlText, "text/html; charset=utf-8");
		multi.addBodyPart(mbp);
		
		mbp = new MimeBodyPart();
		FileDataSource fds = new FileDataSource("C:\\Users\\user\\git\\gethobby\\GetHobby\\WebContent\\resources\\image\\logo\\wool.png");
		
		mbp.setDataHandler(new DataHandler(fds));
		mbp.setHeader("Content-ID", "<image>");
		
		multi.addBodyPart(mbp);
		mimemessage.setContent(multi);		
		
		System.out.println("mimemessage::::::::::::::::::::::::::::::::::::::::"+mimemessage);
		Transport.send(mimemessage);		
		
		String mailurl = "http://192.168.0.144:8080/user/getPassword.jsp";
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		mapp.put("mailURL", mailurl);
		return mapp;
	}
	@RequestMapping(value="json/reSendSMS")
	public Map reSendSMS(@RequestBody HashMap<String, String> map, Model model)throws Exception{
		
		String hostname = "api.bluehouselab.com";
		String url = "https://"+hostname+"/smscenter/v1.0/sendsms";
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname,443,AuthScope.ANY_REALM), new UsernamePasswordCredentials("byeol","a1c36bc2546811eab4b90cc47a1fcfae"));
		
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname,443,"https"), new BasicScheme());
		
		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);
		
		DefaultHttpClient client = new DefaultHttpClient();
		int ran = 0;
		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-Type","application/json; charset=utf-8");
			
					
			List<String> receiverList = new ArrayList<String>();
			receiverList.add(map.get("receivePhone"));
			
			Random random = new Random();
			ran = random.nextInt(8999)+1000;
			String content = "인증번호를 입력해주세요.["+ran+"]";
			
			String json = "{\"sender\":\""+sender+"\",\"receivers\":[\""+receiverList.get(0)+"\"],\"content\":\""+content+"\"}";
			
			StringEntity se = new StringEntity(json,"UTF-8");
			httpPost.setEntity(se);
			
			HttpResponse httpResponse = client.execute(httpPost,context);
			
			InputStream inputStream = httpResponse.getEntity().getContent();
			
			if(inputStream !=null) {
				BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
				
				String line ="";
				while((line=br.readLine()) != null) ;
					inputStream.close();
			}
				model.addAttribute("ran", ran);
				model.addAttribute("receivePhone", map.get("receivePhone"));
				
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			client.getConnectionManager().shutdown();
			map.put("ran", Integer.toString(ran));
			System.out.println("ran:::::::::::::::::::::::::::"+Integer.toString(ran));
		}			
		
			
			
		return map;
	}
	
	@RequestMapping( value="json/fileUpload")
	public String fileUpload(HttpServletRequest req)throws Exception{
		System.out.println(req);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		MultipartFile file = multi.getFile("file");
		
		
		String filepath = "C:\\Users\\user\\git\\gethobby\\GetHobby\\WebContent\\resources\\image\\logo\\";
		String path = "..\\resources\\image\\logo\\";
		File saveFile = new File(filepath + file.getOriginalFilename());
		file.transferTo(saveFile);
		String result =  path+file.getOriginalFilename();
		
		System.out.println("result:::::::::::"+result);
		return result;
	}	
	
	@RequestMapping(value ="json/reCaptcha")
	public Map<String, Object> reCaptcha() throws Exception{
		
		System.out.println("start!!@!@!@start!!@!@!@start!!@!@!@start!!@!@!@start!!@!@!@start!!@!@!@");
		String code= "0";
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
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
//			File file = new File("C:/Users/user/git/gethobby/GetHobby/WebContent/resources/image/woo/"+imageName+".jpg");
			File file = new File("C:/images/woo/"+imageName+".jpg");
			file.createNewFile();
			
			OutputStream outputStream = new FileOutputStream(file);
			while ((read=is.read(bytes)) != -1) {
				outputStream.write(bytes,0,read);
			}
//			model.addAttribute("key", key);
//			model.addAttribute("image", imageName);
			
			resultMap.put("key", key);
			resultMap.put("image", imageName);
			is.close();
		}else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
		}			
		
		return resultMap;
	}
}
