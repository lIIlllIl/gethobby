package com.gethobby.service.openhobbyclass.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.omg.CORBA.portable.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassDAO;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseDAO;
import com.gethobby.service.purchase.PurchaseService;

@Service("openHobbyClassServiceImpl")
public class OpenHobbyClassServiceImpl implements OpenHobbyClassService{
		
	//Field
	@Autowired
	@Qualifier("openHobbyClassDAOImpl")
	private OpenHobbyClassDAO openHobbyClassDAO;
	public void setOpenHobbyClassDAO(OpenHobbyClassDAO openHobbyClassDAO) {
		this.openHobbyClassDAO = openHobbyClassDAO;
	}
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	private String temDir = "C:\\images\\hobbyclass\\";		
	private String videoTemDir = "C:\\video\\";		
	
	//Constructor
	public OpenHobbyClassServiceImpl() {
		System.out.println(this.getClass());
	}
		
	public Map<String, Object> getHobbyClassList(Search search, HttpSession session) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if( search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		search.setPageSize(10);
		String userId = ((User)session.getAttribute("user")).getUserId();

		int totalCount = openHobbyClassDAO.getHobbyClassTotalCount(userId);
		search.setSearchKeyword(userId);
		resultMap.put("hobbyClass", this.changeHobbyClassState(openHobbyClassDAO.getHobbyClassList(search)));
		resultMap.put("resultPage", new Page(search.getCurrentPage(),totalCount, pageUnit, 10));
		
		return resultMap;
	}
	
	public List changeHobbyClassState(List list) throws Exception {
		List resultList = new ArrayList();
		for(int i=0; i<list.size(); i++) {
			HobbyClass hobbyClass = (HobbyClass)list.get(i);
			String state = hobbyClass.getHobbyClassState();
			
			if( state.equals("0") ){
				hobbyClass.setHobbyClassState("클래스 작성 중");
			}else if( state.equals("1") ) {
				hobbyClass.setHobbyClassState("심사 중");
			}else if( state.equals("2") ) {
				hobbyClass.setHobbyClassState("심사완료");
			}else if( state.equals("3") ) {
				hobbyClass.setHobbyClassState("수요조사 중");
			}else if( state.equals("4") ) {
				hobbyClass.setHobbyClassState("수요조사완료");
			}else if( state.equals("5") ) {
				hobbyClass.setHobbyClassState("개강 중");
			}else if( state.equals("6") ) {
				hobbyClass.setHobbyClassState("종강");
			}else if( state.equals("7") ) {
				hobbyClass.setHobbyClassState("폐강");
			}
			resultList.add(hobbyClass);
		}
		return resultList;
	}

	public void addHobbyClass(String userId) throws Exception {
		openHobbyClassDAO.addMyHobbyClass(userId);
		this.addLesson(openHobbyClassDAO.getNewHobbyClass(userId).getHobbyClassNo());
	}
	
	public HobbyClass getHobbyClassInfo(String userId) throws Exception {
		HobbyClass hobbyClass = openHobbyClassDAO.getNewHobbyClass(userId);
		List lessonList = new ArrayList();
		Lesson lesson = new Lesson();
		lesson.setLessonNo(openHobbyClassDAO.getLessonNo(hobbyClass.getHobbyClassNo()));
		lessonList.add(lesson);
		hobbyClass.setLesson(lessonList);
		return hobbyClass;
	}

	public int deleteHobbyClass(int hobbyClassNo) throws Exception {
		this.deleteLesson(hobbyClassNo);
		return openHobbyClassDAO.deleteHobbyClass(hobbyClassNo);
	}
	
	public HobbyClass getSaveHobbyClass(int hobbyClassNo) throws Exception {
		
		HobbyClass hobbyClass = openHobbyClassDAO.getSaveHobbyClass(hobbyClassNo);
		if( hobbyClass.getCategory() != null) {
			hobbyClass.setCategory(this.changeCategoryName(hobbyClass));
		}	
		hobbyClass.setLesson(openHobbyClassDAO.getLessonList(hobbyClassNo));	
		hobbyClass.setHashtag(this.chageHashtag(openHobbyClassDAO.getHashtag(hobbyClassNo)));
		hobbyClass.getUser().setNickName(openHobbyClassDAO.getNickName(hobbyClass.getUser().getUserId()));

		return hobbyClass;
	}

