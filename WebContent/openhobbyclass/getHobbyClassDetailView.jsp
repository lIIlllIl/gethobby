<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>GetHobby</title>
<%-- //2020-02-24 Git Commit --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>		
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/saveHobbyClass.css">	
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
  <%-- <script src="lang/summernote-ko-KR.js"></script> --%>

  <style type="text/css">
  input {
  	cursor: default;
  	background-color: white;
  }

  .ghcd-anrd-b:focus {
  	border:0;
  	outline: 0 none;
  }
  
  svg:focus {
  	border:0;
  	outline: 0 none;
  }
  
  svg:hover {
  	border:0;
  	outline: 0 none;
  }
  .ghcd-anrd-b:hover {
  	border:0;
  	outline: 0 none;
  }
  	select {
		width: 100%;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('/resources/image/gon/flow.jpg') no-repeat 97% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	
	.header_title_div {
		font-color: rgb(62, 64, 66);
		font-size: 24px; 
		font-weight: bold; 
		margin: 0px 0px 32px;
	}
	

	.nav-link {
	margin-bottom: 2px;
	font-size: 14px;
	width:100%;
	color: rgb(168, 174, 179);
	}
	
	.nav-link:hover {
	margin-bottom: 2px;
	font-size: 14px;
	width:100%;
	color: rgb(168, 174, 179);
	background-color:white;
	}
	
	.nav-link:focus {
		font-weight: bold;
		outline: 0 none;
		border: 0;
		margin-bottom: 2px;
		font-size: 14px;	
	}

.file_input_lesson {
	position: relative;
	width: 155.98px;
	height: 208.58px;
	overflow: hidden;
}

.file_input_hidden_lesson {
	width: 155.98px;
	height: 208.58px;
	opacity: 0;
}

.file_input_test_lesson {
	position: absolute;
	width: 155.98px;
	height: 208.58px;
	overflow: hidden;
	outline: 0 none;
	cursor: default;
}
.file_input_test_lesson:focus {
	position: absolute;
	width: 155.98px;
	height: 208.58px;
	overflow: hidden;
	border: 0;
	outline: 0 none;
	cursor: default;
}



.colorTest {
	position: absolute;
	width: 565.68px;
	height: 423.98px;
	background-color: #CA5E08;
	
}

#bootstrap-overrides input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus,input[type="url"]:focus,  textarea:focus{
  border-color: black;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6);
  outline: 0 none;
}

#inputState:focus {
	border-color: black;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6);
 	outline: 0 none;
}
.inputState:focus {
	border-color: black;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6);
 	outline: 0 none;
}

.btn-dark.focus, .btn-dark:focus {
    -webkit-box-shadow: none!important;
    box-shadow: none!important;
    background-color: #639d34;
}

.btn-dark:active:focus {
  color: #ffffff; 
  background-color: #161617; 
  border-color: #494F57;
}

::selection { 
	background-color: rgb(255, 89, 70) !important;
  		color: rgb(255, 255, 255) !important;
}
.shc-hchashtag-ib {
		cursor: default;
	}

	@media (max-width: 416px){
	.shc-shclm-di {
		 position: relative !important;
		 top: 115px !important;
	}
}
	
