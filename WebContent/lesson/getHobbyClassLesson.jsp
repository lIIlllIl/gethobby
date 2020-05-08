<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<link href="https://vjs.zencdn.net/7.6.6/video-js.css" rel="stylesheet" />
  	<script src="http://vjs.zencdn.net/7.6.6/video.js"></script>
	
	<!-- css import -->
	<link href="../resources/css/min/getHobbyClassLesson.css" rel="stylesheet" />
	
	<!-- javascript import -->
	<script src="../resources/javascript/min/getHobbyClassLesson.js"></script>
	
	<link rel="stylesheet" href="/resources/css/sol/article.css">
	
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Header js & css -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	
</head>
<body>
	<jsp:include page="/common/header.jsp"/>
	
	<input type="hidden" class="lesson-number" value="${lesson.lesson.lessonNo}" />
	<input type="hidden" class="class-number" value="${lesson.lesson.hobbyClass.hobbyClassNo}" />
	<input type="hidden" class="total-count" value="${lesson.lesson.totalCount}" />
	<input type="hidden" class="current-count" value="${lesson.lesson.currentCount}" />
	<input type="hidden" class="user-id-hidden" value="${user.userId }" />
	<input type="hidden" class="update-textarea-check" value="0" />
	<input type="hidden" class="lesson-reply-list-max-page" value="${resultPage.maxPage }"/>
	<input type="hidden" class="lesson-reply-list-current-page" />
	<input type="hidden" class="lesson-user-report-count" value="${sessionScope.user.totalReport }" />
	<input type="hidden" class="lesson-video-name" value="${lesson.lesson.lessonVideo }" />
	
	<div class="container-fluid">
		
		<div class="row mt-5">
			<div class="col-lg-7 this-is-col-scroll-height">
				
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
						<video id="lesson-video" class="video-js vjs-default-skin vjs-big-play-centered">	
							<source id="video-source" src="http://192.168.0.144:3000/video/${lesson.lesson.lessonVideo }" type="application/x-mpegURL">
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
					
					<!-- 댓글 숨기기용 -->
					<div class="lesson-reply-content-total-outer-div">
						<!-- 댓글 안내 구간 시작 -->
						<div class="KlassCommentContainer__Header-kq9l9j-1 eiMOfM mt-3">
							<h4 class="sc-bdVaJa cZzCCw KlassCommentContainer__Title-kq9l9j-2 dPaGDF">
								댓글 
								<div class="sc-bdVaJa hBKkTB KlassCommentContainer__Count-kq9l9j-3 iYqxgO">
									${resultPage.totalCount } 개
								</div>
							</h4>
						</div>
						<!-- 댓글 안내 구간 끝 -->
						
						<!-- 댓글 선 구간 -->
						<hr class="KlassCommentContainer__Hr-kq9l9j-6 mIsej">
						
						<!-- 댓글 작성 양식 배낀거 -->
						<div class="border-bottom mt-2 mb-4 py-4">
				            <div class="form-row d-flex justify-content-center">
				                <textarea class="form-control col-9 col-md-10 mr-1" id="reply-textarea" name="replyContent" rows="3" maxlength="500"></textarea>
				                <button class="col-2 col-md-1 btn btn-basic">등록</button>
				            </div>
				            <span class="m-3 m-md-5"><strong class="text-danger">0</strong> / 500자</span>
				        </div>
						<!-- 댓글 작성 양식 배낀거 -->								
						
						<!-- 댓글 작성 후 삭제시킬 기준점이 되는 span -->
						<span class="this-is-gi-jun"></span>
						
						<div class="why-div-wrapper-need">
							<ul class="list-unstyled">
								<c:forEach var="reply" items="${replyList }">
									<li class="media my-4">
										<input type="hidden" class="lesson-reply-number-hidden" value="${reply.replyNo }"/>
										<input type="hidden" class="lesson-reply-content-hidden-value" value="${reply.replyContent }" />
										<input type="hidden" class="lesson-reply-user-userId-hidden-value" value="${reply.user.userId }" />
										
										<!-- <img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="..."> -->
										<!-- <span class="lesson-reply-profile-image-outer-span"> -->
										<!-- <img src="/resources/image/logo/${!empty reply.user.profileImage ? reply.user.profileImage : 'unnamed.jpg'}" class="mr-3 lesson-reply-profile-image" onError="this.src='/resources/image/logo/unnamed.jpg'"> --%>
										<!-- </span> -->
										
										<c:if test="${!empty reply.user.profileImage }">
											<img src="/resources/image/woo/${reply.user.profileImage}" class="mr-3 lesson-reply-profile-image" onError="this.src='/resources/image/logo/unnamed.jpg'">
										</c:if>
										<c:if test="${empty reply.user.profileImage }">
											<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src='/resources/image/logo/unnamed.jpg'">
										</c:if>
										
										<div class="media-body">
											<h6 class="mt-0 mb-1 d-flex justify-content-between">
												<span>
													<strong>${ !empty reply.user.nickName ? reply.user.nickName : reply.user.name }</strong>
													<small class="text-muted">${reply.regDate }</small>
												</span>
												<span class="lesson-reply-reset-button-span">
													<span>
													<c:if test="${user.userId eq reply.user.userId }">
															<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>
															<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>
													</c:if>
													<c:if test="${user.userId != reply.user.userId }">
															<small class="lesson-reply-content-right">신고<input type="hidden" class="lesson-reply-content-hidden" value="2"/></small>
													</c:if>
													</span>
												</span>
											</h6>
											<div class="here-is-change-update-div">
												<c:if test="${reply.totalReport >= 5 }">
													<p class="blind-reply-content">블라인드 처리된 댓글입니다.</p>
												</c:if>
												<c:if test="${reply.totalReport < 5 }">
													<p>${reply.replyContent }</p>
												</c:if>
											</div>
										</div>
									</li>
									<hr/>
								</c:forEach>
								
								<!-- 검색결과 출력될 span -->
							</ul>
							
							<span class="scroll-page"></span>
							
						</div>
					</div>
					
				</div>
			</div>
			<div class="col-lg-5 fixed-right-tool-bar">
			<!-- <div class="col-lg-4 fixed-bottom"> -->
				<div class="right-fixed-div-outer">
					<div class="right-fixed-div-inner">
						<span class="span-image-tag-outer">
							<img class="right-fixed-img-tag" src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" />
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
				<div class="lesson-project-content-outer-div overflow-auto">
					<h4 class="lesson-project-title-h4-1 lesson-project-title-h4-2">수업노트</h4>
					<div class="lesson-project-real-content-outer-div">
						<span class="lesson-project-outer-div-of-many-p overflow-auto ">
							<p><strong>[WELCOME]</strong> ${lesson.lesson.lessonTitle }</p>
							<p><img src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" /></p>
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
							<img class="right-fixed-img-tag" src="/images/hobbyclass/${lesson.lesson.hobbyClass.hobbyClassImage }" />
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
	
	<!-- 신고 모달창 시작 -->
	<div class="modal fade report-madal-total" tabindex="-1" role="dialog" aria-labelledby="report-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="report-modal-label">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container report-container">
						<input type="hidden" class="report-reply-number-hidden" />
						<input type="hidden" class="report-hidden-input-value" value="0" />
						<input type="hidden" class="report-reply-hidden-content" />
						<div class="row report-row-div">
							<div class="col-sm-12 report-col">
								<div color="#3e4042" class="report-cirlce report-cirlce-select"></div>
								<div color="#3e4042" class="report-div report-text-select">
									부적절한 내용
								</div>
								<input type="hidden" class="report-hidde-value" value="0" />
							</div>
						</div>
						<br/>
						<div class="row report-row-div">
							<div class="col-sm-12 report-col">
								<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
								<div color="#3e4042" class="report-div report-text-non-select">
									광고
								</div>
								<input type="hidden" class="report-hidde-value" value="1" />
							</div>
						</div>
						<br/>
						<div class="row report-row-div">
							<div class="col-sm-12 report-col">
								<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
								<div color="#3e4042" class="report-div report-text-non-select">
									욕설
								</div>
								<input type="hidden" class="report-hidde-value" value="2" />
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-sm-12">
								<span class="report-reply-content-check">
									
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-basic modal-to-report-process-button">신고</button>
					<button type="button" class="btn btn-basic" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 모달창 끝 -->
	
	<!-- 신고처리 완료 모달창 시작 -->
	<div class="modal fade report-result-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="report-result-modal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title report-result-modal" id="report-result-modal">신고 결과 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="report-navi-span-text">신고가 정상적으로 접수되었습니다.</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-basic report-result-modal-close-button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고처리 완료 모달창 끝 -->
	
	<script type="text/javascript">	
		// 바로 video.js 생성 ----------------------------------------------
		
		var video = videojs('lesson-video', {
				controls : true,
				autoplay : false, 
				preload : 'auto', 
				playbackRates: [0.5, 1, 1.5, 2, 2.5]
		})
		
		// var video = videojs('lesson-video');
		// 바로 video.js 생성 ----------------------------------------------
	
		// window.onload 이벤트 -------------------------------------------
		window.onload = function(){
			var totalTimes = "${lesson.totalTimes }";
			var lessonNo = "${lesson.lesson.lessonNo }";
			var hobbyClassNo = "${lesson.lesson.hobbyClass.hobbyClassNo}";
			var currentTimes = "${lesson.currentTimes }";
			var maxTimes = "${lesson.maxTimes }";

			console.log('getLesson 입장');
			console.log('totalTimes ? : ' + totalTimes);
	
			if (totalTimes == 0){
				console.log('addLessonTimes 동작');
				
				$.ajax(
						{
							url : "/lesson/json/addLessonTimes",
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								lessonNo : lessonNo,
								hobbyClassNo : hobbyClassNo
							}),
							success : function(JSONData, status) {
								console.log(JSONData.result);
							}
						}
				)
				
			}
			else if(currentTimes != 0) {
				console.log('이어보기가 가능합니다. 시작 구간은 : ' + currentTimes);
				video.currentTime(currentTimes);
			}
		}
		// window.onload 이벤트 -------------------------------------------
		
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
		
		// window.onbeforeunload 이벤트 -----------------------------------
		window.onbeforeunload = function(e) {
			e = e || window.event; 
			
			var maxTimes = "${lesson.maxTimes }";
			var lessonNo = "${lesson.lesson.lessonNo }";
			var hobbyClassNo = "${lesson.lesson.hobbyClass.hobbyClassNo}";
			var currentTimes = Math.floor( video.currentTime() );
			var totalTimes = Math.floor( video.duration() );
			$.ajax(
					{
						url : "/lesson/json/updateLessonTimes", 
						method : "post",  
						dataType : "json", 
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							currentTimes :currentTimes,
							maxTimes : maxTimes, 
							lessonNo : lessonNo, 
							hobbyClassNo : hobbyClassNo,
							totalTimes : totalTimes 
						}),
						success : function(JSONData, status) {
							console.log(JSONData.result);
						}
					}
			)
		}
		// window.onbeforeunload 이벤트 -----------------------------------
		
		$(function(){
			$(document).on('click', video, function(){
				if ( video.paused() ) {
					$('.vjs-big-play-button').show();
				}
				else {
					$('.vjs-big-play-button').hide();
				}
			})
		})
	</script>

	
</body>
</html>