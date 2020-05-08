<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- //2020-02-20 Git Commit --%>
<!doctype html>
<html>
<head>
<title>GetHobby</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
<link rel="icon" href="/resources/image/logo/logo-favicon.png">

<!-- favicon 404 에러 안보이게  -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<!-- 웹 폰트 (나눔고딕) -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">

<!--부트스트랩 CSS-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- fontawesome cdn(웹 아이콘 라이브러리) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<!-- 공통 CSS -->
<link rel="stylesheet" href="/resources/css/common.css">
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />
<link rel="stylesheet" href="/" />

<script src="/resources/javascript/min/channelTalk.js"></script>

<style>

/* @import url('https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap'); */


::-webkit-scrollbar {
	display:none;
}
body{
	margin: 0;
	padding: 0;
	/* font-family: sans-serif; */
	/* font-family: 'Black Han Sans' !important; */
}

ul{
	position: fixed;
	top: 50%;
	right: 17px;
	transform: translateY(-50%);
	margin: 0;
	padding: 0;
	z-index: 1;
}
ul li{
	list-style: none;
	display: block;
    width: 14px;
    height: 13px;
    margin: 7px;
    position: relative;
    padding: 0;
	
}
ul li a{
	display: block;
    position: relative;
    z-index: 1;
    width: 100%;
    height: 100%;
    cursor: pointer;
    text-decoration: none;
}
.circle-active{
	height: 12px;
    width: 12px;
    margin: -6px 0 0 -6px;
    border-radius: 100%;
    background: #fff;
    position: absolute;
    z-index: 1;
    border: 0;
    left: 50%;
    top: 50%;
    ransition: all .1s ease-in-out;
}
.circle-none{
	height: 4px;
    width: 4px;
    margin: -2px 0 0 -2px;
    border-radius: 50%;
    background: #fff;
    position: absolute;
    z-index: 1;
    border: 0;
    left: 50%;
    top: 50%;
    ransition: all .1s ease-in-out;
}
.circle-none:hover {
	height: 9px;
    width: 9px;
    margin: -4px 0 0 -4px;
}
ul li a:hover{
	color: #fff;
}
#container{
	width: 100%;
	height: 100vh;
	/* font-family: 'Black Han Sans' !important; */
	/* font-family: 'Noto Sans KR' !important; */
	/* font-family: 'Jua' !important; */
	font-family: 'Do Hyeon' !important;
}
#container div{
	position: relative;
	width: 100%;
	height: 100%;
	/* font-family: 'Black Han Sans' !important; */
	cursor: pointer;
}
#container div h1{
	/* font-family: 'Noto Sans KR' !important; */
	/* font-family: 'Jua' !important; */
	font-family: 'Do Hyeon' !important;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 100%;
	text-align: center;
	margin: 0;
	padding: 0;
	font-size: 6rem;
	text-transform: uppercase;
	color: #fff;
	/* font-weight: bold; */
}

/* #green > h1 {
	color: black;
} */
#container div h3{
	/* font-family: 'Noto Sans KR' !important; */
	/* font-family: 'Jua' !important; */
	font-family: 'Do Hyeon' !important;
	position: absolute;
	top: 60%;
	transform: translateY(-50%);
	width: 100%;
	text-align: center;
	margin: 0;
	padding: 0;
	font-size: 2em;
	text-transform: uppercase;
	color: #fff;
}

#container div#red{
	/* background-image: url('https://images.unsplash.com/photo-1528642474498-1af0c17fd8c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'); */
	background: linear-gradient(to top, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 1)), url('/images/red.jpeg') fixed;
	background-size: cover  ;
}
#container div#green{
	background-image: url('/images/green.jpeg');
	background-size: cover  ;
}
#container div#blue{
	/* background-image: url('https://images.unsplash.com/photo-1541443517255-9e9aa2962f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'); */
	background: linear-gradient(to top, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('/images/blue.jpeg') fixed;
	background-size: cover  ;
}
#container div#yellow{
	/* background-image: url('https://images.unsplash.com/photo-1449247666642-264389f5f5b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1649&q=80'); */
	background: linear-gradient(to top, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('/images/yellow.jpeg') fixed;
	background-size: cover  ;
}
#container div#magenta{
	/* background-image: url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80'); */
	background: linear-gradient(to top, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('/images/magenta.jpeg') fixed;
	background-size: cover  ;
}
.circle-span {
	color: #fff;
	position: relative;
	margin: 0;
	padding: 0;
	bottom: 7px;
	right: 18px;
	float: right;
	font-size: 14px;
	display: none;
}

@media (max-width: 767px) {

    h3 {
        display: none;
    }
}
</style>

</head>