@media (min-width: 992px) {
	.shc-shclm-di {
		 position:relative; 
		 top: -65px;
	}
	.summernote_div {
		width:567.98px;
	}
	body {
		padding-top : 62px;		
	}	
	.progress-div {
		position:fixed;
		top: 62px;
		left: 240px;
		width: 100%;
		height: 4px;
		z-index: 1000;	
	}
	.tab-content {
		margin-left: 30px;
	}
	.start_hobbyclassInfo {
		width:591.98px; 
		padding: 44px 12px; 
		margin-left: 27%;			
	}
	.hobbyclassInfo_body_div {
		margin: 0px 0px 32px; 
		width:568.98px;
	}
	.file_input_hidden {
		cursor: default;
		width: 565.68px;
		height: 423.98px;
		opacity: 0;
	}
	
	.file_input_div {
		position: relative;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
		cursor: default;
	}
	.file_input_test {
		cursor: default;
		position: absolute;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
	
	}
	.file_input_hidden:focus {
		cursor: default;
		width: 565.68px;
		height: 423.98px;
		opacity: 0;
		border: 0;
		outline: 0 none;
	}
	
	.file_input_div:focus {
		position: relative;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
		cursor: default;
		border: 0;
		outline: 0 none;
	}
	.file_input_test:focus {
		cursor: default;
		position: absolute;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
		border: 0;
		outline: 0 none;
	}
	#inputState {
		height:48px; 
		border-radius: 0; 
		width:567.98px;
	}
	.inputState {
		height:48px; 
		border-radius: 0; 
		width:567.98px;
	}
	.form-group {
		width:267px; 
		margin-bottom: 32px;
	}
	.lessonVideo_div {
	width: 565.67px;
	height: 25px;
	}
	.card_div {
		height: 144px;
		width: 567.98px;
	}
	.lesson_title_div {
		width:565.67px; 
		height:40px;"
	}
	.flex-column {
		width: 240px;
		height: calc(100vh - 72px);
	}
	.lesson_intro_div {
		position: relative;
		width:567.97px;
		height: 208.58px;
	}
	.lesson_intro_text_div {
		border-radius: 0;
		width: 386px;
	}
	.lesson_intro_text_input_out_div {
		width: 386px;
		margin-right: 26px;
		float: left;
	}
	.progress-bar {
		width: 90%;
	}
}
@media (max-width: 991px) {
.shc-shclm-di {
		 position:relative; 
		 top: 35px;
	}
	.progress-bar {
		width: 100%;
	}
	.summernote_div {
		width:100%;
	}
	.progress-div {
		position: relative;
		top: 62px;
		width: 100%;
		height: 4px;
		z-index: 1000;	
	}
	.start_hobbyclassInfo {
		padding: 32px; 
		margin-top: 62px;
	}
	.file_input_div {
		position: relative;
		width: 100%;
		min-width: 238px;
    	min-height: 178.5px;
    	height: auto;
		overflow: hidden;	
		cursor: default;
	}
	
	.file_input_test {		
		position: relative;	
		width: 100%;		
		min-width: 238px;
		overflow: hidden;
		height: auto;
		cursor: default;
		
	}
	
	.file_input_hidden {
		cursor: default;
		position: absolute;	
		width: 100%;
		min-width: 238px;
		height: 100%;
		opacity: 0;
		left: 0px;
		top: 0px;
		background- color: black;
		z-index: 1000;
	}
	
	.file_input_div:focus {
		position: relative;
		width: 100%;
		min-width: 238px;
    	min-height: 178.5px;
    	height: auto;
		overflow: hidden;	
		cursor: default;
		border: 0;
		outline: 0 none;
	}
	
	.file_input_test:focus {		
		position: relative;	
		width: 100%;		
		min-width: 238px;
		overflow: hidden;
		height: auto;
		cursor: default;
		cursor: default;
		border: 0;
		outline: 0 none;
		
	}
	
	.file_input_hidden:focus {
		cursor: default;
		position: absolute;	
		width: 100%;
		min-width: 238px;
		height: 100%;
		opacity: 0;
		left: 0px;
		top: 0px;
		background- color: black;
		z-index: 1000;
		cursor: default;
		border: 0;
		outline: 0 none;
	}
	#inputState {
		height:48px; 
		border-radius: 0; 
		width:100%;
	}
	.inputState {
		height:48px; 
		border-radius: 0; 
		width:100%;
	}
	.form-group {
		width:100%; 
		margin-bottom: 32px;
	}
	.card_div {
		height: 144px;
		width: 100%;
	}
	.lesson_title_div {
		width:100%; 
		height:40px;
	}
	.lessonVideo_div {
		width: 100%;
		height: 25px;
	}
	.flex-column {
		width: 100%;
		height: calc(100vh - 72px);
	}
	.lesson_intro_div {
		position: relative;
		width:100%;
		height: 430px;
	}
	.lesson_intro_text_div {
		border-radius: 0;	
		width: 100%;
	}
	.lesson_intro_text_input_out_div {
		width: 100%;
		margin-right: 26px;
		float: left;
	}

	
}
.lmhc-cc-text {
		font-weight: bold;
    	font-size: 1.1rem;
    	color: rgb(62, 64, 66);
    	cursor: default;
    	top:5px;
    	position:relative;
}

  </style>
