<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">
	
	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	<!-- owl -->
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
	<script src="../resources/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

	<!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Header js & css -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	
	<link rel="stylesheet" href="/resources/css/min/getHobbyClassLesson.css" />
	
	<script type="text/javascript">
		$(function(){
			// spinner 가리기
			$('.spinner-border').hide();
		
			var hobbyClassNo = $('.hidden-hobby-class-number').val();	
			
			// 클래스 한줄평인데 일단 다 가리고 보자
			$('.end-class').hide();
			$('.non-end-class').hide();
			// 클래스 한줄평인데 일단 다 가리고 보자
			
			// 쿠키 저장용 ajax --------------------------------------------------------	
			$.ajax(
					{
						url : "/myHobbyClass/json/addCookies",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : hobbyClassNo	
						}),
						success : function(JSONData, status) {
							console.log('addCookies run');
							console.log(JSONData);
						}
						
					}
			)
			// 쿠키 저장용 ajax --------------------------------------------------------	
			
			// 제발 사라져줘
			$('.lesson-content').hide();
		
			// 클래스 한줄평 페이지 저장 
			var currentPage = "${resultPage.currentPage}";
			var maxPage = "${resultPage.maxPage}";
			
			// 댓글 작성 길이 측정용 변수
			var textLength = 0;
			
			// 한줄평 댓글 본문 저장용
			var assessContent;
			
			// 처음은 클래스 소개만 보이게 하였음 
			$('.class-intro-content').show();
			$('.class-kit-content').hide();
			$('.class-assess-content').hide();
			
			// 구매여부 저장 
			var purchaseCheck = $('.hidden-purchase-check').val();
			console.log('purchaseCheck ? : ' + purchaseCheck);
			
			// 버튼 판별용 클래스 진행상태 변수처리
			var classState = $('.hidden-class-state').val();
			
			// 구매 여부 및 클래스 진행상황에 따라 버튼 다르게 보이게 
			if ( purchaseCheck == '0' ) {
				// 이거는 구매 안했을 때 
				
				if ( classState == '3' ) {
					$('.purchase-button').show();
					$('.purchase-button-already-buy').hide();
					$('.purchase-button-end-class').hide();
					$('.purchase-button-add-assess-content').hide();
					$('.purchase-button-cannot-purchase').hide();
				}
				else if ( classState == '5' ) {
					$('.purchase-button').hide();
					$('.purchase-button-already-buy').hide();
					$('.purchase-button-end-class').hide();
					$('.purchase-button-add-assess-content').hide();
					$('.purchase-button-cannot-purchase').show();
				}
				else if ( classState == '6' ) {
					$('.purchase-button').hide();
					$('.purchase-button-already-buy').hide();
					$('.purchase-button-end-class').show();
					$('.purchase-button-add-assess-content').hide();
					$('.purchase-button-cannot-purchase').hide();
				}
				
			}
			else if ( purchaseCheck == '1' ) {
				// 이거는 구매했을 때 
				if ( classState == '3' ) {
					$('.purchase-button').hide();
					$('.purchase-button-already-buy').show();
					$('.purchase-button-end-class').hide();
					$('.purchase-button-add-assess-content').hide();
					$('.purchase-button-cannot-purchase').hide();
				}
				else if ( classState == '5' ) {
					$('.purchase-button').hide();
					$('.purchase-button-already-buy').hide();
					$('.purchase-button-end-class').hide();
					
					$('.purchase-button-add-assess-content').attr('disabled', true);
					$('.purchase-button-add-assess-content').hide();
					
					$('.cannot-add-button').show();
					
					$('.purchase-button-cannot-purchase').hide();
				}
				else if ( classState == '6' ) {
					$('.purchase-button').hide();
					$('.purchase-button-already-buy').hide();
					$('.purchase-button-end-class').hide();
					
					/*
					$('.purchase-button-add-assess-content').attr('disabled', false);
					$('.purchase-button-add-assess-content').show();
					*/
					$('.purchase-button-add-assess-content').hide();
					// 여기에 해당 인원이 해당 클래스에 클래스 한줄평을 작성했는지 여부에 따라 뭘 보여줄지 택하게 할것
					
					var classAssessCheck = $('.hidden-class-assess-check').val();
					
					if( classAssessCheck == '1' ) {
						// 작성시
						$('.cannot-add-button').show();
						$('.can-add-button').hide();
					}
					else if ( classAssessCheck == '0' ) {
						// 작성 안했을 시
						$('.cannot-add-button').hide();
						$('.can-add-button').show();
					}
					
					$('.purchase-button-cannot-purchase').hide();
				}
				
			}
			
			// 밑바닥 고정 가리기 
			$('.small-width-bottom-fixed').hide();
			
			// 작은버전 메뉴바 가리기
			$('.container-small-nav-menu').hide();
			
			// 찜하기 체크 추가로 이미 구매한 클래스도 로직 처리해야함 -> hobbyClass 도메인이 구매여부도 판단하는 그 무엇이 필요해졌다 -> 그냥 model 두 개 담아서 전달
			$('.steam-count').val('${hobbyClass.steamCount}');
			$('.steam-check').val('${hobbyClass.steamCheck}');
			
			// 무조건 class intro 보게할 것이기 때문에 얘 진하게 
			$('.nav-span-inner-nav-link').eq(0).css({
				'font-weight' : 'bold'
			});
			
			// 구매 이벤트 시작-----------------------------------
			$('.purchase-button').on('click', function(){
				console.log('구매 버튼을 눌렀읍니다.');
				
				var userId = $('.user-hidden-class-intro-value').val();
				
				if ( !userId ) { 
						
					/*
					console.log('로그인이 필요합니다.');
					
					Swal.fire({
						icon : 'error',
						title : '로그인이 필요합니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					})
					return;
					*/
					// self.location = '/user/noLogonUser?type=purchase&hobbyClassNo=' + '${hobbyClass.hobbyClassNo}';
					self.location = '/user/noLogonUser?type=intro&hobbyClassNo=' + '${hobbyClass.hobbyClassNo}';
					return false;
				}
				
				self.location = "/purchase/getSelectOption?hobbyClassNo=" + $('.hidden-hobby-class-number').val() + "&eventDiscount=" + "${hobbyClass.event.eventDiscount}";
				
				// 단순 네비게이션만 하면 될듯 
			});
			// 구매 이벤트 끝-----------------------------------
			
			// 찜하기 이벤트 시작--------------------------------------
			$('.steam-button').on('click', function(){
				var userId = $('.user-hidden-class-intro-value').val();
				var checkPurchase = $('.hidden-purchase-check').val();
				var classState = $('.hidden-class-state').val();
				
				if ( classState != '3' ) {
					const Toast = Swal.mixin({
						toast : true, 
						position : 'top', 
						showConfirmButton : false, 
						showCancelButton : false,
						timer : 1500, 
						timerProgressBar : false, 
						onOpen : (toast) => {
							toast.addEventListener('mouseenter', Swal.stopTimer);
							toast.addEventListener('mouseleave', Swal.resumeTimer);
						}
					});
					
					Toast.fire({
						icon : 'error', 
						title : '찜하기는 수요조사 중인 클래스에만 가능합니다.'
					}).then((result) => {
						event.preventDefault();	
					});		
					
					event.preventDefault();	
					return false;
				}
				
				if ( checkPurchase == '1' ) {
					Swal.fire({
						icon : 'error',
						title : '이미 구매한 클래스입니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					}).then((result) => {
						event.preventDefault();
					})
				}
				
				if ( !userId ) {  
					/*
					Swal.fire({
						icon : 'error',
						title : '로그인이 필요합니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					}).then((result) => {
						event.preventDefault();
					})
					*/
					// self.location = '/user/noLogonUser?type=steamHobbyClass&hobbyClassNo=' + '${hobbyClass.hobbyClassNo}';
					self.location = '/user/noLogonUser?type=intro&hobbyClassNo=' + '${hobbyClass.hobbyClassNo}';
				}
				
				var steamCheck = $('.steam-check').val();
				var hobbyClassNo = '${hobbyClass.hobbyClassNo}';
				var steamCount = $('.steam-count').val();
				var steamButton = $(this);
				
				var url = '';
				
				if ( steamCheck == 0 ) {
					url = '/myHobbyClass/json/addSteamHobbyClass';
				}
				else {
					url = '/myHobbyClass/json/deleteSteamHobbyClass';
				}
				
				$.ajax(
						{
							url : url,
							method : 'post',
							dataType : 'json', 
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								hobbyClassNo : hobbyClassNo, 
								steamCount : steamCount
							}),
							success : function(JSONData, status) {
								if ( JSONData.result == 'error' ) {
									$('.spinner-border').show();								
									self.location = '/user/noLogonUser?type=intro&hobbyClassNo=' + '${hobbyClass.hobbyClassNo}';
								}
								else if ( JSONData.result == 'ok' ) {
									$('.steam-check').val(JSONData.hobbyClass.steamCheck);
									$('.steam-count').val(JSONData.hobbyClass.steamCount);
									
									var display = '';
									
									
									if ( JSONData.hobbyClass.steamCheck == '0' ) {
										display += '<i class="far fa-heart"></i>';
//										$('.steam-button').html('<i class="far fa-heart"></i>');
									}
									else if ( JSONData.hobbyClass.steamCheck == '1' ) {
										display += '<i class="fas fa-heart"></i>';
//										$('.steam-button').html('<i class="fas fa-heart"></i>');
									}
									display += '&nbsp;&nbsp;';
									display += '<span class="steam-inner">';
									display += JSONData.hobbyClass.steamCount;
									display += '</span>';
									
									$('.steam-button').html(display);
									/* 하트가 제대로 안바뀜...
									if ( JSONData.hobbyClass.steamCheck == '0' ) {
										$('.steam-heart-font').html('<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M17.586 15.086c2.07-2.07 2.914-3.572 2.914-5.586A3.5 3.5 0 0017 6c-1.074 0-1.92.392-2.829 1.19a14.88 14.88 0 00-.757.724L12 9.328l-1.414-1.414a14.88 14.88 0 00-.757-.724C8.919 6.392 8.074 6 7 6a3.5 3.5 0 00-3.5 3.5c0 2.014.844 3.516 2.914 5.586 1.038 1.037 2.91 2.277 5.586 3.67 2.677-1.393 4.548-2.633 5.586-3.67zM5 16.5c-1.911-1.911-3.5-3.962-3.5-7A5.5 5.5 0 017 4c2.5 0 4 1.5 5 2.5 1-1 2.5-2.5 5-2.5a5.5 5.5 0 015.5 5.5c0 3.038-1.589 5.089-3.5 7-1.333 1.333-3.667 2.833-7 4.5-3.333-1.667-5.667-3.167-7-4.5z"></path></svg>');
									}
									else if ( JSONData.hobbyClass.steamCheck == '1' ) {
										$('.steam-heart-font').html('<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M5 16.5c-1.911-1.911-3.5-3.962-3.5-7A5.5 5.5 0 017 4c2.5 0 4 1.5 5 2.5 1-1 2.5-2.5 5-2.5a5.5 5.5 0 015.5 5.5c0 3.038-1.589 5.089-3.5 7-1.333 1.333-3.667 2.833-7 4.5-3.333-1.667-5.667-3.167-7-4.5z"></path></svg>');
									}
									*/ 
								
//									$('.steam-inner-count').text(JSONData.hobbyClass.steamCount);
									$('.spinner-border').hide();
								}
							},
							beforeSend : function() {
							//	$('.spinner-border').show();
							}, 
							complete : function() {
							//	$('.spinner-border').hide();
							}
						}
				)
			})
			// 찜하기 이벤트 시작--------------------------------------
			
			// 키자마자 화면 크기 따라서 뭐 보여주고 뭐 감추고 해버리기 ---------------------
			var onloadWidth = $(window).width();
			
			if ( onloadWidth <= 980 ) {
				$('.small-width-bottom-fixed').show();
				$('.fixed-right-tool-bar').hide();
				$('.navbar-brand').show();
				$('.container-big-nav-menu').hide();
				$('.container-small-nav-menu').show();
				$('.hide-dt-tag').hide();
			}
			else if ( onloadWidth > 980 ) {
				$('.small-width-bottom-fixed').hide();
				$('.fixed-right-tool-bar').show();
				$('.navbar-brand').hide();
				$('.container-big-nav-menu').show();
				$('.container-small-nav-menu').hide();
				$('.hide-dt-tag').show();
			}
			// 키자마자 화면 크기 따라서 뭐 보여주고 뭐 감추고 해버리기 ---------------------
			
			// 크기에 따라서 하단에 툴바 띄울건지 우측에 툴바 띄울건지 ---------------------
			$( window ).resize(function(){
				var windowWidth = $(this).width();
				console.log(windowWidth);
				if ( windowWidth <= 980 ) {
					$('.small-width-bottom-fixed').show();
					$('.fixed-right-tool-bar').hide();
					$('.navbar-brand').show();
					$('.container-big-nav-menu').hide();
					$('.container-small-nav-menu').show();
					$('.hide-dt-tag').hide();
				}
				else {
					$('.small-width-bottom-fixed').hide();
					$('.fixed-right-tool-bar').show();
					$('.navbar-brand').hide();
					$('.container-big-nav-menu').show();
					$('.container-small-nav-menu').hide();
					$('.hide-dt-tag').show();
				}
			})
			// 크기에 따라서 하단에 툴바 띄울건지 우측에 툴바 띄울건지 ---------------------
			
			// navbar 메뉴 선택 ------------------------------------------------
			$('.nav-span-inner-nav-link').on('click', function(){
				var check = $(this).find('.navbar-nav-link-inner-span-input').val();
				console.log(check);
				
				// 제발 사라져줘 
				$('.lesson-content').hide();
				
				$('.nav-span-inner-nav-link').css({
					'font-weight' : 'normal'
				});
				
				var index = $('.nav-span-inner-nav-link').index(this);
				
				$('.nav-span-inner-nav-link').eq(index).css({
					'font-weight' : 'bold'
				});
				
				// 클래스 소개 관련 
				if ( index == 0 ) {
					$('.class-intro-content').show();
					var offset = $('.class-intro-content').offset();
					$('html, body').animate({scrollTop : offset.top}, 400);

				} 
				else if ( index != 0 ) {
					$('.class-intro-content').hide();
				}
				
				// 클래스 준비물 관련 
				if ( index == 1 ) {
					$('.class-kit-content').show();
					var offset = $('.class-kit-content').offset();
					$('html, body').animate({scrollTop : offset.top}, 400);
				} 
				else if ( index != 1 ) {
					$('.class-kit-content').hide();
				}
				
				// 클래스 한줄평 관련
				if ( index == 2 ) {
					// 클래스 진행상태에 따른 클래스 한줄평 숨기고 보이고 그것 ----------------------
					
					// 클래스 진행상태에 따른 클래스 한줄평 숨기고 보이고 그것 ----------------------
					var classState = $('.hidden-class-state').val();	
					if ( classState == '6' ) {
						$('.class-assess-content').show();
						$('.end-class').show();
						$('.non-end-class').hide();
						var offset = $('.class-assess-content').offset();
						$('html, body').animate({scrollTop : offset.top}, 400);
					}
					else if ( classState != '6' ) {
						$('.class-assess-content').show();
						$('.end-class').hide();
						$('.non-end-class').show();
						var offset = $('.non-end-class').offset();
						$('html, body').animate({scrollTop : offset.top}, 400);
					}
				}
				else if ( index != 2 ) {
					$('.class-assess-content').hide();
				}

				if ( index == 3 ) {
					$('.lesson-content').show();
					
					console.log( $('.btn-owl-carousel').length );
					if ( $('.btn-owl-carousel').length == 0 ) {
						console.log("부엉이 이벤트 만들기");
						
						// 부엉이 이벤트 
						$('.owl-carousel').owlCarousel({
						    loop:true,
						    nav:true,
						    navText:["<div class='nav-btn prev-slide'><button type='button' class='btn btn-basic'><i class='fas fa-arrow-left'></i></button></div>","<div class='nav-btn next-slide'><button type='button' class='btn btn-basic'><i class='fas fa-arrow-right'></i></button></div>"],
						    responsive:{
						        0:{
						            items:1
						        },
						        600:{
						            items:1
						        },
						        1000:{
						            items:1
						        }
						    }
						})
						// 부엉이 이벤트
						
						var offset = $('.lesson-content').offset();
						$('html, body').animate({scrollTop : offset.top}, 400);
						
					}
					else if ( index != 3 ) {
						$('.lesson-content').hide();
						console.log("부엉이는 이미 있다!");
					}
				}
				
				if ( index == 4 ) {
					var userId = $('.user-hidden-class-intro-value').val();
					
					self.location = "/community/listCommunity?hobbyClassNo=" + $('.hidden-hobby-class-number').val();
					
				}
				
			})
			// navbar 메뉴 선택 ------------------------------------------------
			
			// 한줄평 더보기 요청 시 -----------------------------------------------
			$('.btn-class-assess-more').on('click', function(){
				
				currentPage = (currentPage * 1) + 1;
				var hobbyClassNo = "${hobbyClass.hobbyClassNo}";
				
				// ajax 시작-------------------------------------------
				$.ajax(
						{
							url : "/searchHobbyClass/json/getHobbyClassAssessContent",
							method : "post", 
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, 
							data : JSON.stringify({
								currentPage : currentPage, 
								hobbyClassNo : hobbyClassNo
							}), 
							success : function(JSONData, status) {
								var display = '';
								
								for ( var i = 0; i < JSONData.assessContentList.length; i++ ) {
									display += '<li class="media my-4">';
									
									if ( JSONData.assessContentList[i].user.profileImage != null ) {
										display += '<img src="/resources/image/woo/' + JSONData.assessContentList[i].user.profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
									}
									
									if ( JSONData.assessContentList[i].user.profileImage == null ) {
										display += '<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
									}
									
									display += '<div class="media-body">';
									display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
									display += '<span>';
									
									if ( JSONData.assessContentList[i].user.nickName != null ) {
										display += '<strong>' + JSONData.assessContentList[i].user.nickName + '</strong>';
									}
									else {
										display += '<strong>' + JSONData.assessContentList[i].user.name + '</strong>';
									}
									
									display += '<small class="text-muted">' + JSONData.assessContentList[i].regDate + '</small>';
									display += '</span>';
									display += '<span class="lesson-reply-reset-button-span">';
									display += '<span>';
									display += '<small>';
									display += '<span class="assess-star-span-right-tool-bar pull-right">';
									display += '<i class="fas fa-star"></i>&nbsp;&nbsp;' + JSONData.assessContentList[i].assessStar + '&nbsp;점';
									display += '</span>';
									display += '</small>';
									display += '</span>';
									display += '</span>';
									display += '</h6>';
									display += '<div class="here-is-change-update-div">';
									display += '<p>' + JSONData.assessContentList[i].assessContent + '</p>';
									display += '</div>';
									display += '</div>';
									display += '</li>';
									display += '<hr/>';
								}
								
								display += '<span class="scroll-page"></span>';
								
								$('.scroll-page:last').after(display);
								
								maxPage = JSONData.resultPage.maxPage;
								
								if ( maxPage == currentPage ) {
									$('.btn-class-assess-more').hide();
								}
								else {
									$('.btn-class-assess-more').show();
								}
							}
						}
				)
				// ajax 끝-------------------------------------------
			})
			// 한줄평 더보기 요청 시 --------------------------------------------------
			
			// 한줄평 더보기 스위트 알러트 창 불러오기 ------------------------------------------------
