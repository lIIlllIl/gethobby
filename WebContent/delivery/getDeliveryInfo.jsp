<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- 웹 폰트 (나눔고딕) -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
	rel="stylesheet">


<!--부트스트랩 CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- fontawesome cdn(웹 아이콘 라이브러리) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!--부트스트랩 js-->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


<style>
*, body, p, h1, h2, h3, h4, h5, h6, button, a, ul, li, ol, div, span,
	input, textarea, table, th, tr, td, nav, header, article, footer,
	select, small {
	font-family: "Nanum Gothic"
}
</style>

<script>

	$(function(){
		
		$(".btn-primary").on("click", function(){
			window.open("/delivery/getDeliveryInfoDetail/${ delivery.dlvyCompany }/${ delivery.trackingNo }", "PopupWin", "width=500,height=600");
		});
		
	});

</script>


</head>

<body>

	<div class="card" style="width: 18rem;">
	  <img src="https://dummyimage.com/600x400/000/fff" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">${ delivery.hobbyClass.kitName }</h5>
	    <p class="card-text"> 택배회사: ${ delivery.dlvyCompany } <br> 운송장번호: ${ delivery.trackingNo } </p>
	    <a href="" class="btn btn-primary">배송상태 상세보기</a>
	  </div>
	</div>



</body>

</html>