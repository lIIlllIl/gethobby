<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    
    <!-- 웹사이트 파비콘 -->
    <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
    <link rel="icon" href="/resources/image/logo/logo-favicon.png">
    
    <!-- favicon 404 에러 안보이게  -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<title>GetHobby</title>
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

	<!-- 채널톡 js -->
	<!-- <script src="/resources/javascript/min/channelTalk.js"></script> -->
	
	<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->

	<!-- owl -->
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
	<script src="../resources/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
	
	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	<!-- javascript import -->
	<script src="../resources/javascript/min/searchHobbyClassMain.js"></script>
	<script src="../resources/javascript/min/listPopularHobbyClass.js"></script>
	<script src="../resources/javascript/min/listRegisterHobbyClass.js"></script>
	<script src="/resources/javascript/min/listRecommendHobbyClass.js"></script>
	<script src="/resources/javascript/min/getProgressEvent.js"></script>

	<!-- css import -->
	<link href="../resources/css/min/searchHobbyClassMain.css" rel="stylesheet" />
	<link href="../resources/css/min/listPopularHobbyClass.css" rel="stylesheet" />
	<link href="../resources/css/min/listRegisterHobbyClass.css" rel="stylesheet" />
	<link href="../resources/css/min/listRegisterHobbyClass.css" rel="stylesheet" />
	<link rel="stylesheet" href="/resources/css/min/listRecommendHobbyClass.css" />
	<link rel="stylesheet" href="/resources/css/min/getProgressEvent.css" />
	
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Header js & css -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	
	<!-- jquery mobile cdn -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	
