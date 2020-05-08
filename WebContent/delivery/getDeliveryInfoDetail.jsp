<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        
        
        
</script>


</head>

<body>

	<div class="container-fluid">
		<div class="panel-body">
			<div class="col-md-12 header-title">스마트택배 배송조회</div>
			<div class="col-md-12">
				<div class="form-group row">
					<label for="invoice" class="col-xs-4 label-style">운송장번호</label>
					<div id="invoice" class="col-xs-8 info-style">${deliveryNum}</div>
				</div>
				<div class="form-group row">
					<label for="to" class="col-xs-4 label-style">받는 사람</label>
					<div id="to" class="col-xs-8 info-style">${receiverName}</div>
				</div>
				<div class="form-group row">
					<label for="from" class="col-xs-4 label-style">보낸 사람</label>
					<div id="from" class="col-xs-8 info-style">${senderName}</div>
				</div>
				<div class="form-group row">
					<label for="adress" class="col-xs-4 label-style">수령 주소</label>
					<div id="adress" class="col-xs-8 info-style">${receiverAddr}</div>
				</div>
			</div>
		</div>

		<div class="col-sm-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>시간</th>
						<th>현재 위치</th>
						<th>배송 상태</th>
					</tr>
				</thead>
				<tbody class="d_l">
					<tr>
						<td>${timeString}</td>
						<td>고객</td>
						<td>인수자등록</td>
					</tr>
					<c:set var="i" value="0" />
					<c:forEach var="list" items="${list}">
						<c:set var="i" value="${i+1}" />
						<tr>
							<td>${list.timeString}</td>
							<td>${list.where}</td>
							<td>${list.kind}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>

</html>