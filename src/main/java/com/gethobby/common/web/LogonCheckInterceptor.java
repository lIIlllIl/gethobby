package com.gethobby.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gethobby.service.domain.User;

public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();

		if ( user == null && queryString != null ) {
			ModelAndView mav = new ModelAndView("/user/captcha");
			
			if ( queryString.split("=")[1].equals("steam") ) {
				mav.addObject("redirectUrl", "/searchhobbyclass/getSearchHobbyClassList.jsp");
				
				throw new ModelAndViewDefiningException(mav);
			}
			else if ( queryString.split("&")[0].split("=")[1].equals("intro") ) {
				mav.addObject("redirectUrl", "/searchHobbyClass/getSearchHobbyClassIntro?" + queryString.split("&")[1]);
				
				throw new ModelAndViewDefiningException(mav);
			}
			else if ( queryString.split("=")[1].equals("mypageSteam") ) {
				mav.addObject("redirectUrl", "/user/mypageUser");
				
				throw new ModelAndViewDefiningException(mav);
			}
			else if ( queryString.split("&")[0].contains("article") ) {
				
				mav.addObject("redirectUrl", "/article/getBoardArticle?boardCode=" + queryString.split("&")[1].split("=")[1] + "&" + queryString.split("&")[2]);
				
				throw new ModelAndViewDefiningException(mav);
			}
		}
		return true;
	}
	
	
	
}