</head>
<body>
	<input type="hidden" class="user-hidden-value" value="${sessionScope.user.userId }"/>
	<input type="hidden" id="role" value="${sessionScope.user.role}"/>
	
	<div class="include-common-header">
		<jsp:include page="/common/header.jsp"/>
	</div>
	
	<br/><br/><br/><br/>
	
	<div class="spinner-outer-div">
		<div class="spinner-border text-warning" role="status">
	  		<span class="sr-only">Loading...</span>
		</div>
	</div>
	
	<!-- 누르면 위로 올라가는 버튼 -->
	<span class="mini-button-to-top shadow">
    	<i class="fas fa-arrow-up arrow-i-tag"></i>
    </span>
	<!-- 누르면 위로 올라가는 버튼 -->
	
	<!-- navbar 시작 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-lg">
					<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
						<ul class="navbar-nav ">
							<li class="nav-item dropdown align-self-center">
								<button class="btn wrapper-basic dropdown-toggle dropdown-nav-bar-class-search-button" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-list"></i>&nbsp;&nbsp;전체 카테고리</button>
								<div class="dropdown-menu mr-1 dropdown-menu-center" aria-labelledby="categoryDropdown">
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-all.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											전체
											<input type="hidden" name="categoryValue" value="all">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-art.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											미술
											<input type="hidden" name="categoryValue" value="A">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-craft.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											공예
											<input type="hidden" name="categoryValue" value="H">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-exercise.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											운동
											<input type="hidden" name="categoryValue" value="E">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-food.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											음식
											<input type="hidden" name="categoryValue" value="C">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-lifestyle.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											라이프스타일 
											<input type="hidden" name="categoryValue" value="L">
										</a>
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-inner-text">
										<img src="/resources/image/min/im-music.png" height="45px"/>
										<br/>
										<a class="dropdown-span-text">
											음악
											<input type="hidden" name="categoryValue" value="M">
										</a>
									</div>
								</div>
							</li>
							<li class="nav-item active">
								<a class="nav-link just-bar">
									<span class="nav-span-text"><span>수요조사 중</span>
										<input type="hidden" value="1" class="navbar-nav-link-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link">
									<span class="nav-span-text"><span>인기 클래스</span> 
										<input type="hidden" value="2" class="navbar-nav-link-input"/>
									</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link">
									<span class="nav-span-text"><span>이벤트</span> 
										<input type="hidden" value="3" class="navbar-nav-link-input" onclick="/community/listCommunity"/>
									</span>
								</a>
							</li>
							<!-- 자유게시판 사진게시판 헤더에 놓게 됨으로써 사라지게 되었다
							<li class="nav-item dropdown align-self-center">
								<button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-list"></i>&nbsp;&nbsp;Get취미 커뮤니티</button>
								<div class="dropdown-menu mr-1 dropdown-menu-center" aria-labelledby="categoryDropdown">
									<div class="dropdown dropdown-article-inner-text">
										<a href="/article/getBoardArticleList?boardCode=0" class="dropdown-article-span-text">
											자유게시판
										</a>
										<input type="hidden" class="nav-bar-dropdown-hidden-input" value="0" />
									</div>
									<div class="dropdown-divider"></div>
									<div class="dropdown dropdown-article-inner-text">
										<a class="dropdown-article-span-text">
											사진게시판
										</a>
										<input type="hidden" class="nav-bar-dropdown-hidden-input" value="0" />
									</div>
								</div>
							</li>
							 -->
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- navbar 끝 -->
	
	<!-- 이벤트 캐러셀 시작 -->
	<div class="outer-event-carousel-div">
		<jsp:include page="/searchhobbyclass/getProgressEvent.jsp"/>
	</div>
	<!-- 이벤트 캐러셀 끝 -->
	
	<!-- 화면 작아지면 보여줄 카테고리 리스트 시작 -->
	<div class="container mini-size-category-total-outer-container-div">
		<div class="row">
			<div class="col-md-12">
				<div class="mini-size-category-menu-outer-div">
					<span class="mini-size-category-static-span-text">
						카테고리
					</span>
					<div class="mini-size-category-menu-content-outer-div">
						<ul class="mini-size-category-ul">
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-all.png" class="mini-category-img" />
									전체
									<input type="hidden" class="mini-category-value" value="all">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-art.png" class="mini-category-img" />
									미술
									<input type="hidden" class="mini-category-value" value="A">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-craft.png" class="mini-category-img" />
									공예
									<input type="hidden" class="mini-category-value" value="H">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-exercise.png" class="mini-category-img" />
									운동
									<input type="hidden" class="mini-category-value" value="E">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-food.png" class="mini-category-img" />
									요리
									<input type="hidden" class="mini-category-value" value="C">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-lifestyle.png" class="mini-category-img" />
									라이프스타일
									<input type="hidden" class="mini-category-value" value="L">
								</a>
							</li>
							<li class="mini-size-category-li">
								<a class="mini-size-category-a-tag">
									<img src="/images/hobbyclass/im-music.png" class="mini-category-img" />
									음악
									<input type="hidden" class="mini-category-value" value="M">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 화면 작아지면 보여줄 카테고리 리스트 끝 -->

	<!-- Modal 시작-->
	<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 검색</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="modal-category-text">
											<span class="category-name"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="container-fluid">
						<div class="row mt-4">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton">퍼스널트레이닝(PT)</button>
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-outline-secondary btn-sm btn-block" name="hashtagButton" value="all">전체</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="container-fluid">
						<div class="row mt-2">
							<div class="col-sm-12">
								<span class="warning-text">
									경고문구를 표시하는 구간 
								</span>
							</div>
						</div>
					</div>
					
					<div class="container-fluid">
						<div class="row mt-4">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="dropdown">
  													<button class="btn btn-secondary dropdown-toggle dropdown-main-button search-condition-dropdown-button-modal" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">검색조건</button>
													<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
														<a class="dropdown-item search-condition-dropdown" href="#">전체보기<input type="hidden" class="search-condition-dropdown-value" value="0"/></a>
														<a class="dropdown-item search-condition-dropdown" href="#">클래스 제목<input type="hidden" class="search-condition-dropdown-value" value="1"/></a>
														<a class="dropdown-item search-condition-dropdown" href="#">크리에이터 닉네임<input type="hidden" class="search-condition-dropdown-value" value="2"/></a>
													</div>
												</div>
											</div>
											<input type="text" class="form-control search-keyword-input" placeholder="검색어 입력" aria-label="search-help" aria-describedby="basic-addon1">
											<div class="input-group-append">
					   							<button type="button" class="btn btn-outline-secondary btn-sm search-button"><i class="fas fa-search"></i></i></button>
					  						</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->
	
	<!-- 검색요청용 input group 시작 -->
	<div class="container" id="search-form-group">
		<div class="row">
			<div class="col-lg-12">
				<div class="input-group mb-3 input-search-form-but-not-button-outer-div">
  					<div class="input-group-prepend">
    					<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
  					</div>
 				 	<input type="text" class="form-control search-button-but-form" placeholder="검색..." aria-label="se-a-r-ch" aria-describedby="se-a-r-ch">
				</div>
			</div>
		</div>
	</div>
	<!-- 검색요청용 input group 끝 -->
	
	<!-- 정렬버튼 시작 -->
	<div class="container" id="search-alignment-button-div">
		<div class="row">
			<div class="col-sm-12 text-right">
				<button class="btn pull-right search-alignment-button">
					<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#a8aeb3"></path>
						<circle cx="8" cy="18" r="2" fill="#a8aeb3"></circle>
						<circle cx="8" cy="6" r="2" fill="#a8aeb3"></circle>
						<circle cx="16" cy="12" r="2" fill="#a8aeb3"></circle>
					</svg>
				<span class="in-the-aligment-button-text">전체보기</span>
				</button> 
			</div>
		</div>
	</div>
	<!-- 정렬버튼 끝 -->
	
	
	<!-- 정렬버튼 전용 모달창 시작 -->
	<div class="modal fade search-alignment-modal" id="modalmodal" tabindex="-1" role="dialog" aria-labelledby="modalmodallabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">전체보기</h5>
					<button type="button" class="close class-state-cancle" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container alignment-container">
						<div class="row aligment-row-div">
							<div class="col-sm-12 alignment-col">
								<div color="#3e4042" class="alignment-cirlce alignment-cirlce-select"></div>
								<div color="#3e4042" class="alignment-div alignment-text-select">
									전체보기 
								</div>
								<input type="hidden" class="alignment-hidde-value" value="0" />
							</div>
						</div>
						<br/>
						<div class="row aligment-row-div">
							<div class="col-sm-12 alignment-col">
								<div color="#3e4042" class="alignment-cirlce alignment-cirlce-non-select"></div>
								<div color="#3e4042" class="alignment-div alignment-text-non-select">
									수요조사 중 
								</div>
								<input type="hidden" class="alignment-hidde-value" value="3" />
							</div>
						</div>
						<br/>
						<div class="row aligment-row-div">
							<div class="col-sm-12 alignment-col">
								<div color="#3e4042" class=" alignment-cirlce alignment-cirlce-non-select"></div>
								<div color="#3e4042" class="alignment-div alignment-text-non-select">
									개강 
								</div>
								<input type="hidden" class="alignment-hidde-value" value="5" />
							</div>
						</div>
						<br/>
						<div class="row aligment-row-div">
							<div class="col-sm-12 alignment-col">
								<div color="#3e4042" class=" alignment-cirlce alignment-cirlce-non-select"></div>
								<div color="#3e4042" class="alignment-div alignment-text-non-select">
									종강 
								</div>
								<input type="hidden" class="alignment-hidde-value" value="6" />
							</div>
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<div class="spinner-border text-secondary" role="status">
  						<span class="sr-only">Loading...</span>
					</div>
					<button type="button" class="btn btn-secondary class-state-cancle" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 정렬버튼 전용 모달창 끝 -->
	<br/><br/>
	
	<!-- 검색결과 츌력 기준 span -->
	<span class='this-is-not'></span>
	
	<!-- 검색결과 출력될 span -->
	<span class="scroll-page"></span>
	
	<div class="include-for-popular-hobby-class">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<jsp:include page="./listPopularHobbyClass.jsp" />
				</div>
			</div>
		</div>
		<br/><br/>
	</div>	
	
	<div class="include-for-register-hobby-class">	
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<jsp:include page="./listRegisterHobbyClass.jsp" />
				</div>
			</div>
		</div>
		<br/><br/>
	</div>
	
	<c:if test="${ !empty sessionScope.user.userId }" >
		<div class="include-for-recommend-hobby-class">	
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<jsp:include page="/myhobbyclass/listRecommendHobbyClass.jsp" />
					</div>
				</div>
			</div>
			<br/><br/>
		</div>
	</c:if>
	
	
	
	<input type="hidden" class="main-scroll-current-page" value="1" />
	<input type="hidden" class="main-scroll-max-page" />
	<input type="hidden" class="check-search" value="0" />
	
	<div class="main-scroll-outer-div">
		<div class="container border-bottom mb-5">
			<h4 class="popular-hobby-class-list-h4-tag mt-3 mb-3">클래스 목록</h4>
		</div>
	
		<span class="main-scroll-page-flag"></span>
		
		<span class="main-scroll-page"></span>
	</div>
	
	
	<div class="footer-outer-div">
		<br/><br/><br/><br/><br/>
		<jsp:include page="/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>