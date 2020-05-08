<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="today" class="java.util.Date" />
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
<!-- <link rel="stylesheet" href="/resources/css/kyung/listCommunity.css"> -->	


<link rel="shortcut icon" href="/static/pc/images/favicon.ico">

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />


<style type="text/css">

#dropdownButton{
	height: 2rem;
	width: 4rem;
	font-size: 16px;
}

#cannotdeleteEvent{
	background-color: grey;
}

#cannotupdateEvent{
	background-color: grey;
}

/* 
 이벤트 최상단 박스
 */
.event_box {
   /*  background-color: #F2B33D;
    color: white;  */
   /*  width: 700px; */
    width: auto;
    height: 200px;

}   

/* .event-detail-date{
    border-bottom: 1px solid #555;
} */

.event_header_div{
	border-bottom: 1px solid #555;
}

.inner_container{
	/* background-color: #F2B33D; */
	/* width: 700px; */
	width: 100%;
	max-width: 700px;
	align-content: center;
	text-align: center;
}

.event_use_div{
    /*  background-color: antiquewhite;   */
	/*  color: #F2B33D;  */
	background-color: #F2F2F2; 
	color: black;
/* 	background-color:#8C8C8C; 
	color: white; */
	font-weight: bold;
	text-align: left;
	padding-top: 1%;
	padding-left: 3%;
	padding-bottom: 20px;
}

.event_note_div{
	
	text-align: left;
	
}

.dropdown-toggle::after {
	display: none;
}

/* .btn-group{
	display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 1 0%;
    padding: 8px 16px;
} */

</style>

<script type="text/javascript">

	
	$(function(){	
		 $(document).on('click', '.dropdown-item', function(){
	
			 var eventId = $("input[name=eventId]").val();
			 var checkNavigation = $(this).val();
			 //alert('checkNavigation=>'+checkNavigation);
			 //alert('eventId=>'+eventId); 
			 
			 if( checkNavigation == '0'){
				 //수정
				 //alert('0');
		          self.location = "/event/updateOneEventViewAdmin?eventId="+eventId;
				
			 }if( checkNavigation == '1'){
				 //수정불가
				 swal.fire("수정불가", "진행중인 이벤트는 수정할 수 업습니다 :)", "error");
			 }if( checkNavigation == '2'){
				 //삭제
		 		swal.fire({
  			  		title: '삭제되었습니다!',
  			  		text: 'Get취미IfYouCAN',
  			  		imageUrl: '/resources/image/logo/logo-favicon.png',
  			  		timer : 800
  				}).then((result)=>{
  					self.location = "/event/deleteOneEventAdmin?eventId="+eventId;
  				}) 
	
				 //self.location = "/event/deleteOneEventAdmin?eventId="+eventId;
			 }else if( checkNavigation == '3'){
				 //삭제불가
				 swal.fire("삭제불가", "진행중인 이벤트는 삭제할 수 업습니다 :)", "error");
			 }//if문 끝
		})//navigation 끝
		
	})

</script>

</head>
<body>
<!--  
	<c:if test="${user.userId eq 'admin@naver.com'}">
	<jsp:include page="/admin/sidebarAdmin.jsp" />
	</c:if> -->
	
	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />


	<!-- 전체 묶음 -->
	<div class="container mt-5">
		
		<input type="hidden" id="eventId" name="eventId" value="${event.eventId }">
		
		<div class="event_box">
		 
		 	</br>
		 	</br>
		 	</br>
			<div>
			<h1 class="tit">${event.eventTitle }</h1>
			</div>
		
			<div class="event_header_div">
			
			<p class="event-detail-date">
				<!-- <span>기간</span> -->
				<em><h3>${event.eventStartDate } ~ ${event.eventEndDate }</h3></em>
			</p>
			
			
			</div>
			
			<c:if test="${user.userId eq 'admin@naver.com'}">
			
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="to_day"/>  
				<fmt:formatDate value="${event.eventEndDate}" pattern="yyyy-MM-dd" var="event_End_Date"/>  
				<fmt:formatDate value="${event.eventStartDate}" pattern="yyyy-MM-dd" var="event_Start_Date"/>  
			
				<div class="btn-group">
