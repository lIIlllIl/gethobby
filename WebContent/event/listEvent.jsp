<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>GetHobby</title>

<!-- 웹사이트 파비콘 -->
<link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
<link rel="icon" href="/resources/image/logo/logo-favicon.png">

<!-- favicon 404 에러 안보이게  -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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

<!-- jQuery js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


<!-- 공통 CSS -->
<link rel="stylesheet" href="/resources/css/common.css">

<!-- 메인 메뉴 CSS -->
<link rel="stylesheet" href="/resources/css/header.css">
<!-- 메인 메뉴 js -->
<script src="/resources/javascript/header.js"></script>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />

<style type="text/css">

.card-img-top {
	border-radius: 10px;
	height: 20rem;
	width: 100%;
	object-fit: cover;
}

.breadcrumb{
	background-color: white;
}
/* 
.k-image-wrapper {
	height: 20rem;
}
 */

/* .k-image-wrapper .card-img-top{
	height: 20rem;
	width: 100%;
	object-fit: cover;
} */

</style>

<script type="text/javascript">


$(function() {
	//이미지클릭시
	//$(".card-img-top").on("click", function() {
	$(document).on("click", ".card-img-top", function(){	
		
		
 		//alert('이미지클릭');
/* 		var beforeSplit = $(this).attr('id');
		alert(beforeSplit);
		var afterSplit = beforeSplit.split('_');
		var eventNo = afterSplit[1];
		console.log('eventNo--'+eventNo+'--');
		alert(eventNo);  */
		
 		var eventId = $(this).parents('.kyung-card').find('.eventId_hidden').val();
 		console.log('eventId ? : ' + eventId);

		self.location = "/event/getEvent?eventId="+eventId;
		
	})
	
 	//////////////
/* 	$("#onGoing").on("click", function() {
		
		//alert('진행중');
		fnGetListEvent('1');

		
	})
	
	$("#entireEvent").on("click", function() {
		
		//alert('전체');
		fnGetListEvent('0');
		
	})
	
	$("#ended").on("click", function() {
		
		//alert('종료');
		fnGetListEvent('2');
	}) */
	
	
	// 페이지네이션 이벤트
   // $(document).on("click", ".breadcrumb-item", function(){
	   $(".breadcrumb-item").on("click", function() {
    		if($(this).text().trim() == '전체'){
    		//alert('전');
    		$("#listEvent_form").children("input[name='searchCondition']").val(0);
    		//alert($("#listEvent_form").children("input[name='searchCondition']").val());
    	
    	}else if($(this).text().trim() == '진행중'){
    		//alert('진');
    		$("#listEvent_form").children("input[name='searchCondition']").val(1);
    	}else if($(this).text().trim() == '종료'){
    		//alert('종');
    		$("#listEvent_form").children("input[name='searchCondition']").val(2);
    	}
    		
    		$('input[name="currentPage"]').val(1);
        	//listEventAjax($('input[name="currentPage"]').val());
        	listEventOrderBy();
    })
	 
	
//	$(window).scroll(function () {
		
	//	var scrollValue = $(document).scrollTop(); 
	//	console.log(scrollValue); 
		
//	});
	
	

	
}); 

 	$(function() {
		/////더보기버튼 클릭시 BUTTON1
		 $(document).on("click", "#moreEventButton", function() {
			 var currentPage = ( $('input[name="currentPage"]').val() * 1 ) + 1;
			
			 $('input[name="currentPage"]').val(currentPage);
			 
			 if( $("#listEvent_form").children("input[name='searchCondition']").val() == 0 || $("#listEvent_form").children("input[name='searchCondition']").val() == null){
         		$("#listEvent_form").children("input[name='searchCondition']").val(0);
			 }
			 else if($("#listEvent_form").children("input[name='searchCondition']").val() == 1){
      			$("#listEvent_form").children("input[name='searchCondition']").val(1);
			 }
			 else if($("#listEvent_form").children("input[name='searchCondition']").val() == 2){
				$("#listEvent_form").children("input[name='searchCondition']").val(2);
			 }
			// alert('더보기--');
			 //alert($("#listEvent_form").children("input[name='searchCondition']").val());
 				listEventAjax(currentPage);
 				
			})//더보기버튼 function 

	}); 
 	
 	//정렬 function
 	function listEventOrderBy(){
 		
 		//alert('정렬');
 		
 		var currentPage = $("input[name='currentPage']").val();
		//alert('currentPage-->'+currentPage);
		
		searchCondition = $("#listEvent_form").children("input[name='searchCondition']").val();
		//alert('searchCondition-->'+searchCondition);
		
		var search = {
				"currentPage" : currentPage,
				"searchCondition" : searchCondition
		};
		
 		
 		$.ajax({
			
			url : "/event/json/eventList",
			method : "POST", 
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			dataType: "json",
			data : JSON.stringify(search),
			success : function(data){
				if(data.success=="200"){
					
				
					var moreEventList = "";
					
					moreEventList += "<div class='oneRowEvent row d-flex'>"
					for(var i =0; i< data.list.length; i++){
						
						moreEventList += "<div class='kyung-card card col-lg-4 border-0 mb-5'>"
						+"<input type='hidden' class='eventId_hidden' value='"+data.list[i].eventId+"'/>"
						+"<img src='/images/kyung/"+data.list[i].eventImage+"' class='card-img-top' alt='...'>"
						+"<div class='card-body'>"
						+"	<p><strong>"+data.list[i].eventTitle+"</strong></p>"
						+"	<p>기간: "+data.list[i].eventStartDate+" ~ "+data.list[i].eventEndDate+"</p>"
						+"	</div>"
						+"</div>";
						
						
						
					}//for
					moreEventList += "</div>";
					$(".totalEvent").text(data.resultPage.totalCount);
					
					
					var currentPage = ( $('input[name="currentPage"]').val() * 1);
					
					if ( currentPage < data.resultPage.maxPage ) {
						$('.more-button-outer-div').show();
					}
					else {
						$('.more-button-outer-div').hide();
					}
					
				}//if
				$('.oneRowEvent').remove();
				$('.update').html(moreEventList);
				
				},//success

		 	error:function(request,status,error){
	            //alert("ajax과정 실패");
	       }//error
		});//ajax
 		
 	};
 	
			 
 	//더보기 바튼 function
	 function listEventAjax(currentPage) {		 

			// alert('더보기버튼');
			//alert('currentPage-->'+currentPage);
			//currentPage += 1;
			searchCondition = $("#listEvent_form").children("input[name='searchCondition']").val();
			
			//alert('searchCondition-->'+searchCondition);
			
			var search = {
					"currentPage" : currentPage,
					"searchCondition" : searchCondition
			};
			
			
	 		$.ajax({
				
				url : "/event/json/eventList",
				method : "POST", 
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType: "json",
				data : JSON.stringify(search),
				success : function(data){
					if(data.success=="200"){
						
						var moreEventList = "";
						
						moreEventList += "<div class='oneRowEvent row d-flex'>"
						for(var i =0; i< data.list.length; i++){
							
							moreEventList += "<div class='kyung-card card col-lg-4 border-0 mb-5'>"
							+"<input type='hidden' class='eventId_hidden' value='"+data.list[i].eventId+"'/>"
							+"<img src='/images/kyung/"+data.list[i].eventImage+"' class='card-img-top' alt='...'>"
							+"<div class='card-body'>"
							+"	<p><strong>"+data.list[i].eventTitle+"</strong></p>"
							+"	<p>기간: "+data.list[i].eventStartDate+" ~ "+data.list[i].eventEndDate+"</p>"
							+"	</div>"
							+"</div>";
							
							
							
						}//for
						moreEventList += "</div>";
						
						var currentPage = ( $('input[name="currentPage"]').val() * 1);
						
						if ( currentPage < data.resultPage.maxPage ) {
							$('.more-button-outer-div').show();
						}
						else {
							$('.more-button-outer-div').hide();
						}
						
					}//if
					
					
					$('.update').append(moreEventList);
					
					},//success
	
			 	error:function(request,status,error){
		            //lert("ajax과정 실패");
		       }//error
			});//ajax
				
				
	 };
 	
 	

	function fnGetListEvent(searchCondition) {
		
		//alert('함수시작');
		//alert('searchCondition--'+searchCondition);
		self.location = "/event/eventList?searchCondition="+searchCondition;
	};


	//////////////////////////////////////////////////////////////////////////////////