</head>
<body id="bootstrap-overrides">
	<input type="hidden" name="hobbyClassNo" value="${hobbyClass.hobbyClassNo}">
	<div style="width:100%; height:100%; overflow: hidden;">
	
	<div class="d-none d-lg-block">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" style="width:100%; padding-left:24px;">
			<a class="navbar-brand" href="/index.jsp"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
			<span class="lmhc-cc-text">CREATOR CENTER</span>	
			<div class="collapse navbar-collapse justify-content-end">
				<div class="navbar-nav">
							
				</div>
			</div>
			
		</nav>
	</div>
	
	
	<div class="d-block d-lg-none">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" style="width:100%; padding-left:24px;">
			<a class="navbar-brand" href="/index.jsp"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
			
			<div class="justify-content-end">
				<div class="navbar-nav">				
					<div>
			        </div>
		        </div>
		    </div>
		    
		</nav>
	</div>
	
	
	
	<!-- Start of SideBar -->
	<div>
		<div class="row d-none d-lg-block" style="position:fixed; top:62px; left:10px; width:240px;">
		  <div class="col-3">
		    <div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a style="border:0;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo">01 클래스 기본정보
		      	<div class="shc-info-tb" style="float: right; margin-right:10px; display:none">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
				      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
				      	</path>
			      	</svg>
		      	</div>
		      </a>
		      <a style="border:0;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson">02 클래스 강의정보
		      	<div class="shc-lesson-tb" style="display:none; float: right; margin-right:10px;">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
				      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
				      	</path>
			      	</svg>
		      	</div>
		      </a>
		      <a style="border:0;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit">03 클래스 준비물
		      	<div class="shc-kit-tb" style="display:none; float: right; margin-right:10px;">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
				      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
				      	</path>
			      	</svg>
		      	</div>
		      </a> 
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- Start Tab panes -->
	<div>
	<!-- Start of 진행바 -->
	<div class="progress-div">
	  <div class="progress-bar" role="progressbar" style="background-color: rgb(253, 126, 20); height:4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<!-- End of 진행바 --> 
	
		<div class="tab-content" style=""><!-- background-color: rgb(255, 146, 43); -->
		  <div class="tab-pane active" id="hobbyClassInfo" role="tabpanel" aria-labelledby="hobbyClassInfo-tab">
		  
		  	<!-- Start of 01 클래스 기본정보 -->
		  	<div class="start_hobbyclassInfo">
		  	
		  	<div class="d-none d-lg-block header_title_div">01 클래스 기본정보</div>
		  	<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">01 클래스 기본정보</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link anrd-menu-flow-button" id="hobbyClassInfoAndroidMenu-tab" data-toggle="tab" href="#hobbyClassInfoAndroidMenu" aria-controls="v-pills-hobbyClassInfoAndroidMenu" aria-selected="false">
								<svg width="24" height="24" class="FormTitle__StyledIconChevronDown-td4kks-5 jUkHLk" viewBox="0 0 24 24">
							  		<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z">
							  		</path>
								</svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
		  		
		  		<div class="hobbyclassInfo_body_div">
					
							<label for="inputState" style="margin:4px; font-size:14px;">커버 이미지</label>
							<div class="file_input_div" style="margin-bottom:32px;">
								<input type="hidden" name="hobbyClassImage" value="${hobbyClass.hobbyClassImage}">
								<input type="image" src="/images/hobbyclass/${hobbyClass.hobbyClassImage}" class="file_input_test infoInput classInfo_image">
							</div>
					
			  		 
				    <div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 카테고리</label>
				      <input readonly id="inputState" value="${hobbyClass.category}" name="hobbyClassCategory" class="form-control shc-hchashtag-ib" readonly style="font-size:14px; color: rgb(168, 174, 179); background-color:white;">
				    </div>
				    
				    <div class="form-group" id="hobbyClassHashtagDiv">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 해쉬태그</label>
				      <input readonly id="inputState" value="${hobbyClass.hashtag[0]}, ${hobbyClass.hashtag[1]}, ${hobbyClass.hashtag[2]}" name="hobbyClassHashtag" class="form-control shc-hchashtag-ib" readonly style="font-size:14px; color: rgb(168, 174, 179); background-color:white;">	    
				    </div>
			    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 제목</label>
				      <input readonly type="text" name="hobbyClassName" value="${hobbyClass.hobbyClassName}" class="form-control infoInput" id="inputState" style="background-color:white; font-size:14px; color: rgb(168, 174, 179);">
				      <small id="passwordHelpBlock" class="form-text text-muted" style="font-size: 11px; line-height: 16px;">0자 / 최대 50자</small>
				    </div>
				    
				    <div class="form-group">
				    	<label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 소개하기</label>
						<div class="summernote_div">
							<div style="display: none;" id="sumb">${hobbyClass.hobbyClassIntro}</div>				      
							  <textarea id="summernote1" name="editordata1"></textarea>
						</div>
					</div>
				    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 가격</label>
				      	<input readonly type="text" name="hobbyClassPrice" value="${hobbyClass.hobbyClassPrice}" class="form-control infoInput" id="inputState" style="background-color:white; font-size:14px; color: rgb(168, 174, 179);">
				    </div>
				    
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="infoYesButton" class="btn btn-dark" style="margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button> 
				    </div>
		  		</div>
		  	</div>
		  	<!-- End of 01 클래스 기본정보 -->
		  	
		  </div>
		  <div class="tab-pane" id="hobbyClassLesson" role="tabpanel" aria-labelledby="hobbyClassLesson-tab">
		  
		  	<!-- Start of 02 클래스 강의정보 -->
		  	<div class="start_hobbyclassInfo">
		  		
		  		
		  		<div class="d-none d-lg-block" style="margin-bottom: 32px;">
		  		<div class="lesson_title_div">
		  		<div style="font-color: rgb(62, 64, 66);font-size: 24px; font-weight: bold; float:left;">02 클래스 강의정보</div>		  		
			  		
		  		</div>
		  		</div>
		  		<div class="shc-shclm-di" style="float:right;">
		  			<jsp:include page="/openhobbyclass/saveHobbyClassLessonModal.jsp" />
		  		</div>
		  		
		  		<div class="d-block d-lg-none">
			  		<div class="header_title_div">
				  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<div style="width:100%; height:54px;"><div style="float:left;">02 클래스 강의정보</div> 
								
								<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassLessonAndroidMenu-tab" data-toggle="tab" href="#hobbyClassLessonAndroidMenu" aria-controls="v-pills-hobbyClassLessonAndroidMenu" aria-selected="false">
									<svg width="24" height="24" class="FormTitle__StyledIconChevronDown-td4kks-5 jUkHLk" viewBox="0 0 24 24">
								  		<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z">
								  		</path>
									</svg>
								</button>
							</div>	 	
					 	</div>	  		
			  		</div>
			  	</div>
		  		
		  		
		  		<div class="hobbyclassInfo_body_div">
					
						<div>
							<div class="lessonVideo_div"style="float:left;"><label for="inputState" style="margin:4px; font-size:14px;">강의 영상</label></div>
							<div class="file_input_div" style="margin-bottom:32px;">
								<input type="hidden" name="lessonNo" value="${hobbyClass.lesson[0].lessonNo}">
								<input type="hidden" name="lessonVideo" value="${hobbyClass.lesson[0].lessonVideo}">
								<iframe src="/video/${hobbyClass.lesson[0].lessonVideo}" class="file_input_test lessonInput classLesson_image_one"></iframe>	
							</div>
						</div>
							
			    
			    	<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 제목</label>
				      <input readonly type="text" name="lessonTitle" value="${hobbyClass.lesson[0].lessonTitle}" class="form-control lessonInput" id="inputState" style="background-color:white; font-size:14px; color: rgb(168, 174, 179);">
				      <small id="passwordHelpBlock" class="form-text text-muted" style="font-size: 11px; line-height: 16px;">0자 / 최대 50자</small>
				    </div>
			    
			    	<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 과제</label>
				      <input readonly type="text" name="lessonProject" value="${hobbyClass.lesson[0].lessonProject}" class="form-control lessonInput" id="inputState" style="font-size:14px; color: rgb(168, 174, 179); background-color:white; " >
				    </div>
			    
				    <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 소개</label>
				    <div class="lesson_intro_div">		
				    
						<div class="form-group lesson_intro_text_input_out_div"> 
					      <input readonly type="text" name="lessonIntro" value="${hobbyClass.lesson[0].lessonIntro}" class="form-control lesson_intro_text_div lessonInput" id="temp" style="background-color:white;  height: 208.58px;">
					    </div>
					     

								<div class="file_input_lesson" style="float:left;">
									<input type="hidden" name="lessonImage" value="${hobbyClass.lesson[0].lessonImage}">
									<input type="image" src="/images/hobbyclass/${hobbyClass.lesson[0].lessonImage}" class="file_input_test_lesson lessonInput classLesson_image_two">
									
								</div>
 
				    </div>
				    
				     <div class="form-group">
				    	<label for="inputState" style="margin-bottom:4px; font-size:14px;">수업 노트</label>
						<div class="summernote_div">
							<div style="display:none;" id="sumb-lesson">${hobbyClass.lesson[0].lessonContent}</div>
							  <textarea id="summernote2" name="editordata2"></textarea>					
						</div>
					</div>
					
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="lessonBeforeButton" class="btn btn-light" style="width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" id="lessonYesButton" class="btn btn-dark" style="margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button>
						    
				    </div>
		  		</div>
		  	</div>
		  	<!-- End of 02 클래스 강의정보 -->
		  	
		  </div>
		  <div class="tab-pane" id="hobbyClassKit" role="tabpanel" aria-labelledby="hobbyClassKit-tab">
		  
		  	<!-- Start of 03 클래스 준비물 -->
		  	<div class="start_hobbyclassInfo">
		  	
		  	<div class="d-none d-lg-block header_title_div">03 클래스 준비물</div>
		  	<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">03 클래스 준비물</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassKitAndroidMenu-tab" data-toggle="tab" href="#hobbyClassKitAndroidMenu" aria-controls="v-pills-hobbyClassKitAndroidMenu" aria-selected="false">
								<svg width="24" height="24" class="FormTitle__StyledIconChevronDown-td4kks-5 jUkHLk" viewBox="0 0 24 24">
							  		<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z">
							  		</path>
								</svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
		  		

		  		
		  		<div class="hobbyclassInfo_body_div">
					
							<label for="inputState" style="margin:4px; font-size:14px;">준비물 이미지</label>
							<div class="file_input_div" style="margin-bottom:32px;">
								<input type="hidden" name="kitImage" value="${hobbyClass.kitImage}">
								<input type="image" src="/images/hobbyclass/${hobbyClass.kitImage}" class="file_input_test kitInput classKit_image">
							</div>
					
					
			  		<form class="classKitForm">			    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 이름</label>
				      <input readonly type="text" name="kitName" value="${hobbyClass.kitName}" class="form-control kitInput" id="inputState" style="background-color:white;  font-size:14px; color: rgb(168, 174, 179);">
				      <small id="passwordHelpBlock" class="form-text text-muted" style="font-size: 11px; line-height: 16px;">0자 / 최대 50자</small>
				    </div>
				    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 소개</label>
				      <input readonly type="text" name="kitIntro" value="${hobbyClass.kitIntro}" class="form-control kitInput" id="inputState" style="background-color:white;  font-size:14px; color: rgb(168, 174, 179);">
				    </div>
				    
				    <div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 가격</label>
				      	<input readonly type="text" name="kitPrice" value="${hobbyClass.kitPrice}" class="form-control kitInput" id="inputState" style="background-color:white;  font-size:14px; color: rgb(168, 174, 179);">
				    </div>
				    </form>
				    
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="kitBeforeButton" class="btn btn-light" style="width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" id="kitYesButton" class="btn btn-dark" style="margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button> 
				    </div>
		  		</div>
		  	</div>
		  	<!-- End of 03 클래스 준비물 -->
		  	
		  </div>
		  
		  <!-- Start of Android Menu -->
		  
		  <div class="tab-pane" id="hobbyClassInfoAndroidMenu" role="tabpanel" aria-labelledby="hobbyClassInfoAndroidMenu-tab">
			<div class="start_hobbyclassInfo">
			<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">01 클래스 기본정보</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link cghcd-anrd-b" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">
								<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
		  	
	  		<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs anrd-shc-menu-div" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">
			      01 클래스 기본정보
			      	<div style="float: right; margin-right:10px;">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">
			      02 클래스 강의정보
			      	<div style="float: right; margin-right:10px;">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">
			      03 클래스 준비물
			      	<div style="float: right; margin-right:10px;">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>    
		    	</div>
	    	</div>
		  	
		  </div>
		  </div>
		  
		  
		  <div class="tab-pane" id="hobbyClassLessonAndroidMenu" role="tabpanel" aria-labelledby="hobbyClassLessonAndroidMenu-tab">
			<div class="start_hobbyclassInfo">
			
			<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">02 클래스 강의정보</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link cghcd-anrd-b" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">
								<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
			
			<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">01 클래스 기본정보 
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">02 클래스 강의정보
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">03 클래스 준비물
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>  
		    	</div>
	    	</div>
	    	
	    	</div>
			
		  </div>
		  
		  
		  <div class="tab-pane" id="hobbyClassKitAndroidMenu" role="tabpanel" aria-labelledby="hobbyClassKitAndroidMenu-tab">

			<div class="start_hobbyclassInfo">
			<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">03 클래스 준비물</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link cghcd-anrd-b" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" aria-controls="v-pills-hobbyClassKit" aria-selected="false">
								<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
		  	
		  	<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">01 클래스 기본정보 
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">02 클래스 강의정보
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">03 클래스 준비물
			      	<div style="float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
		    	</div>
	    	</div>
		  	
		  </div>
		  </div>
		  
		  <!-- End of Android Menu -->
		</div>
	</div>
	<!-- End Tab panes -->
	
	
	<!-- End of SideBar -->
	</div>
	
	<script type="text/javascript">

		$(function(){

			$(document).on("click", ".thisisbuyerstats", function(){
				self.location = "/myHobbyClass/method?hobbyClassNo="+$("input[name='hobbyClassno']").val();
			});
			
    		// summernote onload Setting
	    	$('#summernote1').summernote({
	    		lang: 'ko-KR',
	    		height: 550,
	    		toolbar: [		
	    			  ['font', ['bold', 'subscript']],
	    			  ['para', ['ol', 'ul']],
	    			  ['style', ['style']],
	    			  ['font', ['clear']],
	    			  ['insert', ['link', 'picture', 'video']]
	    			],
	    		disableResizeEditor: true

	    	});
	    	$('#summernote2').summernote({
	    		lang: 'ko-KR',
	    		height: 550,
	    		toolbar: [		
	    			  ['font', ['bold', 'subscript']],
	    			  ['para', ['ol', 'ul']],
	    			  ['style', ['style']],
	    			  ['font', ['clear']],
	    			  ['insert', ['link', 'picture', 'video']]
	    			],
	    		disableResizeEditor: true

	    	});
	    	
	    	// Summernote Date Write
			var summ1 = $("#sumb").html();
    		$('#summernote1').summernote('code', summ1);	
    		$('#summernote1').summernote('disable');	

    		var summ2 = $("#sumb-lesson").html();
    		$('#summernote2').summernote('code', summ2);	
    		$('#summernote2').summernote('disable');	
 
			
    		// CREATOR CENTER TEXT Click Event
			$(document).on("click", ".lmhc-cc-text", function(){
				self.location = "/hobbyclass/getMyHobbyClassList";
			});

			// Next Button:hover Event
			var bootstrapButton = $.fn.button.noConflict();
			$.fn.bootstrapBtn = bootstrapButton;
			$(".btn-dark").on("mouseover", function(){
				$(".btn-dark").css("background-color","rgb(253, 126, 20)");
			});
			$(".btn-dark").on("mouseleave", function(){
				$(".btn-dark").css("background-color","rgb(255, 146, 43)");
			});
			$(".nav-link").on("click", function(){
				$(this).removeClass('nav-link active').addClass('nav-link');
			});
			

            $(".shc-info-tb").css("display","block"); // 클래스 기본정보 Complete Check svg
			$(".shc-lesson-tb").css("display","block"); // 레슨 Complete Check svg
			$(".shc-kit-tb").css("display","block"); // 준비물 Complete Check svg
			
			$(document).on("click", "#kitBeforeButton", function(){
				$(window).scrollTop(0);
				$("a[href='#hobbyClassLesson']").click();
			});
			$(document).on("click", "#kitYesButton", function(){
				$(window).scrollTop(0);
				$("a[href='#hobbyClassInfo']").click();
			});
			$(document).on("click", "#lessonBeforeButton", function(){
				$(window).scrollTop(0);
				$("a[href='#hobbyClassInfo']").click();
			});
			$(document).on("click", "#lessonYesButton", function(){
				$(window).scrollTop(0);
				$("a[href='#hobbyClassKit']").click();
			});
			$(document).on("click", "#infoYesButton", function(){
				$(window).scrollTop(0);
				$("a[href='#hobbyClassLesson']").click();
			});

	    
		});
	</script>
</body>
</html>