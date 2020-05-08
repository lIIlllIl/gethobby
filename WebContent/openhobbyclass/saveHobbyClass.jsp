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
  
  <!-- 웹사이트 파비콘 -->
  <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
  <link rel="icon" href="/resources/image/logo/logo-favicon.png">
  <!-- favicon 404 에러 안보이게  -->
  <link rel="icon" href="data:;base64,iVBORw0KGgo=">
  
  <!-- jQuery CDN -->
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="http://malsup.github.com/jquery.form.js"></script>
  
  <!-- bootStrap CDN -->		
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <!-- popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  
  <!-- summerNote -->	
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
  <%-- <script src="lang/summernote-ko-KR.js"></script> --%>
  
  
  
  <!-- project css, js link -->
  <link rel="stylesheet" href="/resources/css/saveHobbyClass.css">
  
  <style type="text/css">
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
	cursor: pointer;
}

.file_input_test_lesson {
	position: absolute;
	width: 155.98px;
	height: 208.58px;
	overflow: hidden;
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

.btn-dar:hover {
	background-color: rgb(253, 126, 20);
}

::selection { 
	background-color: rgb(255, 89, 70) !important;
  		color: rgb(255, 255, 255) !important;
}
.shc-hchashtag-ib {
		cursor: default;
	}

@media (min-width: 992px) {
	.summernote_div {
		width:567.98px;
	}
	shc-body {
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
		cursor: pointer;
		width: 565.68px;
		height: 423.98px;
		opacity: 0;
	}
	
	.file_input_div {
		position: relative;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
	}
	.file_input_test {
		position: absolute;
		width: 565.68px;
		height: 423.98px;
		overflow: hidden;
	
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
	.shchtm-con {
		padding:16px 12px; 
		margin:0px; 
		width:460px;
	}
	.shchtm-hea {
		border:0; 
		outline:0; 
		width:432px;
	}
	.shchtm-foo {
		border:0; 
		outline:0; 
		width:432.1px; 
		height:40px; 
		padding:0px; 
		margin-bottom:12px;
	}
	.shc-htm-xab {
		cursor:not-allowed; 
		margin:0px; 
		float:left; 
		width:368px; 
		height:40px; 
		background-color: rgb(255, 232, 204); 
		border:0; 
		outline:0;
	}
	.shc-htm-ab {
		display:none; 
		margin:0px; 
		float:left; 
		width:368px; 
		height:40px; 
		background-color: rgb(255, 146, 43); 
		border:0; 
		outline:0;
	}
	.shchtm-lab {
		float:left; 
		width:216px; 
		height:24px;
	}
	.shchtm-oudi {
		width:432px; 
		height:400px;
	}
	.shchtm-wrdi {
		width:432px; 
		margin-bottom:20px; 
		height:24px;
	}
	.shc-shclm-di {
		 position:relative; 
		 top: -65px;
	}
}
.shc-htm-xab:hover {
	border:0; 
	outline:0 none;
	background-color: rgb(255, 232, 204);
	
}
.shc-htm-ab:hover {
	border: 0;
	outline: 0 none;
	background: rgb(255, 146, 43);
}
@media (max-width: 416px){
	.shc-shclm-di {
		 position: relative !important;
		 top: 115px !important;
	}
}


@media (max-width: 991px) {
	.shc-shclm-di {
		 position:relative; 
		 top: 35px;
	}
	.shchtm-wrdi {
		width:100%; 
		margin-bottom:20px; 
		height:24px;
		display: flex;
	}
	.shchtm-oudi {
		width:100%; 
		height:400px;
	}
	.shchtm-lab {
		flex: 1 1;
		float:left; 
		max-width:216px; 
		height:24px;
	}
	.shc-htm-ab {
		display:none; 
		margin:0px; 
		float:left; 
		max-width: 100%; 
		height:40px; 
		background-color: rgb(255, 146, 43); 
		border:0; 
		outline:0;
		flex: 1 auto;
	}
	.shc-htm-xab {
		cursor:not-allowed; 
		margin:0px; 
		float:left; 
		height:40px; 
		max-width: 100%; 
		background-color: rgb(255, 232, 204); 
		border:0; 
		outline:0;
		flex: 1 auto;
	}
	.shchtm-foo {
		width:100%;
		max-width: 432.1px;
		display:flex;
	}
	.shchtm-con {
		width:100%; 
		max-width:460px;
		padding:16px 12px; 
	}
	.shchtm-hea {
		width:100%;
		max-width:432px;
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
    	height: 100%;
		overflow: hidden;	
	}
	
	.file_input_test {		
		position: relative;	
		width: 100%;		
		min-width: 238px;
		overflow: hidden;
		height: auto;
		
	}
	
	.file_input_hidden {
		cursor: pointer;
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
		height: auto;
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
	
	<%--
	.tab-pane {
		padding: 48px;
	}
	--%>
	
}
.shc-classInfo-ImageDeleteButton, .shc-lesson-one-ImageDeleteButton, .shc-lesson-two-ImageDeleteButton, .shc-kit-ImageDeleteButton {
	position: absolute;
    top: 8px;
    right: 8px;
    width: 24px;
    height: 24px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    text-align: center;
    padding: 0px;
    margin: 0px;
    border-radius: 50%;
    background: white;
    display: none;
	z-index: 1000;
}
.shc-classInfo-ImageDeleteButton:focus, .shc-lesson-one-ImageDeleteButton:focus, .shc-lesson-two-ImageDeleteButton:focus, .shc-kit-ImageDeleteButton:focus{
	border: 0;
	outline: 0 none;
}
.warning-mini-h6 {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(255, 82, 82);
    margin: 2px 0px;
    font-weight: 600;
    line-height: 16px;
    font-size: 14px;
    padding: 0px;
    justify-content: left;
    display: none;
}
.warning-mini-span {
	font-size: 11px;
    line-height: 16px;
    font-weight: normal;
    color: rgb(255, 82, 82);
}
.lmhc-cc-text {
		font-weight: bold;
    	font-size: 1.1rem;
    	color: rgb(62, 64, 66);
    	cursor: default;
    	top:5px;
    	position:relative;
	}
iframe{
	border:0;
	outline: 0 none;
	overflow-x:hidden;
}
  </style>
</head>
<body id="bootstrap-overrides" class="shc-body">

	<input type="hidden" name="hobbyClassNo" value="${hobbyClass.hobbyClassNo}">
	<div style="width:100%; height:100%; overflow: hidden;">
	<jsp:include page="/openhobbyclass/saveHobbyClassToolbar.jsp" />
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
		      <a style="border:0;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck">04 검토 요청 전 확인
		      </a>    
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- Start Tab panes -->
	<div>
	<!-- Start of 진행바 -->
	<div class="progress-div">
	  <div class="progress-bar" role="progressbar" style="background-color: rgb(253, 126, 20); width: 0%; height:4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="120"></div>
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
					<form id="classInfoImageForm" method="POST" enctype="multipart/form-data">
							<label for="inputState" style="margin:4px; font-size:14px;">커버 이미지</label>
							<div class="file_input_div" style="margin-bottom:32px;">
							
								<input type="hidden" name="hobbyClassImage" value="${hobbyClass.hobbyClassImage}">
								<c:if test="${empty hobbyClass.hobbyClassImage}">
									<input type="image" src="/resources/image/gon/addimage.jpg" class="file_input_test infoInput classInfo_image">
								</c:if>
								<c:if test="${!empty hobbyClass.hobbyClassImage}">
								<input type="image" src="/images/hobbyclass/${hobbyClass.hobbyClassImage}" class="file_input_test infoInput classInfo_image">
								</c:if>
								<button type="button" class="shc-classInfo-ImageDeleteButton">
									<svg width="24" height="24" viewBox="0 2 24 24">
										<path fill="#3E4042" fill-rule="evenodd" d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z">
										</path>
									</svg>
								</button>
								<input type="file" class="file_input_hidden infoInput classInfo_file">
							</div>
					</form>
			  		 
				    <div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 카테고리</label>
				      <select id="inputState" name="hobbyClassCategory" class="form-control" style="font-size:14px; color: rgb(168, 174, 179);">
				      	<c:if test="${empty hobbyClass.category}">
				      		<option selected disabled hidden >클래스 카테고리를 선택해주세요.</option>
				      	</c:if>
				      	<c:if test="${!empty hobbyClass.category}">
				      		<option selected>${hobbyClass.category}</option>
				      	</c:if>
				        <option>음악</option>
				        <option>미술</option>
				        <option>요리</option>
				        <option>공예</option>
				        <option>운동</option>
				        <option>라이프 스타일</option>
				      </select>
				    </div>
				    
				    <div class="form-group" id="hobbyClassHashtagDiv">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 해쉬태그<span style="font-size:10px; margin-left:8px;">(필수 3개)</span></label>
				      <jsp:include page="/openhobbyclass/saveHobbyClassHashtagModal.jsp" />
				      <c:if test="${empty hobbyClass.hashtag}">
				      	<input id="inputState" value="" placeholder="클래스 해쉬태그를 선택해주세요." name="hobbyClassHashtag" class="form-control shc-hchashtag-ib" readonly style="font-size:14px; color: rgb(168, 174, 179); background: url('/resources/image/gon/flow.jpg') no-repeat 97% 50%;">
				      </c:if>	    
				      <c:if test="${!empty hobbyClass.hashtag}">
				      	<input id="inputState" value="${hobbyClass.hashtag[0]}, ${hobbyClass.hashtag[1]}, ${hobbyClass.hashtag[2]}" placeholder="클래스 해쉬태그를 선택해주세요." name="hobbyClassHashtag" class="form-control shc-hchashtag-ib" readonly style="font-size:14px; color: rgb(168, 174, 179); background: url('/resources/image/gon/flow.jpg') no-repeat 97% 50%;">
				      </c:if>
				    </div>
			    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 제목</label>
				      <input type="text" name="hobbyClassName" value="${hobbyClass.hobbyClassName}" class="form-control infoInput" id="inputState" placeholder="클래스를 대표할 수 있는 제목을 정해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      <h6 class="warning-mini-h6 warning-mini-max-length-hcinfo">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           최대 30자 입니다.
					      </span>
				      </h6>
				      <small id="passwordHelpBlock" class="form-text text-muted hcn-max-length" style="font-size: 11px; line-height: 16px;">0자 / 최대 30자</small>
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
				    
				    <div class="form-group">
				    	<label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 소개하기</label>
						<div class="summernote_div">
							<div style="display:none;" id="sumb-info-div">${hobbyClass.hobbyClassIntro}</div>
						    <form method="post">
						      
							  <textarea id="summernote1" name="editordata1"></textarea>
							
							</form>
						</div>
					</div>
				    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">클래스 가격</label>
				      <c:if test="${empty hobbyClass.hobbyClassPrice || hobbyClass.hobbyClassPrice == 0}">
				      	<input type="text" name="hobbyClassPrice" value="" class="form-control infoInput" id="inputState" placeholder="클래스 가격을 입력해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      </c:if>
				      <c:if test="${!empty hobbyClass.hobbyClassPrice && hobbyClass.hobbyClassPrice != 0}">
				      	<input type="text" name="hobbyClassPrice" value="${hobbyClass.hobbyClassPrice}" class="form-control infoInput" id="inputState" placeholder="클래스 가격을 입력해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      </c:if>
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
				    
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="infoYesButton" class="btn btn-dark ifyb" style="display: none; margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button>
						    <button type="button" id="infoNoButton" disabled class="btn btn-dark" style=" margin-left:14px; float: left; background-color: rgb(255, 202, 164); color: rgb(255, 255, 255); cursor: not-allowed; padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; ">다음</span></button>
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
		  		<div style="font-color: rgb(62, 64, 66); font-size: 24px; font-weight: bold; float:left;">02 클래스 강의정보</div>		  		
			  		
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
					<form id="classLessonOneImageForm" method="POST" enctype="multipart/form-data">
						<div>
							<div class="lessonVideo_div"style="float:left;"><label for="inputState" style="margin:4px; font-size:14px;">강의 영상</label></div>
							<div class="file_input_div" style="margin-bottom:32px;">
								<input type="hidden" name="lessonNo" value="${hobbyClass.lesson[0].lessonNo}">
								<input type="hidden" name="lessonVideo" value="${hobbyClass.lesson[0].lessonVideo}">
								<c:if test="${empty hobbyClass.lesson[0].lessonVideo}">
									<input type="image" src="/resources/image/gon/addVideo.png" style="overflow:hidden; " class="file_input_test lessonInput classLesson_image_one">
								</c:if>
								<c:if test="${!empty hobbyClass.lesson[0].lessonVideo}">
									<iframe src="/video/${hobbyClass.lesson[0].lessonVideo}" class="file_input_test lessonInput classLesson_image_one"></iframe>
								</c:if>
								<button type="button" class="shc-lesson-one-ImageDeleteButton">
									<svg width="24" height="24" viewBox="0 2 24 24">
										<path fill="#3E4042" fill-rule="evenodd" d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z">
										</path>
									</svg>
								</button>
								<input type="file" class="file_input_hidden lessonInput classLesson_file_one">
							</div>
						</div>
					</form>	  		
			    
			    	<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 제목</label>
				      <input type="text" name="lessonTitle" value="${hobbyClass.lesson[0].lessonTitle}" class="form-control lessonInput" id="inputState" style="font-size:14px; color: rgb(168, 174, 179);" placeholder="강의 제목을 정해주세요.">
				      <h6 class="warning-mini-h6 warning-mini-max-length-lesson">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           최대 30자 입니다.
					      </span>
				      </h6>
				      <small id="passwordHelpBlock" class="form-text text-muted hclt-max-length" style="font-size: 11px; line-height: 16px;">0자 / 최대 30자</small>
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
			    
			    	<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 과제</label>
				      <input type="text" name="lessonProject" value="${hobbyClass.lesson[0].lessonProject}" class="form-control lessonInput" id="inputState" style="font-size:14px; color: rgb(168, 174, 179);" placeholder="강의 과제를 정해주세요.">
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
			    
				    <label for="inputState" style="margin-bottom:4px; font-size:14px;">강의 소개</label>
				    <div class="lesson_intro_div">		
				    
						<div class="form-group lesson_intro_text_input_out_div"> 
					      <input type="text" name="lessonIntro" value="${hobbyClass.lesson[0].lessonIntro}" class="form-control lesson_intro_text_div lessonInput" id="temp" style="height: 208.58px;" placeholder="강의 소개를 입력해주세요.">
					      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
					    </div>
					     
					    <form id="classLessonTwoImageForm" method="POST" enctype="multipart/form-data">
								<div class="file_input_lesson" style="float:left;">
									<input type="hidden" name="lessonImage" value="${hobbyClass.lesson[0].lessonImage}">
									<c:if test="${empty hobbyClass.lesson[0].lessonImage}">
									<input type="image" src="/resources/image/gon/lessonaddimage.jpg" class="file_input_test_lesson lessonInput classLesson_image_two">
									</c:if>
									<c:if test="${!empty hobbyClass.lesson[0].lessonImage}">
										<input type="image" src="/images/hobbyclass/${hobbyClass.lesson[0].lessonImage}" class="file_input_test_lesson lessonInput classLesson_image_two">
									</c:if>
									<button type="button" class="shc-lesson-two-ImageDeleteButton">
										<svg width="24" height="24" viewBox="0 2 24 24">
											<path fill="#3E4042" fill-rule="evenodd" d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z">
											</path>
										</svg>
									</button>
									<input type="file" class="file_input_hidden_lesson lessonInput classLesson_file_two">
								</div>
						</form>	 
				    </div>
				    
				     <div class="form-group">
				    	<label for="inputState" style="margin-bottom:4px; font-size:14px;">수업 노트</label>
						<div class="summernote_div">
							<div style="display:none;" id="sumb-lesson-div">${hobbyClass.lesson[0].lessonContent}</div>						
						    <form method="post">
						      
							  <textarea id="summernote2" name="editordata2"></textarea>
							
							</form>
						</div>
					</div>
					
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="previousLessonButton" class="btn btn-light" style="display:none; width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" class="btn btn-light previousLessonButton" style="width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" id="lessonYesButton" class="btn btn-dark" style="display: none; margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button>
						    <button type="button" id="lessonNoButton" disabled class="btn btn-dark" style=" margin-left:14px; float: left; background-color: rgb(255, 202, 164); color: rgb(255, 255, 255); cursor: not-allowed; padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; ">다음</span></button>
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
					<form id="classKitImageForm" method="POST" enctype="multipart/form-data">
							<label for="inputState" style="margin:4px; font-size:14px;">준비물 이미지</label>
							<div class="file_input_div" style="margin-bottom:32px;">
								<input type="hidden" name="kitImage" value="${hobbyClass.kitImage}">
								<c:if test="${empty hobbyClass.kitImage}">
								<input type="image" src="/resources/image/gon/addimage.jpg" class="file_input_test kitInput classKit_image">
								</c:if>
								<c:if test="${!empty hobbyClass.kitImage}">
									<input type="image" src="/images/hobbyclass/${hobbyClass.kitImage}" class="file_input_test kitInput classKit_image">
								</c:if>
								<button type="button" class="shc-kit-ImageDeleteButton">
									<svg width="24" height="24" viewBox="0 2 24 24">
										<path fill="#3E4042" fill-rule="evenodd" d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z">
										</path>
									</svg>
								</button>
								<input type="file" class="file_input_hidden kitInput classKit_file">
							</div>
					</form>
					
			  		<form class="classKitForm">			    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 이름</label>
				      <input type="text" name="kitName" value="${hobbyClass.kitName}" class="form-control kitInput" id="inputState" placeholder="클래스 준비물 이름을 정해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      <h6 class="warning-mini-h6 warning-mini-max-length-kit">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           최대 30자 입니다.
					      </span>
				      </h6>
				      <small id="passwordHelpBlock" class="form-text text-muted hckn-max-length" style="font-size: 11px; line-height: 16px;">0자 / 최대 30자</small>
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
				    
			  		<div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 소개</label>
				      <input type="text" name="kitIntro" value="${hobbyClass.kitIntro}" class="form-control kitInput" id="inputState" placeholder="클래스 준비물 소개를 입력해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
				    
				    <div class="form-group">
				      <label for="inputState" style="margin-bottom:4px; font-size:14px;">준비물 가격</label>
				      <c:if test="${empty hobbyClass.kitPrice || hobbyClass.kitPrice == 0}">
				      	<input type="text" name="kitPrice" value="" class="form-control kitInput" id="inputState" placeholder="클래스 준비물 가격을 입력해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      </c:if>
				      <c:if test="${!empty hobbyClass.kitPrice && hobbyClass.kitPrice != 0}">
				      	<input type="text" name="kitPrice" value="${hobbyClass.kitPrice}" class="form-control kitInput" id="inputState" placeholder="클래스 준비물 가격을 입력해주세요." style="font-size:14px; color: rgb(168, 174, 179);">
				      </c:if>
				      <h6 class="warning-mini-h6 warning-mini-must-input">
					      <svg width="16" height="16" viewBox="0 0 24 24">
						      <path fill="rgb(255, 82, 82)" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"/>
					      </svg>
					      <span class="warning-mini-span">
					           필수 입력입니다.
					      </span>
				      </h6>
				    </div>
				    </form>
				    
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="previousKitButton" class="btn btn-light" style="display:none; width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" class="btn btn-light previousKitButton" style="width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" id="kitYesButton" class="btn btn-dark" style="display: none; margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">다음</span></button>
						    <button type="button" id="kitNoButton" disabled class="btn btn-dark" style=" margin-left:14px; float: left; background-color: rgb(255, 202, 164); color: rgb(255, 255, 255); cursor: not-allowed; padding: 0px 15px; border:0; width:59.61px; height:40px;"><span style="font-size: 14px; ">다음</span></button>
				    </div>
		  		</div>
		  	</div>
		  	<!-- End of 03 클래스 준비물 -->
		  	
		  </div>
		  <div class="tab-pane" id="hobbyClassCheck" role="tabpanel" aria-labelledby="hobbyClassCheck-tab">
		  
		  	<!-- Start of 04 클래스 검토요청 -->
		  	<div class="start_hobbyclassInfo">
		  	
		  		<div class="d-none d-lg-block header_title_div header_title_div">04 검토 요청 전 확인</div>
		  		<div class="d-block d-lg-none">
			  		<div class="header_title_div">
				  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<div style="width:100%; height:54px;"><div style="float:left;">04 검토 요청 전 확인</div> 
								<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassCheckAndroidMenu-tab" data-toggle="tab" href="#hobbyClassCheckAndroidMenu" aria-controls="v-pills-hobbyClassCheckAndroidMenu" aria-selected="false">
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
					
					<div style="font-size: 16px; margin: 0px 0px 8px;">검토요청 전 마지막으로 확인해주세요.</div>
					<div style="font-size: 14px; margin: 0px 0px 32px;">필요한 내용은 다 채웠어요. 완벽한 페이지 완성을 위해 마지막 점검을 해봐요!</div>
					
					<div style="margin: 0px 0px 16px;">
						<div style="font-size: 16px;">체크리스트<span style="margin-left: 8px; font-size: 9px; color: rgb(252, 61, 70);">*체크해주셔야 제출하실 수 있습니다.</span></div>
					</div>
					
					<div style="display:flex; flex-direction: column; position:relative;">
						 <div class="card_div" style="display:inline-flex; flex:1 1 1 1;">
						    <div class="card" style="margin-bottom: 16px;">
						      <div class="card-body" style="padding: 20px 24px;">
						      	<label class="guide-1 shc-gl" style="width:100%;">
						     		<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg>
						     		<input name="guide-1" type="checkbox" style="display: none;">    		
						        	<span style="font-size: 16px; margin-left:8px;">클래스에서 배우게 될 기법, 노하우, 스킬</span></label>
						        <div style="font-size: 14px; margin-left: 30px;">구체적으로 어떤 과정을 통해 작품을 만들어 보는지 안내가 되었나요? 내 클래스를 통해 배우게 될 나만의 기법, 노하우, 스킬을 소개해주세요.</div>
						      </div>
						    </div>
						  </div>
						  
						  <div class="card_div" style="display:inline-flex; flex:1 1 1 1;">
						    <div class="card" style="margin-bottom: 16px;">
						      <div class="card-body" style="padding: 20px 24px;">
						      	<label class="guide-2 shc-gl" style="width:100%;">
						     		<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg>
						     		<input name="guide-2" type="checkbox" style="display: none;">					     		
						        	<span style="font-size: 16px; margin-left:8px;">클래스를 통해 만들어 볼 완성작</span></label>
						        <div style="font-size: 14px; margin-left: 30px;">내 클래스를 들으면 어떤 작품을 만들어 볼 수 있는지 수강생이 한 눈에 알 수 있나요? 나의 평소 작업물과 스타일을 다양한 작품 사진으로 전달해주세요.</div>
						      </div>
						    </div>
						  </div>
						  
						  <div class="card_div" style="display:inline-flex; flex:1 1 1 1;">
						    <div class="card" style="margin-bottom: 16px;">
						      <div class="card-body" style="padding: 20px 24px;">
						      	<label class="guide-3 shc-gl" style="width:100%;">
						     		<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg>
						     		<input name="guide-3" type="checkbox" style="display: none;"> 
						        	<span style="font-size: 16px; margin-left:8px;">맞춤법 검사</span></label> 
						        <div style="font-size: 14px; margin-left: 30px;">오로지 텍스트와 이미지로 나의 클래스를 보여주는 곳이기 때문에 맞춤법은 나의 인상을 결정 짓는 중요한 부분이랍니다. 맞춤법 검사를 필수적으로 진행해주세요.</div>
						      </div>
						    </div>
						  </div>
						  
						  <div class="card_div" style="display:inline-flex; flex:1 1 1 1;">
						    <div class="card" style="margin-bottom: 16px;">
						      <div class="card-body" style="padding: 20px 24px;">
						      	<label class="guide-4 shc-gl" style="width:100%;">
						     		<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg>
						     		<input name="guide-4" type="checkbox" style="display: none;">   
						        	<span style="font-size: 16px; margin-left:8px;">가독성 높이기</span></label> 
						        <div style="font-size: 14px; margin-left: 30px;">편집창 내 서식을 이용하여 긴 글에 리듬감을 부여할 수 있어요. 중요한 부분에 적절히 이용한다면 긴 글을 끝까지 읽게 할 수 있어요.</div>
						      </div>
						    </div>
						  </div>
					  </div>
			  		<div style="font-size: 16px; margin: 0px 0px 16px;">제출 전 체크리스트까지 확인했다면 검토요청 해주세요!</div>
			  		<div style="font-size: 14px;">검토 요청 후 평균적으로 영업일 3일 이내 검토가 완료되며, <p>
			  		검토 후 메일(${hobbyClass.user.userId})로 피드백이 전송됩니다 : )</div>
			  					    			    
				    <div style=" width:100%; height:40px; margin-top: 32px; ">
						    <button type="button" id="previousCheckButton" class="btn btn-light" style="width:59.61px; height:40px; float: left; padding:0px 14px; font-size:14px; ">이전</button>
						    <button type="button" id="checkYesButton" class="btn btn-dark" style="display: none; margin-left:14px; float: left; background-color: rgb(255, 146, 43); padding: 0px 15px; border:0; width:135.91px; height:40px;"><span style="font-size: 14px; color: rgb(255, 255, 255);">검토 후 요청하기</span></button>
						    <button type="button" id="checkNoButton" disabled class="btn btn-dark" style=" margin-left:14px; float: left; background-color: rgb(255, 202, 164); color: rgb(255, 255, 255); cursor: not-allowed; padding: 0px 15px; border:0; width:135.91px; height:40px;"><span style="font-size: 14px; ">검토 후 요청하기</span></button>
						    
				    </div>
		  		</div>
		  	</div>
		  	<!-- End of 04 클래스 검토요청 -->
		  	
		  </div>
		  
		  <!-- Start of Android Menu -->
		  
		  <div class="tab-pane" id="hobbyClassInfoAndroidMenu" role="tabpanel" aria-labelledby="hobbyClassInfoAndroidMenu-tab">
			<div class="start_hobbyclassInfo">
			<div class="d-block d-lg-none">
		  		<div class="header_title_div">
			  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<div style="width:100%; height:54px;"><div style="float:left;">01 클래스 기본정보</div> 
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">
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
			      	<div class="shc-info-tb" style="float: right; margin-right:10px; display:none">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">
			      02 클래스 강의정보
			      	<div class="shc-lesson-tb" style="display:none; float: right; margin-right:10px;">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">
			      03 클래스 준비물
			      	<div class="shc-kit-tb" style="display:none; float: right; margin-right:10px;">
				      	<svg width="20" height="20" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
					      	</path>
				      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck" role="tab" aria-controls="v-pills-hobbyClassCheck" aria-selected="false">
			      04 검토 요청 전 확인
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
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">
								<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
			
			<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">01 클래스 기본정보 
			      	<div class="shc-info-tb" style="float: right; margin-right:10px; display:none"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">02 클래스 강의정보
			      	<div class="shc-lesson-tb" style="display:none; float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">03 클래스 준비물
			      	<div class="shc-kit-tb" style="display:none; float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck" role="tab" aria-controls="v-pills-hobbyClassCheck" aria-selected="false">04 검토 요청 전 확인
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
							<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" aria-controls="v-pills-hobbyClassKit" aria-selected="false">
								<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
							</button>
						</div>	 	
				 	</div>	  		
		  		</div>
		  	</div>
		  	
		  	<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">01 클래스 기본정보 
			      	<div class="shc-info-tb" style="float: right; margin-right:10px; display:none"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">02 클래스 강의정보
			      	<div class="shc-lesson-tb" style="display:none; float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">03 클래스 준비물
			      	<div class="shc-kit-tb" style="display:none; float: right; margin-right:10px;"><svg width="20" height="20" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path></svg></div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck" role="tab" aria-controls="v-pills-hobbyClassCheck" aria-selected="false">04 검토 요청 전 확인
			      </a>    
		    	</div>
	    	</div>
		  	
		  </div>
		  </div>
		  
		  
		  <div class="tab-pane" id="hobbyClassCheckAndroidMenu" role="tabpanel" aria-labelledby="hobbyClassCheckAndroidMenu-tab">
			
			<div class="start_hobbyclassInfo">
				<div class="d-block d-lg-none">
			  		<div class="header_title_div">
				  		<div style="border:0; outline:0; width: 100%; height:54px;" class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<div style="width:100%; height:54px;"><div style="float:left;">04 검토 요청 전 확인</div> 
								<button type="button" style="background-color:white; float:left; margin-left: 4px; padding: 0px; width:24px; height:24px;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck" aria-controls="v-pills-hobbyClassCheck" aria-selected="false">
									<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
								</button>
							</div>	 	
					 	</div>	  		
			  		</div>
			  	</div>
			  	
			  	<div style="font-size: 16px; font-weight: bold; color:rgb(62, 64, 66);">
			  	<div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="tab_a_class nav-link" id="hobbyClassInfo-tab" data-toggle="tab" href="#hobbyClassInfo" role="tab" aria-controls="v-pills-hobbyClassInfo" aria-selected="false">01 클래스 기본정보 
			      	<div class="shc-info-tb" style="float: right; margin-right:10px; display:none">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
			      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
			      	</path>
			      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassLesson-tab" data-toggle="tab" href="#hobbyClassLesson" role="tab" aria-controls="v-pills-hobbyClassLesson" aria-selected="false">02 클래스 강의정보
			      	<div class="shc-lesson-tb" style="display:none; float: right; margin-right:10px;">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
			      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
			      	</path>
			      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassKit-tab" data-toggle="tab" href="#hobbyClassKit" role="tab" aria-controls="v-pills-hobbyClassKit" aria-selected="false">03 클래스 준비물
			      	<div class="shc-kit-tb" style="display:none; float: right; margin-right:10px;">
			      	<svg width="20" height="20" viewBox="0 0 24 24">
			      	<path fill="#3E4042" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
			      	</path>
			      	</svg>
			      	</div>
			      </a>
			      <hr/>
			      <a style="border:0; padding:0px; margin-bottom: 10px;" class="nav-link" id="hobbyClassCheck-tab" data-toggle="tab" href="#hobbyClassCheck" role="tab" aria-controls="v-pills-hobbyClassCheck" aria-selected="false">04 검토 요청 전 확인
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
	<jsp:include page="/openhobbyclass/saveHobbyClassOutModal.jsp" />
	<script type="text/javascript">

		$(function(){
						
    		// summernote onload Setting : 클래스 소개하기
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
	    		disableResizeEditor: true,
	    		callbacks: {
	    	          onImageUpload: function(files, editor, welEditable) {
	    	            for (var i = files.length - 1; i >= 0; i--) {
	    	              sendFile(files[i], this);
	    	            }
	    	          }
	    	        }

	    	});
	    	
    		// summernote onload Setting : 강의 수업 노트 [0]
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
	    		disableResizeEditor: true,
	    		callbacks: {
	    	          onImageUpload: function(files, editor, welEditable) {
	    	            for (var i = files.length - 1; i >= 0; i--) {
	    	              sendFile(files[i], this);
	    	            }
	    	          }
	    	        }

	    	});
		
	    	// Summernote Date Write
			var summ1 = $("#sumb-info-div").html(); 
    		$('#summernote1').summernote('code', summ1);	
    		var summ2 = $("#sumb-lesson-div").html(); 
    		$('#summernote2').summernote('code', summ2);	
    		
    		// Summernote imageUpload
    		function sendFile(file, el) {
    			var form_data = new FormData();
	    	      form_data.append('file', file);

		    	      $.ajax(
		    	    		  {
				    	    	url : "/hobbyclass/json/saveFile", // summernoteFile
				    	        method : "POST",
			    	     		data : form_data,
				    	        cache : false,
				    	        contentType : false,
				    	        enctype : 'multipart/form-data',
				    	        processData : false,
				    	        success : function(JSONData) {
				    	        	
				    	        	$(el).summernote('editor.insertImage',"/images/hobbyclass/"+JSONData);
				    	    	    $('#imageBoard > ul').append('<li><img src="/images/hobbyclass/'+JSONData+'" width="480" height="auto"/></li>');
				    	        }
		 	  	 	});
	    	}
			
    		// 클래스 미리보기
    		$(document).on("click", ".getPreviewClass", function(){
    			// 미리보기 하기 전에 ajax로 저장처리
    			saveHobbyClassInfo();
    			saveLesson();
    			saveKit();
    			
    			self.location = "/searchHobbyClass/getPreview?hobbyClassNo="+$("input[name='hobbyClassNo']").val();
    		});
    		
			// Category Validation Check
			if( $("select[name='hobbyClassCategory']").val() != null ) {
				var category = $("select[name='hobbyClassCategory']").val();
				if( $("select[name='hobbyClassCategory'] option:contains('"+category+"')").is(":selected") ){
					$("select[name='hobbyClassCategory'] option:contains('"+category+"')").remove();
					$("select[name='hobbyClassCategory']").prepend("<option selected>"+category+"</option>");
				}
			} 

			// Next Button:hover Event
			var bootstrapButton = $.fn.button.noConflict();
			$.fn.bootstrapBtn = bootstrapButton;
			$(document).on("click",".nav-link", function(){
				$(this).removeClass('nav-link active').addClass('nav-link');
			});
			
		
			
			// (변화, 입력, 복사, 잘라내기, 붙여넣기) 이벤트 : Next Button 활성화 비활성화 : 작성이 모두 완료된 상태라면 활성화 ==> 사용자가 사용 중일 때
			$(document).on("change input copy cut paste", function(e){		
				
				// 화면구성 완료 이후에 동작하는 이벤트
				if( !omega && !$(e.target).hasClass("shc-info-tb") && !$(e.target).hasClass("shc-lesson-tb")
						&& !$(e.target).hasClass("shc-kit-tb") && !$(e.target).hasClass("progress-bar") ){
					
					// 일반 데이터 변경 시
					if( !$(e.target).hasClass("file_input_div") && !$(e.target).hasClass("classLesson_file_two")
							&& !$(e.target).hasClass("file_input_hidden") && !$(e.target).hasClass("file_input_test") ){
						changeEvent();
						
						//파일 업로드 이벤트
					}else if( $(e.target).hasClass("file_input_div") || $(e.target).hasClass("classLesson_file_two") 
							|| $(e.target).hasClass("file_input_hidden") || $(e.target).hasClass("file_input_test") ){
						// 파일업로드 성공 시 비활성화

					}
					
					
				}
			});
			

			
			
			// 최초 실행시 화면구성 : 진행바, 진행svg, x 버튼
			var progress = 0;
			var infoSvgCheck = false;
			var lessonSvgCheck = false;
			var kitSvgCheck = false;
			
			var omega = true;
			changeEvent();
			

			function changeEvent(){
				setTimeout(function() {  

				// 클래스 기본정보 
				var markupStr1 = $('#summernote1').summernote('code');
				var markupStr2 = $('#summernote2').summernote('code');
				if( $("select[name='hobbyClassCategory']").val() != "" && $("select[name='hobbyClassCategory']").val() != null
						&& $("input[name='hobbyClassHashtag']").val() != "" && $("input[name='hobbyClassHashtag']").val() != null
						&& $("input[name='hobbyClassName']").val() != "" && $("input[name='hobbyClassName']").val() != null
						&& $("input[name='hobbyClassPrice']").val() != "" && $("input[name='hobbyClassPrice']").val() != null					
						&& markupStr1 != "" && markupStr1 != null
						&& $(".classInfo_image").attr("src") != "/resources/image/gon/addimage.jpg"
						&& $(".classInfo_image").attr("src") != null && $(".classInfo_image").attr("src") != ""
						&& $("input[name='hobbyClassName']").val().length <= 30	) {
					progress += 40;
					infoSvgCheck = true;
					$('#infoNoButton').css({'display':'none'});
		            $('#infoYesButton').css({'display':'inline-block'});	  
				}else {
					$('#infoNoButton').css({'display':'inline-block'});
					$('#infoYesButton').css({'display':'none'});
				}
				
				
				// 클래스 강의정보
				if( $("input[name='lessonTitle']").val() != "" && $("input[name='lessonTitle']").val() != null
					&& $("input[name='lessonProject']").val() != "" && $("input[name='lessonProject']").val() != null								
					&& $("input[name='lessonIntro']").val() != "" && $("input[name='lessonIntro']").val() != null
					&& markupStr2 != "" && markupStr2 != null
					&& $(".classLesson_image_one").attr("src") != "/resources/image/gon/addimage.jpg"
					&& $(".classLesson_image_one").attr("src") != null && $(".classLesson_image_one").attr("src") != ""
					&& $(".classLesson_image_two").attr("src") != "/resources/image/gon/lessonaddimage.jpg"
					&& $(".classLesson_image_two").attr("src") != null && $(".classLesson_image_two").attr("src") != ""
					&& $("input[name='lessonTitle']").val().length <= 30 ) {
					
					progress += 40;
					lessonSvgCheck = true;
					$('#lessonNoButton').css({'display':'none'}); // 강의 다음 버튼 비활성화
					$('#lessonYesButton').css({'display':'inline-block'}); // 강의 다음 버튼 활성화
				}else {
					$('#lessonNoButton').css({'display':'inline-block'});
					$('#lessonYesButton').css({'display':'none'});
				}
				
				// 클래스 준비물
				if( $("input[name='kitName']").val() != "" && $("input[name='kitName']").val() != null					
					&& $("input[name='kitIntro']").val() != "" && $("input[name='kitIntro']").val() != null
					&& $("input[name='kitPrice']").val() != "" && $("input[name='kitPrice']").val() != null 
					&& $(".classKit_image").attr("src") != '/resources/image/gon/addimage.jpg'
					&& $(".classKit_image").attr("src") != "" && $(".classKit_image").attr("src") != null
					&& $("input[name='kitName']").val().length <= 30 ) {
					
					progress += 40;
					kitSvgCheck = true;
					$('#kitNoButton').css({'display':'none'}); // 준비물 다음 버튼 비활성화
					$('#kitYesButton').css({'display':'inline-block'}); // 준비물 다음 버튼 활성화
				}else {
					$('#kitNoButton').css({'display':'inline-block'}); // 준비물 다음 버튼 비활성화
					$('#kitYesButton').css({'display':'none'}); // 준비물 다음 버튼 활성화
				}
				
				
				// 최초 실행 시
				if( omega ){
					if( infoSvgCheck ){
						$(".shc-info-tb").css("display","block"); // 클래스 기본정보 Complete Check svg
					}
					if( lessonSvgCheck ){
						$(".shc-lesson-tb").css("display","block"); // 레슨 Complete Check svg
					}
					if( kitSvgCheck ){
						$(".shc-kit-tb").css("display","block"); // 준비물 Complete Check svg
					}
					
					$(".progress-bar").css("width",progress+"%"); // 진행바 변경
					
					// onload시 파일이 있을 경우 비활성화
					if( $(".classInfo_image").attr("src") != "/resources/image/gon/addimage.jpg" ){
						$(".classInfo_file").attr("disabled",true);
						$(".classInfo_file").css("cursor","default");
						$(".shc-classInfo-ImageDeleteButton").css("display","block");
						
					}
					if( $(".classLesson_image_one").attr("src") != "/resources/image/gon/addVideo.png" ){
						$(".classLesson_file_one").attr("disabled",true);
						$(".classLesson_file_one").css("cursor","default");
						$(".shc-lesson-one-ImageDeleteButton").css("display","block");
					}
					
					if( $(".classLesson_image_two").attr("src") !=  "/resources/image/gon/lessonaddimage.jpg" ){
						$(".classLesson_file_two").attr("disabled",true);
						$(".classLesson_file_two").css("cursor","default");
						$(".shc-lesson-two-ImageDeleteButton").css("display","block");
					}
					if( $(".classKit_image").attr("src") != "/resources/image/gon/addimage.jpg" ){
						$(".classKit_file").attr("disabled",true);
						$(".classKit_file").css("cursor","default");
						$(".shc-kit-ImageDeleteButton").css("display","block");
					}
					omega = false;
				}
				
				},100);
					$('#previousLessonButton').css("display","block");
					$('.previousLessonButton').css("display","none");
					$('#previousKitButton').css("display","block");
					$('.previousKitButton').css("display","none");
	
				}
			
			function closeFileUpload(){

				var changeEventTag = false;
				setTimeout(function(){
					if( $(".classInfo_image").attr("src") != "/resources/image/gon/addimage.jpg" ){
						$(".classInfo_file").attr("disabled",true);
						$(".classInfo_file").css("cursor","default");
						$(".shc-classInfo-ImageDeleteButton").css("display","block");
						changeEventTag = true;
						
					}
					if( $(".classLesson_image_one").attr("src") != "/resources/image/gon/addVideo.png" ){
						$(".classLesson_file_one").attr("disabled",true);
						$(".classLesson_file_one").css("cursor","default");
						$(".shc-lesson-one-ImageDeleteButton").css("display","block");
						changeEventTag = true;
					}
					
					if( $(".classLesson_image_two").attr("src") !=  "/resources/image/gon/lessonaddimage.jpg" ){
						$(".classLesson_file_two").attr("disabled",true);
						$(".classLesson_file_two").css("cursor","default");
						$(".shc-lesson-two-ImageDeleteButton").css("display","block");
						changeEventTag = true;
					}
					if( $(".classKit_image").attr("src") != "/resources/image/gon/addimage.jpg" ){
						$(".classKit_file").attr("disabled",true);
						$(".classKit_file").css("cursor","default");
						$(".shc-kit-ImageDeleteButton").css("display","block");
						changeEventTag = true;
					}
					if( changeEventTag ){
						changeEvent();	
					}
				},100);
				
			}
	
			// 이미지 x 버튼 이벤트
			$(document).on("click", ".shc-classInfo-ImageDeleteButton", function(){
				$(".classInfo_image").attr("src", "/resources/image/gon/addimage.jpg");
				$(".classInfo_file").attr("disabled",false);
				$(".classInfo_file").css("cursor","pointer");
				$(".shc-classInfo-ImageDeleteButton").css("display","none");
			});
			$(document).on("click", ".shc-lesson-one-ImageDeleteButton", function(){
				$(".classLesson_image_one").remove();
				$("input[name='lessonVideo']").after('<input type="image" src="/resources/image/gon/addVideo.png" style="overflow:hidden; " class="file_input_test lessonInput classLesson_image_one">');
				$(".classLesson_file_one").attr("disabled",false);
				$(".classLesson_file_one").css("cursor","pointer");
				$(".shc-lesson-one-ImageDeleteButton").css("display","none");
			});
			$(document).on("click", ".shc-lesson-two-ImageDeleteButton", function(){
				$(".classLesson_image_two").attr("src", "/resources/image/gon/lessonaddimage.jpg");
				$(".classLesson_file_two").attr("disabled",false);
				$(".classLesson_file_two").css("cursor","pointer");
				$(".shc-lesson-two-ImageDeleteButton").css("display","none");
			});
			$(document).on("click", ".shc-kit-ImageDeleteButton", function(){
				$(".classKit_image").attr("src", "/resources/image/gon/addimage.jpg");
				$(".classKit_file").attr("disabled",false);
				$(".classKit_file").css("cursor","pointer");
				$(".shc-kit-ImageDeleteButton").css("display","none");
			});

			
	    	$(document).on("click","#infoYesButton", function(){
	    		saveHobbyClassInfo();
	    	});
	    	
	    	// 클래스 기본정보 저장
	    	function saveHobbyClassInfo() {
	    		
	    		var hashtag = $("input[name='hobbyClassHashtag']").val().split(',');    		
	    		var hashtagList = [];
	    		for(var i=0; i<hashtag.length; i++){
	    			hashtagList.push(hashtag[i].trim());
	    		}
	    		var markupStr1 = $('#summernote1').summernote('code');
	    		var resultList = changeHashtagCode(hashtagList); 
	    		
				if( $("select[name='hobbyClassCategory']").val() != "" && $("select[name='hobbyClassCategory']").val() != null
						&& $("input[name='hobbyClassHashtag']").val() != "" && $("input[name='hobbyClassHashtag']").val() != null
						&& $("input[name='hobbyClassName']").val() != "" && $("input[name='hobbyClassName']").val() != null
						&& $("input[name='hobbyClassPrice']").val() != "" && $("input[name='hobbyClassPrice']").val() != null					
						&& markupStr1 != "" && markupStr1 != null
						&& $(".classInfo_image").attr("src") != "/resources/image/gon/addimage.jpg"
						&& $(".classInfo_image").attr("src") != null && $(".classInfo_image").attr("src") != "" ) {
   					

   		            $(".shc-info-tb").css("display","block"); // 기본정보 Complete Check svg
   		            
   		         var progress = 0;   
   		         if ( $(".shc-lesson-tb").css("display") == 'block' ) {
   		        	progress += 30;
   		         }
   		         if ( $(".shc-info-tb").css("display") == 'block' ) {
	    			progress += 30;
				 }
				 if ( $(".shc-kit-tb").css("display") == 'block' ) {
					progress += 30;
				 }
   		         $(".progress-bar").css("width",progress+"%"); // 진행바 변경
   		         
   				}
   				
	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/saveHobbyClassInfo",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo: $("input[name='hobbyClassNo']").val(),
		    						hobbyClassName: $("input[name='hobbyClassName']").val(),
		    						hobbyClassImage: $("input[name='hobbyClassImage']").val(),
		    						category: $("select[name='hobbyClassCategory']").val(),
		    						hobbyClassPrice: $("input[name='hobbyClassPrice']").val(),
		    						hobbyClassIntro : $('#summernote1').summernote('code'),
		    						hashtag: resultList
	    					}),
	    					dataType : "text" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
								
	    						if(JSONData == 1){
	    							closePreviousCheckButton();
	    							$(window).scrollTop(0);
	    							closePreviousCheckButton();
	    				    		$("a[href='#hobbyClassLesson']").click();

	    						}
	    					}
   				});//end of ajax
	    	}//end of saveHobbyClassInfo
	    	
	    	
	    	
	    	$(document).on("click","#lessonYesButton", function(){
	    		saveLesson();
	    	});
	    	
	    	// 클래스 강의정보 저장
	    	function saveLesson() {
	    		var markupStr2 = $('#summernote2').summernote('code');
	    		if( $("input[name='lessonTitle']").val() != "" && $("input[name='lessonTitle']").val() != null
						&& $("input[name='lessonProject']").val() != "" && $("input[name='lessonProject']").val() != null								
						&& $("input[name='lessonIntro']").val() != "" && $("input[name='lessonIntro']").val() != null
						&& markupStr2 != "" && markupStr2 != null
						&& $(".classLesson_image_one").attr("src") != "/resources/image/gon/addimage.jpg"
						&& $(".classLesson_image_one").attr("src") != null && $(".classLesson_image_one").attr("src") != ""
						&& $(".classLesson_image_two").attr("src") != "/resources/image/gon/lessonaddimage.jpg"
						&& $(".classLesson_image_two").attr("src") != null && $(".classLesson_image_two").attr("src") != "") {

					$(".shc-lesson-tb").css("display","block"); // 레슨 Complete Check svg
					
					var progress = 0;   
	   		         if ( $(".shc-lesson-tb").css("display") == 'block' ) {
	   		        	progress += 30;
	   		         }
	   		         if ( $(".shc-info-tb").css("display") == 'block' ) {
		    			progress += 30;
					 }
					 if ( $(".shc-kit-tb").css("display") == 'block' ) {
						progress += 30;
					 }
	   		         $(".progress-bar").css("width",progress+"%"); // 진행바 변경
				}

	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/saveLesson",
	    					method: "POST",
	    					data: JSON.stringify({
	    							lessonNo: $("input[name='lessonNo']").val(),
	    							hobbyClass: {hobbyClassNo : $("input[name='hobbyClassNo']").val()},
	    							lessonVideo: $("input[name='lessonVideo']").val(),
	    							lessonTitle: $("input[name='lessonTitle']").val(),
	    							lessonProject: $("input[name='lessonProject']").val(),
	    							lessonIntro: $("input[name='lessonIntro']").val(),
	    							lessonImage: $("input[name='lessonImage']").val(),
	    							lessonContent: $('#summernote2').summernote('code')
	    					}),
	    					dataType : "text" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
								
	    						if(JSONData == 1){
	    							closePreviousCheckButton();
	    							$(window).scrollTop(0);
	    							closePreviousCheckButton();
	    				    		$("a[href='#hobbyClassKit']").click();
	    						}		

	    					}
	    				});//end of ajax
	    	}//end of saveLesson
	    	
	    	
	    	$(document).on("click","#kitYesButton", function(){
	    		saveKit();
	    	});
	    	
    		// 클래스 준비물 저장
    		function saveKit() {
	    		if( $("input[name='kitName']").val() != "" && $("input[name='kitName']").val() != null					
						&& $("input[name='kitIntro']").val() != "" && $("input[name='kitIntro']").val() != null
						&& $("input[name='kitPrice']").val() != "" && $("input[name='kitPrice']").val() != null 
						&& $(".classKit_image").attr("src") != '/resources/image/gon/addimage.jpg'
						&& $(".classKit_image").attr("src") != "" && $(".classKit_image").attr("src") != null	) {
					
					$(".shc-kit-tb").css("display","block"); // 준비물 Complete Check svg
					
					var progress = 0;   
	   		         if ( $(".shc-lesson-tb").css("display") == 'block' ) {
	   		        	progress += 30;
	   		         }
	   		         if ( $(".shc-info-tb").css("display") == 'block' ) {
		    			progress += 30;
					 }
					 if ( $(".shc-kit-tb").css("display") == 'block' ) {
						progress += 30;
					 }
	   		         $(".progress-bar").css("width",progress+"%"); // 진행바 변경
				}

	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/saveKit",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo: $("input[name='hobbyClassNo']").val(),
	    							kitName : $("input[name='kitName']").val(),
	    							kitIntro : $("input[name='kitIntro']").val(),
	    							kitPrice : $("input[name='kitPrice']").val(),
	    							kitImage : $("input[name='kitImage']").val()
	    							
	    						}),
	    					dataType : "text" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						if ( JSONData == 1){
	    							closePreviousCheckButton();
	    							$(window).scrollTop(0);
	    							
	    							setTimeout(function(){
	    							// 기본정보가 미완성일 경우
	    							if( $(".shc-info-tb").css("display") == 'none' ){
	    								$("a[href='#hobbyClassInfo']").click();
	    							// 강의정보가 미완성일 경우
	    							}else if( $(".shc-lesson-tb").css("display") == "none" ){
	    								$("a[href='#hobbyClassLesson']").click();
	    							// 모두 완성일 경우
	    							}else if( $(".shc-info-tb").css("display") == 'block' && $(".shc-lesson-tb").css("display") == "block" && $(".shc-kit-tb").css("display") == "block" ){
	    								$("a[href='#hobbyClassCheck']").click();
	    							}else{
	    								$("a[href='#hobbyClassLesson']").click();
	    							}
	    							},100);
	    								
	    						}//end of if
	    					}//end of Call Back Function
	    				});//end of ajax
	    	};//end of saveKit 
	    	
	    	// 클래스 검토요청
			$(document).on("click","#checkYesButton", function(){
				
				
	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/saveCheckHobbyClass",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo : $("input[name='hobbyClassNo']").val()
	    					}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
								if( JSONData == 1 ){
									closePreviousCheckButton();
									self.location = "/hobbyclass/getMyHobbyClassList";
								}
	    					}
        					
	    				});//end of ajax
	    	});//end
	    	
	    	// 강의정보 이전 버튼 이벤트
	    	$(document).on("click", "#previousLessonButton", function(){
	    		resetLessonAjax();
   				closePreviousCheckButton();
	    		$("a[href='#hobbyClassInfo']").click();
	    	});
	    	
	    	function resetInfoAjax() {
	    		confirm("지정하지 않은 변경사항이 있습니다. 이 페이지를 벗어나도 괜찮겠습니까?");
	    		self.location = "/hobbyclass/getSaveHobbyClass?hobbyClassNo="+$("input[name='hobbyClassNo']").val();
	    	}
	    	
	    	function resetLessonAjax() {
	    		confirm("지정하지 않은 변경사항이 있습니다. 이 페이지를 벗어나도 괜찮겠습니까?");
	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/getSaveHobbyClass",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo : $("input[name='hobbyClassNo']").val()
	    					}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						
	    						if( JSONData.lesson[0].lessonVideo != null && JSONData.lesson[0].lessonVideo != "" ){
									$(".classLesson_image_one").attr("src","/video/"+JSONData.lesson[0].lessonVideo);
									$(".classLesson_file_one").attr("disabled",true);
	    							$(".classLesson_file_one").css("cursor","default");
	    							$(".shc-lesson-one-ImageDeleteButton").css("display","block");
	    						}else{
	    							$(".classLesson_image_one").attr("src", "/resources/image/gon/addVideo.png");
	    							$(".classLesson_file_one").attr("disabled",false);
	    							$(".classLesson_file_one").css("cursor","pointer");
	    							$(".shc-lesson-one-ImageDeleteButton").css("display","none");
	    						}
	    						if( JSONData.lesson[0].lessonTitle != null && JSONData.lesson[0].lessonTitle != "" ){
	    							$("input[name='lessonTitle']").val(JSONData.lesson[0].lessonTitle);
	    						}else{
	    							$("input[name='lessonTitle']").val("");
	    						}
	    						if( JSONData.lesson[0].lessonProject != null && JSONData.lesson[0].lessonProject != "" ){
	    							$("input[name='lessonProject']").val(JSONData.lesson[0].lessonProject);
	    						}else{
	    							$("input[name='lessonProject']").val("");
	    						}
	    						if( JSONData.lesson[0].lessonIntro != null && JSONData.lesson[0].lessonIntro != "" ){
	    							$("input[name='lessonIntro']").val(JSONData.lesson[0].lessonIntro);
	    						}else{
	    							$("input[name='lessonIntro']").val("");
	    						}
	    						if( JSONData.lesson[0].lessonImage != null && JSONData.lesson[0].lessonImage != "" ){
	    							$(".classLesson_image_two").attr("src","/images/hobbyclass/"+JSONData.lesson[0].lessonImage);
	    							$(".classLesson_file_two").attr("disabled",true);
	    							$(".classLesson_file_two").css("cursor","default");
	    							$(".shc-lesson-two-ImageDeleteButton").css("display","block");
	    						}else{
	    							$(".classLesson_image_two").attr("src", "/resources/image/gon/lessonaddimage.jpg");
	    							$(".classLesson_file_two").attr("disabled",false);
	    							$(".classLesson_file_two").css("cursor","pointer");
	    							$(".shc-lesson-two-ImageDeleteButton").css("display","none");
	    						}
	    						if( JSONData.lesson[0].lessonContent != null && JSONData.lesson[0].lessonContent != "" ){
	    				    		$('#summernote2').summernote('code', JSONData.lesson[0].lessonContent);	
	    						}else{
	    				    		$('#summernote2').summernote('code', "");	
	    						}
	    					}
   				});//end of ajax
	    	}
	    	
	    	function resetKitAjax() {
	    		confirm("지정하지 않은 변경사항이 있습니다. 이 페이지를 벗어나도 괜찮겠습니까?");
	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/getSaveHobbyClass",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo : $("input[name='hobbyClassNo']").val()
	    					}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
								if( JSONData.kitImage != null && JSONData.kitImage != "" ){
									$(".classKit_image").attr("src", "/images/hobbyclass/"+JSONData.kitImage);
									$(".classKit_file").attr("disabled",true);
									$(".classKit_file").css("cursor","default");
									$(".shc-kit-ImageDeleteButton").css("display","block");
								}else{
									$(".classKit_image").attr("src", "/resources/image/gon/addimage.jpg");
									$(".classKit_file").attr("disabled",false);
									$(".classKit_file").css("cursor","pointer");
									$(".shc-kit-ImageDeleteButton").css("display","none");
								}
								if( JSONData.kitName != null && JSONData.kitName != "" ){
									$("input[name='kitName']").val(JSONData.kitName);
								}else{
									$("input[name='kitName']").val("");
								}
								if( JSONData.kitIntro != null && JSONData.kitIntro != "" ){
									$("input[name='kitIntro']").val(JSONData.kitIntro);
								}else{
									$("input[name='kitIntro']").val("");
								}
								if( JSONData.kitPrice != null && JSONData.kitPrice != "" ){
									$("input[name='kitPrice']").val(JSONData.kitPrice);
								}else{
									$("input[name='kitPrice']").val("");
								}
	    					}
   				});//end of ajax
	    	}
	    	
	    	// 준비물 이전 버튼 이벤트
	    	$(document).on("click", "#previousKitButton", function(){
	    		resetKitAjax();
   				closePreviousCheckButton();
	    		$("a[href='#hobbyClassLesson']").click();
	    	});
	    	
	    	// 강의정보 이전 버튼 이벤트
	    	$(document).on("click", ".previousLessonButton", function(){ 
	    		closePreviousCheckButton();
	    		$("a[href='#hobbyClassInfo']").click();
	    	});
	    	// 준비물 이전 버튼 이벤트
	    	$(document).on("click", ".previousKitButton", function(){
	    		closePreviousCheckButton();
	    		$("a[href='#hobbyClassLesson']").click();
	    	});
	    	// 검토요청 이전 버튼 이벤트
	    	$(document).on("click", "#previousCheckButton", function(){
	    		// 검토요청 버튼 모두 비활성화
	    		$(".guide-1").children("svg").children("path").remove();
				$("input[name='guide-1']").attr("checked",false);
				$(".guide-1").children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
				
				$(".guide-2").children("svg").children("path").remove();
				$("input[name='guide-2']").attr("checked",false);
				$(".guide-2").children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
				
				$(".guide-3").children("svg").children("path").remove();
				$("input[name='guide-3']").attr("checked",false);
				$(".guide-3").children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
				
				$(".guide-4").children("svg").children("path").remove();
				$("input[name='guide-4']").attr("checked",false);
				$(".guide-4").children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
				
				closePreviousCheckButton();
	    		$("a[href='#hobbyClassKit']").click();
	    	});
	    	
	    	// 이전버튼 기본기능 제공
	    	function closePreviousCheckButton(){
	    		$('#previousLessonButton').css("display","none");
				$('.previousLessonButton').css("display","block");
				$('#previousKitButton').css("display","none");
				$('.previousKitButton').css("display","block");
	    	}
	    	


			// 검토 후 요청하기 버튼 활성화 이벤트
			$(document).on("click",".shc-gl", function(){

				var CheckCheck = 0;
				setTimeout(function() {  
					
					$(".shc-gl input:checked").each(function() {
						CheckCheck ++;
					});
					
					if( CheckCheck == 4 ){
						$('#checkNoButton').css({'display':'none'});
					    $('#checkYesButton').css({'display':'inline-block'});
					}else {
						$('#checkYesButton').css({'display':'none'});
				        $('#checkNoButton').css({'display':'inline-block'});
					}
				}, 1);// input:checked 활성화 이후를 잡아주는 Method
				
			});//end of hobbyClassCheck Next Button Open Event

			// 검토 후 요청하기 1번 라벨 클릭 이벤트
			$(document).on("click",".guide-1", function(){			
				
				// Check Button Close
				if( $("input[name='guide-1']").is(":checked") == true ){
					$(this).children("svg").children("path").remove();
					$("input[name='guide-1']").attr("checked",false);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
					
				// Check Button Open
				}else if( $("input[name='guide-1']").is(":checked") == false ){			
					$(this).children("svg").children("path").remove();
					$("input[name='guide-1']").attr('checked',true);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
				}
				return false;
			});//end of hobbyClassCheck lable-1 Click Event
			
			// 검토 후 요청하기 2번 라벨 클릭 이벤트
			$(document).on("click",".guide-2", function(){	
				
				// Check Button Close
				if( $("input[name='guide-2']").is(":checked") == true ){
					$(this).children("svg").children("path").remove();
					$("input[name='guide-2']").attr("checked",false);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
					
				// Check Button Open	
				}else if( $("input[name='guide-2']").is(":checked") == false ){			
					$(this).children("svg").children("path").remove();
					$("input[name='guide-2']").attr('checked',true);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
				}
				return false;
			});//end of hobbyClassCheck lable-2 Click Event
			
			// 검토 후 요청하기 3번 라벨 클릭 이벤트
			$(document).on("click",".guide-3", function(){			
				
				// Check Button Close
				if( $("input[name='guide-3']").is(":checked") == true ){
					$(this).children("svg").children("path").remove();
					$("input[name='guide-3']").attr("checked",false);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
					
				// Check Button Open		
				}else if( $("input[name='guide-3']").is(":checked") == false ){			
					$(this).children("svg").children("path").remove();
					$("input[name='guide-3']").attr('checked',true);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
				}
				return false;
			});//end of hobbyClassCheck lable-3 Click Event
			
			// 검토 후 요청하기 4번 라벨 클릭 이벤트
			$(document).on("click",".guide-4", function(){		
				
				// Check Button Close
				if( $("input[name='guide-4']").is(":checked") == true ){
					$(this).children("svg").children("path").remove();
					$("input[name='guide-4']").attr("checked",false);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
					
				// Check Button Open		
				}else if( $("input[name='guide-4']").is(":checked") == false ){			
					$(this).children("svg").children("path").remove();
					$("input[name='guide-4']").attr('checked',true);
					$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
				}
				return false;
			});//end of hobbyClassCheck lable-4 Click Event
			
			$(document).on("click", "a[href='#hobbyClassCheck']", function(){
				// 기본정보가 미완성일 경우
				if( $(".shc-info-tb").css("display") == 'none' ){
					alert("검토 요청 전 확인을 하려면 이전 정보가 다 작성되어야 합니다.");
					$("a[href='#hobbyClassInfo']").click();
				// 강의정보가 미완성일 경우
				}else if( $(".shc-lesson-tb").css("display") == "none" ){
					alert("검토 요청 전 확인을 하려면 이전 정보가 다 작성되어야 합니다.");
					$("a[href='#hobbyClassLesson']").click();
				// 준비물이 미완성일 경우
				}else if( $(".shc-kit-tb").css("display") == "none" ){
					alert("검토 요청 전 확인을 하려면 이전 정보가 다 작성되어야 합니다.");
					$("a[href='#hobbyClassKit']").click();
				// 모두 완성일 경우
				}else if( $(".shc-info-tb").css("display") == 'block' && $(".shc-lesson-tb").css("display") == "block" && $(".shc-kit-tb").css("display") == "block" ){
					$("a[href='#hobbyClassCheck']").click();
				}
			});
			
			//최대 글자수 제한 이벤트
			$(".hcn-max-length").text( $("input[name='hobbyClassName']").val().length+"자 / 최대 30자" );
			$(document).on("change cut copy paste input", "input[name='hobbyClassName']", function(){
				
				$(".hcn-max-length").text( $(this).val().length+"자 / 최대 30자" );
				if( $(this).val().length > 30 ){
					$(this).next().next().text( "30자 / 최대 30자" );
					$(this).next().next().css("display","none");
					$(this).next().next().next().css("display","none");
				}else{
					if( $(this).val().length <= 0 ){
						$(this).next().next().next().css("display","block");
						$(this).next().next().css("display","none");
						$(this).css("border-color","rgb(255, 82, 82)");
					}else{
						$(this).next().next().next().css("display","none");
						$(this).next().next().css("display","block");
						$(this).next().css("display","none");
						$(this).next().next().text( $(this).val().length+"자 / 최대 30자" );
						$(this).css("border-color","black");
					}
				}
			});
			
			$(".hclt-max-length").text( $("input[name='lessonTitle']").val().length+"자 / 최대 30자" );
			$(document).on("change cut copy paste input", "input[name='lessonTitle']", function(){
				$(".hclt-max-length").text( $(this).val().length+"자 / 최대 30자" );
				if( $(this).val().length > 30 ){
					$(".hclt-max-length").text( "30자 / 최대 30자" );
					$(".hclt-max-length").css("display","none");
				}else{
					if( $(this).val().length <= 0 ){
						$(this).next().next().next().css("display","block");
						$(this).next().next().css("display","none");
						$(this).css("border-color","rgb(255, 82, 82)");
					}else{
						$(this).next().next().next().css("display","none");
						$(this).next().next().css("display","block");
						$(this).next().css("display","none");
						$(this).next().next().text( $(this).val().length+"자 / 최대 30자" );
						$(this).css("border-color","black");
					}
				}
			});
			
			$(".hckn-max-length").text( $("input[name='kitName']").val().length+"자 / 최대 30자" );
			$(document).on("change cut copy paste input", "input[name='kitName']", function(){
				$(".hckn-max-length").text( $(this).val().length+"자 / 최대 30자" );
				if( $(this).val().length > 30 ){
					$(".hckn-max-length").text( "30자 / 최대 30자" );
					$(".hckn-max-length").css("display","none");
				}else{
					if( $(this).val().length <= 0 ){
						$(this).next().next().next().css("display","block");
						$(this).next().next().css("display","none");
						$(this).css("border-color","rgb(255, 82, 82)");
					}else{
						$(this).next().next().next().css("display","none");
						$(this).next().next().css("display","block");
						$(this).next().css("display","none");
						$(this).next().next().text( $(this).val().length+"자 / 최대 30자" );
						$(this).css("border-color","black");
					}
				}
			});
			
			$(document).on("blur", "input", function(){
				
				if( $(this).attr("name") != 'hobbyClassName' && $(this).attr("name") != 'lessonTitle' && $(this).attr("name") != 'kitName'){
					if( $(this).attr("name") == 'hobbyClassHashtag' ){
						
					}else if( $(this).val().length > 0 ){
						$(this).next("h6").css("display","none");
						$(this).css("border-color","rgb(221, 224, 226)");
					}else{
						$(this).next("h6").css("display","block");
						$(this).css("border-color","rgb(255, 82, 82)");
					}
				}
				
			});
			
			$(document).on("blur", "input[name='hobbyClassName']", function(){
				if( $(this).val().length > 30 ){
					$(".warning-mini-max-length-hcinfo").css("display","block");
					$("input[name='hobbyClassName']").css("border-color","rgb(255, 82, 82)");
				}else if( $(this).val().length <= 0) {
					$(this).css("border-color","rgb(255, 82, 82)");
				}else{
					$(".hcn-max-length").css("display","block");
					$(".warning-mini-max-length-hcinfo").css("display","none");
					$(".hcn-max-length").text( $(this).val().length+"자 / 최대 30자" );
					$("input[name='hobbyClassName']").css("border-color","rgb(221, 224, 226)");
					
				}
			});
			$(document).on("blur", "input[name='lessonTitle']", function(){
				if( $(this).val().length > 30 ){
					$(".warning-mini-max-length-lesson").css("display","block");
					$("input[name='lessonTitle']").css("border-color","rgb(255, 82, 82)");
				}else if( $(this).val().length <= 0) {
					$(this).css("border-color","rgb(255, 82, 82)");
				}else{
					$(".hclt-max-length").css("display","block");
					$(".warning-mini-max-length-lesson").css("display","none");
					$(".hclt-max-length").text( $(this).val().length+"자 / 최대 30자" );	
					$("input[name='lessonTitle']").css("border-color","rgb(221, 224, 226)");
				}
			});
			$(document).on("blur", "input[name='kitName']", function(){
				if( $(this).val().length > 30 ){
					$(".warning-mini-max-length-kit").css("display","block");
					$("input[name='kitName']").css("border-color","rgb(255, 82, 82)");
				}else if( $(this).val().length <= 0) {
					$(this).css("border-color","rgb(255, 82, 82)");
				}else{
					$(".hckn-max-length").css("display","block");
					$(".warning-mini-max-length-kit").css("display","none");
					$(".hckn-max-length").text( $(this).val().length+"자 / 최대 30자" );	
					$("input[name='kitName']").css("border-color","rgb(221, 224, 226)");
				}
			});
			
			$(document).on("change cut copy paste input", "input", function(){
				
				if( $(this).attr("name") != 'hobbyClassName' && $(this).attr("name") != 'lessonTitle' && $(this).attr("name") != 'kitName'){
					if( $(this).val().length > 0 ){
						$(this).next("h6").css("display","none");
						$(this).css("border-color","black");
					}
				}
			});
			
			// CREATOR CENTER TEXT Click Event
			$(document).on("click", ".lmhc-cc-text", function(){
				self.location = "/hobbyclass/getMyHobbyClassList";
			});
			
			// hobbyClassImage Change Event : 클래스 기본정보 클래스이미지 미리보기 기능
			$(".classInfo_file").on("change", function(){
				// Get Form
				var form = $("#classInfoImageForm")[0];
				var fomdata = new FormData(document.getElementById('classInfoImageForm')  );
				// Create an FormData Object
				var data = new FormData();
				data.append("file",$(".classInfo_file")[0].files[0]);

				$.ajax (
							{
								url : "/hobbyclass/json/saveFile",
								method : "POST",
								enctype: 'multipart/form-data',
								data : data,
								dataType: "text",
								contentType: false,
				                processData: false,
				                cache: false,
								success: function(JSONData){
									var jsonObj = JSON.parse(JSONData);
									closeFileUpload();
									$(".classInfo_image").attr("src","/images/hobbyclass/"+jsonObj[0]);
									$("input[name='hobbyClassImage']").val(jsonObj[0]);
									
								}
						});//end of ajax				
			});//end of hobbyClassImage Change Event
			
			// LessonVideo Change Event : 클래스 강의정보 강의영상 미리보기 기능
			$(".classLesson_file_one").on("change", function(){
				// Get Form
				var form = $("#classLessonOneImageForm")[0];
				var fomdata = new FormData(document.getElementById('classLessonOneImageForm'));
				// Create an FormData Object
				var data = new FormData();
				data.append("file",$(".classLesson_file_one")[0].files[0]);
				var progressPercent = $(".progress-bar").css("width");
				$.ajax (
							{
								url : "/hobbyclass/json/saveFile",
								method : "POST",
								enctype: 'multipart/form-data',
								data : data,
								dataType: "text",
								contentType: false,
				                processData: false,
				                cache: false,
				                beforeSend: function() {
				                	$(".progress-bar").css("width", "0%");
				                },
				                xhr: function() {
				                	   var xhr = new window.XMLHttpRequest();
				                	   //Upload progress
				                	   xhr.upload.addEventListener("progress", function(evt) {
				                	      if (evt.lengthComputable) {
				                	      var percentComplete = evt.loaded / evt.total;
				                	      $(".progress-bar").css("width",(percentComplete*120) + '%');
				                	      }
				                	   }, false);
				                	   return xhr;
				               	},
								success: function(JSONData){
									var jsonObj = JSON.parse(JSONData);
									closeFileUpload();
									$(".classLesson_image_one").remove();	
									$("input[name='lessonVideo']").after('<iframe src="/video/'+jsonObj[0]+'" class="file_input_test lessonInput classLesson_image_one"></iframe>');
									$("input[name='lessonVideo']").val(jsonObj[0]);
									setTimeout(function(){
										$(".progress-bar").css("width", progressPercent);
									},2000);
								}
						});//end of ajax
			});//end of LessonVideo Change Event
			
			// LessonImage Change Event : 클래스 강의정보 강의이미지 미리보기 기능
			$(".classLesson_file_two").on("change", function(){
				// Get Form
				var form = $("#classLessonTwoImageForm")[0];
				var fomdata = new FormData(document.getElementById('classLessonTwoImageForm'));
				// Create an FormData Object
				var data = new FormData();
				data.append("file",$(".classLesson_file_two")[0].files[0]);
				
				$.ajax (
							{
								url : "/hobbyclass/json/saveFile",
								method : "POST",
								enctype: 'multipart/form-data',
								data : data,
								dataType: "text",
								contentType: false,
				                processData: false,
				                cache: false,
								success: function(JSONData){
									var jsonObj = JSON.parse(JSONData);
									closeFileUpload();
									$(".classLesson_image_two").attr("src","/images/hobbyclass/"+jsonObj[0]);
									$("input[name='lessonImage']").val(jsonObj[0]);
								}
						});//end of ajax
				
			});//end of LessonImage Change Event
			
			// KitImage Change Event : 클래스 준비물 준비물이미지 미리보기 기능
			$(".classKit_file").on("change", function(){
				// Get Form
				var form = $("#classKitImageForm")[0];
				// Create an FormData Object
				var data = new FormData();
				data.append("file",$(".classKit_file")[0].files[0]);
				
				$.ajax (
							{
								url : "/hobbyclass/json/saveFile",
								method : "POST",
								enctype: 'multipart/form-data',
								data : data,
								dataType: "text",
								contentType: false,
				                processData: false,
				                cache: false,
								success: function(JSONData){
									var jsonObj = JSON.parse(JSONData);
									closeFileUpload();
									$(".classKit_image").attr("src","/images/hobbyclass/"+jsonObj[0]);
									$("input[name='kitImage']").val(jsonObj[0]);
								}
						})//end of ajax
				
			});//end of KitImage Change Event

	    	
			
	    	// 클래스 해쉬태그 select 창 클릭시 모달창 오픈처리
	    	$(document).on("click", "input[name='hobbyClassHashtag']", function(){
	    		$("#hashtagModalButton").click();
	    	});
			
			// 저장 후 나가기 클릭시 모달창 오픈처리
			$(document).on("click", ".saveAndOutButton", function(){
				$("#saveAndOutModalButton").click();
			});
	    	
	    	$(document).on("focus", "#inputState", function(){
	    		if( $(this).attr("name") != 'hobbyClassCategory' ){
		    		if( $(this).attr("name") == 'hobbyClassName' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "black");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		if( $(this).attr("name") == 'lessonTitle' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "black");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		if( $(this).attr("name") == 'kitName' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "black");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		
					if( $(this).attr("name") != 'hobbyClassName' && $(this).attr("name") != 'lessonTitle' && $(this).attr("name") != 'kitName'){
						if( $(this).val().length > 0 ){
							
							$(this).css("border-color","black");
							$(this).css("box-shadow","0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
							$(this).css("outline","0 none");
						}
					}
	    		}
	    		
	    	});
	    	$(document).on("focusout", "#inputState", function(){
	    		if( $(this).attr("name") != 'hobbyClassCategory' ){
		    		if( $(this).attr("name") == 'hobbyClassName' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "rgb(221, 224, 226)");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		
		    		if( $(this).attr("name") == 'lessonTitle' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "rgb(221, 224, 226)");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		if( $(this).attr("name") == 'kitName' && $(this).val().length <= 30 && !($(this).val().length <= 0) ){
			    		$(this).css("border-color", "rgb(221, 224, 226)");
			    		$(this).css("box-shadow", "0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
			    		$(this).css("outline", "0 none");
		    		}
		    		if( $(this).attr("name") != 'hobbyClassName' && $(this).attr("name") != 'lessonTitle' && $(this).attr("name") != 'kitName'){
						if( $(this).val().length > 0 ){
							
							$(this).css("border-color","rgb(221, 224, 226)");
							$(this).css("box-shadow","0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6)");
							$(this).css("outline","0 none");
						}
					}
	    		}
	    	});
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	function changeHashtagCode(hashtagList){
	    		var resultList = [];
	    		for(var i=0; i<3; i++){
	    			
	    			if(hashtagList[i] == '플라워/꽃꽃이'){
	    				resultList.push("H00");
	    			}else if(hashtagList[i] == '뜨개질/위빙'){
	    				resultList.push("H01");
	    			}else if(hashtagList[i] == '가구/목공예'){
	    				resultList.push("H02");
	    			}else if(hashtagList[i] == '가죽공예'){
	    				resultList.push("H03");
	    			}else if(hashtagList[i] == '천연비누/화장품'){
	    				resultList.push("H04");
	    			}else if(hashtagList[i] == '디퓨저/향수'){
	    				resultList.push("H05");
	    			}else if(hashtagList[i] == '캔들/석고공예'){
	    				resultList.push("H06");
	    			}else if(hashtagList[i] == '도자공예'){
	    				resultList.push("H07");
	    			}else if(hashtagList[i] == '금속/악세사리공예'){
	    				resultList.push("H08");
	    			}else if(hashtagList[i] == '바느질/재봉틀'){
	    				resultList.push("H09");
	    			}else if(hashtagList[i] == '한식'){
	    				resultList.push("C00");
	    			}else if(hashtagList[i] == '양식'){
	    				resultList.push("C01");
	    			}else if(hashtagList[i] == '중식'){
	    				resultList.push("C02");
	    			}else if(hashtagList[i] == '일식'){
	    				resultList.push("C03");
	    			}else if(hashtagList[i] == '분식'){
	    				resultList.push("C04");
	    			}else if(hashtagList[i] == '베이킹'){
	    				resultList.push("C05");
	    			}else if(hashtagList[i] == '커피'){
	    				resultList.push("C06");
	    			}else if(hashtagList[i] == '와인'){
	    				resultList.push("C07");
	    			}else if(hashtagList[i] == '칵테일'){
	    				resultList.push("C08");
	    			}else if(hashtagList[i] == '디저트'){
	    				resultList.push("C09");
	    			}else if(hashtagList[i] == '디지털드로잉'){
	    				resultList.push("A00");
	    			}else if(hashtagList[i] == '아동미술'){
	    				resultList.push("A01");
	    			}else if(hashtagList[i] == '미술 회화'){
	    				resultList.push("A02");
	    			}else if(hashtagList[i] == '소묘/드로잉'){
	    				resultList.push("A03");
	    			}else if(hashtagList[i] == '만화/웹툰'){
	    				resultList.push("A04");
	    			}else if(hashtagList[i] == '애니'){
	    				resultList.push("A05");
	    			}else if(hashtagList[i] == '동양화'){
	    				resultList.push("A06");
	    			}else if(hashtagList[i] == '팝아트'){
	    				resultList.push("A07");
	    			}else if(hashtagList[i] == '조소'){
	    				resultList.push("A08");
	    			}else if(hashtagList[i] == '캘리그라피'){
	    				resultList.push("A09");
	    			}else if(hashtagList[i] == '보컬'){
	    				resultList.push("M00");
	    			}else if(hashtagList[i] == '랩'){
	    				resultList.push("M01");
	    			}else if(hashtagList[i] == '디제잉'){
	    				resultList.push("M02");
	    			}else if(hashtagList[i] == '미디/컴퓨터작곡'){
	    				resultList.push("M03");
	    			}else if(hashtagList[i] == '시창청음/화성악'){
	    				resultList.push("M04");
	    			}else if(hashtagList[i] == '피아노/키보드'){
	    				resultList.push("M05");
	    			}else if(hashtagList[i] == '기타'){
	    				resultList.push("M06");
	    			}else if(hashtagList[i] == '베이스기타'){
	    				resultList.push("M07");
	    			}else if(hashtagList[i] == '드럼'){
	    				resultList.push("M08");
	    			}else if(hashtagList[i] == '바이올린'){
	    				resultList.push("M09");
	    			}else if(hashtagList[i] == '퍼스널트레이닝(PT)'){
	    				resultList.push("E00");
	    			}else if(hashtagList[i] == '크로스핏'){
	    				resultList.push("E01");
	    			}else if(hashtagList[i] == '팔레티스'){
	    				resultList.push("E02");
	    			}else if(hashtagList[i] == '요가'){
	    				resultList.push("E03");
	    			}else if(hashtagList[i] == '스키'){
	    				resultList.push("E04");
	    			}else if(hashtagList[i] == '태권도'){
	    				resultList.push("E05");
	    			}else if(hashtagList[i] == '복싱'){
	    				resultList.push("E06");
	    			}else if(hashtagList[i] == '체조'){
	    				resultList.push("E07");
	    			}else if(hashtagList[i] == '파쿠르'){
	    				resultList.push("E08");
	    			}else if(hashtagList[i] == '스케이트보드'){
	    				resultList.push("E09");
	    			}else if(hashtagList[i] == '컴퓨터활용'){
	    				resultList.push("L00");
	    			}else if(hashtagList[i] == '외국어'){
	    				resultList.push("L01");
	    			}else if(hashtagList[i] == '수학'){
	    				resultList.push("L02");
	    			}else if(hashtagList[i] == '과학'){
	    				resultList.push("L03");
	    			}else if(hashtagList[i] == '국어'){
	    				resultList.push("L04");
	    			}else if(hashtagList[i] == '사회'){
	    				resultList.push("L05");
	    			}else if(hashtagList[i] == '논술'){
	    				resultList.push("L06");
	    			}else if(hashtagList[i] == '연기'){
	    				resultList.push("L07");
	    			}else if(hashtagList[i] == '뮤지컬'){
	    				resultList.push("L08");
	    			}else if(hashtagList[i] == '마술'){
	    				resultList.push("L09");
	    			}	
	    		}
	    		return resultList;
	    	}

	    	// 버튼 hover Event
	    	$(document).on("mouseover", "#infoYesButton", function(){
	    		$(this).css("background-color","rgb(253, 126, 20)");
	    	});
			$(document).on("mouseout", "#infoYesButton", function(){
				$(this).css("background-color","rgb(255, 146, 43)");
	    	});
			$(document).on("mouseover", "#lessonYesButton", function(){
	    		$(this).css("background-color","rgb(253, 126, 20)");
	    	});
			$(document).on("mouseout", "#lessonYesButton", function(){
				$(this).css("background-color","rgb(255, 146, 43)");
	    	});
			$(document).on("mouseover", "#kitYesButton", function(){
	    		$(this).css("background-color","rgb(253, 126, 20)");
	    	});
			$(document).on("mouseout", "#kitYesButton", function(){
				$(this).css("background-color","rgb(255, 146, 43)");
	    	});
			$(document).on("mouseover", "#checkYesButton", function(){
	    		$(this).css("background-color","rgb(253, 126, 20)");
	    	});
			$(document).on("mouseout", "#checkYesButton", function(){
				$(this).css("background-color","rgb(255, 146, 43)");
	    	});
			
		});
	</script>
</body>
</html>