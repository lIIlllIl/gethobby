<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- //2020-02-24 Git Commit --%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="/resources/css/commonAdmin.css">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	<style>
		/*
    DEMO STYLE
*/

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
    clear: left;
}

.navbar {
	position: fixed;
	left:0px;
	top: 0px;
	z-index: 1000;
	width:100%;
	
    padding: 14px 16px;
    height: 57px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
}

#sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 999;
    background: white;
    color: rgb(97, 101, 104);
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: white;
    font-size: 14px;
}

#sidebar ul.components {
    padding: 20px 0;
    font-size: 14px;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    color: rgb(97, 101, 104);
    background: #fff;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: rgb(27, 28, 29);
    font-weight: bold;
    background: white;
    position: relative;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: calc(100% - 250px);
    padding: 81px 24px 57px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0px;
    right: 0px;
}

#content.active {
    width: 100%;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #content {
        width: 100%;
    }
    #content.active {
        width: calc(100% - 250px);
    }
    #sidebarCollapse span {
        display: block;
    }
}

/* Css Custom */

.adminAction-button {
	background-color:#4267b2; 
	border:0; 
	outline: none; 
	width:40px; 
	height:24px; 
	padding: 0px;
}
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
			
}
.sidebar-text:hover{
	font-weight: 700;
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 23px 0px 15px 32px;
}
.manager-content {
	margin: 0px;
}
.manager-title-searchbar {
	width: 360px;
    height: 100%;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    box-shadow: rgba(0, 0, 0, 0.04) 0px 0px 1px 0px, rgba(41, 42, 43, 0.16) 0px 1px 3px 0px;
    padding: 10px 16px;
    border-radius: 3px;
    
}
.manager-title-search-input-box {
	border:0; 
	outline:none;
	width:360px;
	
}
.manager-no {
	width: 20px;
}
.delete-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.add-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    cursor: pointer;
    
}
.add-event-div:hover {
 	text-decoration: underline;
 	text-decoration-color:rgb(95, 174, 201);
}
.update-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.black-hover:hover {
	font-weight: 700;
}

.manage-menu-div {
	width: 100%;
	display: flex;
	justify-content: space-between;	
}
.manage-search-menu-div-left-sort {
	width: 100%;
	display: flex;
	justify-content: left;
	
}
.manager-search-menu-div {
	display: flex;
	justify-content: left;
}
.manage-sort-button-div {	
	height: 44px;			
}

.manage-sort-button {
	border: 0;
	outline: none;
	width:140px;	
	color:rgb(62, 64, 66);
	background-color: white;
}
.manage-sort-button:focus {
	border: 0;
	outline: none;
}
::selection { 
	background-color: rgb(255, 89, 70) !important;
 		color: rgb(255, 255, 255) !important;
}
.dropdown-item:focus {
	background-color: white;
	color: rgb(255, 146, 43);
}
.dropdown-menu {
	border: 0;
	box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;
	outline: 0 none;
	
}
.button:hover {
	border: 0;
	outline: 0 none;
	background-color: white;
}

.button,textarea:focus {
	border: 0 !important;
	outline: 0 none !important;
	background-color: white;	
}

.button:not(:hover) {
	border: 0;
	outline: 0 none;
	background-color: white;
}
.manager-title-state {
	font-size: 14px;
	margin-left: 8px;
}
.page-item a {
	color: rgb(62, 64, 66);
	border: 0;
	outline: 0 none;
}
.page-item:focus {
	border: 0;
	outline: 0 none;
}
.page-item a:hover {
	color: rgb(62, 64, 66);
	font-weight: 700;
	border: 0;
	outline: 0 none;
}
.flow-button {
	border: 0;
	outline: 0 none;
	background-color: white;
	width:32px;
	height:32px;
	padding:0px;
}
.flow-button:hover {
	border: 0;
	outline: 0 none;
	font-weight: 500;
	
}
.flow-button:focus {
	border: 0;
	outline: 0 none;			
}
.page-link:focus {
	border: 0;
	box-shadow: none;
	outline: 0 none;
 }
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
	
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 16px 0px 32px 32px;
}
.manager-content {
	margin: 0px;
}
.manage-no-page-span {
	color: rgb(220, 220, 220);	
	cursor: not-allowed;
	border: 0;
	outline 0 none;
}
				
	</style>
