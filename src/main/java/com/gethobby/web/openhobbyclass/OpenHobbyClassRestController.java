package com.gethobby.web.openhobbyclass;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;

@RestController
@RequestMapping("/hobbyclass/*")
public class OpenHobbyClassRestController {
	
	//Field
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;

	//Constructor
	public OpenHobbyClassRestController() {
		System.out.println(this.getClass());
	}
	
	//Method
	@RequestMapping( value="json/saveHobbyClassInfo", method=RequestMethod.POST )
	public int saveHobbyClassInfo(@RequestBody HobbyClass hobbyClass, HttpSession session) throws Exception {
		return oepnhobbyClassService.saveHobbyClassInfo(hobbyClass, session);
	}//end of saveHobbyClassInfo
	
	@RequestMapping( value="json/saveKit", method=RequestMethod.POST )
	public int saveKit(@RequestBody HobbyClass hobbyClass, HttpSession session) throws Exception {
		return oepnhobbyClassService.saveKit(hobbyClass);
	}//end of saveKit
	
	@RequestMapping( value="json/saveFile", method=RequestMethod.POST )
	public List saveFile(MultipartFile file, HttpSession session) throws Exception {		
		return oepnhobbyClassService.getFileName(file, session);
	}//end of saveFile
	
	@RequestMapping( value="json/saveVideoFile", method=RequestMethod.POST )
	public String saveVideoFile(MultipartFile file, HttpSession session) throws Exception {	
		return (String)oepnhobbyClassService.getFileName(file, session).get(0);
	}//end of saveVideoFile
	
	@RequestMapping( value="json/deleteHobbyClass", method=RequestMethod.POST )
	public int deleteHobbyClass(@RequestBody HobbyClass hobbyClass) throws Exception {
		return oepnhobbyClassService.deleteHobbyClass(hobbyClass.getHobbyClassNo());
	}//end of deleteHobbyClass

	@RequestMapping( value="json/saveLesson", method=RequestMethod.POST )
	public int saveLesson(@RequestBody Lesson lesson, HttpSession session) throws Exception {
		return oepnhobbyClassService.saveLesson(lesson, session);
	}//end of saveLesson
	
	@RequestMapping( value="json/addLesson", method=RequestMethod.POST )
	public Lesson addLesson(@RequestBody HobbyClass hobbyClass) throws Exception {
		return oepnhobbyClassService.addLesson(hobbyClass.getHobbyClassNo());
	}//end of addLesson
	
	@RequestMapping( value="json/saveCheckHobbyClass", method=RequestMethod.POST )
	public int saveCheckHobbyClass(@RequestBody HobbyClass hobbyClass) throws Exception {
		return oepnhobbyClassService.saveCheckHobbyClass(hobbyClass.getHobbyClassNo());
	}//end of saveCheckHobbyClass
	
	@RequestMapping( value="json/getMyHobbyClassList", method=RequestMethod.POST )
	public Map getMyHobbyClassList(@RequestBody Search search, HttpSession session) throws Exception {
		return oepnhobbyClassService.getHobbyClassList(search, session);
	}//end of getMyHobbyClassList
	
	@RequestMapping( value="json/getSaveHobbyClass", method=RequestMethod.POST )
	public HobbyClass getSaveHobbyClass(@RequestBody HobbyClass hobbyClass) throws Exception {
		return oepnhobbyClassService.getSaveHobbyClass(hobbyClass.getHobbyClassNo());
	}//end of getSaveHobbyClass
	
	@RequestMapping( value="json/getLesson", method=RequestMethod.POST )
	public Lesson getLesson(@RequestBody Lesson lesson) throws Exception {
		return oepnhobbyClassService.getLesson(lesson.getLessonNo());
	}//end of getLesson

}
