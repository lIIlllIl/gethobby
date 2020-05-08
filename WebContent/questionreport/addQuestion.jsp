<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
		.h5-left-title1 {
		    font-size: 24px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.h5-left-title2 {
		    word-break: keep-all;
		}
		
		.question-span-strong {
			color: rgb(253, 126, 20);
			font-weight: bold;
		}
		
		.question-span-blue-strong {
			color: rgb(42, 143, 180);
			font-weight: bold;
		}
		
		.h4-left-title1 {
		    font-size: 28px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.h4-left-title2 {
		    word-break: keep-all;
		}		
		
		.inner-static-info-text1 {
		    font-size: 15px;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.inner-static-info-text2 {
		    word-break: keep-all;
		}	
		
		.h6-left-title1 {
		    font-size: 15px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.h6-left-title2 {
		    word-break: keep-all;
		}		

	</style>
	
	<script type="text/javascript">
		$(function(){
			$('select[name="question-type-select"').on('change', function(){
				$('.question-type-hidden-value').val($(this).val());
			})
			
			$('.btn-add-question-submit-button').on('click', function(){
				$('.add-question-form-tag').attr('method', 'post').attr('action', '/questionReport/addQuestion').submit();
			})
		})
	</script>
	
</head>
<body>
	<br/><br/>
	<div class="contact py-5 bg-light" id="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="h4-left-title1 h4-left-title2">Get취미 문의하기</h4>
					<hr>
				</div>
				<div class="col-md-6">
					<div class="address">
						<h5 class="h5-left-title1 h5-left-title2">주소 :</h5>
						<ul class="list-unstyled">
							<li class="inner-static-info-text1 inner-static-info-text2">서울특별시 서초구 서초4동 강남대로 459</li>
							<li class="inner-static-info-text1 inner-static-info-text2">2층 강의실 5호</li>
						</ul>
					</div>
					<div class="email">
						<h5 class="h5-left-title1 h5-left-title2">Email:</h5>
						<ul class="list-unstyled">
							<li class="inner-static-info-text1 inner-static-info-text2">gethobby-manager@gethobby.com</li>
							<li class="inner-static-info-text1 inner-static-info-text2">gethobby-master@gethobby.com</li>
						</ul>
					</div>
					<div class="phone">
						<h5 class="h5-left-title1 h5-left-title2">연락처 :</h5>
						<ul class="list-unstyled">
							<li class="inner-static-info-text1 inner-static-info-text2">+82 010-0000-0000</li>
							<li class="inner-static-info-text1 inner-static-info-text2">02-0000-0000</li>
						</ul>
						<h6 class="h6-left-title1 h6-left-title2">
							급한 용건을 경우 위의
							<br/>
							<span class="question-span-strong">연락처</span> 혹은
							<span class="question-span-strong">이메일</span>로 연락을 주시거나
							<br>
							<span class="question-span-blue-strong">직접 방문</span>해주세요.
						</h6>
					</div>
					<hr>
					<!-- 여기다가 로고 박으면 될듯 
					<div class="social">
						<ul class="list-inline list-unstyled">
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-facebook-square fa-2x"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-google-plus-square fa-2x"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-youtube-play fa-2x"></i></a></li>
						</ul>
					</div>
					-->
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-body event_card_body">
							<form class="add-question-form-tag">
								<div class="form-row">
									<div class="form-group col-lg-12">
										<select name="question-type-select" class="form-control">
											<option hidden>문의 말머리 선택</option>
											<option value="0">수강/클래스 문의</option>
											<option value="1">이벤트 문의</option>
											<option value="2">배송/준비물 문의</option>
											<option value="3">서비스 이용 문의</option>
											<option value="4">결제/수강취소/환불 문의</option>
										</select>
									</div>
									<input type="hidden" class="question-type-hidden-value" name="questionType" />
									<div class="form-group col-lg-12">
										<input name="questionTitle" placeholder="문의 제목을 입력하세요." class="form-control" type="text">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<textarea name="questionContent" cols="40" rows="5" placeholder="문의 내용을 입력하세요." class="form-control textarea-text-inner-html"></textarea>
									</div>
								</div>

								<div class="form-row">
									<button type="button" class="btn btn-basic btn-add-question-submit-button">문의</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>


</body>
</html>