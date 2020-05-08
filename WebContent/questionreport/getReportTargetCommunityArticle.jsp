<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	
	<title>GetHobby</title>
	
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
	
	<!-- 메인 메뉴 CSS -->
	<link rel="stylesheet" href="/resources/css/header.css">
	<!-- 메인 메뉴 js -->
	<script src="/resources/javascript/header.js"></script>
	
	<!-- sweet alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	<style>
		.question-intro-outer-div {
		    font-size: 14px;
		    line-height: 24px;
		    background: rgb(255, 255, 255);
		    padding: 16px 24px;
		}
		
		.question-intro-top-small-text1 {
		    font-size: 11px;
		    font-weight: normal;
		    line-height: 16px;
		    letter-spacing: normal;
		    color: rgb(133, 138, 141);
		    margin: 0px;
		}
		
		.question-intro-top-small-text2 {
		    margin-bottom: 16px;
		}
		
		.question-intro-top-small-text1 * {
		    vertical-align: middle;
		}
		
		.question-intro-entered-room {
		    display: inline-block;
		}
		
		.question-intro-top-small-text-a-tag {
		    font-size: 11px;
		    font-weight: normal;
		    line-height: 16px;
		    letter-spacing: normal;
		    color: inherit;
		    margin: 0px;
		}
		
		.a-tag-right-arrow-img {
		    width: 12px;
		    height: 12px;
		}
		
		.question-intro-now-room {
		    display: inline-block;
		    color: rgb(27, 28, 29);
		}

		.question-intro-top-small-text-a-tag {
		    color: inherit !important;
		    text-decoration: none !important;
		}

		.question-intro-user-profile-div {
		    margin-bottom: 8px;
		    display: flex;
		}
		
		.user-profile-img-outer-div {
		    position: relative;
		    width: 40px;
		    height: 40px;
		    background-color: rgb(255, 255, 255);
		    border-radius: 50%;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(237, 239, 240);
		    border-image: initial;
		}
		
		.user-prifile-img-outer-span1 {
		    width: 100%;
		    height: 100%;
		    line-height: 0;
		    border-radius: 50%;
		}
		
		.user-prifile-img-outer-span2 {
		    display: block;
		    position: relative;
		    font-size: 0px;
		    overflow: hidden;
		}

		.user-profile-main-img {
		    top: 0px;
		    left: 0px;
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    position: relative;
		    opacity: 1;
		    transition: opacity 0.1s linear 0s;
		    vertical-align: middle;
		    border-style: none;
		}
	
		.user-profile-text-outer-div {
		    padding-top: 4px;
		    padding-left: 8px;
		}

		.user-profile-nickname-h3 {
		    font-size: 11px;
		    font-weight: bold;
		    line-height: 16px;
		    color: rgb(62, 64, 66);
		    margin: 0px 4px 0px 0px;
		}

		.user-profile-date-h4 {
		    font-size: 11px;
		    font-weight: normal;
		    color: rgb(168, 174, 179);
		    margin: 0px;
		}
	
		.question-cotent-outer-div1 {
		    margin-bottom: 16px;
		    word-break: break-word;
		}
		
		.question-cotent-outer-div2 {
		    font-size: 14px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    margin: 0px;
		}
		
		.question-type {
		    margin-bottom: 16px;
		    background-color: rgb(255, 255, 255);
		}

		.question-type-h5-gray {
		    font-size: 20px;
	        color: rgb(168, 174, 179);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}

		.question-type-static-text {
			font-size: 20px;
		    color: inherit !important;
		    text-decoration: none !important;
		}
		
		.question-type-h4 {
		    font-size: 20px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    margin: 0px;
		}
		
		.question-content-center-outer-div {
			position : absolute;
			left : 50%;
			transform : translate(-50%);
			width : 80%;
		}
		
		.check-answer-outer-div {
			margin-top : 230px;
		}
		
		.question-intro-outer-div {
			margin-bottom : 30px;
		}
		
		.class-community-img-outer-span {
		    display: block;
		    position: relative;
		    font-size: 0px;
		    overflow: hidden;
		}

		.class-community-text-outer-div img {
		    top: 0px;
		    left: 0px;
		    object-fit: cover;
		    position: relative;
		    opacity: 1;
		    transition: opacity 0.1s linear 0s;
		    vertical-align: middle;
    		border-style: none;
		}
		
		.class-community-text-outer-div {
		    font-size: 12px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    letter-spacing: -0.2px;
		    margin: 0px;
		}
		
		.fa-heart {
			color :red;
		}
		
		.mIsej {
		    color: rgb(237, 239, 240);
		    margin: 16px 0px;
		}
		
		.community-reply-content-right:hover {
			cursor : pointer;
		}
		
		.report-container {
		    margin-top: 16px;
		    margin-left: -16px;
		}
		
		.report-col {
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    cursor: pointer;
		    white-space: nowrap;
		    text-align: left;
		    margin-bottom: 12px;
		    border-radius: 1px;
		    flex: 1 1 0%;
		    padding: 12px 16px;
		}
		
		.report-text-non-select {
		    font-size: 16px;
		    font-weight: normal;
		    line-height: 24px;
		    letter-spacing: -0.2px;
		    color: rgb(168, 174, 179);
		    white-space: normal;
		    margin: 0px;
		    flex: 1 1 0%;
		}
		
		.report-cirlce-non-select {
		    display: inline-flex;
		    box-sizing: border-box;
		    width: 20px;
		    height: 20px;
		    margin-right: 8px;
		    flex: 0 0 auto;
		    border-width: 2px;
		    border-style: solid;
		    border-color: rgb(168, 174, 179);
		    border-image: initial;
		    border-radius: 50%;
		    cursor : pointer;
		}
		
		.report-row-div {
			display: flex;
			flex-direction: column;
		}
		
		.report-article-row-div {
			display: flex;
			flex-direction: column;
		}
		
		.report-cirlce-select {
		    display: inline-flex;
		    box-sizing: border-box;
		    width: 20px;
		    height: 20px;
		    margin-right: 8px;
		    flex: 0 0 auto;
		    border-style: solid;
		    border-image: initial;
		    border-radius: 50%;
		    border-color: rgb(62, 64, 66);
		    border-width: 4px;
		}
		
		.report-check-reason-text {
			display: inline-block;
		}
		
		.report-article-span-click {
			cursor : pointer;
		}
		
		.community-top-div {
			cursor : pointer;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$('.form-control.col-9.col-md-10.mr-1').on('keyup', function(event){
				var thisLength = $(this).val().length;
				$('.text-danger').text(thisLength);
			});
			
			$(document).on('click', '.col-2.col-md-1.btn.btn-basic', function(){
				var replyContent = $('.form-control.col-9.col-md-10.mr-1').val();
				$('.form-control.col-9.col-md-10.mr-1').val('');
				$('.form-control.col-9.col-md-10.mr-1').val(null);
				
				var articleNo = $('.class-community-number').val();
				
				var userId = $('.class-community-userId').val();
				
				var reply = new Object();
				reply.article = {
						articleNo : articleNo, 
						hobbyClass : {
							hobbyClassNo : 10000
						}
				};
				reply.replyContent = replyContent;
				
				var textDangerLength = $(this).parents('.border-bottom.mt-2.mb-4.py-4').find('.text-danger');
				$.ajax(
						{
							url : "/searchHobbyClass/json/addCommunityReply",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify(
								reply
							),
							success : function(JSONData,status) {
								
								var display = '';
								display += '<ul class="list-unstyled">';
								for(var i = 0; i < JSONData.replyList.length; i++) {
									display += '<li class="media my-4">';
									display += '<input type="hidden" class="community-reply-number-hidden" value="' + JSONData.replyList[i].replyNo  + '"/>';
									display += '<input type="hidden" class="community-reply-content-hidden-value" value="' + JSONData.replyList[i].replyContent + '" />';
									display += '<input type="hidden" class="community-reply-user-userId-hidden-value" value="' + JSONData.replyList[i].user.userId + '" />';
									// 나중에 프로필 사진 바꾸기 
									display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="...">';
									
									display += '<div class="media-body">';
									display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
									display += '<span>';
									
									if ( JSONData.replyList[i].user.nickName != null ) {
										display += '<strong>' + JSONData.replyList[i].user.nickName + '</strong>';
									}
									else {
										display += '<strong>' + JSONData.replyList[i].user.name + '</strong>';
									}
									
									display += '<small class="text-muted">' + JSONData.replyList[i].regDate + '</small>';
									display += '</span>';
									
									display += '<span class="community-reply-reset-button-span">';
									
									if ( JSONData.replyList[i].user.userId == userId ) {
										display += '<span>';
										display += '<small class="community-reply-content-right ml-3">삭제<input type="hidden" class="community-reply-content-hidden" value="0"/></small>';
										display += '<small class="community-reply-content-right ml-3">수정<input type="hidden" class="community-reply-content-hidden" value="1"/></small>';
										display += '</span>';
									}
									else if ( JSONData.replyList[i].user.userId != userId ) {
										display += '<span>';
										display += '<small class="text-muted community-reply-content-right">신고<input type="hidden" class="community-reply-content-hidden" value="2"/></small>';
										display += '</span>';
									}
									
									display += '</span>';
									
									display += '</h6>';
									display += '<div class="here-is-change-update-div">';
									display += '<p>' + JSONData.replyList[i].replyContent + '</p>'
									display += '</div>';
									display += '</div>';
									display += '</li>';
									
								}
								
								display += '</ul>';
								display += '<span class="scroll-page"></span>';
								
								$('.why-div-wrapper-need').html(display);
								
								textDangerLength.text('0');
								
								var offset = $('.this-is-gi-jun').offset();
								$('html, body').animate({scrollTop : offset.top}, 400);
							}
							
						}
				)
				
				
			});
			
			$(document).on('click', '.community-reply-content-right', function(){
				var checkTarget = $(this).find('.community-reply-content-hidden').val();
				var replyNo = $(this).parents('.media.my-4').find('.community-reply-number-hidden').val();
				var articleNo = $('.class-community-number').val();
				
				var userId = $('.class-community-userId').val();
				
				var thisButtonParent = $(this).parents('.media.my-4');
				var thisButtoncommunityContentBundle = $(this).parents('.media.my-4').find('.here-is-change-update-div');
				var contentValue = $(this).find('.community-reply-content-hidden').val();
				
				var newRightButtonSpan = $(this).parents('.media.my-4').find('.community-reply-reset-button-span');
				
				var reply = new Object();
				
				reply.replyNo = replyNo;
				reply.article = {
						articleNo : articleNo 
				}
				
				if ( checkTarget == 0 ) {
					$.ajax(
							{
								url : '/searchHobbyClass/json/deleteCommunityReply', 
								method : 'post', 
								dataType : 'json', 
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}, 
								data : JSON.stringify(
									reply
								), 
								success : function(JSONData, status) {
									
									var display = '';
									display += '<ul class="list-unstyled">';
									for(var i = 0; i < JSONData.replyList.length; i++) {
										display += '<li class="media my-4">';
										display += '<input type="hidden" class="community-reply-number-hidden" value="' + JSONData.replyList[i].replyNo  + '"/>';
										display += '<input type="hidden" class="community-reply-content-hidden-value" value="' + JSONData.replyList[i].replyContent + '" />';
										display += '<input type="hidden" class="community-reply-user-userId-hidden-value" value="' + JSONData.replyList[i].user.userId + '" />';
										// 나중에 프로필 사진 바꾸기 
										display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="...">';
										
										display += '<div class="media-body">';
										display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
										display += '<span>';
										
										if ( JSONData.replyList[i].user.nickName != null ) {
											display += '<strong>' + JSONData.replyList[i].user.nickName + '</strong>';
										}
										else {
											display += '<strong>' + JSONData.replyList[i].user.name + '</strong>';
										}
										
										display += '<small class="text-muted">' + JSONData.replyList[i].regDate + '</small>';
										display += '</span>';
										
										display += '<span class="community-reply-reset-button-span">';
										
										if ( JSONData.replyList[i].user.userId == userId ) {
											display += '<span>';
											display += '<small class="community-reply-content-right ml-3">삭제<input type="hidden" class="community-reply-content-hidden" value="0"/></small>';
											display += '<small class="community-reply-content-right ml-3">수정<input type="hidden" class="community-reply-content-hidden" value="1"/></small>';
											display += '</span>';
										}
										else if ( JSONData.replyList[i].user.userId != userId ) {
											display += '<span>';
											display += '<small class="text-muted community-reply-content-right">신고<input type="hidden" class="community-reply-content-hidden" value="2"/></small>';
											display += '</span>';
										}
										
										display += '</span>';
										
										display += '</h6>';
										display += '<div class="here-is-change-update-div">';
										display += '<p>' + JSONData.replyList[i].replyContent + '</p>'
										display += '</div>';
										display += '</div>';
										display += '</li>';
										
									}
									
									display += '</ul>';
									display += '<span class="scroll-page"></span>';
									
									$('.why-div-wrapper-need').html(display);
									
									Swal.fire({
										icon : 'success',
										title : '댓글 삭제 완료',
										showConfirmButton : false, 
										allowOutsideClick : true,
										timer : 800
									});
								}
							}
					)
				} // 댓글 삭제 구간
				else if ( checkTarget == 1 ) {
					var display = '';
					// 기존 댓글 양식으로 초기화시키기 ------------------------------------------
					var resetTargetLength = $('.media.my-4').length;
					
					for (var i = 0; i < resetTargetLength; i++) {
						
						var resetDisplay = '';
						
						var resetReplyContent = $('.media.my-4').eq(i).find('.community-reply-content-hidden-value').val();
						var replyUserId = $('.community-reply-reset-button-span').eq(i).parents('.media.my-4').find('.community-reply-user-userId-hidden-value').val();
						var loginUserId = $('.user-id-hidden').val();
						
						var thisReplyUserId = $('.media.my-4').eq(i).find('.community-reply-user-userId-hidden-value').val();
						
						if ( thisReplyUserId == userId ) {
							resetDisplay += '<small class="community-reply-content-right ml-3">삭제<input type="hidden" class="community-reply-content-hidden" value="0"/></small>';
							resetDisplay += '<small class="community-reply-content-right ml-3">수정<input type="hidden" class="community-reply-content-hidden" value="1"/></small>';
						}
						else {
							resetDisplay += '<small class="community-reply-content-right">신고<input type="hidden" class="community-reply-content-hidden" value="2"/></small>';
						}
						
						$('.community-reply-reset-button-span').eq(i).html(resetDisplay);
						
						var resetTextAreaDisplay = '<p>' + resetReplyContent + '</p>';
						$('.media.my-4').find('.here-is-change-update-div').eq(i).html(resetTextAreaDisplay);
					}
					// 기존 댓글 양식으로 초기화시키기 ------------------------------------------
					
					var replyContent = thisButtonParent.find('.community-reply-content-hidden-value').val();
					
					display += '<textarea class="form-control community-reply-update-edit-textarea" rows="3" maxlength="500">' + replyContent + '</textarea>';
					display += '<span class="m-1"><strong class="text-danger">' + replyContent.length + '</strong> / 500자</span>';
					
					thisButtoncommunityContentBundle.html(display);
					
					var rightButtonDisplay = '';
					rightButtonDisplay += '<span>';
					rightButtonDisplay += '<small class="community-reply-content-right community-reply-content-update-right ml-3">취소<input type="hidden" class="community-reply-content-update-hidden" value="0"/></small>';
					rightButtonDisplay += '<small class="community-reply-content-right community-reply-content-update-right ml-3">수정<input type="hidden" class="community-reply-content-update-hidden" value="1"/></small>';
					rightButtonDisplay += '</span>';
//					$(this).parents('.media.my-4').find('.community-reply-reset-button-span').html(rightButtonDisplay);
					newRightButtonSpan.html(rightButtonDisplay);
					// 댓글 수정 양식으로 바꿔치기 ------------------------------------------------------------------- 
					
					$('.community-reply-update-edit-textarea').focus();
					
					var textarea = document.getElementsByClassName('community-reply-update-edit-textarea');
					textarea[0].setSelectionRange(replyContent.length, replyContent.length);
					
					$('.update-textarea-check').val("1");
					
					
				}
				else if ( checkTarget == 2 ) {
					console.log('신고 hidden value ? : ' + contentValue);
					
					var replyText = $(this).parents('.media.my-4').find('.community-reply-content-hidden-value').val();
					
					if ( replyText.length <= 10 ) {
						replyText = '(' + replyText + ')';
					}
					else {
						replyText = '(' + replyText.substr(0, 10) + '...)'
					}
					
					$('.report-reply-hidden-content').val( replyText );
					
					replyText = $('.report-reply-hidden-content').val();
					
					console.log('replyText ? : ' + replyText);
					
					$('.report-reply-number-hidden').val(replyNo);
					
					var display = '';
					display += '<div class="report-check-reason-text"><h6>해당 댓글' + replyText + '을 <span class="text-danger">부적절한 내용</span> 사유로 신고하시겠습니까?</h6></div>';
					
					$('.report-reply-content-check').html(display);
					
					$('.report-madal-total').modal('show');
					
				}
			});
			
			$(document).on('keyup', '.community-reply-update-edit-textarea', function(event){
				var thisLength = $(this).val().length;
				$(this).parents('.here-is-change-update-div').find('.text-danger').text(thisLength);
			});
			
			$(document).on('click', '.community-reply-content-update-right', function(){
				var updateValue = $(this).find('.community-reply-content-update-hidden').val();
				var display = '';
				
				var userId = $('.user-id-hidden').val();
				var replyUserId = $(this).parents('.media.my-4').find('.community-reply-user-name').text().trim();
				
				var newRightButtonSpan = $(this).parents('.media.my-4').find('.community-reply-reset-button-span');
				var newReplyTextDiv = $(this).parents('.media.my-4').find('.here-is-change-update-div');
				var newReplyContent = $(this).parents('.media.my-4').find('.community-reply-content-hidden-value').val();
				
				var replyNo = $(this).parents('.media.my-4').find('.community-reply-number-hidden').val();
				var targetRightButton = $(this).parents('.media.my-4').find('.community-reply-reset-button-span');
				var targetReplyContentTextArea = $(this).parents('.media.my-4').find('.here-is-change-update-div');
				var hiddenReplyContent = $(this).parents('.media.my-4').find('.community-reply-content-hidden-value');
				
				if ( updateValue == 0 ) {
					display += '<small class="community-reply-content-right ml-3">삭제<input type="hidden" class="community-reply-content-hidden" value="0"/></small>';
					display +=  '<small class="community-reply-content-right ml-3">수정<input type="hidden" class="community-reply-content-hidden" value="1"/></small>';
					
					newRightButtonSpan.html(display);
					
					var replyContentDisplay = '';
					replyContentDisplay += '<p>' + newReplyContent + '</p>';
					newReplyTextDiv.html(replyContentDisplay);

					$('.update-textarea-check').val('0');
					
				}
				else if ( updateValue == 1 ) {
					var replyContent = $('.community-reply-update-edit-textarea').val();
					
					$.ajax(
							{
								url : "/searchHobbyClass/json/updateCommunityReply", 
								method : "post", 
								dataType : "json", 
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								data : JSON.stringify({
									replyNo : replyNo, 
									replyContent : replyContent 
								}),
								success : function(JSONData, status){
									var display = '';
									display += '<small class="community-reply-content-right ml-3">삭제<input type="hidden" class="community-reply-content-hidden" value="0"/></small>';
									display +=  '<small class="community-reply-content-right ml-3">수정<input type="hidden" class="community-reply-content-hidden" value="1"/></small>';
									
									targetRightButton.html(display);
									hiddenReplyContent.val(JSONData.reply.replyContent);
									
									var textAreaDisplay = '';
									textAreaDisplay += '<p>' + JSONData.reply.replyContent + '</p>';
									targetReplyContentTextArea.html(textAreaDisplay);
									
									
									Swal.fire({
										icon : 'success',
										title : '댓글 수정 완료',
										showConfirmButton : false, 
										allowOutsideClick : true,
										timer : 800
									});
								}
							}
					)
					
					
				}
				
			})
			
			// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
			$('.report-row-div').on('click', function(){
				$('.report-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
				$('.report-container').find('.report-div').attr('class', 'report-div report-text-non-select');
				
				$(this).find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-select');
				$(this).find('.report-div').attr('class', 'report-div report-text-select');
				
				var stateValue = $(this).find('.report-hidde-value').val();
				
				var buttonText = $(this).find('.report-div').text().trim();
				
				var replyContent = $('.report-reply-hidden-content').val();
				
				$('.report-hidden-input-value').val(stateValue);
				console.log( $('.report-hidden-input-value').val() + ' / ' + buttonText );
				
				var display = '';
				display += '<div class="report-check-reason-text">해당 댓글' + replyContent + '을 <span class="text-danger">' + buttonText + '</span> 사유로 <br/>신고하시겠습니까?</div>';
				$('.report-reply-content-check').html(display);
			});
			// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
			
			// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
			$('.report-madal-total').on('hidden.bs.modal', function(){
				$('.report-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
				$('.report-container').find('.report-div').attr('class', 'report-div report-text-non-select');
				
				$('.report-container').find('.report-cirlce').eq(0).attr('class', 'report-cirlce report-cirlce-select');
				$('.report-container').find('.report-div').eq(0).attr('class', 'report-div report-text-select');
				
				console.log('modal이 닫히긴 했다');
			})
			// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
			
			$('.modal-to-report-process-button').on('click', function(){
				var reportCode = $('.report-hidden-input-value').val();
				var replyNo = $('.report-reply-number-hidden').val();
				var report = new Object();
				report.replyNo = replyNo;
				report.reportCode = reportCode;
				
				$.ajax(
						{
							url : "/questionReport/json/addReport",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify(
								report		
							),
							success : function(JSONData, status) {
								console.log('JSONData.result ? : ' + JSONData.result);
								
								if (JSONData.result == 'true') {
									$('.report-madal-total').modal('hide');
									$('.report-navi-span-text').text('신고가 정상적으로 접수되었습니다.');
									$('.report-result-modal').modal('show');
								}
								else {
									$('.report-madal-total').modal('hide');
									$('.report-navi-span-text').text('이미 신고한 상태입니다.');
									$('.report-result-modal').modal('show');
								}
							}
						}
				)
			})
			
			$('.report-result-modal-close-button').on('click', function(){
				$('.modal-backdrop').remove();
			})
			
			$('.report-article-span-click').on('click', function(){
				var articleNo = $('.class-community-number').val();
				$('.report-article-number-hidden').val(articleNo);
				
				var display = '';
				display += '<div class="report-article-reply-content-check"><h6>해당 게시글을 <span class="text-danger">부적절한 내용</span> 사유로<br/> 신고하시겠습니까?</h6></div>';
				
				$('.report-article-reply-content-check').html(display);
				
				$('.report-article-madal-total').modal('show');
			})
			
			// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
			$('.report-article-row-div').on('click', function(){
				$('.report-article-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
				$('.report-article-container').find('.report-div').attr('class', 'report-div report-text-non-select');
				
				$(this).find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-select');
				$(this).find('.report-div').attr('class', 'report-div report-text-select');
				
				var stateValue = $(this).find('.report-hidde-value').val();
				
				var buttonText = $(this).find('.report-div').text().trim();
				
				$('.report-article-hidden-input-value').val(stateValue);
				
				var display = '';
				display += '<div class="report-article-check-reason-text">해당 게시글을 <span class="text-danger">' + buttonText + '</span> 사유로 <br/>신고하시겠습니까?</div>';
				$('.report-article-reply-content-check').html(display);
			});
			// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
			
			// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
			$('.report-article-madal-total').on('hidden.bs.modal', function(){
				$('.report-article-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
				$('.report-article-container').find('.report-div').attr('class', 'report-div report-text-non-select');
				
				$('.report-article-container').find('.report-cirlce').eq(0).attr('class', 'report-cirlce report-cirlce-select');
				$('.report-article-container').find('.report-div').eq(0).attr('class', 'report-div report-text-select');
			})
			// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
			
			$('.modal-to-report-article-process-button').on('click', function(){
				var reportCode = $('.report-article-hidden-input-value').val();
				var articleNo = $('.report-article-number-hidden').val();
				
				var report = new Object();
				report.articleNo = articleNo;
				report.reportCode = reportCode;
				
				$.ajax(
						{
							url : "/questionReport/json/addReport",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify(
								report		
							),
							success : function(JSONData, status) {
								console.log('JSONData.result ? : ' + JSONData.result);
								
								if (JSONData.result == 'true') {
									$('.report-article-madal-total').modal('hide');
									$('.report-navi-span-text').text('신고가 정상적으로 접수되었습니다.');
									$('.report-result-modal').modal('show');
								}
								else {
									$('.report-article-madal-total').modal('hide');
									$('.report-navi-span-text').text('이미 신고한 상태입니다.');
									$('.report-result-modal').modal('show');
								}
							}
						}
				)

			})
			
			$('.report-result-modal-close-button').on('click', function(){
				$('.modal-backdrop').remove();
			})
			
			$('.community-top-div').on('click', function(){
				var checkTarget = $(this).find('.community-top-hidden-value').val();
				var hobbyClassNo = "${article.hobbyClass.hobbyClassNo}";
				
				console.log(checkTarget + ' / ' + hobbyClassNo);
			})
		})
		
	</script>
</head>
<body>
	<input type="hidden" class="class-community-hobby-class-number" value="${article.hobbyClass.hobbyClassNo }" />
	<input type="hidden" class="class-community-number" value="${article.articleNo }" />
	<input type="hidden" class="class-community-userId" value="${sessionScope.user.userId }" />
	<input type="hidden" class="update-textarea-check" value="0" />
	
	<br/><br/>
		<div class="contaier">
			<div class="row">	
				<div class="col-md-12 question-intro-col">	
					<div class="question-content-center-outer-div">
	
						<div class="question-intro-top-small-text1 question-intro-top-small-text2">
							<div class="community-top-div question-intro-entered-room">
								<!-- 기존의 클래스 상세보기로 이동하는 링크 -->
								<a class="question-intro-top-small-text-a-tag">
									클래스 소개
								</a>
									<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
									<input type="hidden" class="community-top-hidden-value" value="0" />
							</div>
							<div class="community-top-div question-intro-entered-room">
								<!-- 기존의 클래스 상세보기로 이동하는 링크 -->
								<a class="question-intro-top-small-text-a-tag">
									클래스 커뮤니티 
								</a>
									<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
									<input type="hidden" class="community-top-hidden-value" value="1" />
							</div>
							<div class="community-top-div question-intro-now-room">
								<a class="question-intro-top-small-text-a-tag">
									user01님의 글
								</a>
							</div>
						</div>
					
						<div class="question-intro-user-profile-div">
							<div size="40" class="user-profile-img-outer-div">
								<span class="user-profile-img-outer-span1 user-profile-img-outer-span2">
									<!-- 나중에 유저 프로필 사진으로 바꿀것  -->
									<img src="/resources/image/min/default-profile.jpg" class="user-profile-main-img rounded-circle" />
								</span>
							</div>
							<div class="user-profile-text-outer-div">
								<h3 class="user-profile-nickname-h3">
									<!-- 나중에 유저 닉네임으로 바꿀것 -->
									유저01
								</h3>
								<h4 class="user-profile-date-h4">
									2020-02-02
								</h4>
							</div>
						</div>
						
						<div class="question-cotent-outer-div1 question-cotent-outer-div2">
							<!-- 이미지 삽입구간 -->
							<!--  근데 필요없어짐...서머노트 안에 다 적용된다함 
							<div class="class-community-img-outer-div mb-3">
								<span class="class-community-img-outer-span">
									
									<img src="/images/min/375xauto.jpeg" class="class-community-img-tag" />
								</span>
							</div>
							-->
							<!-- 이미지 삽입구간 -->
							
							<!-- 클커 입력내용 출력구간 -->
							<div class="class-community-text-outer-div">
								${article.articleContent }
							</div>
							<!-- 클커 입력내용 출력구간 -->
			
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>