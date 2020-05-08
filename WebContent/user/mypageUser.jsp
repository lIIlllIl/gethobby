<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>GetHobby</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- ////////////////////////해더/////////////////////////////////////// -->
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
    
	<!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>


    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

	<!-- 채널톡 js -->
	<script src="/resources/javascript/min/channelTalk.js"></script>
	
	<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->
<!-- owl -->
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
	<script src="../resources/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
	
	<!-- javascript, css import -->
	<script src="/resources/javascript/min/listSteamHobbyClass.js"></script>
	<link rel="stylesheet" href="/resources/css/min/listSteamHobbyClass.css" />
	
	<!-- javascript, css import -->
	<script src="/resources/javascript/min/listRecentlyHobbyClass.js"></script>
	<link rel="stylesheet" href="/resources/css/min/listRecentlyHobbyClass.css" /> 
	
	<!-- javascript, css import -->
	<script src="/resources/javascript/min/listListenHobbyClass.js"></script>
	<link rel="stylesheet" href="/resources/css/min/listListenHobbyClass.css" />
	
	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
	<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>

<script type="text/javascript">
	$(function(){
		
		
		
		
		$("#getuser").on("click",function(){
			
			self.location="/user/getUser?userId=${sessionScope.user.userId}";			
		});	
		
		$("#steamclick").on("click",function(){
			
			$(".include-for-recently-hobby-class").hide();
		});
		
		
		
		$("#buyschedule").on("click",function(){
			
			// self.location="/myhobbyclass/getPurchaseHobbyClassSchedule.jsp";
			self.location = "/myHobbyClass/getPurchaseHobbyClassSchedule";
		});
		
		$(".purchaseHistory").on("click", function(){
			self.location = "/purchase/getPaymentHistoryList";
		});
		
		var onloadWidth = $(window).width();
		
		if ( onloadWidth <= 980 ) {
			$('#recentlyPrev').hide();
			$('#recentlyNext').hide();
			$('#recommendPrev').hide();
			$('#recommendNext').hide();
			$('#listenPrev').hide();
			$('#listenNext').hide();
			$('#steamPrev').hide();
			$('#steamNext').hide();
		}
		else {
			$('#recentlyPrev').show();
			$('#recentlyNext').show();
			$('#recommendPrev').show();
			$('#recommendNext').show();
			$('#listenPrev').show();
			$('#listenNext').show();
			$('#steamPrev').show();
			$('#steamNext').show();
		}
		
		$( window ).resize(function() {
			   var windowWidth = $(this).width(); // 화면 창 변화 그대로 가져오기 
			   var windowHeight = $(this).height();
			   
			   if ( windowWidth <= 980 ) {
				   $('#recentlyPrev').hide();
					$('#recentlyNext').hide();
					$('#recommendPrev').hide();
					$('#recommendNext').hide();
					$('#listenPrev').hide();
					$('#listenNext').hide();
					$('#steamPrev').hide();
					$('#steamNext').hide();
			   }
			   else {
				   $('#recentlyPrev').show();
					$('#recentlyNext').show();
					$('#recommendPrev').show();
					$('#recommendNext').show();
					$('#listenPrev').show();
					$('#listenNext').show();
					$('#steamPrev').show();
					$('#steamNext').show();
			   }
		});
	});
	
	
	
	