//			$('.btn-class-assess-add').on('click', function(){
				//	$('.class-assess-add-modal').modal('show');
				//	self.location = "/searchhobbyclass/testsweet.jsp";
				
				
//			})
			// 한줄평 더보기 모달창 불러오기 ------------------------------------------------
			
			// 별표선택 ---------------------------------------------------------------
			$('.starRev span').click(function(){
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				index = $(this).parent().children().index(this) + 1;
				console.log('index ? : ' + index);
				$('.class-assess-star-hidden-value').val(index);
				var display = '';
				display += '선택하신 별점은 <span class="text-danger">' + index + '점</span> 입니다.';
				
				$('.star-value-span').html(display);
				return false;
			});
			// 별표선택 ---------------------------------------------------------------
			
			// 클래스 한줄평 작성 모달창 버튼 클릭 시 
			//$('.btn-class-assess-modal-add-button').on('click', function(){
			$('.purchase-button-add-assess-content').on('click', function(){
				console.log('한줄평 작성 클릭');
				
				var hobbyClassNo = "${hobbyClass.hobbyClassNo}";
				var assessContent = $('.lesson-reply-add-textarea').val();
				var assessStar = $('.class-assess-star-hidden-value').val();
				
				// sweet alert2 생성 
				Swal.mixin({
					icon : 'info',
					showCancelButton : false,
					showConfirmButton: false,
					allowOutsideClick : false, 
					progressSteps : ['1', '2']
				}).queue([
					{
						title : '<span class="first-title">별점 선택</span>',
						html : 	'<br/><br/>' + 
						'<div class="starRev">' + 
						'<span class="starR1 on">별1_왼쪽</span>' + 
						'<span class="starR2">별1_오른쪽</span>' + 
						'<span class="starR1">별2_왼쪽</span>' + 
						'<span class="starR2">별2_오른쪽</span>' + 
						'<span class="starR1">별3_왼쪽</span>' + 
						'<span class="starR2">별3_오른쪽</span>' + 
						'<span class="starR1">별4_왼쪽</span>' + 
						'<span class="starR2">별4_오른쪽</span>' + 
						'<span class="starR1">별5_왼쪽</span>' + 
						'<span class="starR2">별5_오른쪽</span>' + 
						'</div>' + 
						'<br/><br/>' + 
						'<span class="now-star">현재 선택하신 별점은 <span class="start-number">1점</span>입니다.</span>' +
						'<br/><br/>' + 
						'<button type="button" class="btn btn-secondary swal-next-button mr-5">다음</button>' + 
						'<button type="button" class="btn btn-secondary swal-cancel-button">취소</button>' 
					},
					{
						title : '<span class="secend-title">한줄평 작성</span>', 
						html : 	'<br/><br/>' + 
							  	'<div class="textarea-container">' + 
							  	'<textarea class="lesson-reply-add-textarea" rows="10" name="content" type="text" placeholder="한줄평을 작성해주세요." sizes="md" style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 24px;"></textarea>' + 
							  	'</div>' + 
							  	'<br/><br/>' + 
							  	'<span class="text-length-alert"></span>' + 
							  	'<br/><br/>' + 
							  	'<button type="button" class="btn btn-secondary swal-reply-next-button mr-5">다음</button>' + 
								'<button type="button" class="btn btn-secondary swal-reply-cancel-button">취소</button>',
						showLoaderOnConfirm: true, 
						preConfirm: () => {
						    return fetch("/searchHobbyClass/json/addHobbyClassAssess", {
						    				method : "POST", 
						    				headers : {
						    					"Accept" : "application/json", 
						    					"Content-Type" : "application/json"
						    				},
						    				body : JSON.stringify({
						    					assessStar : $('.hidden-star-number').val(),  
						    					hobbyClassNo : "${hobbyClass.hobbyClassNo}",  
						    					assessContent : $('.hidden-assess-content').val()  
						    				})
						    			}).then(JSONData => JSONData.json()).then(JSONData => {
						    				console.log(JSONData);
						    				maxPage = JSONData.resultPage.maxPage;
						    				currentPage = 1;
						    				// 여기서 깆ㄴ 리스트 삭제하고 새거 붙이고 저 우측 툴바에 통계도 바꿔주고...
						    				$('.class-assess-scroll').remove();
						    				$('.why-div-wrapper-need').remove();
						    				
						    				$('.class-assess-scroll-flag').after('<span class="class-assess-scroll"></span>');
						    				
						    				var display = '';
						    				
						    				display += '<div class="why-div-wrapper-need">';
						    				
						    				for ( var i = 0; i < JSONData.classAssessList.length; i++ ) {
												display += '<li class="media my-4">';
												
												if ( JSONData.classAssessList[i].user.profileImage != null ) {
													display += '<img src="/resources/image/woo/' + JSONData.classAssessList[i].user.profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
												}
												
												if ( JSONData.classAssessList[i].user.profileImage == null ) {
													display += '<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
												}
												
												display += '<div class="media-body">';
												display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
												display += '<span>';
												
												if ( JSONData.classAssessList[i].user.nickName != null ) {
													display += '<strong>' + JSONData.classAssessList[i].user.nickName + '</strong>';
												}
												else {
													display += '<strong>' + JSONData.classAssessList[i].user.name + '</strong>';
												}
												
												display += '<small class="text-muted">' + JSONData.classAssessList[i].regDate + '</small>';
												display += '</span>';
												display += '<span class="lesson-reply-reset-button-span">';
												display += '<span>';
												display += '<small>';
												display += '<span class="assess-star-span-right-tool-bar-assess-content pull-right">';
												display += '<i class="fas fa-star"></i>&nbsp;&nbsp;' + JSONData.classAssessList[i].assessStar + '&nbsp;점';
												//display += '<i class="fas fa-star"></i>5&nbsp;점';
												display += '</span>';
												display += '</small>';
												display += '</span>';
												display += '</span>';
												display += '</h6>';
												display += '<div class="here-is-change-update-div">';
												display += '<p>' + JSONData.classAssessList[i].assessContent + '</p>';
												display += '</div>';
												display += '</div>';
												display += '</li>';
												display += '<hr/>';
											}
											display += '</ul>';
											display += '<span class="scroll-page"></span>';
						    				display += '</div>';
											
						    				$('.class-assess-scroll').after(display);
						    				
						    				$('.class-assess-count').text( JSONData.resultPage.totalCount + ' 개' );
						    				
						    				//var lastStarValue = '<i class="fas fa-star"></i>&nbsp;&nbsp;' + JSONData.hobbyClass.totalGrade;
						    				
						    				//$('.assess-star-span-right-tool-bar').html(lastStarValue);
						    				
						    				if ( maxPage == currentPage ) {
												$('.btn-class-assess-more').hide();
											}
											else {
												$('.btn-class-assess-more').show();
											}
						    				
						    			})
						}
					}
				]).then((result) => {
					console.log(result);
					
					if ( result.dismiss ) {
						const Toast = Swal.mixin({
							toast : true, 
							position : 'top', 
							showConfirmButton : false, 
							showCancelButton : false,
							timer : 1500, 
							timerProgressBar : false, 
							onOpen : (toast) => {
								toast.addEventListener('mouseenter', Swal.stopTimer);
								toast.addEventListener('mouseleave', Swal.resumeTimer);
							}
						});
						
						Toast.fire({
							icon : 'error', 
							title : '한줄평 작성 취소'
						}).then((result) => {
							event.preventDefault();	
						});
					} 
					else {
						const Toast = Swal.mixin({
							toast : true, 
							position : 'top', 
							showConfirmButton : false, 
							showCancelButton : false,
							timer : 1500, 
							timerProgressBar : false, 
							onOpen : (toast) => {
								toast.addEventListener('mouseenter', Swal.stopTimer);
								toast.addEventListener('mouseleave', Swal.resumeTimer);
							}
						});
						 
						Toast.fire({
							icon : 'success', 
							title : '한줄평 완료'
						})
					
						$('.lesson-content').hide();
						$('.class-intro-content').hide();
						$('.class-kit-content').hide();
						
						
						$('.nav-span-inner-nav-link').css({
							'font-weight' : 'normal'
						});
						
						$('.nav-span-inner-nav-link').eq(2).css({
							'font-weight' : 'bold'
						});
						
						$('.class-assess-content').show();
						$('.non-end-class').hide();
						
						$('.cannot-add-button').show();
						$('.can-add-button').hide();
						
						var offset = $('.class-assess-content').offset();
						$('html, body').animate({scrollTop : offset.top}, 400);
					
					}
					
				});				
				
			})
			// 클래스 한줄평 작성 모달창 버튼 클릭 시 
			// 	//		assessContent : $('.hidden-assess-content').val()  기존꺼
			// sweet alert2 관련 이벤트 
			$(document).on('click', '.starRev span', function(){
    			$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				
				var index = $(this).parent().children().index(this) + 1;
				console.log(index);
				$('.hidden-star-number').val(index);
				$('.start-number').text(index + '점');
				
				return false;
    		});
    		
    		$(document).on('click', '.swal-next-button', function(){
    			Swal.clickConfirm();
    		})
    		
    		$(document).on('click', '.swal-cancel-button', function(){
    			Swal.clickCancel();
    		})
    		
    		$(document).on('keyup', '.lesson-reply-add-textarea', function(){
    			textLength = $(this).val().length;
    			console.log('textLength ? : ' + textLength);
    			
    			/* 이구간 왜있음?
    			if ( textLength > 0 ) {
    				$('.text-length-alert').text('');
    			}
    			*/
    		})
    		
    		$(document).on('click', '.swal-reply-next-button', function(){
    			assessContent = $('.lesson-reply-add-textarea').val();
    			console.log(assessContent);
    			
    			if ( textLength < 1 ) {
    				$('.text-length-alert').text('내용을 입력해주세요.');
    				return false;
    			}
    			
    			if ( assessContent = '' ) {
    				$('.text-length-alert').text('공백은 입력할 수 없습니다.');
    				return false;
    			}
    			/* 왜 안담기지..
    			console.log($('.hidden-assess-content'));
    			$('.hidden-assess-content').val(assessContent);
    			
    			console.log( '한줄평 제대로 되었나 ? : ' + $('.hidden-assess-content').val() );
    			*/
    			$('.hidden-assess-content').val( $('.lesson-reply-add-textarea').val() );
    			console.log( '한줄평 제대로 되었나 ? : ' + $('.hidden-assess-content').val() );
    			Swal.clickConfirm();
    			//hidden-assess-content
    		})
    		
    		$(document).on('click', '.swal-reply-cancel-button', function(){
    			Swal.clickCancel();
    		})
			// sweet alert2 관련 이벤트 
			console.log( $('.hidden-hobby-class-number').val()  );
			// 강의 리스트 불러오는 구간 --------------------------------------------------
			$.ajax(
					{
						url : "/lesson/json/getLessonList",
						method : "post",
						dataType : "json", 
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"							
						},
						data : JSON.stringify({
								hobbyClassNo : $('.hidden-hobby-class-number').val() 
						}),
						success : function(JSONData, status) {
							var pageSize = 3;
							var display = '';
							console.log(JSONData);	
							
							var i = 1;
							for(i = 1; i < JSONData.resultPage.maxPage; i++) {
							
								display += '<div class="lesson-cotent-for-each-outer-div mt-3">';
								display += '<div class="lesson-content-carousel-img-outer-div">';
								display += '<div class="lesson-content-carousel-img-inner-div">';
								display += '<div class="owl-carousel owl-theme owl-outer-1 owl-outer-2">';
								
								var currentPage = ( i - 1 ) * pageSize + 1;
								var nowMaxPage = ( i * pageSize );
			
								for(var j = currentPage; j <= nowMaxPage; j++ ) {
									display += '<div class="item"><img src="/images/hobbyclass/' + JSONData.lessonList[j - 1].lessonImage + '" /></div>';
								}
								
								display += '</div>';
								display += '</div>';
								display += '</div>';
								
								display += '<div class="lesson-content-text-outer-div">';
								display += '<div class="lesson-content-text-list-outer-div">';
								
								for(var j = currentPage; j <= nowMaxPage; j++ ) {
									display += '<a class="lesson-content-click-a-tag">';
									display += '<div class="lesson-content-inner-div mt-4">';
									display += '<div class="lesson-content-number-div">';
								
									display += '<span class="lesson-content-number">';
									display += j;
									display += '</span>';
									display += '</div>';
									
									display += '<div class="lesson-content-text-div">';
									display += JSONData.lessonList[j - 1].lessonTitle;
									display += '</div>';
									display += '</div>';
									
									display += '<input type="hidden" class="hidden-lesson-content-lesson-number" value=" ' + JSONData.lessonList[j - 1].lessonNo + ' "/> ';
									
									display += '</a>';
								}
								
								display += '</div>';
								display += '</div>';
								display += '</div>';
							}
							
							var lastValue = (i - 1) * pageSize;
							var check = JSONData.resultPage.totalCount - ( (i - 1) * pageSize )  
							if ( check > 0 ) {
							
								for(i = lastValue + 1; i <= JSONData.resultPage.totalCount; i++) {
									display += '<div class="lesson-cotent-for-each-outer-div mt-3">';
									display += '<div class="lesson-content-carousel-img-outer-div">';
									display += '<div class="lesson-content-carousel-img-inner-div">';
									display += '<div class="owl-carousel owl-theme owl-outer-1 owl-outer-2">';
									
									var currentPage = i;
									
									console.log(currentPage);
									for(var j = currentPage; j <= JSONData.resultPage.totalCount; j++ ) {
										display += '<div class="item"><img src="/images/hobbyclass/' + JSONData.lessonList[j - 1].lessonImage + '" /></div>';
									}
									
									display += '</div>';
									display += '</div>';
									display += '</div>';
									
									display += '<div class="lesson-content-text-outer-div">';
									display += '<div class="lesson-content-text-list-outer-div">';
									
									for(var j = currentPage; j <= JSONData.resultPage.totalCount; j++ ) {
										display += '<a class="lesson-content-click-a-tag">';
										display += '<div class="lesson-content-inner-div mt-4">';
										display += '<div class="lesson-content-number-div">';
									
										display += '<span class="lesson-content-number">';
										display += j;
										display += '</span>';
										display += '</div>';
										
										display += '<div class="lesson-content-text-div">';
										display += JSONData.lessonList[j - 1].lessonTitle;
										display += '</div>';
										display += '</div>';
										
										display += '<input type="hidden" class="hidden-lesson-content-lesson-number" value=" ' + JSONData.lessonList[j - 1].lessonNo + ' "/> ';
										
										display += '</a>';
									}
									
									display += '</div>';
									display += '</div>';
									display += '</div>';
								}
							}
							
							$('.lesson-title-and-img-inner-div').html(display);
						}
					}
			)
			// 강의 리스트 불러오는 구간 --------------------------------------------------
			
			// 강의 상세보기 구간 ------------------------------------------------
			$(document).on('click', '.lesson-content-click-a-tag', function(){
				console.log('purchaseCheck ? : ' + purchaseCheck);	
				
				var userId = $('.user-hidden-class-intro-value').val();
				
				// 유저 로그인 안되있을 경우
				if ( !userId ) {
					self.location = '/user/noLogonUser?type=intro&hobbyClassNo=' + $('.hidden-hobby-class-number').val();	
					return false;
				}
				
				if ( classState != '5' ) {
					Swal.fire({
						icon : 'error',
						title : '개강시에만 확인 가능합니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					})
					return;
				}
				
				if ( purchaseCheck != '1' ) {
					Swal.fire({
						icon : 'error',
						title : '구매시에 확인 가능합니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					})
					return;
				}
				
				console.log('click');
				
				var lessonNo = ( $(this).find('.hidden-lesson-content-lesson-number').val() ) * 1;
				console.log('lessonNo ? : ' + lessonNo);
				
				var hobbyClassNo = $('.hidden-hobby-class-number').val();
				
				var userId = $('.user-hidden-class-intro-value').val();
				
				if ( !userId ) {  
					console.log('로그인이 필요합니다.');
					
					Swal.fire({
						icon : 'error',
						title : '로그인이 필요합니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					})
					return;
				}
				
				if ( purchaseCheck == '0' ) {
					console.log('구매시에 확인할 수 있습니다.');
					
					Swal.fire({
						icon : 'error',
						title : '구매시에 확인할 수 있습니다.',
						showConfirmButton : false, 
						allowOutsideClick : true,
						timer : 800
					})
					return;
				}
				
				self.location = "/lesson/getLesson?lessonNo=" + lessonNo + "&hobbyClassNo=" + hobbyClassNo;
			})
			// 강의 상세보기 구간 ------------------------------------------------
			
			// 클릭시 위로가기 ----------------------------------
			$(".mini-button-to-top").on("click", function () {
            	$('body,html').animate({
    				scrollTop: 0
    			}, 200);
    			return false;
            });
			// 클릭시 위로가기 ----------------------------------
		})
		
		function ul(index) {
			var purchaseCheck = $('.hidden-purchase-check').val();	
			
			console.log('click!' + index)
			
			var underlines = document.querySelectorAll(".underline");
		
			for (var i = 0; i < underlines.length; i++) {
				underlines[i].style.transform = 'translate3d(' + index * 100 + '%,0,0)';
			}
			
			$('.lesson-content').hide();
			
			
			// 클래스 소개 관련 
			if ( index == 0 ) {
				$('.class-intro-content').show();
				var offset = $('.class-intro-content').offset();
				$('html, body').animate({scrollTop : offset.top}, 400);

			} 
			else if ( index != 0 ) {
				$('.class-intro-content').hide();
			}
			
			// 클래스 준비물 관련 
			if ( index == 1 ) {
				$('.class-kit-content').show();
				var offset = $('.class-kit-content').offset();
				$('html, body').animate({scrollTop : offset.top}, 400);
			} 
			else if ( index != 1 ) {
				$('.class-kit-content').hide();
			}
			
			// 클래스 한줄평 관련
			if ( index == 2 ) {
				// 클래스 진행상태에 따른 클래스 한줄평 숨기고 보이고 그것 ----------------------
				
				// 클래스 진행상태에 따른 클래스 한줄평 숨기고 보이고 그것 ----------------------
				var classState = $('.hidden-class-state').val();	
				if ( classState == '6' ) {
					$('.class-assess-content').show();
					$('.end-class').show();
					$('.non-end-class').hide();
					var offset = $('.class-assess-content').offset();
					$('html, body').animate({scrollTop : offset.top}, 400);
				}
				else if ( classState != '6' ) {
					$('.class-assess-content').show();
					$('.end-class').hide();
					$('.non-end-class').show();
					var offset = $('.non-end-class').offset();
					$('html, body').animate({scrollTop : offset.top}, 400);
				}
			}
			else if ( index != 2 ) {
				$('.class-assess-content').hide();
			}

			if ( index == 3 ) {
				$('.lesson-content').show();
				
				console.log( $('.btn-owl-carousel').length );
				if ( $('.btn-owl-carousel').length == 0 ) {
					console.log("부엉이 이벤트 만들기");
					
					// 부엉이 이벤트 
					$('.owl-carousel').owlCarousel({
					    loop:true,
					    nav:true,
					    navText:["<div class='nav-btn prev-slide'><button type='button' class='btn btn-basic'><i class='fas fa-arrow-left'></i></button></div>","<div class='nav-btn next-slide'><button type='button' class='btn btn-basic'><i class='fas fa-arrow-right'></i></button></div>"],
					    responsive:{
					        0:{
					            items:1
					        },
					        600:{
					            items:1
					        },
					        1000:{
					            items:1
					        }
					    }
					})
					// 부엉이 이벤트
					
					var offset = $('.lesson-content').offset();
					$('html, body').animate({scrollTop : offset.top}, 400);
					
				}
				else if ( index != 3 ) {
					$('.lesson-content').hide();
					console.log("부엉이는 이미 있다!");
				}
			}
			
			if ( index == 4 ) {
				var userId = $('.user-hidden-class-intro-value').val();
				
				
				self.location = "/community/listCommunity?hobbyClassNo=" + $('.hidden-hobby-class-number').val();

			}
		}
	</script>
	
	<style>
		.starR1{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR2{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		
		.starR1.on {
			background-position:0 0;
		}
		
		.starR2.on {
			background-position:-15px 0;
		}
		
		.nav-in-class-detail-menu {
			margin : 0px 5px 5px 0px;
		}
		
		.nav-span-inner-nav-link {
			display : inline-block;
			font-size: 16px;
		    line-height: 24px;
		    letter-spacing: -0.2px;
		    position: relative;
		    font-weight: 500;
		    color: rgb(62, 64, 66);
		    margin: 0px;
		    padding: 14px 32px 12px;
		}
		
		.nav-link>span>span:hover {
			border-bottom: 2px solid #6c757d;
			padding-bottom: 8px;
			cursor : pointer;
		}
		
		.just-bar:before {
	   		content: "";
	   		position: absolute;
		    width: 1px;
		    height: 50px;
		    background-color: rgb(205, 209, 212);
		}
		
		.container-background-setting1 {
		    max-width: 960px;
		    margin-left: auto;
		    margin-right: auto;
		}
		
		.container-background-setting2 {
		    position: static;
		}
		
		.class-intro-row {
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    align-content: stretch;
		    margin-right: -12px;
		    margin-left: -12px;
		}

		.class-intro-image-col-area1 {
		    position: relative;
		    min-height: 1px;
		    padding-right: 12px;
		    padding-left: 12px;
		    box-sizing: border-box;
		}
		
		.class-intro-image-col-area2 {
		    position: static;
		}
		
		.image-outer-div {
		    position: relative;
		    margin-bottom: 24px;
		    overflow: hidden;
		    border-radius: 4px;
		}

		.image-outer-span {
		    display: block;
		    position: relative;
		    font-size: 0px;
		    padding-top: 75%;
	    }
	    
	    .img-class-intro {
		    top: 0px;
		    left: 0px;
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    position: absolute;
		    opacity: 1;
		    transition: opacity 0.1s linear 0s;
		}
		/*
		.fixed-right-tool-bar {
			position: fixed;
			z-index: 1; 
			top: 0;
			right: 0;
		}
		*/

		.fixed-right-tool-bar {
			box-shadow: rgba(41, 42, 43, 0.16) 0px 2px 6px -2px;
		    position: sticky;
		    top: 0px;
		    max-height: 100vh;
		    padding: 24px;
		    /*
		    border-radius: 3px;
		    border-width: 0px;
		    border-style: solid;
		    border-color: rgb(255, 255, 255) !important;
		    border-image: initial;
		    */
		    border : none !important;
		    overflow: auto;
		}
		
		.fixed-right-tool-bar-outer-div1 {
		    box-shadow: rgba(41, 42, 43, 0.16) 0px 2px 6px -2px;
		    position: sticky;
		    top: 0px;
		    max-height: 100vh;
		    padding: 24px;
		    border-radius: 3px;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(255, 255, 255);
		    border-image: initial;
		    overflow: hidden;
		}
		
		.fixed-right-tool-bar-outer-div2 {
		    color: rgb(62, 64, 66);
		    background-color: rgb(255, 255, 255);
		    padding-bottom: 12px;
		}

		.this-is-by-creator-nickname {
		    font-size: 14px;
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    display: block;
		    color: rgb(168, 174, 179);
		    font-weight: bold;
		    margin: 0px 0px 4px;
		}

		.this-is-class-title-to-the-right-fixed-tool-bar {
		    font-size: 20px;
		    font-weight: bold;
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    color: rgb(62, 64, 66);
		    word-break: keep-all;
		    margin: 0px 0px 8px;
		}
		
		.this-is-for-each-hashtag-div {
		    font-size: 11px;
		    font-weight: normal;
		    line-height: 16px;
		    letter-spacing: normal;
		    color: rgb(255, 255, 255);
		    margin: 0px;
		}

		.hashtag-wrapper-but-not-bootstrap {
		    display: inline-block;
		    vertical-align: top;
		    background-color: rgb(62, 64, 66);
		    padding: 2px 8px;
		    border-radius: 3px;
		}
		
		.class-intro-for-discount-percent {
			font-size: 9px;
		    line-height: 12px;
		    letter-spacing: normal;
		    display: flex;
		    color: rgb(243, 51, 64);
		    font-weight: bold;
		    margin: 0px 4px 0px 0px;
		    text-decoration: none;
		}
		
		.class-intro-last-price {
		    font-size: 20px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    display: flex;
		    margin: 0px;
		}

		.class-intro-steam-button-outer-div {
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    margin-top: 16px;
		}
		
		.steam-button1 {
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 1 1 0%;
		}
		
		.steam-button2 {
		    width: auto;
		    display: inline-flex;
		    vertical-align: middle;
		    color: rgb(62, 64, 66);
		    background-color: rgb(248, 248, 249);
		    font-weight: 500;
		    font-size: 14px;
		    letter-spacing: -0.2px;
		    height: 40px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 16px;
		    transition: background-color 0.1s ease 0s;
		}
		
		.steam-button3 {
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}

		.steam-count {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 0 auto;
		}

		.steam-heart-font {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 0px;
		    width: 18px;
		    height: 18px;
		    margin-right: 4px;
		    flex: 0 0 auto;
		    color : red;
		}
		
		.steam-button1:first-child {
		    margin-right: 8px;
		}

		.purchase-button1 {
		    width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgb(255, 146, 43);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		}
		
		.purchase-button2 {
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}

		.purchase-button-text {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 0 auto;
		}

		.class-total-lesson-count {
		    font-size: 24px;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    font-weight: 500;
		    margin: 0px;
		}

		.class-total-lesson-count-p-tag {
		    font-size: 16px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 24px;
		    letter-spacing: -0.2px;
		    margin: 12px 0px 0px;
		}

		.class-kit-content {
		    position: relative;
		    margin-left: auto;
		    margin-right: auto;
		}

		.class-kit-outer-div {
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    align-content: stretch;
		    margin-right: -12px;
		    margin-left: -12px;
		}

		.class-kit-title1 {
		    font-size: 24px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.class-kit-title2 {
		    word-break: keep-all;
		}
		
		.class-kit-title2::after {
		    content: "";
		    display: block;
		    clear: both;
		}

		.class-kit-title-outer-div {
		    position: relative;
		    width: 100%;
		    margin: 48px 0px 24px;
		}
		
		.class-kit-main-content-outer-div {
		    word-break: break-word;
		    margin-bottom: 48px;
		    width: 100%;
		}

		.class-kit-main-content-inner-div-1 {
		    width: 100%;
		}
		
		.class-kit-main-content-inner-div-2 {
		    margin-left: -24px;
		    margin-right: -24px;
		    max-height: none;
		    position: relative;
		}
		
		.class-kit-main-content-inner-div-3 {
		    padding: 0px 24px;
		}

		.class-kit-main-title-outer-div {
		    display: block;
		    background-color: rgb(255, 255, 255);
		    font-size: 14px;
		    line-height: 24px;
		    padding: 0px 12px;
		}

		.class-kit-main-image-outer-span {
		    display: block;
		    width: 100%;
		    margin-bottom: 8px;
		    padding: 0px;
		    border-width: initial;
		    border-style: none;
		    border-color: initial;
		    border-image: initial;
		    background: none;
		}

		.kit-main-image {
		    top: 0px;
		    left: 0px;
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    position: relative;
		    opacity: 1;
		    transition: opacity 0.1s linear 0s;
		}
		
		.class-kit-main-title-outer-div p {
		    font-size: 20px;
		    font-weight: bold;
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    color: rgb(62, 64, 66);
		    word-break: keep-all;
		    margin: 0px 0px 8px;
		}

		.kit-main-h4 {
		    font-weight: bold;
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    color: rgb(62, 64, 66);
		    word-break: keep-all;
		    margin: 0px 0px 8px;
		}
		
		.kit-inner-p-title {
		    font-weight: bold;
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    color: rgb(62, 64, 66);
		    word-break: keep-all;
		    margin: 0px 0px 8px;
		}
		
		.purchase-button-already-buy {
			width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgba(255, 146, 43, 0.5);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		    
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		
		.purchase-button-cannot-purchase {
			width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgba(255, 146, 43, 0.5);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		    
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		
		.cannot-add-button {
			width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgba(255, 146, 43, 0.5);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		    
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		
		.purchase-button-end-class {
			width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgba(255, 146, 43, 0.5);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		    
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		
		.purchase-button-already-buy:hover {
			cursor : not-allowed;
		}
		
		.class-assess-content {
		    margin-bottom: 16px;
		    background-color: rgb(255, 255, 255);
		    padding: 48px 0px 32px;
		}

		.class-assess-section {
		    position: relative;
		}
		
		.class-assess-section > div:first-child {
		    position: relative;
		    display: inline-block;
		    z-index: 2;
		}

		.class-assess-outer-div1 {
		    margin-bottom: 16px;
		    display: inline-flex;
		    flex-direction: column;
		}

		.class-assess-outer-div2 {
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		}

		.class-assess-title1 {
		    font-size: 20px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    margin: 0px;
		}

		.class-assess-count {
		    color: rgb(253, 126, 20);
		}

		.class-assess-content-outer-div {
		    margin-bottom: 24px;
		}
		
		.class-assess-content-outer-div-logon-mine {
		    background-color : #fefbed;
		}

		.profile-and-name {
		    display: flex;
		    flex-direction: row;
		}

		.profile-outer-div {
		    position: relative;
		    width: 24px;
		    height: 24px;
		    background-color: rgb(255, 255, 255);
		    border-radius: 50%;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(237, 239, 240);
		    border-image: initial;
		}
	
		.profile-outer-span1 {
		    width: 100%;
		    height: 100%;
		    line-height: 0;
		    border-radius: 50%;
		}
		
		.profile-outer-span2 {
		    display: block;
		    position: relative;
		    font-size: 0px;
		    overflow: hidden;
		}

		.class-assess-img-tag {
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

		.name-outer-div {
		    display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    -webkit-box-align: center;
		    align-items: center;
		    margin-left: 8px;
		    margin-right: auto;
		}

		.name-inner-div1 {
    		color: rgb(62, 64, 66);
		}
		
		.name-inner-div2 {
		    font-size: 11px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 16px;
		    letter-spacing: normal;
		    margin: 0px;
		}

		.class-assess-reply-outer-div {
		    margin-left: 32px;
		    margin-top: 4px;
		    display: block;
		}

		.class-assess-reply-content1 {
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		    color: rgb(62, 64, 66);
		    overflow: hidden;
		}
		
		.class-assess-reply-content2 {
		    font-size: 14px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    margin: 0px;
		}

		.class-intro-h4-lesson-days1 {
		    word-break: keep-all;
		}
		
		.class-intro-h4-lesson-days2 {
		    font-size: 24px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}

		.class-intro-h4-category {
		    color: rgb(42, 143, 180);
		}

		.class-intro-lesson-days-outer-div {
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    align-content: stretch;
		    margin-right: -12px;
		    margin-left: -12px;
		}
		
		.class-intro-expect-days {
		    width: 50%;
		}
		
		.class-intro-expect-days-inner {
		    width: 100%;
		    height: 104px;
		    background-color: rgb(255, 255, 255);
		    margin-bottom: 16px;
		    padding-top: 12px;
		    border-radius: 3px;
		}
		
		.class-intro-expect-days-real-outer-div {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    align-items: flex-end;
		}
		
		.class-intro-expect-days-real-span {
		    font-size: 48px;
		    line-height: 56px;
		    letter-spacing: -1px;
		    color: rgb(42, 143, 180);
		    font-weight: normal;
		    margin: 0px 4px 0px 0px;
		}
		
		.class-intro-expect-date {
		    font-size: 24px;
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    font-weight: normal;
		    margin: 18px 0px 6px;
		}

		.class-intro-expect-static-date {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    align-items: flex-end;
		}
	
		.class-intro-expect-static-p-tag {
		    font-size: 11px;
		    line-height: 16px;
		    letter-spacing: normal;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    margin: 0px;
		}

		.btn-class-assess-more {
		    width: 100%;
		    height: 100%;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    text-decoration: none;
		}
		
		.lesson-reply-add-format {
		    display: flex;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    align-items: flex-end;
		}
		
		.textarea-container {
		    width: 100%;
		    align-self: center;
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		}
		
		.lesson-reply-add-textarea {
		    width: 100%;
		    height: 20px;
		    background-color: transparent;
		    padding: 0px 0px 0px 8px;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: 0px;
		}
		
		.star-result-outer-div {
			width : 100%;
		}
		
		.class-kit-expect-days-real-span {
		    font-size: 18px;
		    line-height: 56px;
		    letter-spacing: -1px;
		    color: rgb(42, 143, 180);
		    font-weight: bold;
		    margin: 0px 4px 0px 0px;
		}
		
		.class-kit-expect-price {
		    font-size: 12px;
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    font-weight: normal;
		    margin: 18px 0px 6px;
		}
		
		.starRev {
		 	display : inline-block;
		 }
		 
		 .start-number {
		 	color: rgb(253, 126, 20) !important;
		 }
		 
		 .now-star {
		 	font-size: 20px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		 }
		 
		  .textarea-container {
		    width: 100%;
		    align-self: center;
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		}
		
		.lesson-reply-add-textarea {
		    width: 100%;
		    height: 20px;
		    background-color: transparent;
		    padding: 0px 0px 0px 8px;
		    border-width: 1px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: 0px;
		}
		
		.fa-heart {
			color : red;
		}
		
		.lesson-first-title1 {
			word-break: keep-all;
    		margin-top: 48px;
		}
		
		.lesson-first-title2 {
		    font-size: 24px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}

		.lesson-first-title-intro {
		    font-size: 14px;
		    line-height: 24px;
		    text-align: left;
		    color: rgb(62, 64, 66);
		    margin: 12px 0px 16px;
		}
	
		.lesson-content {
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    align-content: stretch;
		    margin-right: -12px;
		    margin-left: -12px;
		}
	
		.lesson-content-total-outer-div {
		    word-break: break-word;
		    margin-bottom: 48px;
		    width: 100%;
		}
		
		.lesson-title-and-img-outer-div {
		    margin-top: 24px;
		}

		.lesson-title-and-img-inner-div {
		    display: block;
		}
	
		.lesson-cotent-for-each-outer-div {
		    display: flex;
		    width: 100%;
		}

		.lesson-content-carousel-img {
		    width: 220px;
		    margin-right: 24px;
		    flex: 0 0 auto;
		}
		
		.lesson-content-carousel-img-outer-div {
		    width: 220px;
		    margin-right: 24px;
		    flex: 0 0 auto;
		}

		.lesson-content-carousel-img-inner-div {
		    height: auto;
		}
	
		.owl-outer-1 {
		    display: block;
		    background-color: rgb(255, 255, 255);
		    font-size: 14px;
		    line-height: 24px;
		    padding: 0px 12px;
		}

		.lesson-content-text-outer-div {
		    flex: 1 1 auto;
		}
	
		.lesson-content-main-text-div {
		    margin-top: 12px;
		    display: flex;
		    align-items: flex-start;
		    cursor: pointer;
		}
	
		.lesson-content-number-div {
		    font-size: 11px;
		    font-weight: normal;
		    line-height: 16px;
		    letter-spacing: normal;
		    background-color: rgb(237, 239, 240);
		    color: rgb(62, 64, 66);
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    width: 20px;
		    height: 20px;
		    margin: 0px 16px 0px 0px;
		    flex: 0 0 auto;
		    border-radius: 100%;
		}

		.lesson-content-text-div {
		    font-size: 14px;
		    font-weight: normal;
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    color: rgb(62, 64, 66);
		    margin: 0px;
		    flex: 1 1 auto;
		}

		.lesson-content-inner-div {
		    margin-top: 12px;
		    display: flex;
		    align-items: flex-start;
		    cursor: pointer;
		}
		
		.lesson-content-click-a-tag {
			margin-top : 5px;
		}
		
		.class-intro-event-outer-div {
		    position: relative;
		    margin-left: auto;
		    margin-right: auto;
		}
		
		.class-intro-event-outer-inner-div {
		    background-color: rgb(27, 28, 29);
		    position: relative;
		    padding: 0px 36px 48px;
		    margin: 0px -12px 48px;
		}
		
		.class-intro-evnet-inner-div {
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    align-content: stretch;
		    margin-right: -12px;
		    margin-left: -12px;
		}

		.class-intro-event-static-top {
		    position: relative;
		    width: 100%;
		    margin: 48px 0px 24px;
		}

		.class-intro-event-static-top-h3-1 {
		    word-break: keep-all;
		}
		
		.class-intro-event-static-top-h3-2 {
		    font-size: 24px;
		    font-weight: bold;
		    color: rgb(248, 248, 249);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.class-intro-event-static-top-h3-2::after {
		    content: "";
		    display: block;
		    clear: both;
		}
		
		.kaxRSZ {
		    word-break: break-word;
		    width: 100%;
		    margin-top: -8px;
		    margin-bottom: 0px;
		}
		
		.class-intro-event-h4-1 {
		    font-size: 20px;
		    font-weight: bold;
		    color: rgb(237, 239, 240);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    margin: 0px;
		}
		
		.class-intro-event-h4-2 {
		    margin-bottom: 16px;
		}
		
		.dl-event {
		    margin-bottom: 0px;
		    margin-top: 8px;
		}
		
		.this-is-dd {
		    font-size: 14px;
		    font-weight: bold;
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    padding-left: 140px;
		    text-align: right;
		    color: rgb(255, 255, 255);
		    margin: 0px;
		}

		.this-is-dt {
		    font-size: 14px;
		    font-weight: normal;
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    color: rgb(255, 255, 255);
		    float: left;
		    margin: 0px;
		}
		
		.class-intro-content-in-summer-note div:first-child {
		    font-size: 25px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    margin: 0px;
		}
		
		.class-intro-content-in-summer-note p:first-child {
		    font-size: 25px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    margin: 0px;
		}
		
		.class-intro-content-in-summer-note {
			overflow : hidden;
		}
		
		.btn.btn-light.steam-button {
			background-color : #FFFFFF;
		}
		
		.spinner-outer-div {
			width : 100%;
			position : relative;
			z-index : 1;
			height : 100%;
		}
		
		.spinner-border {
			display : block;
			position : fixed;
			top : calc(50% - (58px / 2));
			right : calc(50% - (58px / 2));
		}
		
		
		
		
		.nav-menu-black {
		  position: relative;
		  white-space: nowrap;
		  background: white;
		  padding: var(--underline-height) 0;
		  margin: 2em 0;
		  box-shadow: 0 1em 2em rgba(0, 0, 0, 0.05);
		}
		
		.underline {
		  display: block;
		  position: absolute;
		  z-index: 0;
		  bottom: 0;
		  left: 0;
		  height: var(--underline-height);
		  width: 20%;
		  background: black;
		  pointer-events: none;
		  mix-blend-mode: multiply;
		  -webkit-transition: -webkit-transform var(--transition-duration) ease-in-out;
		  transition: -webkit-transform var(--transition-duration) ease-in-out;
		  transition: transform var(--transition-duration) ease-in-out;
		  transition: transform var(--transition-duration) ease-in-out, -webkit-transform var(--transition-duration) ease-in-out;
		}
		.underline:nth-child(1) {
		  background: yellow;
		  -webkit-transition: calc(var(--transition-duration) * .8);
		  transition: calc(var(--transition-duration) * .8);
		}
		.underline:nth-child(2) {
		  background: cyan;
		  -webkit-transition: calc(var(--transition-duration) * 1.2);
		  transition: calc(var(--transition-duration) * 1.2);
		}
		.underline:nth-child(3) {
		  background: magenta;
		}
		
		.nav-menu-black a {
		  display: inline-block;
		  z-index: 10;
		  width: 20%;
		  padding: 1em 0;
		  text-align: center;
		  cursor: pointer;
		}
		
		.nav-menu-black .underline {
		  background: #222;
		  border-radius: .25em;
		  height: calc(var(--underline-height) / 2);
		  mix-blend-mode: initial;
		}
		
		:root {
		  --underline-height: .5em;
		}
		
		.mini-button-to-top:hover {
		    cursor: pointer;
		}
		
		@media (max-width: 576px) {
		    .mini-button-to-top {
		        position: fixed;
		        bottom: 3rem;
		        right: 1rem;
		        font-size: 1rem;
		        width: 2rem;
		        height: 2rem;
		        text-align: center;
		        line-height: 2rem;
		        border: 0;
		        border-radius: 2rem;
		        background-color: rgba(255, 255, 255, 0.5);
		        z-index:9999;
		    }
		}
				
		.mini-button-to-top {
		    position: fixed;
		    bottom: 3rem;
		    right: 3rem;
		    font-size: 1.5rem;
		    width: 3rem;
		    height: 3rem;
		    text-align: center;
		    line-height: 3rem;
		    border: 0;
		    border-radius: 2rem;
		    background-color: rgba(255, 255, 255, 0.5);
		    z-index:9999;
		}
		
		/*
		.class-intro-to-the-top-mini {
		    position: fixed;
		    bottom: 6rem;
		    right: 2rem;
		    font-size: 1.5rem;
		    width: 3rem;
		    height: 3rem;
		    text-align: center;
		    line-height: 3rem;
		    border: 0;
		    border-radius: 2rem;
		    background-color: rgb(36, 36, 36);
		    z-index: 100;
		}
		*/

		.class-intro-content-in-summer-note img {
			width : 100% !important;
			height : auto !important;
		}
		
		.class-intro-content-in-summer-note {
			/* float : center; */
			margin : 0 auto;
		}
	</style>

</head>
<body>
	<jsp:include page="/common/header.jsp"/>
	
	
	<input type="hidden" class="user-hidden-class-intro-value" value="${sessionScope.user.userId }"/>
	<input type="hidden" class="steam-count"/>
	<input type="hidden" class="steam-check"/>
	<input type="hidden" class="current-page"/>
	<input type="hidden" class="hidden-star-number" value="1"/>
	<input type="hidden" class="hidden-assess-content"/>
	<input type="hidden" class="hidde-lesson-content-max-page" value="${lessonCountResultPage.maxPage }" />
	<input type="hidden" class="hidden-hobby-class-number" value="${hobbyClass.hobbyClassNo }" />
	<input type="hidden" class="hidden-purchase-check" value="${purchaseCheck }" />
	<input type="hidden" class="hidden-class-state" value="${hobbyClass.hobbyClassState }" />
	<input type="hidden" class="hidden-class-assess-check" value="${ !empty classAssess ? '1' : '0' }" />
	
	<br/><br/><br/><br/>
	
	<div class="spinner-outer-div">
		<div class="spinner-border text-warning" role="status">
	  		<span class="sr-only">Loading...</span>
		</div>
	</div>

	<div class="container container-small-nav-menu">
		<div class="row">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-white class-intro-nav-bar">
					<span class="navbar-brand">클래스 메뉴</span>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item active nav-in-class-detail-menu">
								<a class="nav-link">
									<span class="nav-span-inner-nav-link">
										<span>클래스 소개</span>
										<input type="hidden" value="0" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link just-bar">
									<span class="nav-span-inner-nav-link">
										<span>클래스 준비물</span>
										<input type="hidden" value="1" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link just-bar">
									<span class="nav-span-inner-nav-link">
										<span>클래스 한줄평</span>
										<input type="hidden" value="2" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link just-bar">
									<span class="nav-span-inner-nav-link">
										<span>클래스 강의</span>
										<input type="hidden" value="3" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link just-bar">
									<span class="nav-span-inner-nav-link">
										<span>클래스 커뮤니티</span>
										<input type="hidden" value="4" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>

		<!-- 테스트중 -->
		<div class="container-fluid container-big-nav-menu">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav class="black nav-menu-black">
					  <div class="underline"></div>
					  <div class="underline"></div>
					  <div class="underline"></div>
					  <a onClick="ul(0)">클래스 소개</a>
					  <a onClick="ul(1)">클래스 준비물</a>
					  <a onClick="ul(2)">클래스 한줄평</a>
					  <a onClick="ul(3)">클래스 강의</a>
					  <a onClick="ul(4)">클래스 커뮤니티</a>
					</nav>
				</div>
			</div>
		</div>
		<!-- 테스트중 -->
	
	<br/><br/>
	
	<div class="container container-background-setting1 container-background-setting2">
		<div class="row class-intro-row">

			<!-- 	<div class="col-lg-8 class-intro-image-col-area1 class-intro-image-col-area2"> -->
			<div class="col-lg-8">
				
				<div class="image-outer-div">
					<span class="image-outer-span">
						<img src="/images/hobbyclass/${hobbyClass.hobbyClassImage }" class="img-class-intro"/>
					</span>
				</div>
				
				<!-- class intro 시작 -->
				<div class="class-intro-content">
					<div class="class-intro-image-col-area1 class-intro-image-col-area2">
						<!--  
						<div class="image-outer-div">
							<span class="image-outer-span">
								<img src="/images/hobbyclass/${hobbyClass.hobbyClassImage }" class="img-class-intro"/>
							</span>
						</div>
						-->
						
						<h3 class="class-intro-h4-lesson-days1 class-intro-h4-lesson-days2">
							<span class="class-intro-h4-category">
								<c:if test="${hobbyClass.category == 'E' }">
									운동 
								</c:if>
								<c:if test="${hobbyClass.category == 'A' }">
									미술 
								</c:if>
								<c:if test="${hobbyClass.category == 'M' }">
									음악 
								</c:if>
								<c:if test="${hobbyClass.category == 'L' }">
									라이프스타일 
								</c:if>
								<c:if test="${hobbyClass.category == 'C' }">
									요리 
								</c:if>
								<c:if test="${hobbyClass.category == 'H' }">
									공예 
								</c:if>
							</span>			
							&nbsp;카테고리의 	
							<br/>
							<span class="class-intro-h4-category">
								${hobbyClass.hobbyClassName }
							</span>	
							<br/>
							클래스입니다.			
						</h3> 
						
						<div class="class-intro-lesson-days-outer-div mt-3">
							<div class="class-intro-expect-days">
								<div class="class-intro-expect-days-inner">
									<div class="class-intro-expect-days-real-outer-div">
										<span class="class-intro-expect-days-real-span">
											${hobbyClass.lessonTotalCount * 3 }
										</span>
										<p class="class-intro-expect-date">
											일
										</p>
									</div>
									<div class="class-intro-expect-static-date">
										<p class="class-intro-expect-static-p-tag">
											수강 기간
										</p>
									</div>
								</div>
							</div>
							
							<div class="class-intro-expect-days">
								<div class="class-intro-expect-days-inner">
									<div class="class-intro-expect-days-real-outer-div">
										<span class="class-intro-expect-days-real-span">
											${hobbyClass.lessonTotalCount }
										</span>
										<p class="class-intro-expect-date">
											개
										</p>
									</div>
									<div class="class-intro-expect-static-date">
										<p class="class-intro-expect-static-p-tag">
											전체 강의 수
										</p>
									</div>
								</div>
							</div>
							
						</div>
						
						<c:if test="${ !empty hobbyClass.event }" >
							<!-- 이벤트(혜택) 구간 -->
							<div>
								<div class="class-intro-event-outer-div">
									<div class="class-intro-event-outer-inner-div">
										<div>
											<div class="class-intro-event-outer-div">
												<div class="class-intro-event-inner-div">
													<div class="class-intro-event-static-top">
														<br/>
														<h3 color="#f8f8f9" class="class-intro-event-static-top-h3-1 class-intro-event-static-top-h3-2 mt-3">
															지금 적용되고 있는 
															<br/>
															혜택이에요!
														</h3>
													</div>
													
													<!-- 그냥 빈칸 만들어주는 얘인듯 -->
													<div class="ContentSectionStyle__SectionBodyColumn-sc-1oywcqb-3 BenefitSection__CardColumn-sc-18zojo3-1 kaxRSZ">
													</div>
													
													<h4 font-weight="bold" color="#edeff0" class="class-intro-event-h4-1 class-intro-event-h4-2">
														이벤트 혜택 계산
													</h4>
													<br/>
													
													<dl class="dl-event">
														<dt class="this-is-dt mr-4">
															이벤트 내용
														</dt>
														<dd class="this-is-dd">
															최종 금액
														</dd>
													</dl>
													<dl class="dl-event">
														<dt class="this-is-dt mr-4">
															${hobbyClass.event.eventTitle }
														</dt>
															<dt class="this-is-dt hide-dt-tag mr-4">
																${hobbyClass.event.eventStartDate } 부터 ~ ${hobbyClass.event.eventEndDate } 까지
															</dt>
															<dt class="this-is-dt hide-dt-tag mr-4">
																${hobbyClass.event.eventDiscount } % 할인
															</dt>
														<dd class="this-is-dd">
															<fmt:formatNumber value="${hobbyClass.event.resultPrice }" pattern="#,###" />&nbsp;원
														</dd>
													<!-- 
													<c:forEach var="event" items="${eventList }">
														<dl class="dl-event">
															<dt class="this-is-dt mr-4">
																${event.eventTitle }
															</dt>
															<dt class="this-is-dt mr-4">
																${event.eventStartDate } 부터 ~ ${event.eventEndDate } 까지
															</dt>
															<dt class="this-is-dt mr-4">
																${event.eventDiscount } % 할인
															</dt>
															<dd class="this-is-dd">
																<fmt:formatNumber value="${event.resultPrice }" pattern="#,###" />&nbsp;원
															</dd>
														</dl>
													</c:forEach>
													 -->
													 </dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 이벤트(혜택) 구간 -->
						</c:if>
						
						<div class="class-assess-outer-div1">
							<div class="class-assess-outer-div2">
								<h4 class="class-assess-title1 class-assess-title2 class-assess-title3">
									<span class="class-assess-count">
										${hobbyClass.user.nickName } 
									</span>
									크리에이터가 작성한 클래스 소개입니다.
								</h4>
							</div>
						</div>
						
						<br/>
						
						<!-- 대충 이런식으로 들어가게 하면 될듯  -->
						<div class="class-intro-content-in-summer-note">
							${hobbyClass.hobbyClassIntro }
						</div>
					</div>
				</div>
				<!-- class intro 끝 -->
				
				<!-- class kit 시작 -->
				<div class="class-kit-content">
					<div class="class-intro-image-col-area1 class-intro-image-col-area2">
						
						<h3 class="class-intro-h4-lesson-days1 class-intro-h4-lesson-days2">
							<span class="class-intro-h4-category">
								${hobbyClass.hobbyClassName }
							</span>			
							&nbsp;클래스의 	
							<br/>
							<span class="class-intro-h4-category">
								준비물
							</span>	
							<br/>
							소개입니다.	
						</h3> 
						
						<div class="image-outer-div mt-5">
							<span class="image-outer-span">
								<img src="/images/hobbyclass/${hobbyClass.kitImage }" class="img-class-intro"/>
							</span>
						</div>
						
						<div class="class-intro-lesson-days-outer-div mt-3">
							<div class="class-intro-expect-days">
								<div class="class-intro-expect-days-inner">
									<div class="class-intro-expect-days-real-outer-div">
										<span class="class-kit-expect-days-real-span">
											${hobbyClass.kitName }
										</span>
									</div>
									<div class="class-intro-expect-static-date">
										<p class="class-intro-expect-static-p-tag">
											준비물 이름
										</p>
									</div>
								</div>
							</div>
							
							<div class="class-intro-expect-days">
								<div class="class-intro-expect-days-inner">
									<div class="class-intro-expect-days-real-outer-div">
										<span class="class-kit-expect-days-real-span">
											<fmt:formatNumber value="${hobbyClass.kitPrice }" pattern="#,###" />
										</span>
										<p class="class-kit-expect-price">
											원 
										</p>
									</div>
									<div class="class-intro-expect-static-date">
										<p class="class-intro-expect-static-p-tag">
											준비물 가격
										</p>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="class-assess-outer-div1">
							<div class="class-assess-outer-div2">
								<h4 class="class-assess-title1 class-assess-title2 class-assess-title3">
									<span class="class-assess-count">
										${hobbyClass.kitName } 
									</span>
									&nbsp;의 상세한 설명입니다.
								</h4>
							</div>
						</div>
						
						<br/>
						
						<!-- 대충 이런식으로 들어가게 하면 될듯  -->
						<div class="class-kit-content">
							<p>${hobbyClass.kitIntro }</p>
						</div>
					</div>
				</div>
				<!-- class kit 끝 -->
				
				<!-- class assess 시작 -->
				<div class="class-assess-content end-class">
					<h3 class="class-intro-h4-lesson-days1 class-intro-h4-lesson-days2">
							<span class="class-intro-h4-category">
								${hobbyClass.hobbyClassName }
							</span>			
							&nbsp;클래스의 	
							<br/>
							<span class="class-intro-h4-category">
								클래스 한줄평
							</span>	
							<br/>
							목록입니다.	
						</h3> 
					
					<div class="class-assess-section mt-3">
						<!-- 생생한 후기 글씨 시작 -->
						<div class="class-assess-outer-div1 mt-3 mb-3">
							<div class="class-assess-outer-div2">
								<h4 class="class-assess-title1 class-assess-title2 class-assess-title3">
									<span class="class-assess-count">
										${resultPage.totalCount } 개
									</span>
									의 생생한 후기를 확인해보세요. 
								</h4>
							</div>
						</div>
						<!-- 생생한 후기 글씨 시작 -->
						
						<div class="why-div-wrapper-need">
							<ul class="list-unstyled">
								<c:forEach var="classAssess" items="${listAssessContent }">
									<li class="media my-4">
										<c:if test="${!empty classAssess.user.profileImage }">
											<img src="/resources/image/woo/${classAssess.user.profileImage}" class="mr-3 lesson-reply-profile-image" onError="this.src='/resources/image/logo/unnamed.jpg'">
										</c:if>
										<c:if test="${empty classAssess.user.profileImage }">
											<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src='/resources/image/logo/unnamed.jpg'">
										</c:if>
										
										<div class="media-body">
											<h6 class="mt-0 mb-1 d-flex justify-content-between">
												<span>
													<strong>${ !empty classAssess.user.nickName ? classAssess.user.nickName : classAssess.user.name }</strong>
													<small class="text-muted">${classAssess.regDate }</small>
												</span>
												
												<span class="lesson-reply-reset-button-span">
													<span>
														<small>
															<span class="assess-star-span-right-tool-bar pull-right">
																<i class="fas fa-star"></i>&nbsp;&nbsp;${classAssess.assessStar }&nbsp;점
															</span>
														</small>
													</span>
												</span>
											</h6>
											<div class="here-is-change-update-div">
												<p>${classAssess.assessContent }</p>
											</div>
										</div>
									</li>
									<hr/>
								</c:forEach>
								
								<!-- 검색결과 출력될 span -->
							</ul>
							
							<span class="scroll-page"></span>
							
						</div>
						
						<!-- class-assess-scroll을 붙여넣을 그 공간 깃대와도 같다 -->
						<span class="class-assess-scroll-flag"></span>
						
						<!-- 클래스 한줄평 붙여놓을 그 공간 -->
						<span class="class-assess-scroll"></span>
						
						<!-- 한줄평 더보기 -->
						<c:if test="${resultPage.maxPage > 1 }">
							<button type="button" class="btn btn-class-assess-more">한줄평 더보기</button>
						</c:if>
						<!-- 우측 툴바로 빼버림 -->
						<!-- <button type="button" class="btn btn-class-assess-add">한줄평 작성하기</button> -->
					</div>
				</div>
				<!-- class assess 끝 -->
				
				<!-- 수요조사, 개강 중일때에는 class assess가 없다 그를 위한 가리기용 -->
				<div class="class-assess-content non-end-class"> 
					<h3 class="class-intro-h4-lesson-days1 class-intro-h4-lesson-days2">
						<span class="class-intro-h4-category">
								${hobbyClass.hobbyClassName }
							</span>			
							&nbsp;클래스의 	
							<br/>
							<span class="class-intro-h4-category">
								클래스 한줄평
							</span>
							은 	
							<br/>
							종강시에 보실 수 있습니다.
					</h3>
				</div>
				<!-- lesson list(content) 시작 -->

				<div class="lesson-content">
					<h3 class="lesson-first-title1 lesson-first-title2">
						클래스 강의
					</h3>
					<div class="lesson-content-total-outer-div">
						<div class="lesson-first-title-intro">
							클래스에 포함된 강의 목록입니다.
							<br/>
							강의 콘텐츠는 영상과 수업노트로 구성되어 있습니다.
						</div>
						<div class="lesson-title-and-img-outer-div">
							<div class="lesson-title-and-img-inner-div">
								<h3 class="class-intro-h4-lesson-days1 class-intro-h4-lesson-days2">
									해당 클래스는 
									<span class="class-intro-h4-category">
									</span>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<!-- lesson list(content) 끝 -->
				
			</div>

			
			
			<!-- 옆에 오른쪽 툴바 시작 -->
			<div class="col-lg-4 fixed-right-tool-bar">
				<div class="fixed-right-tool-bar-outer-div1 fixed-right-tool-bar-outer-div2">
					<span class="this-is-by-creator-nickname">
						By. ${hobbyClass.user.nickName }
					</span>
					<h2 class="this-is-class-title-to-the-right-fixed-tool-bar">
						${hobbyClass.hobbyClassName }
					</h2>
					<div class="this-is-for-each-hashtag-div">
						<span class="hashtag-wrapper-but-not-bootstrap">
							<i class='fas fa-list'></i>&nbsp;
							<c:if test="${hobbyClass.category == 'E' }">
								운동 
							</c:if>
							<c:if test="${hobbyClass.category == 'A' }">
								미술 
							</c:if>
							<c:if test="${hobbyClass.category == 'M' }">
								음악 
							</c:if>
							<c:if test="${hobbyClass.category == 'L' }">
								라이프스타일 
							</c:if>
							<c:if test="${hobbyClass.category == 'C' }">
								요리 
							</c:if>
							<c:if test="${hobbyClass.category == 'H' }">
								공예 
							</c:if>		
						</span>
						<span class="hashtag-wrapper-but-not-bootstrap">
							<span class="assess-star-span-right-tool-bar pull-right">
								<i class="fas fa-star"></i>&nbsp;&nbsp;${hobbyClass.totalGrade }
							</span>
						</span>
						
						<br/><br/>
						<c:forEach var="hashtag" items="${hobbyClass.hashtag }">
							<span class="hashtag-wrapper-but-not-bootstrap mt-2">
  								<i class='fas fa-hashtag'></i>&nbsp;${hashtag }
							</span>
						</c:forEach>
						<c:if test="${!empty hobbyClass.event }">
							<span class="class-intro-for-discount-percent mt-2" color="#f33340" font-weight="bold">
								최대 ${hobbyClass.event.eventDiscount }%&nbsp;할인
							</span>
						</c:if>
						<span class="class-intro-last-price">
							정가 <fmt:formatNumber value="${hobbyClass.hobbyClassPrice }" pattern="#,###" />&nbsp;원
						</span>
						<!-- 
						<div class="class-intro-steam-button-outer-div">
							<button class="steam-button steam-button1 steam-button2 steam-button3">
								<div class="steam-heart-font">
									<c:if test="${hobbyClass.steamCheck == '0' }">
										<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M17.586 15.086c2.07-2.07 2.914-3.572 2.914-5.586A3.5 3.5 0 0017 6c-1.074 0-1.92.392-2.829 1.19a14.88 14.88 0 00-.757.724L12 9.328l-1.414-1.414a14.88 14.88 0 00-.757-.724C8.919 6.392 8.074 6 7 6a3.5 3.5 0 00-3.5 3.5c0 2.014.844 3.516 2.914 5.586 1.038 1.037 2.91 2.277 5.586 3.67 2.677-1.393 4.548-2.633 5.586-3.67zM5 16.5c-1.911-1.911-3.5-3.962-3.5-7A5.5 5.5 0 017 4c2.5 0 4 1.5 5 2.5 1-1 2.5-2.5 5-2.5a5.5 5.5 0 015.5 5.5c0 3.038-1.589 5.089-3.5 7-1.333 1.333-3.667 2.833-7 4.5-3.333-1.667-5.667-3.167-7-4.5z"></path></svg>
									</c:if>
									
									<c:if test="${hobbyClass.steamCheck == '1' }">
										<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M5 16.5c-1.911-1.911-3.5-3.962-3.5-7A5.5 5.5 0 017 4c2.5 0 4 1.5 5 2.5 1-1 2.5-2.5 5-2.5a5.5 5.5 0 015.5 5.5c0 3.038-1.589 5.089-3.5 7-1.333 1.333-3.667 2.833-7 4.5-3.333-1.667-5.667-3.167-7-4.5z"></path></svg>
									</c:if>
								</div>
								<span class="steam-count">
									<span class="steam-inner-count">${hobbyClass.steamCount }</span>
								</span>
							</button>
						</div>
						-->
						<div class="class-intro-steam-button-outer-div">
							<button type="button" class="btn btn-light steam-button">
								<c:if test="${hobbyClass.steamCheck == '0' }">
									<i class='far fa-heart'></i>
								</c:if>
								
								<c:if test="${hobbyClass.steamCheck == '1' }">
									<i class='fas fa-heart'></i>
								</c:if>
								
								&nbsp;<span class="steam-inner-count">${hobbyClass.steamCount }</span>
							</button>
						</div>
						<div class="class-intro-purchase-button mt-2">
							  
							<button type="button" class="purchase-button purchase-button1 purchase-button2">
								<span class="purchase-button-text">
									클래스 구매하기
								</span>
							</button>
							
							<button type="button" class="purchase-button-already-buy" disabled>
								<span class="purchase-button-text">
									이미 구매한 클래스입니다.
								</span>
							</button>
							
							<button type="button" class="purchase-button-end-class" disabled>
								<span class="purchase-button-text">
									이미 종강된 클래스입니다.
								</span>
							</button>
							
							<button type="button" class="purchase-button-cannot-purchase" disabled>
								<span class="purchase-button-text">
									구매할 수 없습니다.
								</span>
							</button>
							
							<button type="button" class="purchase-button-add-assess-content purchase-button1 purchase-button2 can-add-button">
								<span class="purchase-button-text">
									한줄평 작성하기
								</span>
							</button>
							
							<button type="button" class="purchase-button-add-assess-content purchase-button1 purchase-button2 cannot-add-button" disabled>
								<span class="purchase-button-text">
									한줄평 작성하기
								</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 옆에 오른쪽 툴바 끝 -->
		</div>
	</div>
	
	<!-- 화면 작아지면 출력할 푸터바 시작 -->
	<div class="container small-width-bottom-fixed">
		<div class="row">
			<div class="col-lg-12 fixed-bottom">
				<div class="class-intro-purchase-button mt-2">
					<button type="button" class="purchase-button purchase-button1 purchase-button2">
						<span class="purchase-button-text">
							클래스 구매하기
						</span>
					</button>
					
					<button type="button" class="purchase-button-already-buy" disabled>
						<span class="purchase-button-text">
							이미 구매한 클래스입니다.
						</span>
					</button>
					
					<button type="button" class="purchase-button-add-assess-content purchase-button1 purchase-button2 can-add-button">
						<span class="purchase-button-text">
							한줄평 작성하기
						</span>
					</button>
							
					<button type="button" class="purchase-button-add-assess-content purchase-button1 purchase-button2 cannot-add-button" disabled>
						<span class="purchase-button-text">
							한줄평 작성하기
						</span>
					</button>
				</div>
				
				
			</div>
		</div>
	</div>
	<!-- 화면 작아지면 출력할 푸터바 끝 -->
	
	<!-- 누르면 위로 올라가는 버튼 -->
	<span class="mini-button-to-top shadow">
    	<i class="fas fa-arrow-up arrow-i-tag"></i>
    </span>
	<!-- 누르면 위로 올라가는 버튼 -->
	
	<!-- 클래스 한줄평 작성 모달창 시작
	
	<div class="modal fade class-assess-add-modal" tabindex="-1" role="dialog" aria-labelledby="class-assess-add-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="class-assess-add-modal-label">한줄평 작성하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 한줄평 작성 양식 시작 
					<div class="lesson-reply-add-format">
						<div class="leeson-reply-add-container">
							<img src="/images/hobbyclass/default-profile.jpg" class="rounded-circle"/>
							<br/>	
							<br/>
							<span class="star-value-span">
								선택하신 별점은 <span class="text-danger">1점</span> 입니다.
							</span>
							<br/>
							<br/>
							<div class="starRev">
								<span class="starR1 on">별1_왼쪽</span>
								<span class="starR2">별1_오른쪽</span>
								<span class="starR1">별2_왼쪽</span>
								<span class="starR2">별2_오른쪽</span>
								<span class="starR1">별3_왼쪽</span>
								<span class="starR2">별3_오른쪽</span>
								<span class="starR1">별4_왼쪽</span>
								<span class="starR2">별4_오른쪽</span>
								<span class="starR1">별5_왼쪽</span>
								<span class="starR2">별5_오른쪽</span>
							</div>
							<input type="hidden" class="class-assess-star-hidden-value"/>
							<br/><br/><br/>
							<div class="textarea-container">
								<textarea class="lesson-reply-add-textarea" rows="10" name="content" type="text" placeholder="댓글을 작성해주세요." sizes="md" style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 24px;"></textarea>
							</div>
						</div>
						
					</div>
					<!-- 한줄평 작성 양식 끝
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary btn-class-assess-modal-add-button">작성</button>
				</div>
			</div>
		</div>
	</div>
	클래스 한줄평 작성 모달창 끝 -->
	<br/><br/><br/><br/><br/>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>