	public HobbyClass getHobbyClass(int hobbyClassNo, String what) throws Exception {
		
		Map<String, Object> hobbyClassIdAndWhat = new HashMap<String, Object>();
		hobbyClassIdAndWhat.put("hobbyClassNo", hobbyClassNo);
		hobbyClassIdAndWhat.put("what", what);
		HobbyClass hobbyClass = openHobbyClassDAO.getHobbyClass(hobbyClassIdAndWhat);
		
		if(what.equals("510")) {		
			hobbyClass.setHashtag(openHobbyClassDAO.getHashtag(hobbyClassNo));
		}else if(what.equals("520")) {
			hobbyClass.setLesson(openHobbyClassDAO.getLessonList(hobbyClassNo));	
			return hobbyClass;
		}
		return hobbyClass;
	}
	
	public int saveHobbyClassInfo(HobbyClass hobbyClass, HttpSession session) throws Exception {
		hobbyClass.setUser((User)session.getAttribute("user"));

		List list = new ArrayList();
		list.add(hobbyClass.getHobbyClassImage());
		hobbyClass.setTempFile(list);
		this.sessionDelete(session, hobbyClass.getTempFile());
		
		addHashtag(hobbyClass);
		hobbyClass.setCategory(this.changeCategory(hobbyClass));
		System.out.println(hobbyClass.toString());
		return openHobbyClassDAO.saveHobbyClassInfo(hobbyClass);
	}

	public int saveKit(HobbyClass hobbyClass) throws Exception {
		return openHobbyClassDAO.saveKit(hobbyClass);
	}

	public int saveCheckHobbyClass(int hobbyClassNo) throws Exception {
		return openHobbyClassDAO.saveCheckHobbyClass(hobbyClassNo);
	}

	public HobbyClass getPreview(int hobbyClassNo, String what) throws Exception {
		Map<String, Object> hobbyClassNoAndWhat = new HashMap<String, Object>();
		hobbyClassNoAndWhat.put("hobbyClassNo", hobbyClassNo);
		hobbyClassNoAndWhat.put("what", what);
		HobbyClass hobbyClass = openHobbyClassDAO.getPreview(hobbyClassNoAndWhat);
		
		if(what.equals("510")) {		
			hobbyClass.setHashtag(openHobbyClassDAO.getHashtag(hobbyClassNo));
			//user�г���
		}else if(what.equals("520")) {
			hobbyClass.setLesson(openHobbyClassDAO.getLessonList(hobbyClassNo));	
			return hobbyClass;
		}		
		return hobbyClass;
	}
	
	public Lesson getLesson(int lessonNo) throws Exception {
		return openHobbyClassDAO.getLesson(lessonNo);
	}

	public int saveLesson(Lesson lesson, HttpSession session) throws Exception {
		List list = new ArrayList();
		list.add(lesson.getLessonImage());
		list.add(lesson.getLessonVideo());
		lesson.setTempFile(list);
		this.sessionDelete(session, list);
		return openHobbyClassDAO.saveLesson(lesson);
	}

	public Lesson addLesson(int hobbyClassNo) throws Exception {		
		this.updateTotalLesson(hobbyClassNo, 1, "1");
		openHobbyClassDAO.addLesson(hobbyClassNo);	
		return openHobbyClassDAO.getLesson(openHobbyClassDAO.getLessonNo(hobbyClassNo));
	}

	public int deleteLesson(int hobbyClassNo) throws Exception {
		this.updateTotalLesson(hobbyClassNo, 1, "0");
		return openHobbyClassDAO.deleteLesson(hobbyClassNo);
	}

	public int addHashtag(HobbyClass hobbyClass) throws Exception {
		int result = -1;
		for(int i=0; i<hobbyClass.getHashtag().size(); i++) {
			
			Map<String, Object> hashtagMap = new HashMap<String, Object>();
			hashtagMap.put("a", hobbyClass.getHobbyClassNo());
			hashtagMap.put("b", hobbyClass.getUser().getUserId());
			hashtagMap.put("c", hobbyClass.getHashtag().get(i));
			openHobbyClassDAO.addHashtag(hashtagMap);
		}
		return result;
	}
	
	public List getHashtag(int hobbyClassNo) throws Exception {
		return openHobbyClassDAO.getHashtag(hobbyClassNo);
	}
	
	public int updateTotalMoney(int hobbyClassNo, int money, String what) throws Exception {
		Map<String, Object> hobbyClassNoAndTotalMoeny = new HashMap<String, Object>();
		hobbyClassNoAndTotalMoeny.put("hobbyClassNo", hobbyClassNo);
		if(what.equals("1")) {
			hobbyClassNoAndTotalMoeny.put("totalMoney", openHobbyClassDAO.getTotalMoney(hobbyClassNo)+money);
		}else if(what.equals("0")) {
			hobbyClassNoAndTotalMoeny.put("totalMoney", openHobbyClassDAO.getTotalMoney(hobbyClassNo)-money);
		}
		return openHobbyClassDAO.updateTotalMoney(hobbyClassNoAndTotalMoeny);
	}
	