</script>

</head>

<body>
	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />
	<br/><<br/><br/>
	
	<input type="hidden" name="currentPage" value="1" />
	
	<!-- 전체 묶음 -->
	<div class="whole container mt-5">
	
	<h2><span class="totalEvent">${total}</span>개의 이벤트</h2>
	<hr>
	
	<form id="listEvent_form">
		<input type="hidden" name="searchCondition" value="">
	</form>
 
 
 <nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" id="entireEvent" value="전체"><a href="#">전체</a></li>
    <li class="breadcrumb-item" id="onGoing" value="진행중"><a href="#">진행중</a></li>
    <li class="breadcrumb-item active" id="ended" value="종료" aria-current="page">종료</li>
  </ol>
</nav>
 
 <input type="hidden" name="searchCondition" value="">
 
<c:set var="i" value="0"/>
<c:forEach var="eventList" items="${list}" varStatus="status" begin="0" end="0" >
<div class="oneRowEvent row d-flex">

			<c:if test="${list.size() < 1 }">
			 이벤트가 없습니다.
			</c:if>

		<div class="kyung-card card col-lg-4 border-0 mb-5">
			<input type="hidden" class="eventId_hidden" value="${list[i].eventId }"/>
			<img src="/images/kyung/${list[i].eventImage}" class="card-img-top" alt="...">
				<div class="card-body">
					<p><strong>${list[i].eventTitle}</strong></p>
					<p>기간: ${list[i].eventStartDate} ~ ${list[i].eventEndDate}</p>
					<!-- 
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.
					card title and make up the bulk of the card's content.card title and make up the bulk of the card's content.</p>  -->
				</div>
		</div>
		
		<c:if test="${list.size() >1  }"> 
		<div class="kyung-card card col-lg-4 border-0 mb-5">
			<input type="hidden" class="eventId_hidden" value="${list[i+1].eventId }"/>
			<img src="/images/kyung/${list[i+1].eventImage}" class="card-img-top" alt="...">
				<div class="card-body">
					<p><strong>${list[i+1].eventTitle}</strong></p>
					<p>기간: ${list[i+1].eventStartDate} ~ ${list[i+1].eventEndDate}</p>
					<!-- 
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.
					card title and make up the bulk of the card's content.card title and make up the bulk of the card's content.</p>  -->
				</div>
		</div>
		</c:if>  
		
		<c:if test="${list.size() >2}"> 
		<div class="kyung-card col-lg-4 border-0 mb-5">
			<input type="hidden" class="eventId_hidden" value="${list[i+2].eventId }"/>
			<img src="/images/kyung/${list[i+2].eventImage}" class="card-img-top" alt="...">
				<div class="card-body">
					<p><strong>${list[i+2].eventTitle}</strong></p>
					<p>기간: ${list[i+2].eventStartDate} ~ ${list[i+2].eventEndDate}</p>
					<!-- 
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.
					card title and make up the bulk of the card's content.card title and make up the bulk of the card's content.</p>  -->
				</div>
		</div>
		</c:if> 
		
</div>
<!-- 이벤트 3개 한줄 -->
		
<!--<c:set var="i" value="${i+3}"/>-->
</c:forEach>
	
	<div class="update">
	
	</div>
	
	
		<div>
		
		<c:if test="${total > 3}">
		<!-- 버튼 -->
			<div class="more-button-outer-div d-flex justify-content-center" style="margin-top : 20px">
			
				<button type="button" class="btn btn-basic m-1" id="moreEventButton">더보기</button>

			</div>
		<!-- 버튼 -->
		</c:if>
		
		
		</div>


	</div>
	</br>
	</br>
	</br>
	</br>
	</br>
	
		<jsp:include page="/common/footer.jsp" />


</body>
</html>