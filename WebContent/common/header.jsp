<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="header-wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
            
                <div id="sidebarCollapse-side" style="border:0; outline:none; background-color: black; display:flex; justify-content: left;">    	                    
					<img src="/resources/image/logo/logo-favicon.png" class="side-img-header">	
				    <div class="getMainClass-side">
                   		GetHobby
                    </div>
                 </div>
            </div>

            <div class="list-unstyled components">
                
                    <div class="side-title-box-single">
						<img class="side-title-box-single-img" src="/resources/image/gon/classSide.jpg">
                   		클래스
                    </div>
                    <div class="side-title-box-single">
						<img class="side-title-box-single-img" src="/resources/image/gon/saleSide.jpg">
                  		이벤트
               	    </div>  
                    <div class="side-title-box-single">
                    	<img class="side-title-box-single-img" src="/resources/image/gon/freeArticleSide.jpg">
                  		아무말대잔치
               	    </div> 
               	    <div class="side-title-box-single">
						<img class="side-title-box-single-img" src="/resources/image/gon/imageArticleSide.jpg">
                  		하루 한 장
               	    </div>           
            </div>        
        </nav>

        <!-- Page Content  -->
        

            <nav class="navbar navbar-expand-lg navbar-light bg-light header-navbar">
               <div class="container-fluid" style="padding:0px 16px; background-color:black; height:100%; width:100%;">

                   <div id="sidebarCollapse" class="test" style="border:0; outline:none; background-color: black; display:flex; justify-content: left;">    	                    
						<img src="/resources/image/logo/logo-favicon.png">	
					    <div class="getMainClass">
	                   		GetHobby
	                    </div>
                   </div>
                   
                   <!-- Title Menu -->
                   <div style="display: flex; justify-content: right;">
                   <div class="header-title-menu-div">
					   <div style="display: flex; justify-content: right;">
		                   <div class="header-title-box-single">
		                   		클래스
		                   </div>
		                   <div class="header-title-box-single">
		                   		이벤트
		                   </div>
	                   
	                   <!-- Get취미 커뮤니티 -->
	                   <div class="dropdown d-flex justify-content-end">
				                <div class="header-mynemo-check-mylist dropdown-icon-comunity" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
				                	<span class="header-title-box-single" style="margin-right:0px;">
				                    	Get취미 커뮤니티
				                    </span>
				                    <div class="header-mynemo-profile-flow-one fa-angle-downa">
										<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
											<path d="M0 0h24v24H0V0z" fill="none"/>
											<path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z" fill="#ffffff"/>
										</svg>
									</div>
				                </div>
				
								<!-- 마이페이지 미니메뉴 -->
								<div class="header- dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
					                <div class="header-mynemo-out-div" style="padding:0px; background-color:white; width:120px;">
						                <div color="#1b1c1d" class="header-mynemo-logout-div">
						                	<div class="header-mynemo-logout-span jauNaviClass" style="height:37px; width:120px; color: rgb(253, 126, 20); font-size:16px; padding:8px 0px; text-align: center;">아무말대잔치</div>
						                	<div style="background:white; width:100%; height:2px;"></div>
						                	<div class="header-mynemo-logout-span sajinNaviClass" style="height:37px; width:120px; color: rgb(253, 126, 20); font-size:16px; padding:8px 0px; text-align: center;">하루 한 장</div>
						                </div>
					                </div>
				                </div>
			           </div>
	                   
	                   <c:if test="${ ! empty user }">
		                   <c:if test="${ sessionScope.user.role == '1' }">
		                   <div class="header-title-box-single">
		                   	크리에이터 센터 
		                   </div>
		                   </c:if>
		                   <c:if test="${ sessionScope.user.role == '0' }">
		                   <div class="header-title-box-single">
		                  	 크리에이터 지원
		                   </div>
		                   </c:if>
	                   </c:if>
	                   
	                   <c:if test="${ empty user }">
	                   <div class="header-title-box-single">
	                   	회원가입
	                   </div>
	                   </c:if>
	                   </div>
                   </div>
                  	   <c:if test="${ empty user }">
	                   <div class="header-title-box-single">
	                  	 로그인
	                   </div>
	                   </c:if>
	                   
	                   <c:if test="${ ! empty user }">
	                   <div style="margin:0px 0px 0px 24px;; padding:0px; color:white; font-size:24px; font-weight:bold; line-height:32px; etter-spacing: -0.4px;">
	                   		
	                   		<!-- 프로필 -->
				            <div class="dropdown d-flex justify-content-end">
				                <div class="dropdown-icon header-mynemo-check-mylist" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
				                	<span class="header-mynemo-first-span">
				                		<!-- 프로필 이미지 수정 -->
				                    	<img src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
				                    </span>
				                    
				                    <div class="header-mynemo-profile-flow-one fa-angle-down">
										<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
											<path d="M0 0h24v24H0V0z" fill="none"/>
											<path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z" fill="#ffffff"/>
										</svg>
									</div>
				                </div>
				
								<!-- 마이페이지 미니메뉴 -->
								<div class="dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
					                <div class="header-mynemo-out-div">
					                <a class="header-mynemo-first-a" href="/user/mypageUser">
						                <span class="header-mynemo-first-span">
						                	<!-- 프로필 이미지 수정 -->
						                	<img src="../resources/image/logo/${!empty sessionScope.user.profileImage ? sessionScope.user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
						                </span>
						                <div class="header-mynemo-span-next-first-div">
							                <div class="header-mynemo-span-next-first-div-in-div">
							                	${sessionScope.user.nickName}
							                </div>
							                <span class="header-mynemo-span-next-first-div-in-span">
								                <div color="#fd7e14" class="header-mynemo-span-next-first-div-in-mypage-text">
								                	마이페이지
								                </div>
								                <svg width="12" height="12" viewBox="0 0 24 24">
								                	<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z" />
								                </svg>
							                </span>
						                </div>
					                </a>
					                
					                <c:if test="${ sessionScope.user.role == '0' }">
									<div color="#1b1c1d" class="header-mynemo-div">
					                	<div class="header-mynemo-span" style="text-decoration:none;">
						                	크리에이터 지원
						                </div>
					                </div>   
					                <div class="header-mynemo-hr"></div>
					                </c:if>
					                <c:if test="${ sessionScope.user.role == '1' }">
									<div color="#1b1c1d" class="header-mynemo-div">
					                	<div class="header-mynemo-span" style="text-decoration:none;">
						                	크리에이터 센터
						                </div>
					                </div>   
					                <div class="header-mynemo-hr"></div>
					                </c:if>
					                <div color="#1b1c1d" class="header-mynemo-div">
					                	<div class="header-mynemo-span" style="text-decoration:none;">
						                	구매 내역
						                </div>
					                </div>
					                <div class="header-mynemo-hr"></div>
					                <div><hr class="header-mynemo-logout-hr">
						                <div color="#1b1c1d" class="header-mynemo-logout-div">
						                	<a href="/user/logout" class="header-mynemo-logout-span" style="text-decoration:none;">
							                	로그아웃
							                </a>
						                </div>
					                </div>
					                </div>
				                </div>
				                
				            </div>
				       
				        </div>
				        </c:if>
				        </div>
	                   
               </div>
           </nav>
  
        
    </div>