</script>
</head>
<style>
.iWyAzq {
    position: relative;
    background-color: rgb(255, 255, 255);
    padding: 24px 24px 0px;
}
*, ::before, ::after {
    box-sizing: border-box;
}
.eAfAEc {
    display: block;
    position: relative;
    font-size: 0px;
    overflow: hidden;
}
.fNYfEW {
    width: 88px;
    height: 88px;
    object-fit: cover;
    margin-bottom: 8px;
    border-radius: 44px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(248, 248, 249);
    border-image: initial;
}
img {
    vertical-align: middle;
    border-style: none;
}
.gRslZu {
    top: 0px;
    left: 0px;
    width: 120%;
    height: 120%;
    object-fit: cover;
    position: relative;
    opacity: 1;
    transition: opacity 0.1s linear 0s;
}
.CLMeE {
    display: flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
    max-width: 1140px;
}
a {
    color: inherit;
    text-decoration: none;
}
.feMNUL {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    height: 24px;
    margin-left: 2px;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h4 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 21px;
    font-size: 18px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.cZzCCw {
    font-size: 30px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 28px;
    letter-spacing: -0.3px;
    margin: 0px;
}

.bsSvWG {
    width: 72px;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    margin-right: 24px;
}
.gLybhU {
    font-size: 20px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 28px;
    letter-spacing: -0.3px;
    margin: 0px;
}
.gLybhU * {
    vertical-align: middle;
}
.fozILS {
    font-size: 11px;
    font-weight: normal;
    line-height: 16px;
    letter-spacing: normal;
    color: rgb(168, 174, 179);
    margin: 0px;
}
.goJTkf {
    width: 24px;
    height: 24px;
}
button {
    border-radius: 0px;
}
button, input {
    overflow: visible;
}
button, select {
    text-transform: none;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.cNzNJq {
    position: absolute;
    top: 24px;
    right: 24px;
    font-size: 14px;
    line-height: 1.71;
    color: rgb(119, 123, 125);
    background-color: rgb(255, 255, 255);
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
    padding: 0px;
    outline: none !important;
}
hr {
    display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    border-style: inset;
    border-width: 1px;
}
hr {
    box-sizing: content-box;
    height: 0px;
    overflow: visible;
    margin: 20px 0px;
}
.eGyulq {
    height: 1px;
    background-color: rgb(237, 239, 240);
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
}
.flMyeKKK {
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
.fIJpfC {
    width: 8%;
    display: flex;
    vertical-align: middle;
    color: rgb(255, 255, 255);
    background-color: #fd7e14;
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 35px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
.flMyeKKK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
button {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: center;
    cursor: default;
    font: 400 13.3333px Arial;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
span#imageSpan {
	width: 90px;
	height: 90px;
	position: relative;
}
img#imageImage {
	width: 100%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
.card-footer {
	background-color : #FFFFFF;
}
.btn-light {
	background-color: #FFFFFF !important;
	border-color: #FFFFFF;
}
.myfl-o {
	display: inline-flex;
	flex: auto;
}
.goPQgE {
    display: flex;
    margin-top: 24px;
    margin-left: auto;
    margin-right: auto;
    flex-direction: row;
    max-width: 1140px;
}
@media (min-width: 992px){
	
}
@media (max-width: 991px){
	
}
.myfl-bt {
	cursor: pointer;
	width: 100%;
	margin-left: 8px;
}
</style>
<body>
	 <jsp:include page="/common/header.jsp"/>
	<div class="MyPage__Box-sc-15vbtd3-6 iWyAzq" style="padding-left: auto; margin-top: 120px;margin-bottom: 50px;">
			<div style="width: 100%; max-width:1140px; margin-left:auto; margin-right:auto;">
			<span class="RatioImage__Container-wwqqoo-0 eAfAEc MyPage__ProfileImg-sc-15vbtd3-11 fNYfEW" id="imageSpan">
			<img id="imageImage" srcset="" src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" alt="" class="RatioImage__Img-wwqqoo-1 gRslZu">
			</span>
			</div>
			<div class="MyPage__UserNameContainer-sc-15vbtd3-2 CLMeE">
				<a class="MyPage__ProfileEditLink-sc-15vbtd3-4 feMNUL" href="/user/getUser?userId=${sessionScope.user.userId}" style="text-decoration: none;">
					<h2 class="sc-bdVaJa cZzCCw" style="font-size: 30px;">${sessionScope.user.nickName}</h2>
					<i class="fas fa-child" style="font-size: 30px;color: chocolate;"></i>					
				</a>
				
			</div>		
		<div class="goPQgE">
			<div class="myfl-o">
				<button type="button" id="getuser" class="sc-jTzLTM flMyeKKK sc-kEYyzF fIJpfC myfl-bt" id="sendcreator" color="orange" fill="true" style="padding-left: 16px;border-left-width: 20px;">
					<span class="sc-fjdhpX kCztpU">회원 정보</span>							
				</button>
			</div>
			<div class="myfl-o">
				<button type="button" class="sc-jTzLTM flMyeKKK sc-kEYyzF fIJpfC myfl-bt" id="sendcreator" color="orange" fill="true">
					<span class="sc-fjdhpX kCztpU">좋아요 목록</span>							
				</button>
			</div>
			<div class="myfl-o">
				<button type="button" class="sc-jTzLTM flMyeKKK sc-kEYyzF fIJpfC purchaseHistory myfl-bt" id="sendcreator" color="orange" fill="true">
					<span class="sc-fjdhpX kCztpU">구매내역</span>							
				</button>
			</div>
			<!-- 수정
			<div>
				<button type="button" class="sc-jTzLTM flMyeKKK sc-kEYyzF fIJpfC myfl-bt" id="sendcreator" color="orange" fill="true" style="margin-left: 50px;width: 100%; cursor: pointer;">
					<span class="sc-fjdhpX kCztpU">수강</span>							
				</button>
			</div>
			 -->
			<div class="myfl-o">
				<button type="button" class="sc-jTzLTM flMyeKKK sc-kEYyzF fIJpfC myfl-bt" id="buyschedule" color="orange" fill="true">
					<span class="sc-fjdhpX kCztpU">클래스 일정</span>							
				</button>
			</div>
		</div>
	</div>
	
	<div class="include-for-listen-hobby-class">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<jsp:include page="/myhobbyclass/listListenHobbyClass.jsp" />
				</div>
			</div>
		</div>
		<br/><br/>
	</div>
	
	
	<div class="include-for-recently-hobby-class">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<jsp:include page="/myhobbyclass/listRecentlyHobbyClass.jsp" />
				</div>
			</div>
		</div>
		<br/><br/>
	</div>	
	
	<div class="include-for-steam-hobby-class">	
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<jsp:include page="/myhobbyclass/listSteamHobbyClass.jsp" />
				</div>
			</div>
		</div>
		<br/><br/>
	</div>
	<hr class="MyPage__Line-sc-15vbtd3-15 eGyulq">
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>