	public int updateTotalStudent(int hobbyClassNo, int count, String what) throws Exception {
		Map<String, Object> hobbyClassNoAndTotalStudent = new HashMap<String, Object>();
		hobbyClassNoAndTotalStudent.put("hobbyClassNo", hobbyClassNo);
		if(what.equals("1")) {
			hobbyClassNoAndTotalStudent.put("totalStudent", openHobbyClassDAO.getTotalStudent(hobbyClassNo)+count);
		}else if(what.equals("0")) {
			hobbyClassNoAndTotalStudent.put("totalStudent", openHobbyClassDAO.getTotalStudent(hobbyClassNo)-count);

		}
		return openHobbyClassDAO.updateTotalStudent(hobbyClassNoAndTotalStudent);
	}
	
	public int updateTotalLesson(int hobbyClassId, int count, String what) throws Exception {
		Map<String, Object> hobbyClassIdAndTotalLesson = new HashMap<String, Object>();
		hobbyClassIdAndTotalLesson.put("hobbyClassNo", hobbyClassId);
		if(what.equals("1")) {
			hobbyClassIdAndTotalLesson.put("totalLesson", openHobbyClassDAO.getTotalLesson(hobbyClassId)+count);
		}else if(what.equals("0")) {
			hobbyClassIdAndTotalLesson.put("totalLesson", openHobbyClassDAO.getTotalLesson(hobbyClassId)-count);

		}
		return openHobbyClassDAO.updateTotalLesson(hobbyClassIdAndTotalLesson);
	}
	
	public List getFileName(MultipartFile file, HttpSession session) throws Exception {
		List tempFileList = new ArrayList();	
		String fileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String fileName = System.currentTimeMillis() + fileExtension;
		System.out.println(fileExtension);
		try {
			if(fileExtension.equals(".jpg") || fileExtension.equals(".png") || fileExtension.equals(".jpeg")) {
				file.transferTo(new File(temDir, fileName));
				
			}else {
				file.transferTo(new File(videoTemDir, fileName));
			}
			tempFileList.add(fileName);
			session.setAttribute(fileName, fileName);
			System.out.println(session.getAttribute(fileName));
		}catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return tempFileList;
	}
	
	public void fileDelete(HttpSession session, List fileName) throws Exception {
		
		for(int fileListNo=0; fileListNo<fileName.size(); fileListNo++) {
			List tempFileList = (List)session.getAttribute(fileName.get(fileListNo).toString());
			for(int listNo=0; listNo<tempFileList.size(); listNo++) {
				File file = new File(temDir, (String)tempFileList.get(listNo));
				File videoFile = new File(videoTemDir, (String)tempFileList.get(listNo));
				file.delete();
				videoFile.delete();
				
			}
			session.removeAttribute(fileName.get(fileListNo).toString());
		}
		
	}
	
	public void sessionDelete(HttpSession session, List fileName) throws Exception {
		for(int fileListNo=0; fileListNo<fileName.size(); fileListNo++) {
			session.removeAttribute(fileName.get(fileListNo).toString());
		}
	}