<!--   					<button class="btn btn-sm dropdown-toggle bi-three dots vertical" id="dropdownButton" type="button" data-toggle="dropdown" >
    				 관리
 					</button> -->
 						   <!--   <div class="lcmnt-bs-d "> --> 
	                 <button type="button" id="dropdownButton" class="btn btn-sm dropdown-toggle bi-three dots vertical" data-toggle="dropdown">
		                 <span class="lcmnt-bs-i">
			                 <svg width="24" height="24" viewBox="0 0 24 24">
				                 <path fill="#858a8d" fill-rule="evenodd" d="M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z">
				                 </path>
			                 </svg>
		                 </span>
	                 </button>
	                        <!--  </div>  -->  
 					
  					
  					<div class="dropdown-menu dropdown_div">
  					<c:if test="${to_day < event_Start_Date}">
    					<button class="dropdown-item" id="updateEvent" value="0">수정</button>
    				</c:if>
  					<c:if test="${to_day >= event_Start_Date}">
    					<button class="dropdown-item" id="cannotupdateEvent" value="1">수정불가</button>
    				</c:if>
    				<c:if test="${to_day > event_End_Date || to_day < event_Start_Date}"> <!-- 종료된 이벤트만 삭제가능하도록... -->
   						<button class="dropdown-item" id="deleteEvent" value="2">삭제</button>
   					</c:if>
   					<c:if test="${to_day <= event_End_Date && to_day >= event_Start_Date}">
   						<button class="dropdown-item" id="cannotdeleteEvent" value="3">삭제불가</button>
   					</c:if>
  					</div>
  				
				</div>
				
			</c:if>
			
			<%-- <h3>${event.eventStartDate } ~ ${event.eventEndDate }</h3> --%>
			
			
			
		
		
		</div>
		
		
	
	
	  	</br>
		</br>
		</br>
		</br>
	
		<div class="inner_container mx-auto">
		
			<div>
			${event.eventContent }
			</div>
		
		
			</br>
			</br>
			</br>
			</br>	
		
	
			<div>
		
			<%-- 이벤트 기간 : ${event.eventStartDate } ~ ${event.eventEndDate }까지 --%>
			</div>
		
			</br>
			</br>
			</br>
			</br>
	
			<div class="event_use_div">
			<p>참여방법</p>
			
				<div>
					<p>STEP01. 수강생 모집중인 모든 클래스를 확인해주세요.</p>
				</div>
				<div>
					<p>STEP02. 평소 관심있었던 클래스를 선택해주세요.</p>
				</div>
				<div>
					<p>STEP03. 할인된 가격으로 클래스를 구매해주세요.</p>
				</div>
				<div>
					<p>STEP04.</p>
					<span class="event_note_div">
					 좋은 소식은 널리 알리는 게 답! 이벤트 소식 공유하기!!!!!
       			 	<p>SNS에 이벤트 소식을 공유하고  친구들과 취미를 함께 해요.</p>
       			 	</span>
				</div>
				<div>
					<p>STEP05. 이제 취미생활을 즐길 시간!</p>
     		 	 	<p>항상 하고싶었던 클래스를 집에서 강의로 즐겨보세요.</p>
       				<p> 크리에이터와 수강생 여러분과 커뮤니티에서 대화를 즐길 수도 있습니다.</p>
        			<p>서로서로 묻고 답하고 함께 해보세요~!</p>
				</div>
				
		
			
				</br>
				</br>
			
			
				<div>
	
				<p>유의사항</p>
				<p>- ‘수강 신청 중인’클래스만 사용이 가능합니다.</p>
				<p>-다른 쿠폰과 중복사용이 불가합니다.</p>
				<p>-일부 ‘수강권만’ 구매할 수 있는 클래스의 경우에도 사용이 가능합니다.</p>
				<p>-모든 이벤트는 당사의 사정에 의하여 별도의 공지없이 변경/종료 될 수 있습니다.</p>
		
				</div>
		
			</div>
			
			</br>
			</br>
			</br>
			</br>
		   
		
		</div>
	
	
	
	

	</div>




<!-- 
<div class="my-5">&nbsp;</div>
<div class="my-5">&nbsp;</div>
<div class="my-5">&nbsp;</div>
<div class="my-5">&nbsp;</div>
<div class="my-5">&nbsp;</div>
 -->


 <jsp:include page="/common/footer.jsp" />

</body>

</html>