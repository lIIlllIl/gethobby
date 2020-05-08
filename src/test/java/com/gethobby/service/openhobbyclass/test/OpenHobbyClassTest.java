package com.gethobby.service.openhobbyclass.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class OpenHobbyClassTest {
	
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService openHobbyClassService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Test
	public void getHashtag() throws Exception {
		
		List<String> hashtagList = openHobbyClassService.getHashtag(10000);
		for(Object obj : hashtagList) {
			System.out.println(obj);
		}
	}// Success

	
	//@Test
	public void getPreview() throws Exception {
		System.out.println("\n=======================================================\n");
		System.out.println(openHobbyClassService.getPreview(10000, "510").getUser().getNickName());
		System.out.println(openHobbyClassService.getPreview(10000, "520").toString());
		System.out.println(openHobbyClassService.getPreview(10000, "530").toString());
		System.out.println("\n=======================================================\n");
	}// Success
	
	/*@Test
	public void getMyHobbyClassList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchKeyword("creator@bitcamp.com");
		List<HobbyClass> resultList = openHobbyClassService.getHobbyClassList(search);
		for(Object obj : resultList) {
			System.out.println(obj);
		}
	}// Success
	
	//@Test
	public void addMyHobbyClass() throws Exception {
		System.out.println(openHobbyClassService.addMyHobbyClass("creator@bitcamp.com"));
	}// Success
	
	//@Test
	public void deleteMyHobbyClass() throws Exception {
		System.out.println(openHobbyClassService.deleteMyHobbyClass(10001));
	}// Success
	
	//@Test
	public void getHobbyClass() throws Exception {
		System.out.println(openHobbyClassService.getHobbyClass(10000, "510").toString());
		System.out.println(openHobbyClassService.getHobbyClass(10000, "520").toString());
		System.out.println(openHobbyClassService.getHobbyClass(10000, "530").toString());
	}// Success
	*/
/*	
	//@Test
	public void saveHobbyClassInfo() throws Exception {
		

		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassImage("hobbyclasstest.jpg");
		hobbyClass.setHobbyClassName("How make potato");
		hobbyClass.setCategory("m");
		hobbyClass.setHobbyClassNo(10002);
		
		User user = new User();
		user.setUserId("creator@bitcamp.com");
		
		hobbyClass.setUser(user);
		List hashtagList = new ArrayList();
		hashtagList.add("m01");
		hashtagList.add("m02");
		hashtagList.add("m03");
		
		hobbyClass.setHashtag(hashtagList);
		hobbyClass.setHobbyClassPrice(400000);
		hobbyClass.setHobbyClassIntro("<div>Hello, Potato!</div>");
		System.out.println(openHobbyClassService.saveHobbyClassInfo(hobbyClass,session));
	}
*/	
	//@Test
	public void saveKit() throws Exception {
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassNo(10002);
		hobbyClass.setKitImage("kittest.jpg");
		hobbyClass.setKitIntro("테스트용 인트로");
		hobbyClass.setKitName("키트네임테스트");
		hobbyClass.setKitPrice(100000);
		System.out.println(openHobbyClassService.saveKit(hobbyClass));
	}// Success
	
	//@Test
	public void saveCheckHobbyClass() throws Exception {
		openHobbyClassService.saveCheckHobbyClass(10000);
	}// Success
	
	//@Test
	public void saveLesson() throws Exception {
		Lesson lesson = new Lesson();
		lesson.setLessonNo(10002);
		lesson.setLessonTitle("테스트용 레슨 타이틀");
		lesson.setLessonIntro("테스트용 레슨 인트로");
		lesson.setLessonImage("lessontest.jpg");
		lesson.setLessonVideo("lessonvideotest.jpg");
		lesson.setLessonProject("테스트용 레슨 과제");
		lesson.setLessonContent("<div>테스트용 썸머노트 콘텐트.</div>");
		//System.out.println(openHobbyClassService.saveLesson(lesson,session));
	}
	
	//@Test
	public void addLesson() throws Exception {
		for(int i=0; i<3; i++) {
			System.out.println(openHobbyClassService.addLesson(10000));
		}
	}// Success
	
	//@Test
	public void deleteLesson() throws Exception {
		for(int i=10000; i<10003; i++) {
			openHobbyClassService.deleteLesson(i);
		}
	}// Success
	
}
	
////////////////////////////////////////  임시 Test - 아래 - 	///////////////////////////////////////////////////////////////////////////
/*	
	
	//@Test
	public void getHashtag() throws Exception{
		List resultList = openHobbyClassService.getHashtag(10000);
		for(Object obj : resultList) {
			System.out.println(obj);
		}
	}// Success
	
	//@Test
	public void getHobbyClassListAdmin() throws Exception{
		
		Map<String, Object> searchKeywordAndWhat = new HashMap<String, Object>();
		searchKeywordAndWhat.put("what", "101");
		//searchKeywordAndWhat.put("searchKeyword", "");
		
		
		List resultList = openHobbyClassService.getHobbyClassListAdmin(searchKeywordAndWhat);
		for(Object obj : resultList) {
			System.out.println(obj);
		}
	}
	
	//@Test
	public void saveCheckHobbyClassAdmin() throws Exception{
		System.out.println(openHobbyClassService.saveCheckHobbyClassAdmin(10000));
	}// Success
	
	//@Test
*///	public void updateHobbyClassAdmin() throws Exception{
/*		
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassImage("hobbyclasstest.jpg");
		hobbyClass.setHobbyClassName("update");
		hobbyClass.setCategory("m");
		hobbyClass.setHobbyClassId(10000);
		hobbyClass.setHobbyClassIntro("update");
		
		User user = new User();
		user.setUserId("creator@naver.com");
		hobbyClass.setUser(user);
		
		List hashtagList = new ArrayList();
		hashtagList.add("m01");
		hashtagList.add(",02");
		hashtagList.add("m03");
		
		hobbyClass.setHashtag(hashtagList);
		System.out.println(openHobbyClassService.updateHobbyClassAdmin(hobbyClass, "510"));
		
		Lesson lesson = new Lesson();
		lesson.setLessonTitle("admin update");
		lesson.setLessonIntro("���� 500ml�� ���� �ֽ��ϴ�.");
		lesson.setLessonImage("lessontest.jpg");
		lesson.setLessonVideo("lessonvideotest.jpg");
		lesson.setLessonProject("���ڸ� ���� ���̸� �� �ּ���");
		lesson.setLessonContent("<div>���ǼҰ����� �׽�Ʈ �ϰڽ��ϴ�.</div>");
		List lessonList = new ArrayList();
		lessonList.add(lesson);
		lesson.setLessonId(10002);
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setLesson(lessonList);
		System.out.println(openHobbyClassService.updateHobbyClassAdmin(hobbyClass, "520"));
	
		HobbyClass hobbyClass = new HobbyClass();
		hobbyClass.setKitImage("kittest.jpg");
		hobbyClass.setKitIntro("��ȸ�� ������������ ���ڸ� ��ǰ�Դϴ�.");
		hobbyClass.setKitName("���ڸ������������");
		hobbyClass.setKitPrice(100000);
		hobbyClass.setHobbyClassId(10000);
		System.out.println(openHobbyClassService.updateHobbyClassAdmin(hobbyClass, "530"));

	}// Success

*/