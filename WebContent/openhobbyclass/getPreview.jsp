<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- //2020-02-24 Git Commit --%>
<!DOCTYPE html>
<html>
<head>
	<title>GetHobby</title>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Insert title here</title>
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
	
	<script type="text/javascript">
		$(function(){
			
			
			
			var hobbyClassNo = $('.hidden-hobby-class-number').val();	
			
			var kitImage = '';
			
			kitImage = '${hobbyClass.kitImage}';
			
			if ( kitImage == '' ) {
				$('.kit-nav-bar-select').hide();
			}
			else {
				$('.kit-nav-bar-select').show();
			}
			
			// 클래스 한줄평인데 일단 다 가리고 보자
			$('.end-class').hide();
			$('.non-end-class').hide();
			// 클래스 한줄평인데 일단 다 가리고 보자
			
			// 돌아가기 버튼 이벤트 
			$(document).on("click",".gpv-cct-cco",function(){
				self.location = "/hobbyclass/getSaveHobbyClass?hobbyClassNo="+hobbyClassNo;
			});
			
			// 모달 창 닫기
			$(".close-btn").click(function(){
				$('#exampleModalCenter').modal('hide');
			});
			
			// 계속 작성하기 버튼
			$(document).on("click", ".gesockbutton", function(){
				self.location = "/hobbyclass/getSaveHobbyClass?hobbyClassNo="+hobbyClassNo;
			});
			
			// 검토하기 버튼 이벤트
			var count = 0;
			$(document).on("click",".gpv-cct-cc",function(){
				$(".saveCheckButton").click();
				
				getCheck('${hobbyClass.hobbyClassImage}', 'hobbyClassImage');
				//var tempIntro = ${hobbyClass.hobbyClassIntro};
				//alert(tempIntro);
				//getCheck('${hobbyClass.hobbyClassIntro}', 'hobbyClassIntro');
				getCheck('${hobbyClass.hobbyClassName}', 'hobbyClassName');
				getCheck('${hobbyClass.category}', 'category');
				getCheck('${hobbyClass.hashtag[0]}', 'hashtag');
				getCheck('${hobbyClass.hashtag[1]}', 'hashtag');
				getCheck('${hobbyClass.hashtag[2]}', 'hashtag');
				getCheck('${hobbyClass.kitImage}', 'kitImage');
				getCheck('${hobbyClass.kitName}', 'kitName');
				getCheck('${hobbyClass.kitIntro}', 'kitIntro');
				getCheck('${hobbyClass.kitPrice}', 'kitPrice');
				getCheck('${lesson[0].lessonVideo}', 'lessonVideo');
				getCheck('${lesson[0].lessonTitle}', 'lessonTitle');
				getCheck('${lesson[0].lessonProject}', 'lessonProject');
				getCheck('${lesson[0].lessonIntro}', 'lessonIntro');
				//getCheck('${lesson[0].lessonContent}', 'lessonContent');
				getCheck('${lesson[0].lessonImage}', 'lessonImage');
				$('.hobbyClassIntro').hide();
				$('.lessonContent').hide();
				
				
				
				
				
			});
			
			function getCheck(property,name) {
				if( property == null || property == '' || property == 0 || property == []){
					$('.'+name).show();
				}else{
					$('.'+name).hide();
					count ++;
				}
				if( count <= 15 ){
					//$(".gpv-cct-cc").hide();
					$(".classcheckbutton").show();
					$(".md-cli").hide();
					$(".md-sadim").hide();
					self.location = "/hobbyclass/saveCheckHobbyClass?hobbyClassNo="+hobbyClassNo;
					count = 0;
				}else{
					//$(".gpv-cct-cc").show();
					$(".classcheckbutton").hide();
					$(".md-cli").show();
					$(".md-sadim").hide();
					
				}
			}
			
			// 클래스 검토하기 버튼 이벤트
			$(document).on("click", ".classcheckbutton", function(){
				self.location = "/hobbyclass/saveCheckHobbyClass?hobbyClassNo="+hobbyClassNo;
			});
			
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

			// 버튼 판별용 클래스 진행상태 변수처리
			var classState = $('.hidden-class-state').val();
			
			
			// 밑바닥 고정 가리기 
			$('.small-width-bottom-fixed').hide();
	
			// 무조건 class intro 보게할 것이기 때문에 얘 진하게 
			$('.nav-span-inner-nav-link').eq(0).css({
				'font-weight' : 'bold'
			});
			
			// 키자마자 화면 크기 따라서 뭐 보여주고 뭐 감추고 해버리기 ---------------------
			var onloadWidth = $(window).width();
			
			if ( onloadWidth <= 980 ) {
				$('.small-width-bottom-fixed').show();
				$('.fixed-right-tool-bar').hide();
				$('.navbar-brand').show();
			}
			else if ( onloadWidth > 980 ) {
				$('.small-width-bottom-fixed').hide();
				$('.fixed-right-tool-bar').show();
				$('.navbar-brand').hide();
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
				}
				else {
					$('.small-width-bottom-fixed').hide();
					$('.fixed-right-tool-bar').show();
					$('.navbar-brand').hide();
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
				else if ( index != 2 ) {
					$('.lesson-content').hide();
					console.log("부엉이는 이미 있다!");
				}
				
			})
			// navbar 메뉴 선택 ------------------------------------------------
    		
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
    				return;
    			}
    			
    			if ( assessContent = '' ) {
    				$('.text-length-alert').text('공백은 입력할 수 없습니다.');
    				return;
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
									if( JSONData.lessonList[j - 1].lessonImage != null ){
										display += '<div class="item"><img src="/images/hobbyclass/' + JSONData.lessonList[j - 1].lessonImage + '" /></div>';
									}else{
										display += '<div class="item"><img src="/resources/image/gon/ohcbImage.png" /></div>';
									}
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
									if( JSONData.lessonList[j - 1].lessonTitle != null ){
										display += JSONData.lessonList[j - 1].lessonTitle;
									}else {
										display += '강의 제목';
									}
									display += '</div>';
									display += '</div>';

									display += '<input type="hidden" class="hidden-lesson-content-lesson-number" value=" ' + JSONData.lessonList[j - 1].lessonNo + '" /> ';
									
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
										if( JSONData.lessonList[j - 1].lessonImage != null ){
											display += '<div class="item"><img src="/images/hobbyclass/' + JSONData.lessonList[j - 1].lessonImage + '" 	/></div>';
										}else{
											display += '<div class="item"><img src="/resources/image/gon/ohcbImage.png" /></div>';
										}
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
										if( JSONData.lessonList[j - 1].lessonTitle != null ){
											display += JSONData.lessonList[j - 1].lessonTitle;
										}else{
											display += '강의 제목을 정해주세요.';
										}
										display += '</div>';
										display += '</div>';
										
										
										
										display += '<input type="hidden" class="hidden-lesson-content-lesson-number" value=" ' + JSONData.lessonList[j - 1].lessonNo + '" > ';
										
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
				//alert( $(this).find('.hidden-lesson-content-lesson-number').val() );
				var lessonNo = ( $(this).find('.hidden-lesson-content-lesson-number').val() ) * 1;
				
				var hobbyClassNo = $('.hidden-hobby-class-number').val();
				
				var userId = $('.user-hidden-class-intro-value').val();
				
				self.location = "/lesson/getPreviewLesson?lessonNo=" + lessonNo + "&hobbyClassNo=" + hobbyClassNo;
			})
			// 강의 상세보기 구간 ------------------------------------------------
			
		
		})
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
		    border-radius: 3px;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(255, 255, 255);
		    border-image: initial;
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
		.gpv-indi {
			background-color: rgb(255, 249, 242);
		    padding: 16px 32px;
		    border-radius: 3px;
		}
		.gpv-indione {
			font-size: 14px;
		    color: rgb(62, 64, 66);
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    font-weight: bold;
		    display: inline-flex;
		    -webkit-box-align: center;
		    align-items: center;
		    margin: 0px 0px 8px;
		}
		.gpv-inditwo {
			font-size: 11px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 16px;
		    letter-spacing: normal;
		    margin: 0px;
		}
		.gpv-insp {
			display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    margin-right: 5px;
		}
		.gpv-top {
			margin-top: 32px;
			max-width: 960px;
		}
		.gpv-kidi {
			position: relative;
		    margin-left: auto;
    		margin-right: auto;
   			max-width: 960px;
		}
		.gpv-chbt {
			margin: 8px 0px 8px 8px;
			width: auto;
		    display: inline-flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgb(255, 146, 43);
		    font-weight: 500;
		    font-size: 14px;
		    letter-spacing: -0.2px;
		    height: 32px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 12px;
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
		.gpv-chbtsp {
			display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 0 auto;
		    color: rgb(255, 255, 255);
		    font-weight: 500;
		    font-size: 14px;
		    letter-spacing: -0.2px;
		    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    		line-height: inherit;
		}
		.gpv-chabt {
			margin: 8px 0px 8px auto;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(221, 224, 226);
		    border-image: initial;
		    width: auto;
		    display: inline-flex;
		    vertical-align: middle;
		    color: rgb(62, 64, 66);
		    background-color: rgb(255, 255, 255);
		    font-weight: 500;
		    font-size: 14px;
		    letter-spacing: -0.2px;
		    height: 32px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 12px;
		    transition: background-color 0.1s ease 0s;
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		.gpv-chabta {
			color: rgb(62, 64, 66);
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
		.gpv-chtx {
			font-size: 14px;
		    color: rgb(62, 64, 66);
		    line-height: 20px;
		    letter-spacing: -0.2px;
		    font-weight: bold;
		    margin: 12px 0px 0px;
		}
		@media (max-width: 1023px){
			.gpv-tmod {
				margin-left: 24px;
    			margin-right: 24px;	
			}
		}
		.gpv-tmod {
			position: relative;
		    margin-left: auto;
		    margin-right: auto;
		}
		.gpv-tmodi {
			width:100%;
			display:flex;
		}
		.gpv-cct-cc {
			background-color: rgb(255, 146, 43); 
			color: rgb(255, 255, 255); 
			display: inline-flex; 
			vertical-align: middle; 
			font-weight: bold; 	
			height: 36px; 
			padding: 0px 12px; 
			width: auto; 
			margin: 8px 0px 8px 8px; 
			border:0; o
			utline:0 none; 
			border-radius: 3px;
			letter-spacing: -0.2px;
			font-size: 15px;
		}
		
		.gpv-cct-cco {
			color: rgb(62, 64, 66);
			width: 100%;
		    height: 100%;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    text-decoration: none;
		    margin: 8px 0px 8px auto;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(221, 224, 226);
		    border-image: initial;
		    width: auto;
		    display: inline-flex;
		    vertical-align: middle;
		    color: rgb(62, 64, 66);
		    background-color: rgb(255, 255, 255);
		    font-weight: 500;
		    font-size: 15px;
		    height: 36px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 12px;
		    transition: background-color 0.1s ease 0s;
		}
		
		.gpv-cct-cc:focus {
			border:0 ;
			outline: 0 none;
			background-color: rgb(253, 126, 20);
		}
		.gpv-cct-cc:hover {
			background-color: rgb(253, 126, 20);
		}
		.gpv-cct-cco:focus {
			box-shadow: none;
			outline: 0 none;
		}
		.gpv-cct-cco:hover {
			
		
		}
		
		.purchase-button:focus {
			border:0;
			outline: 0 none;
			background-color: rgb(253, 126, 20);
		}
		.purchase-button:hover {
			background-color: rgb(253, 126, 20);
		}
		.temnav {
			padding-left: 0px;
		}
		
		@media (max-width: 960px){
			.md-od {
				width: 100%;
				padding: 24px;
			}
			.modal-content {
				width: 100%;
			}
		}
		
		@media (min-width: 961px){
			.md-od {
				top: 50%;
			    left: 50%;
			    width: 480px;
			    transform: translate(-50%, -50%);
			    max-height: 95%;
			    animation: 0.25s ease 0s 1 normal none running openModal;
			    padding: 32px 24px;
			    position: fixed;
			    overflow-y: auto;
			    z-index: 3000;
			    box-shadow: rgba(0, 0, 0, 0.08) 0px 3px 6px 0px, rgba(0, 0, 0, 0.12) 0px 8px 16px 0px;
			    padding: 24px;
			    background: rgb(255, 255, 255);
			}
		}
		.md-h1 {
			font-size: 24px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 32px;
    letter-spacing: -0.4px;
    display: flex;
    margin: 0px 0px 8px;
    padding: 0px;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
		}
		.md-h1oned {
			-webkit-box-flex: 1;
    flex-grow: 1;

		}
		.close-btn {
			width: 24px;
    height: 24px;
    z-index: 2001;
    cursor: pointer;
    flex: 0 0 auto;
		}
		.md-sadim {
			text-align: center;
    font-size: 64px;
		}
		.md-cli {
			margin-bottom: 12px;
			font-size: 16px;
		    font-weight: normal;
		    color: rgb(62, 64, 66);
		    line-height: 24px;
		    letter-spacing: -0.2px;
		}
		.mdb-gj {
			margin-top: 12px;
			width: 100%;
    display: flex;
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
    padding: 0px;
    flex: initial;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
		}
		
		.md-texi {
			font-size: 9px;
    letter-spacing: normal;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-weight: bold;
    line-height: 1;
    color: rgb(62, 64, 66);
    margin: 0px;
		}
		
		.md-texo {
			margin-right: 4px;
    margin-bottom: 4px;
    min-width: 20px;
    height: 20px;
    display: inline-flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    background-color: rgb(237, 239, 240);
    box-sizing: border-box;
    border-radius: 10px;
    flex: 0 0 auto;
    padding: 0px 6px;
		}
		.gesockbutton:focus {
			border:0;
			outline: 0 none;
			box-shadow: none;
		}
		.gesockbutton:hover {
			background: rgb(226, 226, 226);
		}
		.classcheckbutton:hover {
			background: rgb(226, 226, 226);
		}
	</style>

</head>
<body>
	
	<!-- 검토요청 모달 -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary saveCheckButton" data-toggle="modal" data-target="#exampleModalCenter" style="display:none;">
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="md-od">
		      <h1 class="md-h1">
			      <div class="md-h1oned">
			      	아직 완성하지 않으신 것 같아요
			      </div>
			      <div class="close-btn">
				      <svg width="24" height="24" fill="none" viewBox="0 0 24 24">
					      <path d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41 17.59 5z" fill="#a8aeb3">
					      </path>
				      </svg>
			      </div>
		      </h1>
		      <div class="md-sadim">
			      <span role="img" aria-label="Loudly">
			      	😭
			      </span>
		      </div>
		      <div class="md-cli">
		     	 검토 요청을 하시기 전에 아래의 항목들을 모두 입력해주세요!
		      </div>
		      <div class="md-texo hobbyClassImage">
			      <div color="#3e4042" class="md-texi hobbyClassImage">
			      	커버 이미지
			      </div>
		      </div>
		      <div class="md-texo hobbyClassIntro">
			      <div color="#3e4042" class="md-texi hobbyClassIntro">
			      	클래스 소개
			      </div>
		      </div>
		      <div class="md-texo hobbyClassName">
			      <div color="#3e4042" class="md-texi hobbyClassName">
			      	클래스 제목
			      </div>
		      </div>
		      <div class="md-texo category">
			      <div color="#3e4042" class="md-texi category">
			     	 클래스 카테고리
			      </div>
		      </div>
		      <div class="md-texo hashtag">
			      <div color="#3e4042" class="md-texi hashtag">
			     	 클래스 해쉬태그
			      </div>
		      </div>
		      <div class="md-texo kitImage">
			      <div color="#3e4042" class="md-texi kitImage">
			     	 준비물 이미지
			      </div>
		      </div>
		      <div class="md-texo kitName">
			      <div color="#3e4042" class="md-texi kitName">
			     	 준비물 이름
			      </div>
		      </div>
		      <div class="md-texo kitIntro">
			      <div color="#3e4042" class="md-texi kitIntro">
			     	 준비물 소개
			      </div>
		      </div>
		      <div class="md-texo kitPrice">
			      <div color="#3e4042" class="md-texi kitPrice">
			     	 준비물 가격
			      </div>
		      </div>
		      <div class="md-texo lessonVideo">
			      <div color="#3e4042" class="md-texi lessonVideo">
			      	강의 영상
			      </div>
		      </div>
		      <div class="md-texo lessonTitle">
			      <div color="#3e4042" class="md-texi lessonTitle">
			      	강의 제목
			      </div>
		      </div>
		      <div class="md-texo lessonProject">
			      <div color="#3e4042" class="md-texi lessonProject">
			      	강의 과제
			      </div>
		      </div>
		      <div class="md-texo lessonIntro">
			      <div color="#3e4042" class="md-texi lessonIntro">
			      	강의 소개
			      </div>
		      </div>
		      <div class="md-texo lessonContent">
			      <div color="#3e4042" class="md-texi lessonContent">
			      	수업 노트
			      </div>
		      </div>
		      <div class="md-texo lessonImage">
			      <div color="#3e4042" class="md-texi lessonImage">
			      	강의 소개 이미지
			      </div>
		      </div>
		      <button type="button" class="mdb-gj gesockbutton" color="default" fill="true">
		      <span class="">
		      	계속해서 작성하기
		      </span>
		      </button>
		      <button type="button" class="mdb-gj classcheckbutton" color="default" fill="true">
		      <span class="">
		      	검토 요청하기
		      </span>
		      </button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<!-- 클래스 검토하기 타이틀 -->
	<div style="width:100%; max-width:960px; margin: auto; padding:0px 24px;">
		<div style="display:flex;">
			<div style="font-weight:bold; font-height: 20px; display:inline-flex; margin: 12px 0px 0px; font-size:16px;">
				클래스 검토하기
			</div>
			<span style="display:inline-flex; vertical-align: middle; flex:none; margin-left: auto;">
				<button class="gpv-cct-cco">
				돌아가기</button>
			</span>
			<button class="gpv-cct-cc">
			검토 요청</button>
		</div>
	</div>
	
	<!-- 한번 더 확인해주세요 -->
	<div class="gpv-kidi">
		<div class="gpv-indi">
			<div class="gpv-indione">
				<span class="gpv-insp">
					<svg width="24" height="24" fill="none" viewBox="0 0 24 24">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="#fd7e14">
						</path>
					</svg>
				</span>
				한번 더 확인해주세요
			</div>
			<div class="gpv-inditwo">
				크리에이터님이 작성한 내용이 반영된 미리보기화면입니다. 틀린 내용은 없는지 담고자하신 내용이 잘 담겨있는지 한번 더 확인해주세요.
				<br>참고 클래스를 참조해서 작성해주시면 더 반응이 좋은 페이지를 만들 수 있어요.
			</div>
		</div>
	</div>
	
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
	
	
	<div class="container gpv-top">
		<div class="row">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light temnav">
					<span class="navbar-brand">클래스 메뉴</span>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item active nav-in-class-detail-menu">
								<a class="nav-link">
									<span class="nav-span-inner-nav-link" style="padding-left: 0px;">
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
										<span>클래스 강의</span>
										<input type="hidden" value="3" class="navbar-nav-link-inner-span-input"/>
									</span>
								</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	
	<br/><br/>
	
	<div class="container container-background-setting1 container-background-setting2">
		<div class="row class-intro-row">

			<!-- 	<div class="col-lg-8 class-intro-image-col-area1 class-intro-image-col-area2"> -->
			<div class="col-lg-8">
				
				<div class="image-outer-div">
					<span class="image-outer-span">
						<img src="/images/hobbyclass/${hobbyClass.hobbyClassImage }" class="img-class-intro" onError="this.src='/resources/image/gon/ohcbImage.png'"/>
					</span>
				</div>
				
				<!-- class intro 시작 -->
				<div class="class-intro-content">
					<div class="class-intro-image-col-area1 class-intro-image-col-area2">
						<!--  
						<div class="image-outer-div">
							<span class="image-outer-span">
								<img src="/images/min/${hobbyClass.hobbyClassImage }" class="img-class-intro"/>
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
														<dt class="this-is-dt mr-4">
															${hobbyClass.event.eventStartDate } 부터 ~ ${hobbyClass.event.eventEndDate } 까지
														</dt>
														<dt class="this-is-dt mr-4">
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
							<c:if test="${!empty hobbyClass.hobbyClassName}">
								${hobbyClass.hobbyClassName}
							</c:if>
							<c:if test="${empty hobbyClass.hobbyClassName}">
								클래스를 대표할 수 있는 제목을 정해주세요.
							</c:if>					
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
								<img src="/images/hobbyclass/${hobbyClass.kitImage }" class="img-class-intro" onError="this.src='/resources/image/gon/ohcbImage.png'"/>
							</span>
						</div>
						
						<div class="class-intro-lesson-days-outer-div mt-3">
							<div class="class-intro-expect-days">
								<div class="class-intro-expect-days-inner">
									<div class="class-intro-expect-days-real-outer-div">
										<span class="class-kit-expect-days-real-span">
											<c:if test="${!empty hobbyClass.kitName}">
												${hobbyClass.kitName}
											</c:if>
											<c:if test="${empty hobbyClass.kitName}">
												클래스 준비물 이름을 정해주세요.
											</c:if>
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
										<c:if test="${!empty hobbyClass.kitName}">
											${hobbyClass.kitName}
										</c:if>
										<c:if test="${empty hobbyClass.kitName}">
											클래스 준비물 이름을 정해주세요.
										</c:if>
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
						
						<c:forEach var="assessContent" items="${listAssessContent }">
							<!-- 나중에 그거 forEach문 돌릴 구간 -->
							<div class="class-assess-content-outer-div">
								<div class="profile-and-name">
									<div size="24" class="profile-outer-div">
										<span class="profile-outer-span1 profile-outer-span2">
											<!-- 나중에 프로필 사진으로 대체하기 -->
											<img src="/images/min/default-profile.jpg" class="class-assess-img-tag"/>
										</span>
									</div>
									
									<div class="name-outer-div">
										<div class="name-inner-div1 name-inner-div2">
											${assessContent.user.nickName }&nbsp;&nbsp; <span class="pull-right"><i class="fas fa-star"></i>&nbsp;&nbsp;${assessContent.assessStar }점</span>
											<div>${assessContent.regDate }</div>
										</div>		
									</div>
								</div>
								
								<div class="class-assess-reply-outer-div">
									<div class="class-assess-reply-content1 class-assess-reply-content2">
										${assessContent.assessContent }
									</div>
								</div>
								
							</div>
							<!-- 나중에 그거 forEach문 돌릴 구간 -->
						</c:forEach>
						
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
			<div class="col-lg-12 fixed-bottom" style="width:100%; padding: 0px;">
				<div class="class-intro-purchase-button mt-2">
					<button type="button" class="purchase-button purchase-button1 purchase-button2">
						<span class="purchase-button-text">
							클래스 구매하기
						</span>
					</button>					
				</div>
				
				
			</div>
		</div>
	</div>
	<!-- 화면 작아지면 출력할 푸터바 끝 -->
	
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
							<img src="/images/min/default-profile.jpg" class="rounded-circle"/>
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
	
</body>
</html>	