<body>

	<jsp:include page="/common/header.jsp" />
	
	<ul>
		<li><a href="#red" class="circle-active"><span class="circle-span"></span></a></li>
		<li><a href="#green" class="circle-none"><span class="circle-span"></span></a></li>
		<li><a href="#blue" class="circle-none"><span class="circle-span"></span></a></li>
		<li><a href="#yellow" class="circle-none"><span class="circle-span"></span></a></li>
		<li><a href="#magenta" class="circle-none"><span class="circle-span"></span></a></li>
	</ul>
	<div id="container">
		<div class="box" id="red"><h1>당신을 위한 취미 클래스</h1><h3>바쁜 당신을 위해 맞춤 취미 큐레이션을 제공합니다.</h3></div>
		<div class="box" id="green"><h1>어디서든 새로운 취미를 즐겨보세요</h1><h3>온라인으로 쉽고 간편하게 어디서든 볼 수 있습니다.</h3></div>
		<div class="box" id="blue"><h1>관심분야를 선택하세요!</h1><h3>선별된 클래스를 추천해드립니다</h3></div>
		<div class="box" id="yellow"><h1>준비물 걱정은 하지마세요</h1><h3>필요한 준비물까지 챙겨드린답니다.</h3></div>
		<div class="box" id="magenta"><h1>지금 바로 시작하세요!</h1><h3>개설된 클래스 구경하러가기<i class="ml-3 far fa-hand-point-right"></i></h3></div>
	</div>
<script>

	 //$("#red").fadeIn(100);
	 window.onload = function () {
		 
		 // 클릭으로 페이지 이동
		 $("a").on("click",function(){
			 
			 // 페이지 위치 찾기
			 var pageNavigation = $("#yellow");
			 if( $(this).attr("href") == '#red' ){
				 pageNavigation = $("#red");
			 }else if( $(this).attr("href") == '#green' ){
				 pageNavigation = $("#green");
			 }else if( $(this).attr("href") == '#blue' ){
				 pageNavigation = $("#blue");
			 }else if( $(this).attr("href") == '#yellow' ){
				 pageNavigation = $("#yellow");
			 }else if( $(this).attr("href") == '#magenta' ){
				 pageNavigation = $("#magenta");
			 }
			 $("a").attr("class","circle-none");
			 $(this).attr("class","circle-active");
             
			 // 해당 페이지로 이동
           	 $("html,body").stop().animate({
                    scrollTop: pageNavigation.offset().top + 'px'
                }, {
                    duration: 800, complete: function () {
                    }
                });
         });
		 
         var elm = ".box";
         $(elm).each(function (index) {
             // 개별적으로 Wheel 이벤트 적용
              
             $(this).on("mousewheel DOMMouseScroll", function (e) {
                 e.preventDefault();
                 var delta = 0;
                 if (!event) event = window.event;
                 if (event.wheelDelta) {
                     delta = event.wheelDelta / 120;
                     if (window.opera) delta = -delta;
                 } 
                 else if (event.detail)
                     delta = -event.detail / 3;
                 var moveTop = $(window).scrollTop();
                 var elmSelecter = $(elm).eq(index);
                 // 마우스휠을 위에서 아래로
                 if (delta < 0) {
                     if ($(elmSelecter).next() != undefined) {
                         try{
                             moveTop = $(elmSelecter).next().offset().top;                             
                             $("a[href='#"+$(elmSelecter).next().attr("id")+"']" ).attr("class","circle-active");
                             $("a[href='#"+$(elmSelecter).attr("id")+"']" ).attr("class","circle-none");
                         }catch(e){}
                     }
                 // 마우스휠을 아래에서 위로
                 } else {
                     if ($(elmSelecter).prev() != undefined) {
                         try{
                             moveTop = $(elmSelecter).prev().offset().top;
                             $("a[href='#"+$(elmSelecter).prev().attr("id")+"']" ).attr("class","circle-active");
                             $("a[href='#"+$(elmSelecter).attr("id")+"']" ).attr("class","circle-none");
                         }catch(e){}
                     }
                 }
                                      // 화면 이동 0.8초(800)
                 $("html,body").stop().animate({
                     scrollTop: moveTop + 'px'
                 }, {
                     duration: 800, complete: function () {
                     }
                 });
             });
         });
         
         // 원형 버튼에 Text Event
         $(document).on("mouseover","a", function(){
        	$(this).children(".circle-span").css("display","block"); 
         });
         $(document).on("mouseout","a", function(){
         	$(".circle-span").css("display","none"); 
          });
         
         $('#container').on('scroll touchmove mousewheel', function(event) {
        	  event.preventDefault();
        	  event.stopPropagation();
        	  return false;
        	});
         
         
         
         $("#magenta h3").on("click", function() {
        	 //alert("클래스 목록으로");
        	self.location = "/searchhobbyclass/getSearchHobbyClassList.jsp"; 
         });
         
     }
  

</script>
</body>
</html>
