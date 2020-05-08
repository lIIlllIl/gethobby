<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%-- //2020-02-24 Git Commit --%> --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  
  <style>

  	.test-button { 
  		color: rgb(255,255,255); 
  		margin-left: 100px;
  		margin-top: 34px;
  		background-color: rgb(253, 126, 20); 
  		width:150px; 
  		height:150px; 
  		border:0; 
  		outline: none; 
  	}
  </style>
</head>
<body>
	
	<button class="test-button listMyHobbyClass" style="box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px; background-color:white; color:black;">내 클래스</button>
	<button class="test-button getSelectOption" style="box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">클래스 신청하기</button>
	<button class="test-button getPaymentHistory" style="background-color:rgb(252, 61, 70); box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">주문 및 배송</button>
	<button class="test-button getPaymentHistoryListAdmin" style="color:white; background-color:black; box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">관리자</button>
	<button class="test-button getStartDB" style="color:white; background-color:rgb(42, 143, 180); border: 0; outline:0 none;">?</button>
	<button class="test-button getStartDB-none" style="display:none; position:fixed; top:30%; left:40%; color:white; background-color:rgb(42, 143, 180); border: 0; outline:0 none;">?</button>
	<button class="test-button getPreview" style="position:fixed; top:40%; left:40%; color:white; background-color:purple; border: 0; outline:0 none;">미리보기</button>
	
</body>

<script type="text/javascript">

$(function(){
	
	$(".listMyHobbyClass").on("click", function(){
		self.location = "/hobbyclass/getMyHobbyClassList";
	});
	$(".getSelectOption").on("click", function(){
		self.location = "/purchase/getSelectOption?hobbyClassNo=10000&discountPrice=50";
	});
	$(".getPaymentHistory").on("click", function(){
		self.location = "/purchase/getPaymentHistoryList";
	});
	$(".getPaymentHistoryListAdmin").on("click", function(){
		self.location = "/admin/purchase/getPaymentHistoryListAdmin";
	});
	$(".getPreview").on("click", function(){
		self.location = "/hobbyclass/getPreview?hobbyClassNo=10000";
	});
	$(".getStartDB").on("click", function(){
		$("body").css("background-color","red");
		$(".listMyHobbyClass").hide(200);
		$(".getSelectOption").hide(200);
		$(".getPaymentHistory").hide(200);
		$(".getPaymentHistoryListAdmin").hide(200);
		
		$(".getStartDB-none").css("display","block");
		$(".getStartDB-none").css("color","black");
		$(".getStartDB-none").css("font-size","52px");
		//$(".getStartDB-none").css("font-size","24px");
		$(".getStartDB").css("display","none");
		setTimeout(function(){
		var success = confirm("정말로 PURCHASE를 추가하시겠습니까?");
		if( success ){
			self.location = "/purchase/startDB";
		}else{
			$("body").css("background-color","white");
			$(".getStartDB-none").css("display","none");
			$(".getStartDB").css("display","block");
			$(".listMyHobbyClass").fadeIn(3000);
			$(".getSelectOption").fadeIn(3000);
			$(".getPaymentHistory").fadeIn(3000);
			$(".getPaymentHistoryListAdmin").fadeIn(3000);
		}
		},100);
	});
	
	
});

</script>
</html>