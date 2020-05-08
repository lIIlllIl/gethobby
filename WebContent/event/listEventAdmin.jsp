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
<link rel="stylesheet" href="../resources/css/commonAdmin.css">


<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
    
    <!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css 충돌남
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" /> -->


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

.breadcrumb-item{
	align-self: center;
	width: 4em;
}

.add_Event{
	width: 43em;
}

#deleteButton{
	width: 4em;
	height : 2em;
	
}

.add-event-div{
	display: flex;
	justify-content: left;
}



</style>
<script type="text/javascript">
	
	//ready되자마자 sezrchCondition을 "전체"로 설정
	$(document).ready(function() {
		$("#listEventAdmin").children("input[name='searchCondition']").val(0);
	});//ready
	
$(function() {
	
	//이벤트이름 클릭시
	$(document).on("click", ".event_title_class", function(){
	//$(".event_title_class").on("click", function() {
		
/* 		//alert('이미지클릭');
		var beforeSplit = $(this).attr('id');
		alert(beforeSplit);
		var afterSplit = beforeSplit.split('_');
		var eventNo = afterSplit[1];
		console.log('eventNo--'+eventNo+'--');
		alert(eventNo); */
		//alert('선택');
 		//var eventId = $(this).parents('.kyung-card').find('.eventId_hidden').val();
 		
		//var eventTitle = $(this).text(); 
		var eventId = $(this).parents('tr').find("input:hidden[name='eventId']").val();
		
		//alert('eventId-'+eventId);
 		//console.log('eventId ? : ' + eventId);

		self.location = "/event/getEvent?eventId="+eventId;
		
	});
	
/*  	$("#onGoing").on("click", function() {
		
		//alert('진행중');
		fnGetListEvent('0');

		
	})
	
	$("#entireEvent").on("click", function() {
		
		//alert('전체');
		fnGetListEvent('1');
		
	})
	
	$("#ended").on("click", function() {
		
		//alert('종료');
		fnGetListEvent('2');
	}) */ 
	
	$("#addNewEventButton").on("click", function() {
		
		//alert('이벤트추가');
		self.location = "/event/addEvent.jsp";

	})
	
	
	
	   // 한개 선택 이벤트
            $(document).on("click", ".select-box", function(){
 
            	if( $(this).find("input").is(":checked") == false ) {            		
	            	$(this).find("svg").children("path").remove();	           	
	            	$(this).find("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');	            	
	            	$(this).find("input").attr("checked", true);
	            	
	            	var eventId = $(this).find("input[name='eventId']").val();
	            	//alert('aaa'+eventId);
	            	
	            	var checkboxValues = [];
	        		//체크박스의 값들을 배열에 담는다.
	        	    $("input[name='eventId']:checked").each(function(i) {
	        	    	
	        	        checkboxValues.push($(this).val());
	        	       // console.log('checkboxValues--'+checkboxValues);
	        	        //alert('checkboxValues=='+checkboxValues);
	        	      
	        	    }); 
	        			console.log('checkboxValuesConsole 전체--'+checkboxValues);
	            	
	            	
            	}else if( $(this).find("input").is(":checked") == true ) {
	            	$(this).find("svg").children("path").remove();
	            	$(this).find("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
	            	$(this).find("input").attr("checked", false);
	            	
            	}
            });
            
    // 전체 선택 이벤트
    $(document).on("click", ".select-all-box", function(){
    	
    	if( $(".select-all-box").find("input").is(":checked") == false ) {
    		
    		$("input").prev("svg").children("path").remove();
        	$("input").prev("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
        	$("input").attr("checked", true);
        	
    	}else if( $(".select-all-box").find("input").is(":checked") == true ) {
    		
    		$("input").prev("svg").children("path").remove();
        	$("input").prev("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
        	$("input").attr("checked", false);
    		
    	}
    	
    });
	
	
	
	
	$("input[name='eventId']").on("click", function() {
		
		//alert('선택');
		var eventId = $(this).val();
		//alert('eventId--'+eventId);
	
	   	var checkboxValues = [];
		//체크박스의 값들을 배열에 담는다.
	    $("input[name='eventId']:checked").each(function(i) {
	    	
	        checkboxValues.push($(this).val());
	       // console.log('checkboxValues--'+checkboxValues);
	        //alert('checkboxValues=='+checkboxValues);
	      
	    }); 
			console.log('checkboxValuesConsole 전체--'+checkboxValues);
			
	})//checkBox OnCLick
	
	
	$("#deleteButton").on("click", function() {
		//alert('dd');
		var eventIds = [];
		
		$("input[name='eventId']:checked").each(function(i) {
		    	
			eventIds.push($(this).val());
		      
		}); 
		
		console.log('삭제할 eventId들--'+eventIds);
			
		if(eventIds == null || eventIds.length <1){
			alert("삭제할 이벤트를 선택해주세요");
			return;
		}
 		swal.fire({
		  		title: '삭제되었습니다!',
		  		text: 'Get취미IfYouCAN',
		  		imageUrl: '/resources/image/logo/logo-favicon.png',
		  		timer : 800
			}).then((result)=>{
				self.location = "/event/deleteSelectedEvent?eventIds="+eventIds;
			}) 
		
	});//deleteButton
	
	
	
	// 정렬 버튼 이벤트
    $(document).on("click", ".dropdown-item", function(){
    	$(".manage-sort-button").html( $(this).text() + ' <svg width="20" height="20" viewBox="0 0 24 28"><path fill="#ff922b" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
    	$(".manage-sort-button").css("color","rgb(255, 146, 43)");
    	
    	$("#listEventAdmin").children("input[name='currentPage']").val(1);

    	
   			if( $(this).text().trim() == '전체' ){
        		$("#listEventAdmin").children("input[name='searchCondition']").val(0);
        	}else if( $(this).text().trim() == '진행중' ){
        		$("#listEventAdmin").children("input[name='searchCondition']").val(1);
        	}else if( $(this).text().trim() == '종료' ){
        		$("#listEventAdmin").children("input[name='searchCondition']").val(2);
        	}
   				//alert('aaa-'+$("#listEventAdmin").children("input[name='searchCondition']").val());
       
   		 //}

    	//alert($("#listEventAdmin").children("input[name='searchCondition']").val());
    	fnListEventAdmin();

	});//end of function
	
	
	
	
	
	
	
	
	// 페이지네이션 이벤트
    $(document).on("click", ".manage-pagination", function(){
        	$("#listEventAdmin").children("input[name='currentPage']").val( $(this).text().trim() );
        	
        	fnListEventAdmin();    	
    });
	
	// 페이지네이션 이전, 다음 이벤트
	$(document).on("click", ".page-link", function(){
		
		// 이전 버튼일 경우
		if( $(this).attr("aria-label") == 'Previous' && !($(this).children().attr("class") == 'manage-no-page-span') ){
			
			if( $("#listEventAdmin").children("input[name='currentPage']").val() == 1){
        		$("#listEventAdmin").children("input[name='currentPage']").val(1);
        	}else{
        		$("#listEventAdmin").children("input[name='currentPage']").val( Number( $("#listEventAdmin").children("input[name='currentPage']").val() ) -Number(5) );
        	}
			fnListEventAdmin();
			// 다음 버튼일 경우
		}else if( $(this).attr("aria-label") == 'Next' && !($(this).children().attr("class") == 'manage-no-page-span') ){
			if( $("#listEventAdmin").children("input[name='currentPage']").val() == $("#listEventAdmin").children("input[name='maxPage']").val() ){
           		$("#listEventAdmin").children("input[name='currentPage']").val( $("#listEventAdmin").children("input[name='maxPage']").val() );

        	}else{
        		$("#listEventAdmin").children("input[name='currentPage']").val( Number( $("#listEventAdmin").children("input[name='currentPage']").val() ) +Number(5) );

        	}
			
			fnListEventAdmin();
		}	
    });

    // 페이지 이전 이벤트
    $(document).on("click", ".forward-button", function(){
    	if( $("#listEventAdmin").children("input[name='currentPage']").val() == 1){
    		$("#listEventAdmin").children("input[name='currentPage']").val(1);
    	}else{
    		$("#listEventAdmin").children("input[name='currentPage']").val( Number( $("#listEventAdmin").children("input[name='currentPage']").val() ) -Number(1) );
    	}
    	fnListEventAdmin();
    });
    
    // 페이지 다음 이벤트
    $(document).on("click", ".backward-button", function(){

   		if( $("#listEventAdmin").children("input[name='currentPage']").val() == $("#listEventAdmin").children("input[name='maxPage']").val() ){
       		$("#listEventAdmin").children("input[name='currentPage']").val( $("#listEventAdmin").children("input[name='maxPage']").val() );

    	}else{
    		$("#listEventAdmin").children("input[name='currentPage']").val( Number( $("#listEventAdmin").children("input[name='currentPage']").val() ) +Number(1) );

    	}
   		fnListEventAdmin();
    });
	
	
	
})//function


	function fnGetListEvent(searchCondition) {
		
		//alert('함수시작');
		//alert('searchCondition--'+searchCondition);
		self.location = "/event/eventList?searchCondition="+searchCondition;
	};
	
	
	function fnListEventAdmin(){
		
		var currentPage= $("#listEventAdmin").children("input[name='currentPage']").val();
		var searchCondition= $("#listEventAdmin").children("input[name='searchCondition']").val();
		var today = $("input:hidden[name=hidden_today]").val();
		//alert('today:'+today);
		//alert('currentPage:'+currentPage);
		//alert('searchCondition:'+searchCondition);
		
		var search = {
				"currentPage" : currentPage,
				"searchCondition" : searchCondition
		};
		
		$.ajax(
				{
					url: "/event/json/eventList",
					method: "POST",
					data: JSON.stringify(search),
					dataType : "json" ,
					headers : {
						"Accept" : "application/json" ,
						"Content-Type" : "application/json"
					} ,
					success : function(data) {
						if(data.success=="200"){
						
						var displayValue = "";
						
							//displayValue += "<tbody>";
							
						for(var i=0; i<data.list.length; i++){
							
							var no = (9 * (currentPage-1) ) +1;
				
							
							if(data.list.length < 1){
						displayValue += "이벤트가 없습니다. <tbody>";
							}else{
			  				
							displayValue += "<tr>";
 							if(today > data.list[i].eventEndDate ){ //<!-- 종료된 이벤트만 삭제가능하도록... -->
								displayValue += "<th scope='row' class='select-box'>"
								+"<svg width='24' height='24' viewBox='0 0 24 24'>"
								+"<path fill='#3E4042' fill-rule='evenodd' d='M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z' />"
								+"</svg>"
								+"<input class='form-check-input' style='display:none' name='eventId' type='checkbox' id='categoryCheckbox1' value='"+data.list[i].eventId+"'>"
								+"</th>";
							}else if(today <= data.list[i].eventEndDate){
								displayValue += "<th></th>";
			    			
							} 
				 				
							
							displayValue +="<td>"+(no+i)+"</td>"
								+"<input type='hidden' name='total' value='"+data.total+"'>"
				 				+"<td id='eventTitle' class='event_title_class'><input type='hidden' id='eventId' name='eventId' value='"+data.list[i].eventId+"'>"+data.list[i].eventTitle+"</input></td>"
			     
 			      				+"<td>"+data.list[i].eventStartDate+" ~ "+data.list[i].eventEndDate+"</td>"
			   					 +"</tr>"
							
							}//if

						}//for
						
			   					//displayValue +="</tbody>";
								
								
						//$("tbody").html(displayValue);		
							
				
							
 							paginationDisplayValue = '<li class="page-item">';
							if( data.resultPage.currentPage > data.resultPage.pageUnit ){
							paginationDisplayValue += '<a class="page-link" href="#" aria-label="Previous">' +
									'<span aria-hidden="true">' +
									'&lt;' +
									'</span>' +
									'</a>';
						}else if( data.resultPage.currentPage <= data.resultPage.pageUnit ){
						paginationDisplayValue += '<a class="page-link" aria-label="Previous">' +
												'<span aria-hidden="true" class="manage-no-page-span">' +
											'&lt;' +
											'</span>' +
											'</a>';
							}
						paginationDisplayValue += '</li>';
						
					for(var i=data.resultPage.beginUnitPage; i<=data.resultPage.endUnitPage; i++){
						paginationDisplayValue += '<li class="page-item"><a class="page-link manage-pagination" href="#">'+i+'</a></li>';
					}
					if( data.resultPage.endUnitPage < data.resultPage.maxPage ){
						paginationDisplayValue += '<a class="page-link" href="#" aria-label="Next">' +
									'<span aria-hidden="true">' +
									'&gt;' +
									'</span>' +
									'</a>';
					}else if( data.resultPage.endUnitPage >= data.resultPage.maxPage ){
						paginationDisplayValue += '<a class="page-link" aria-label="Next" style="border:0; outline:0 none;">' +
									'<span aria-hidden="true" class="manage-no-page-span">' +
									'&gt;' +
									'</span>' +
									'</a>';
					}
						paginationDisplayValue += '</li>';			
		 
						$("tbody").html(displayValue);
						$(".pagination").html(paginationDisplayValue);
						$("#listEventAdmin").children("input[name='maxPage']").val( data.resultPage.maxPage );

						
						}//if
						else{
							return;
					}//else
				},//success
			 	error:function(request,status,error){
		          //  alert("ajax과정 실패");
		       }//error
			});//ajax
		
		
	};


	//////////////////////////////////////////////////////////////////////////////////
</script>

</head>

<body>


    <div class="wrapper">
        
        <!-- Sidebar -->
        <jsp:include page="/admin/sidebarAdmin.jsp" />

        <!-- Page Content  -->
        <div id="content">

			<!-- Toolbar -->
            <jsp:include page="/admin/toolbarAdmin.jsp" />
<!-- 
	<div class="whole container mt-5">  -->
	
	<form id="listEventAdmin">
		<input type="hidden" name="searchCondition" value="">
		<input type="hidden" name="currentPage" value="${resultPage.currentPage}">
		<input type="hidden" name="maxPage" value="${resultPage.maxPage}">
		<!-- <input type="hidden" name="total" value="${total}"> -->
		
	</form>
	

	
	    <!-- 모듈관리명 -->
			<div class="manager-title">
            	<h1>이벤트 관리
            		<span class="manager-title-state">이벤트 : ${total}개</span>
            	</h1>          	
            </div>
	
	
		            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
            
            	<!-- 검색창
	            <div class="manager-title-searchbar">
	            	<input type="text" name="searchbar-text" style="border:0; outline:none;" placeholder="검색">
	            	<svg width="24" height="24" class="SearchBox__SearchIcon-rplyxp-2 beZsar" viewBox="0 0 24 24">
		            	<path fill="#3e4042" fill-rule="evenodd" d="M15.593 14.54L20.5 19 19 20.5l-4.46-4.907a6.5 6.5 0 111.054-1.054zM10.5 15a4.5 4.5 0 100-9 4.5 4.5 0 000 9z" />
	            	</svg>	
	            </div>
	             -->
	            <div class="manager-search-menu-div">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					  <button type="button" class="btn-outline-light manage-sort-button black-hover" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	진행상태
					    	<svg width="20" height="20" viewBox="0 0 24 28">
						    	<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" />
					    	</svg>
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#" id="entireEvent">전체</a>
					    <a class="dropdown-item" href="#" id="onGoing">진행중</a>
					    <a class="dropdown-item" href="#" id="ended">종료</a>
					  </div>
					</div>
					
<!-- 		            수정버튼
		            <div class="update-event-div black-hover">  	
						<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24">
									<path d="M11,8v5l4.25,2.52l0.77-1.28l-3.52-2.09V8H11z M21,10V3l-2.64,2.64C16.74,4.01,14.49,3,12,3c-4.97,0-9,4.03-9,9 s4.03,9,9,9s9-4.03,9-9h-2c0,3.86-3.14,7-7,7s-7-3.14-7-7s3.14-7,7-7c1.93,0,3.68,0.79,4.95,2.05L14,10H21z"/>
						</svg>
						<span>수정</span>
		            </div> -->
		            
		            <!-- 삭제버튼 -->
		            <div class="delete-event-div black-hover" id="deleteButton">	
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/>
							<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM8 9h8v10H8V9zm7.5-5l-1-1h-5l-1 1H5v2h14V4h-3.5z"/>
						</svg>
						<span class="">삭제</span>
		            </div>
	            </div>
	            
	            <!-- 등록버튼 -->
	            <div class="add-event-div">
	            <svg width="24" height="24" viewBox="0 0 24 24">
		  			<path fill="#5faec9" fill-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6z">
		  			</path>
	  			</svg>
	            <button type="button" class="btn btn-light button" id="addNewEventButton" style="border:0; outline:none; padding:0px; color:rgb(95, 174, 201);">새 이벤트 등록</button>
	            </div>
	            
            </div>
	
		<div class="manager-content">	    
			<table class="table">
				  <thead>
				    <tr>
				      <th scope="col" class="select-all-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="all-checked-box" style="display: none"> 
				      </th>
				      <th scope="col">No</th>
				      <th scope="col">이벤트 이름</th>
				      <th scope="col">이벤트 기간</th>
				    </tr>
				  </thead>
  
<!--   //전체선택 체크박스를 선택하면 그 아래의 모든 체크박스를 선택 jQuery

  $(function(){
    $("#check_all").click(function(){
        var chk = $(this).is(":checked");//.attr('checked');
        if(chk) $(".select_subject input").prop('checked', true);
        else  $(".select_subject input").prop('checked', false);
    });
}); -->


				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="to_day"/> 
				<input type="hidden" name="hidden_today" id="hidden_today" value="${to_day}"/>
  
  				<tbody>
  				<c:set var="i" value="0"/>
				<c:forEach var="eventList" items="${list}" varStatus="status" >
				<fmt:formatDate value="${list[i].eventEndDate}" pattern="yyyy-MM-dd" var="event_End_Date"/>  
	
				<c:if test="${list.size() < 1 }">
					 이벤트가 없습니다.
				</c:if> 
    			<tr>
    			
					<c:if test="${to_day > event_End_Date}"> <!-- 종료된 이벤트만 삭제가능하도록... -->
      				<th scope="row" class="select-box">
      				<!--  
      				<div class="form-check form-check-inline"> -->
      					<svg width="24" height="24" viewBox="0 0 24 24">
							<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				 		</svg>
  						<input class="form-check-input" style="display:none" name="eventId" type="checkbox" id="categoryCheckbox1" value="${list[i].eventId }">
					<!--  </div> -->
	 				</th>
					</c:if>
					<c:if test="${to_day <= event_End_Date}">
					<th></th>
					</c:if>
      				<td>${i+1}</td>
      				<td id="eventTitle" class="event_title_class">${list[i].eventTitle }</td>
      				<input type="hidden" id="eventId" name="eventId" value="${list[i].eventId }"></input>
     
      				<td>${list[i].eventStartDate} ~ ${list[i].eventEndDate}</td>
   				 </tr>
    
  				  <c:set var="i" value="${i+1}"/>
   				 </c:forEach>

 				 </tbody>
			</table>
	
					<!-- Pagination -->
					<jsp:include page="/admin/paginationAdmin.jsp" />
	
		 </div>
	
	   </div>
	</div>
	
</body>
</html>