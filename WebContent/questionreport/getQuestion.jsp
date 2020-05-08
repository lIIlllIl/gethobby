<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	
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
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 question-intro-col">
				<div class="question-intro-outer-div">
					<div class="question-intro-top-small-text1 question-intro-top-small-text2">
						<div class="question-intro-entered-room">
							<!-- 마이페이지로 이동하는 링크 -->
							<a class="question-intro-top-small-text-a-tag" href="#">
								마이페이지
							</a>
								<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
						</div>
						<div class="question-intro-entered-room">
							<!-- 문의 목록으로 이동하는 링크 -->
							<a class="question-intro-top-small-text-a-tag" href="#">
								문의 목록
							</a>
								<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
						</div>
						<div class="question-intro-now-room">
							<a class="question-intro-top-small-text-a-tag" href="#">
								${sessionScope.user.nickName } 님의 문의
							</a>
						</div>
					</div>
				</div>
				
				<div class="question-content-center-outer-div">
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
					
					<div class="question-type">
						<h4 class="question-type-h4">
							문의 말머리 > 이벤트 문의
						</h4>
					</div>
					
					<div class="question-cotent-outer-div1 question-cotent-outer-div2">
						<!-- span 안에 실제 문의내용 적기 -->
						<span>
							집에가고싶어요fffffffffffffffffffffffffffffffffffffffffff
							<br/>
							하지만 못간댕
							<br/>
							너무슬퍼요 ㅎ그흑ㅎㄱ
						</span>
					</div>
				</div>

				<div class="check-answer-outer-div">
					<div class="question-content-center-outer-div">
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
						
						<div class="question-type">
							<h4 class="question-type-h4">
								문의 말머리 > 이벤트 문의
							</h4>
						</div>
						
						<div class="question-cotent-outer-div1 question-cotent-outer-div2">
							<!-- span 안에 실제 문의내용 적기 -->
							<span>
								집에가고싶어요fffffffffffffffffffffffffffffffffffffffffff
								<br/>
								하지만 못간댕
								<br/>
								너무슬퍼요 ㅎ그흑ㅎㄱ
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>