	public Map<String, Object> getHobbyClassListAdmin(Search search) throws Exception {
		if( search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		search.setPageSize(4);
		Map<String, Object> hobbyClassMap = new HashMap<String, Object>();
		Map<String, Object> totalCountMap = new HashMap<String, Object>();
		hobbyClassMap.put("hobbyClass", openHobbyClassDAO.getHobbyClassListAdmin(search));
		
		// 전체 구매 개수
		totalCountMap.put("totalCountHobbyClass", "전체");
		hobbyClassMap.put("hobbyClassTotalCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		totalCountMap.put("totalCountHobbyClass", "심사 대기");
		hobbyClassMap.put("hobbyClassJudgeWatingCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		totalCountMap.put("totalCountHobbyClass", "수요조사 중");
		hobbyClassMap.put("hobbyClassResearchingCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		totalCountMap.put("totalCountHobbyClass", "수요조사 완료");
		hobbyClassMap.put("hobbyClassResearchedCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		totalCountMap.put("totalCountHobbyClass", "개강 중");
		hobbyClassMap.put("hobbyClassOpenCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		totalCountMap.put("totalCountHobbyClass", "종강");
		hobbyClassMap.put("hobbyClassEndCount", openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap));
		
		// 정렬기능 maxPage 
		if(search.getSearchCondition() != null && search.getSearchCondition().equals("hobbyClassState")) {
			totalCountMap.clear();
			totalCountMap.put("hobbyClassState", search.getSearchKeyword());
			totalCountMap.put("category", search.getCategory());
			int totalCount = openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap);
			hobbyClassMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 4));		
		}else if(search.getSearchCondition() != null && search.getSearchCondition().equals("all")) {
			totalCountMap.clear();
			totalCountMap.put("all", "1");
			totalCountMap.put("searchKeyword", search.getSearchKeyword());
			totalCountMap.put("category", search.getCategory());
			int totalCount = openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap);
			hobbyClassMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 4));
		}else {
			totalCountMap.clear();
			totalCountMap.put("totalCountHobbyClass", "전체");
			totalCountMap.put("category", search.getCategory());
			int totalCount = openHobbyClassDAO.getHobbyClassTotalCountAdmin(totalCountMap);
			hobbyClassMap.put("resultPage", new Page(search.getCurrentPage(), totalCount, pageUnit, 4));
		}	
		return hobbyClassMap;
	}
	
	public int saveCheckHobbyClassAdmin(int hobbyClassNo) throws Exception {
		return openHobbyClassDAO.saveCheckHobbyClassAdmin(hobbyClassNo);
	}

	public int updateHobbyClassAdmin(HobbyClass hobbyClass, String what, HttpSession session) throws Exception {
		if(what.equals("510")) {
			return saveHobbyClassInfo(hobbyClass, session);
		}else if(what.equals("520")) {
			return saveLesson((Lesson)hobbyClass.getLesson().get(0), session);
		}
		return saveKit(hobbyClass);
	}
	
	public String changeCategory(HobbyClass hobbyClass) throws Exception {
		
		String category = hobbyClass.getCategory();
		if( category.equals("운동") ) {
			return "e";
		}else if( category.equals("미술") ) {
			return "a";
		}else if( category.equals("음악") ) {
			return "m";
		}else if( category.equals("라이프스타일") ) {
			return "l";
		}else if( category.equals("요리") ) {
			return "c";
		}
		return "h";// 공예
	}
	
	public String changeCategoryName(HobbyClass hobbyClass) throws Exception {
		
		String category = hobbyClass.getCategory();
		if( category.equals("e") ) {
			return "운동";
		}else if( category.equals("a") ) {
			return "미술";
		}else if( category.equals("m") ) {
			return "음악";
		}else if( category.equals("l") ) {
			return "라이프스타일";
		}else if( category.equals("c") ) {
			return "요리";
		}
		return "공예";// h
	}
	
	public List<String> chageHashtag(List<String> hashtagList) throws Exception {
		List<String> resultList = new ArrayList<String>();
		for(int i=0; i<hashtagList.size(); i++) {
			resultList.add( new String(((String)hashtag.get(hashtagList.get(i))).getBytes("ISO-8859-1"), "UTF-8") );
		}
		return resultList;
	}
	
    public void updateClassState() throws Exception{
    	System.out.println("┎────────────────────────────────────┒");
    	
		// 심사 완료 -> 수요조사 중 변경
    	Map stateMap = new HashMap();
    	stateMap.put("state", "3");
		System.out.println( "┃심사 완료 -> 수요조사 중(변경 수) : "+ openHobbyClassDAO.updateClassState(stateMap) +"         ┃" );
		
		stateMap.clear();
    	stateMap.put("state", "4");
		// 수요조사 중 -> 수요조사 완료 변경
		System.out.println( "┃수요조사 중 -> 수요조사 완료(변경 수) : "+ openHobbyClassDAO.updateClassState(stateMap) +"      ┃" );
		
		// 수요조사 완료 -> 개강 중 변경
		stateMap.clear();
    	stateMap.put("state", "5");
		System.out.println( "┃수요조사 완료 -> 개강 중(변경 수) : "+ openHobbyClassDAO.updateClassState(stateMap) +"        ┃" );
		
		// 개강 중 -> 종강 변경
		stateMap.clear();
    	stateMap.put("state", "6");
		System.out.println( "┃개강 중 -> 종강(변경 수) : "+ openHobbyClassDAO.updateClassState(stateMap) +"              ┃" );
		
		System.out.println("┖───────────────────────────────────┚");
    }// 0 : 작성 중, 1 : 심사 중, 2 : 심사 완료, 3 : 수요조사 중, 4 : 수요조사 완료, 5 : 개강 중, 6 : 종강, 7 : 폐강

}//end of ServiceImpl