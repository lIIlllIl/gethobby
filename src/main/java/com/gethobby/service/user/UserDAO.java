package com.gethobby.service.user;

import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.User;

//ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDAO {

	//Insert
	public void addUser(User	user) throws Exception;
	
	//Select
	public User getUser(String userId)throws Exception;
	
	//Select
	public List<String> getUserHashtag(String userId)throws Exception;
	
	//Update
	public void deleteUser(User user)throws Exception;
	
	//Update
	public void stopUser(User user)throws Exception;
	
	//Update
	public void removeStopUser(User user)throws Exception;
	
	//Update
	public void removeRetireUser(User user)throws Exception;
		
	//Update
	public void updateUser(User user)throws Exception;
	
	//Update
	public void updateHashtag(Map<String,Object> map)throws Exception;
	
	//Update
	public void changeUserCreator(User user) throws Exception;
	
	//Insert
	public void addHashtag(Map map) throws Exception;
	
	//Select
	public Map<String, Object> getUserListAdmin(Search search) throws Exception;
	
	//Update
	public void updateNewPassword(User user) throws Exception;
	
	//Insert
	public int addNotice(Article article) throws Exception;
	
	//Select
	public Article getNotice(int articleNo) throws Exception;
	
	//Update
	public void updateNoticeView(Article article) throws Exception;
	
	//Update
	public void updateNotice(Article article) throws Exception;
	
	//Select
	public Map<String, Object> getNoticeList(Search search) throws Exception;
	
	//Delete
	public void deleteNotice(int articleNo) throws Exception;
	
}
