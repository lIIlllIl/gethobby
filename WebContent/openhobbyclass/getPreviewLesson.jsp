<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- //2020-02-24 Git Commit --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GetHobby</title>
	<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 웹사이트 파비콘 -->
    <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
    <link rel="icon" href="/resources/image/logo/logo-favicon.png">
    
    <!-- favicon 404 에러 안보이게  -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">


    <!--부트스트랩 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />



    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	<!-- video.js CDN -->
	<link href="http://vjs.zencdn.net/4.6.1/video-js.css" rel="stylesheet">
  	<script src="http://vjs.zencdn.net/4.6.1/video.js"></script>
	
	<!-- css import -->
	<link href="../resources/css/min/getHobbyClassLesson.css" rel="stylesheet" />
	
	<!-- javascript import -->
	<script src="/resources/javascript/min/getPreviewLesson.js"></script>
	
	<link rel="stylesheet" href="/resources/css/sol/article.css">
	
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	
</head>
<body>

	<input type="hidden" class="lesson-number" value="${lesson.lesson.lessonNo}" />
	<input type="hidden" class="class-number" value="${lesson.lesson.hobbyClass.hobbyClassNo}" />
	<input type="hidden" class="total-count" value="${lesson.lesson.totalCount}" />
	<input type="hidden" class="current-count" value="${lesson.lesson.currentCount}" />
	<input type="hidden" class="user-id-hidden" value="${user.userId }" />
	<input type="hidden" class="update-textarea-check" value="0" />
	<input type="hidden" class="lesson-reply-list-max-page" value="${resultPage.maxPage }"/>
	<input type="hidden" class="lesson-reply-list-current-page" />
	<div class="container-fluid">
		
		<div class="row mt-5">
			<div class="col-lg-8 this-is-col-scroll-height">
				
				<!-- <div class="overflow-auto p-3 mb-3 mb-md-0 mr-md-3 bg-light" style="max-height: 95%;"> -->
				<div> 
					<!-- 비디오 위에 클래스 제목 그거 시작 -->
					<div class="lesson-top-title-div mb-3">
						<span class="KlassTicketPage__BetaText-w7jpzj-9 eZmfKJ">내 클래스</span>	
						<span class="lesson-top-title">${lesson.lesson.hobbyClass.hobbyClassName }</span>
					</div>
					<!-- 비디오 위에 클래스 제목 그거 끝 -->
					
					<div class="lesson-header-total">
						<!-- 비디오 헤더 타이틀 클릭시 모달창 뜨면서 레슨 모두 뜨는 그거 시작 -->
						<div class="lesson-header-title-div mb-3">
							<h3 class="lesson-header-title-modal1 lesson-header-title-modal2">${lesson.lesson.lessonTitle } 강의입니다.</h3>
							<svg width="24" height="24" viewBox="0 0 24 24">
								<path fill="#3E4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z">
								</path>
							</svg>
						</div>
						<!-- 비디오 헤더 타이틀 클릭시 모달창 뜨면서 레슨 모두 뜨는 그거 끝 -->
						
						<!-- 화살표 시작 -->
						<div class="lesson-header-total-arrow">
							<button type="button" class="btn btn-basic left-arrow mr-3"><i class="fas fa-arrow-left"></i>&nbsp;이전 강의</button>
							<button type="button" class="btn btn-basic right-arrow mr-3">다음 강의&nbsp;<i class="fas fa-arrow-right"></i></button>
						</div>
						<!-- 화살표 끝 -->
					</div>
					
					<!-- 비디오 시작 --> 

					<div class="video-div align-self-center">
						<video id="lesson-video" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" width="985px" height="554px" data-setup='{ "playbackRates": [0.5, 1, 1.5, 2] }'>
						<!-- <video id="lesson-video" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" data-setup='{ "playbackRates": [0.5, 1, 1.5, 2] }'> -->
						 	<!--poster="http://계정명.cache.iwinv.net/thumbnail/Sample.jpg"  -->
							<source src="http://localhost:3000/videoPreview/${lesson.lesson.lessonVideo }" type='video/mp4'>
						</video>
					</div> 

					<!-- 비디오 끝 -->
		
					<!-- 과제알림 시작 -->
					<div class="mission mt-3">
						<div class="MissionGuide__Label-qd0n4y-1 cMUzqH">
							<span class="MissionGuide__Circle-qd0n4y-3 haCSUR">
								<svg width="10" height="10" viewBox="0 0 24 24">
									<path fill="#FFF" fill-rule="evenodd" d="M7.673 19.972c-1.03.542-1.706.051-1.51-1.096l.827-4.819-3.501-3.413c-.834-.813-.575-1.607.577-1.774l4.837-.703 2.165-4.384c.515-1.044 1.35-1.044 1.865 0l2.164 4.384 4.838.703c1.152.167 1.41.961.577 1.774l-3.501 3.413.826 4.819c.196 1.147-.478 1.638-1.509 1.096L12 17.697l-4.327 2.275z"></path>
								</svg>
							</span>
							<div class="sc-bdVaJa dVjooD MissionGuide__LabelText-qd0n4y-2 iATRec">
								MISSION
							</div>
							<div class="sc-bdVaJa hBKkTB ml-2">${lesson.lesson.lessonProject }</div>
						</div>
					</div>
					<!-- 과제알림 끝 -->
					
				</div>
			</div>
			<div class="col-lg-4 fixed-right-tool-bar">
			<!-- <div class="col-lg-4 fixed-bottom"> -->
				<div class="right-fixed-div-outer">
					<div class="right-fixed-div-inner">
						<span class="span-image-tag-outer">
							<c:if test="${!empty lesson.lesson.hobbyClass.hobbyClassImage }">
								<img class="right-fixed-img-tag" src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" />
							</c:if>
							<c:if test="${empty lesson.lesson.hobbyClass.hobbyClassImage }">
								<img class="right-fixed-img-tag" src="/resources/image/gon/ohcbImage.png" />
							</c:if>
						</span>
						<div class="div-tag-text-outer">
							<div class="div-tag-text-inner1 div-tag-text-inner2">
								${lesson.lesson.hobbyClass.hobbyClassName } 
							</div>
							<span class="right-fixed-button-outer-span">
								<button type="button" class="btn btn-basic go-to-the-class-intro-button">클래스 미리보기</button>
							</span>
						</div>
					</div>
				</div>
				<div class="lesson-project-content-outer-div overflow-auto">
					<h4 class="lesson-project-title-h4-1 lesson-project-title-h4-2">수업노트</h4>
					<div class="lesson-project-real-content-outer-div">
						<span class="lesson-project-outer-div-of-many-p overflow-auto ">
							<p><strong>[WELCOME]</strong> ${lesson.lesson.lessonTitle }</p>
							<p>
								<c:if test="${!empty lesson.lesson.hobbyClass.hobbyClassImage }">
									<img class="right-fixed-img-tag" src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" />
								</c:if>
								<c:if test="${empty lesson.lesson.hobbyClass.hobbyClassImage }">
									<img class="right-fixed-img-tag" src="/resources/image/gon/ohcbImage.png" />
								</c:if>
							</p>
							<p>${lesson.lesson.lessonContent }</p>
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row small-width-row">
			<div class="col-lg-12">
				<div class="right-fixed-div-outer">
					<div class="right-fixed-div-inner">
						<span class="span-image-tag-outer">
							<c:if test="${!empty lesson.lesson.hobbyClass.hobbyClassImage }">
								<img class="right-fixed-img-tag" src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" />
							</c:if>
							<c:if test="${empty lesson.lesson.hobbyClass.hobbyClassImage }">
								<img class="right-fixed-img-tag" src="/resources/image/gon/ohcbImage.png" />
							</c:if>	
						</span>
						<div class="div-tag-text-outer">
							<div class="div-tag-text-inner1 div-tag-text-inner2">
								${lesson.lesson.hobbyClass.hobbyClassName } 
							</div>
							<span class="right-fixed-button-outer-span">
								<button type="button" class="btn btn-basic go-to-the-class-intro-button">클래스 살펴보기</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 레슨 제목 선택 시 뜨는 모달창 시작 -->
	<div class="modal fade" id="lesson-content-modal" tabindex="-1" role="dialog" aria-labelledby="lesson-content-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<h5 class="modal-title modal-title-h5">클래스 강의 선택</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				</div>
				<div class="modal-body">
					<ul class="outer-modal-ul">
						<li class="outer-modal-li">
							<h4 class="outer-modal-ul-h41 outer-modal-ul-h42">
								<span class="outer-modal-title-span1 outer-modal-title-span2">WECOME</span>
								${lesson.lesson.hobbyClass.hobbyClassName }
							</h4>
						</li>
						<ul class="inner-modal-ul">
							
						</ul>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 레슨 제목 선택 시 뜨는 모달창 끝 -->
	
	<script type="text/javascript">	
	
		$(function(){
		
			//
			$(document).on("click", ".go-to-the-class-intro-button:contains('클래스 미리보기')", function(){
				self.location = "/searchHobbyClass/getPreview?hobbyClassNo="+$(".class-number").val();
			});
			
			// 바로 video.js 생성 ----------------------------------------------
			
			var video = videojs('lesson-video', {
					controls : true,
					autoplay : false, 
					preload : 'auto', 
					playbackRates: [0.5, 1, 1.5, 2, 2.5] 
			})
			
			// var video = videojs('lesson-video');
			// 바로 video.js 생성 ----------------------------------------------
			
			// keydown 이벤트 ----------------------------------------------
			$(document).on('keydown', function(event){
				var updatetextarea = $('.update-textarea-check').val();
				var checkFocusTextArea = $('.form-control.col-9.col-md-10.mr-1:focus');
				
					if ( checkFocusTextArea.length == 0 ) {
						var currentTime = Math.floor(video.currentTime());
						var duration = Math.floor(video.duration());
			
						if ( event.keyCode == '37' ) {
							
							if ( currentTime - 10 <= 0 ) {
								video.currentTime(0);
								return;
							}
							video.currentTime( ( currentTime - 10 ) ); 
						}
						else if ( event.keyCode == '39' ) {
							
							if ( currentTime + 10 >= duration ) {
								video.currentTime( duration );
								return;
							}
							video.currentTime( ( currentTime + 10 ) );
						}
					}
			})
			// keydown 이벤트 ----------------------------------------------
		});
	</script>

	
</body>
</html>