</head>

<body>

    <div class="wrapper">
        
        <!-- Sidebar
        <jsp:include page="sidebarAdmin.jsp" /> -->
		<jsp:include page="/admin/sidebarAdmin.jsp" />
        <!-- Page Content  -->
        <div id="content">

			<!-- Toolbar
            <jsp:include page="toolbarAdmin.jsp" /> -->
            <jsp:include page="/admin/toolbarAdmin.jsp" />
            <!--------------------------------------------------------------------------------------------------------------------------------------------------->
            <!---------------------------------------------------------------------- 관리화면 ---------------------------------------------------------------------->
            
            <!-- 모듈관리명 -->
			<div class="manager-title">
            	<h1>클래스 관리
            	<span class="manager-title-state">클래스 개수 : ${hobbyClassMap.hobbyClassTotalCount}개</span>
            	<span class="manager-title-state">심사 대기 : ${hobbyClassMap.hobbyClassJudgeWatingCount}개</span>
            	<span class="manager-title-state">수요조사 중 : ${hobbyClassMap.hobbyClassResearchingCount}개</span>
            	<span class="manager-title-state">수요조사 완료 : ${hobbyClassMap.hobbyClassResearchedCount}개</span>
            	<span class="manager-title-state">개강 중 : ${hobbyClassMap.hobbyClassOpenCount}개</span>
            	<span class="manager-title-state">종강 : ${hobbyClassMap.hobbyClassEndCount}개</span>
            	</h1>          	
            </div>
            
            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
            
            	<!-- 검색창 -->
	            <div class="manager-title-searchbar">
	            	<input type="text" name="searchbar-text" class="manager-title-search-input-box" placeholder="검색" value="">
	            	<svg width="24" height="24" class="SearchBox__SearchIcon-rplyxp-2 beZsar" viewBox="0 0 24 24">
		            	<path fill="#3e4042" fill-rule="evenodd" d="M15.593 14.54L20.5 19 19 20.5l-4.46-4.907a6.5 6.5 0 111.054-1.054zM10.5 15a4.5 4.5 0 100-9 4.5 4.5 0 000 9z" />
	            	</svg>	
	            </div>
	            
	            <div class="manage-search-menu-div-left-sort">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					  <button type="button" class="btn-outline-light manage-sort-button black-hover" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	진행상태
					    	<svg width="20" height="20" viewBox="0 0 24 28">
						    	<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" />
					    	</svg>
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">전체</a>
					    <a class="dropdown-item" href="#">심사 대기</a>
					    <a class="dropdown-item" href="#">수요조사 중</a>
					    <a class="dropdown-item" href="#">수요조사 완료</a>
					    <a class="dropdown-item" href="#">개강 중</a>
					    <a class="dropdown-item" href="#">종강</a>
					  </div>
					</div>				
		            
	            </div>
	            
            </div>
            
            
            <div class="manager-content">
	            <table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">진행상태</th>
				      <th scope="col">진행률</th>
				      <th scope="col">커버 이미지</th>
				      <th scope="col">클래스 제목</th>
				      <th scope="col">크리에이터</th>
				      <th scope="col">시작일</th>
				      <th scope="col">종료일</th>
				      <th scope="col">상세보기</th>				      
				      <th scope="col">심사</th>			      
				    </tr>
				  </thead>
				  <tbody class="hobbyClassAdmin-tbody">
				  
			  		
				  	
				    <c:set var="i" value="0" />
					<c:forEach var="hobbyClass" items="${hobbyClassMap.hobbyClass}">
					<c:set var="i" value="${i+1}" />
					
				    <tr class="hobbyClassAdmin">
				    
				      <input type="hidden" name="hobbyClassNoAdmin" value="${hobbyClass.hobbyClassNo}">
				      <!-- 번호 -->
				      <th scope="row" class="hobbyClassNoAdmin">${hobbyClass.hobbyClassNo}</th>
				      
				      <!-- 진행상태 -->				      
				      <td class="hobbyClassStateAdmin">
				      <c:if test="${hobbyClass.hobbyClassState == '3' }">
				      	<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">수요조사 중</div></button>    	
				      </c:if>
				      <c:if test="${hobbyClass.hobbyClassState == '1' || hobbyClass.hobbyClassState == '2' }">
				      	<button type="button" class="btn btn-dark" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">심사 대기</div></button>
				      </c:if>
				      <c:if test="${hobbyClass.hobbyClassState == '4' }">
				      	<button type="button" class="btn btn-dark" style="width:102px; height:20px; padding: 0px;"><div class="font">수요조사 완료</div></button>
				      </c:if>
				      <c:if test="${hobbyClass.hobbyClassState == '5' }">
				      	<button type="button" class="btn btn-dark" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">개강 중</div></button>
				      </c:if>
				      <c:if test="${hobbyClass.hobbyClassState == '6' }">
				      	<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">종강</div></button>
				      </c:if>
				      </td>		
				      
				      <!-- 진행률 -->
				      <!-- 수요조사 중 or 수요조사 완료 -->
				      <c:if test="${hobbyClass.hobbyClassState == '3' || hobbyClass.hobbyClassState == '4'}">
				      	<td class="hobbyClassProgressAdmin">${hobbyClass.hobbyClassPersonnel}/30명</td> <!-- 0강/45강 , 수요조사 중이면 몇명 신청했는지 등등 -->
				      </c:if>
				      <!-- 심사 중 or 심사 완료 -->
				      <c:if test="${hobbyClass.hobbyClassState == '1' || hobbyClass.hobbyClassState == '2'}">
				      	<td class="hobbyClassProgressAdmin">총 ${hobbyClass.lessonTotalCount}강</td> <!-- 0강/45강 , 수요조사 중이면 몇명 신청했는지 등등 -->
				      </c:if>
				      <!-- 종강 or 폐강 -->
				      <c:if test="${hobbyClass.hobbyClassState == '6' || hobbyClass.hobbyClassState == '7'}">
				      	<td class="hobbyClassProgressAdmin"></td> <!-- 0강/45강 , 수요조사 중이면 몇명 신청했는지 등등 -->
				      </c:if>
				      <!-- 개강 중 -->
				      <c:if test="${hobbyClass.hobbyClassState == '5'}">
				      	<td class="hobbyClassProgressAdmin">총 ${hobbyClass.lessonTotalCount}강</td> <!-- 0강/45강 , 수요조사 중이면 몇명 신청했는지 등등 -->
				      </c:if>
				      <!-- 커버 이미지 -->		 
				      <td class="hobbyClassImageAdmin"><img src="/images/hobbyclass/${hobbyClass.hobbyClassImage}" style="width:134px; height:100.5px;"></td>
				    
				      <!-- 클래스 제목 -->
				      <td class="hobbyClassNameAdmin">${hobbyClass.hobbyClassName}</td>
				      
				      <!-- 닉네임(이메일) -->
				      <td class="userIdAdmin">${hobbyClass.user.userId}</td>
				      
				      <!-- 시작날짜 -->
				      <td class="hobbyClassStartDateAdmin">${fn:substring( hobbyClass.startDate,0,4 ) }.${fn:substring( hobbyClass.startDate,5,7 ) }.${fn:substring( hobbyClass.startDate,8,10 ) }</td>
				      
				      <!-- 종료날짜 -->
				      <td class="hobbyClassEndDateAdmin">${fn:substring( hobbyClass.endDate,0,4 ) }.${fn:substring( hobbyClass.endDate,5,7 ) }.${fn:substring( hobbyClass.endDate,8,10 ) }</td>
				      
				      <!-- 상세보기 -->
				      <td>
				      	<button type="button" class="btn btn-dark" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">상세보기</div></button>
				      </td>    
				      
				      <!-- 심사 -->
				      <td class="judgeButton">
				      <c:if test="${hobbyClass.hobbyClassState == '1'}">
				      	<button type="button" class="btn btn-dark" style="background-color:#4267b2; border:0; outline: none; width:40px; height:24px; padding: 0px;"><div class="font">심사</div></button>
				      </c:if>
				      </td>    
				    </tr>
				    </c:forEach>
 
				  </tbody>
				</table>
				
				<!-- Pagination -->
					<jsp:include page="/admin/paginationAdmin.jsp" />
				
			</div>


            
        </div>
    </div>

   			<form id="hobbyClassForm">
		   		<input type="hidden" name="searchKeyword" value="">
		   		<input type="hidden" name="searchCondition" value="">
		   		<input type="hidden" name="category" value="">
		   		<input type="hidden" name="currentPage" value="${resultPage.currentPage}">
		   		<input type="hidden" name="maxPage" value="${resultPage.maxPage}">
		   	</form>

    <script type="text/javascript">
    
	    function numberFormat(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	    
	    function removeComma(str){
			n = parseInt(str.replace(/,/g,""));
			return n;
		}

		// 상세보기 이벤트
		$(document).on("click", "button:contains('상세보기')", function(){
			
			//var popupX = (window.screen.width / 2) - (1256 / 2); // OS 윈도우 가로 길이
			//var popupY= (window.screen.height / 2) - (684 / 2); // OS 윈도우 세로 길이
			
			window.open("/admin/getSaveHobbyClassAdmin?hobbyClassNo="+$(this).parent().parent().children("input[name='hobbyClassNoAdmin']").val(),
					'_blank','toolbar=no, location=no, status=no, menubar=no, directories=no' ); 

		});
	   
        $(function () {
        	
        	// 심사 버튼 이벤트
			/*
        	$(document).on("click", "button div:contains('심사')", function(){
					var yes = confirm("정말로 심사를 허가하시겠어요?");
					if( yes ){
		        		$.ajax(
			    				{
			    					url: "/admin/json/hobbyClass/saveCheckHobbyClassAdmin",
			    					method: "POST",
			    					data: JSON.stringify({
										hobbyClassNo: $(this).parent().parent().parent().children("input[name='hobbyClassNoAdmin']").val()
			    					}),
			    					dataType : "json" ,
		        					headers : {
		        						"Accept" : "application/json" ,
		        						"Content-Type" : "application/json"
		        					} ,
			    					success : function(JSONData, status) {
										if( JSONData == 1 ){
											$("#hobbyClassForm").children("input[name='currentPage']").val(1);
			    							$("#hobbyClassForm").children("input[name='searchCondition']").val('');
			    							$("#hobbyClassForm").children("input[name='searchKeyword']").val('');
			    							$("#hobbyClassForm").children("input[name='category']").val('');
											hobbyClassAdminAjax();
										}
	
			    					}
		        					
		   				});//end of ajax
					}
        	});
        	*/
        	$(document).on("click", "button div:contains('심사')", function(){
        		var hobbyClassNo = $(this).parent().parent().parent().children("input[name='hobbyClassNoAdmin']").val();
        		
        		Swal.mixin({
        			icon : 'question', 
        			showCancelButton : false, 
        			showConfirmButton : false, 
        			allowOutsideClick : true, 
        			progressSteps : ['1', '2']
        		}).queue([
        			{
        				title : '<span class="first-title">클래스 심사</span>',
        				html : '<br/><br/>' + 
        				'<span class="first-queue-test">해당 클래스 심사를 허가하시겠어요?</span>' + 
        				'<br/><br/>' + 
        				'<button type="button" class="btn btn-secondary swal-first-next-button mr-5">다음</button>' + 
        				'<button type="button" class="btn btn-secondary swal-first-cancel-button">취소</button>'
        			},
        			{
        				icon : 'info', 
        				title : '<span class="second-title">동영상 인코딩</span>',
        				html : 	'<br/><br/>' + 
        						'<span class="second-queue-test">동영상 인코딩 중입니다...</span>' + 
        						'<br/>' + 
        						'<span class="second-queue-test">잠시만 기다려 주세요.</span>',
						showLoaderOnConfirm : true, 
						preConfirm : () => {
							
						}
        			}
        		])
        		
        	});
        	
        	$(document).on('click', '.swal-first-next-button', function(){
    			Swal.clickConfirm();
    		})
    		
    		$(document).on('click', '.swal-first-cancel-button', function(){
    			Swal.clickCancel();
    		})
        	
        	
        	// 페이지네이션 이벤트
            $(document).on("click", ".manage-pagination", function(){
	            	$("#hobbyClassForm").children("input[name='currentPage']").val( $(this).text().trim() );
	            	
	            	hobbyClassAdminAjax();
	            	
            });
            
            // 페이지 이전 이벤트
            $(document).on("click", ".forward-button", function(){
            	
            	if( $("#hobbyClassForm").children("input[name='currentPage']").val() == 1){
            		$("#hobbyClassForm").children("input[name='currentPage']").val(1);
            	}else{
            		$("#hobbyClassForm").children("input[name='currentPage']").val( Number( $("#hobbyClassForm").children("input[name='currentPage']").val() ) -Number(1) );            		
            		
            	}
            	hobbyClassAdminAjax();
            });
            
            // 페이지 다음 이벤트
            $(document).on("click", ".backward-button", function(){
            	
           		if( $("#hobbyClassForm").children("input[name='currentPage']").val() == $("#hobbyClassForm").children("input[name='maxPage']").val() ){
               		$("#hobbyClassForm").children("input[name='currentPage']").val( $("#hobbyClassForm").children("input[name='maxPage']").val() );

            	}else{
            		$("#hobbyClassForm").children("input[name='currentPage']").val( Number( $("#hobbyClassForm").children("input[name='currentPage']").val() ) +Number(1) );
            		
            	}
           		hobbyClassAdminAjax();
	        });

            // 정렬 버튼 이벤트 // ++
            $(document).on("click", ".dropdown-item", function(){
            	$(".manage-sort-button").html( $(this).text() + ' <svg width="20" height="20" viewBox="0 0 24 28"><path fill="#ff922b" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
            	$(".manage-sort-button").css("color","rgb(255, 146, 43)");
            	
            	$("#hobbyClassForm").children("input[name='currentPage']").val(1);

            	
            	if( $("#hobbyClassForm").children("input[name='searchCondition']").val() == 'all'
       				&& $("#hobbyClassForm").children("input[name='searchKeyword']").val() != ''
       				&& $("#hobbyClassForm").children("input[name='searchKeyword']").val() != null){
       	
            	}else if( $(this).text().trim() == '전체' ){
            		
            	}else{
            		$("#hobbyClassForm").children("input[name='searchCondition']").val("hobbyClassState");
            	}
            	
            	if( $("#hobbyClassForm").children("input[name='searchCondition']").val() == 'all'
    				&& $("#hobbyClassForm").children("input[name='searchKeyword']").val() != ''
    				&& $("#hobbyClassForm").children("input[name='searchKeyword']").val() != null){
        	       	
            		if( $(this).text().trim() == '심사 대기' ){
	            		$("#hobbyClassForm").children("input[name='category']").val("1");
	            	}else if( $(this).text().trim() == '수요조사 중' ){
	            		$("#hobbyClassForm").children("input[name='category']").val("3");
	            	}else if( $(this).text().trim() == '수요조사 완료' ){
	            		$("#hobbyClassForm").children("input[name='category']").val("4");
	            	}
	            	else if( $(this).text().trim() == '개강 중' ){
	            		$("#hobbyClassForm").children("input[name='category']").val("5");
	            	}
	            	else if( $(this).text().trim() == '종강' ){
	            		$("#hobbyClassForm").children("input[name='category']").val("6");
	            	}else{
	            		$("#hobbyClassForm").children("input[name='category']").val("");
	            	}
            		
            		
	       		 }else{
	       			if( $(this).text().trim() == '심사 대기' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("1");
	            	}else if( $(this).text().trim() == '수요조사 중' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("3");
	            	}else if( $(this).text().trim() == '수요조사 완료' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("4");
	            	}
	            	else if( $(this).text().trim() == '개강 중' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("5");
	            	}
	            	else if( $(this).text().trim() == '종강' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("6");
	            	}else if( $(this).text().trim() == '전체' ){
	            		$("#hobbyClassForm").children("input[name='searchKeyword']").val("");
	            		$("#hobbyClassForm").children("input[name='searchCondition']").val("");
	            	}
	       		 }

            	hobbyClassAdminAjax();

        });//end of function
            
            // 검색창 엔터 이벤트
            $(document).on("keydown", ".manager-title-search-input-box", function(key){
    			if(key.keyCode == 13){    				
    				
    				$("#hobbyClassForm").children("input[name='currentPage']").val(1);
    				$("#hobbyClassForm").children("input[name='searchCondition']").val("all");
    				$("#hobbyClassForm").children("input[name='searchKeyword']").val( $(this).val() );
    				
    				hobbyClassAdminAjax();
    				
    			}//end of if
    		});//end of function
            
            // 검색창 돋보기 클릭 이벤트
            $(document).on("click", ".manager-title-searchbar svg", function(){            	
            	
            	$("#hobbyClassForm").children("input[name='currentPage']").val(1);
            	$("#hobbyClassForm").children("input[name='searchCondition']").val("all");
            	$("#hobbyClassForm").children("input[name='searchKeyword']").val( $(".manager-title-search-input-box").val() );
            	
            	hobbyClassAdminAjax();
            });
    		
    		$(document).on("focusout", ".manager-title-search-input-box", function(){
    			
    				$("#hobbyClassForm").children("input[name='searchKeyword']").val( $(this).val() );
    			
    		});
    		
    		function hobbyClassAdminAjax(){
    			
    			$.ajax(
	    				{
	    					url: "/admin/json/hobbyClass/getHobbyClassListAdmin",
	    					method: "POST",
	    					data: JSON.stringify({
	    							currentPage: $("#hobbyClassForm").children("input[name='currentPage']").val(),
	    							searchCondition: $("#hobbyClassForm").children("input[name='searchCondition']").val(),
	    							searchKeyword: $("#hobbyClassForm").children("input[name='searchKeyword']").val(),
	    							category: $("#hobbyClassForm").children("input[name='category']").val()
	    						}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						var displayValue = "";
	    					
								for(var i=0; i<JSONData.hobbyClass.length; i++){
									
									displayValue += '<tr class="hobbyClassAdmin">' +
												'<input type="hidden" name="hobbyClassNoAdmin" value="'+JSONData.hobbyClass[i].hobbyClassNo+'">' +
												'<th scope="row" class="hobbyClassNoAdmin">'+JSONData.hobbyClass[i].hobbyClassNo+'</th>' +
												'<td class="hobbyClassStateAdmin">';
												if( JSONData.hobbyClass[i].hobbyClassState == '1' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">심사 대기</div></button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '2' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">심사 대기</div></button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '3' ){
													displayValue += '<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">수요조사 중</div></button>';
													
												}else if( JSONData.hobbyClass[i].hobbyClassState == '4' ){
													displayValue += '<button type="button" class="btn btn-dark" style="width:102px; height:20px; padding: 0px;"><div class="font">수요조사 완료</div></button>';
													
												}else if( JSONData.hobbyClass[i].hobbyClassState == '5' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">개강 중</div></button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '6' ){
													displayValue += '<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">종강</div></button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '7' ){
													displayValue += '<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">종강</div></button>';
												}
												
												
									displayValue +=	'</td>';
												  
												  if( JSONData.hobbyClass[i].hobbyClassState == '3' || JSONData.hobbyClass[i].hobbyClassState == '4' ){
													  displayValue += '<td class="hobbyClassProgressAdmin">'+JSONData.hobbyClass[i].hobbyClassPersonnel+'/30명</td>';
												  }else if( JSONData.hobbyClass[i].hobbyClassState == '1' || JSONData.hobbyClass[i].hobbyClassState == '2' ){
													  displayValue += '<td class="hobbyClassProgressAdmin">총 '+JSONData.hobbyClass[i].lessonTotalCount+'강</td>';
												  }else if( JSONData.hobbyClass[i].hobbyClassState == '6' || JSONData.hobbyClass[i].hobbyClassState == '7' ){
													  displayValue += '<td class="hobbyClassProgressAdmin"></td>';
												  }else if( JSONData.hobbyClass[i].hobbyClassState == '5' ){
													  displayValue += '<td class="hobbyClassProgressAdmin">총 '+JSONData.hobbyClass[i].lessonTotalCount+'강</td>';
												  }									
									displayValue += '<td class="hobbyClassImageAdmin"><img src="/images/hobbyclass/'+JSONData.hobbyClass[i].hobbyClassImage+'" style="width:134px; height:100.5px;"></td>' +
												'<td class="hobbyClassNameAdmin">'+JSONData.hobbyClass[i].hobbyClassName;
									displayValue +=	'</td>' +
												'<td class="userIdAdmin">'+JSONData.hobbyClass[i].user.userId+'</td>' +
												'<td class="hobbyClassStartDateAdmin">'+JSONData.hobbyClass[i].startDate.substring(0,4) + '.'
																				+JSONData.hobbyClass[i].startDate.substring(5,7) + '.'
																				+JSONData.hobbyClass[i].startDate.substring(8,10) +
												'</td>' +
												'<td class="hobbyClassEndDateAdmin">';
												if( JSONData.hobbyClass[i].endDate != null ){
													displayValue += JSONData.hobbyClass[i].endDate.substring(0,4) + '.'
																	+ JSONData.hobbyClass[i].endDate.substring(5,7) + '.'
																	+ JSONData.hobbyClass[i].endDate.substring(8,10);
												}
									displayValue +=	'</td>' +
												'<td>' +
												'<button type="button" class="btn btn-dark" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">상세보기</div></button>' +
												'</td>' +
												'<td class="judgeButton">';
												if( JSONData.hobbyClass[i].hobbyClassState == '1'){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:#4267b2; border:0; outline: none; width:40px; height:24px; padding: 0px;"><div class="font">심사</div></button>';
												}
												'</td>' +
												'</tr>';
								}//end of for	
								paginationDisplayValue = '<li class="page-item">';
														if( JSONData.resultPage.currentPage > JSONData.resultPage.pageUnit ){
															paginationDisplayValue += '<a class="page-link" href="#" aria-label="Previous">' +
																					'<span aria-hidden="true">' +
																					'&lt;' +
																					'</span>' +
																					'</a>';
														}else if( JSONData.resultPage.currentPage <= JSONData.resultPage.pageUnit ){
															paginationDisplayValue += '<a class="page-link" aria-label="Previous">' +
																					'<span aria-hidden="true" class="manage-no-page-span">' +
																					'&lt;' +
																					'</span>' +
																					'</a>';
														}
								paginationDisplayValue += '</li>';
														for(var i=JSONData.resultPage.beginUnitPage; i<=JSONData.resultPage.endUnitPage; i++){
															paginationDisplayValue += '<li class="page-item"><a class="page-link manage-pagination" href="#">'+i+'</a></li>';
														}
														if( JSONData.resultPage.endUnitPage < JSONData.resultPage.maxPage ){
															paginationDisplayValue += '<a class="page-link" href="#" aria-label="Next">' +
																					'<span aria-hidden="true">' +
																					'&gt;' +
																					'</span>' +
																					'</a>';
														}else if( JSONData.resultPage.endUnitPage >= JSONData.resultPage.maxPage ){
															paginationDisplayValue += '<a class="page-link" aria-label="Next" style="border:0; outline:0 none;">' +
																					'<span aria-hidden="true" class="manage-no-page-span">' +
																					'&gt;' +
																					'</span>' +
																					'</a>';
														}
								paginationDisplayValue += '</li>';		
								
								$(".hobbyClassAdmin-tbody").html(displayValue);
								$(".pagination").html(paginationDisplayValue);
								$("#hobbyClassForm").children("input[name='maxPage']").val( JSONData.resultPage.maxPage );
	    					}//end of call back method
	   					
	    		});//end of ajax
    		}
            
            
            
            ////////////////////////////////////////////////////////////
            //////////////////// sidebar event /////////////////////////
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
			////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////
			
        	 // 한개 선택 이벤트
            $(document).on("click", ".select-box", function(){
 
            	if( $(this).find("input").is(":checked") == false ) {            		
	            	$(this).find("svg").children("path").remove();	           	
	            	$(this).find("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');	            	
	            	$(this).find("input").attr("checked", true);
	            	
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
            
         	// 수정 버튼 클릭 이벤트
            $(".update-event-div").on("click", function(){
            	
            	// 체크박스 ( checked == true ) 잡는 이벤트
	            $("input[name='check-status']:checked").each(function(){
	            	// 원하는 로직 작성 하는 곳
	            });
	            
            });
            
        });
    </script>
</body>

</html>