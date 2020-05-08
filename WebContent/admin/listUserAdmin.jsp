<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- //2020-02-19 Git Commit --%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="/resources/css/commonAdmin.css">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	 <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
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
	width:120px;	
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
 .page-link {
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
<form id="userlistSend" >
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
            	<h1>회원 관리
            	<span class="manager-title-state">총 회원 : ${allUserCount}명</span>
            	<span class="manager-title-state">총 일반회원 : ${userCount}명</span>
            	<span class="manager-title-state">총 크리에이터 회원 : ${creatorCount}명</span>
            	<span class="manager-title-state">총 정지 회원 : ${stopUserCount}명</span>
            	<span class="manager-title-state">총 탈퇴 회원 : ${retireUserCount}명</span>
            	</h1>          	
            </div>
            
            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
            	<!-- 검색창 -->
	            <div class="manager-title-searchbar" style="margin-left: 800px;height: 40px;width: 250px;border: 1px solid #ced4da;">
	            	<input type="text" id="searchKeyword" name="searchKeyword" class="manager-title-search-input-box" placeholder="아이디 검색" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
	            	<svg width="30" height="30" class="SearchBox__SearchIcon-rplyxp-2 beZsar" viewBox="0 0 24 24" style="border-right-width: 20px;margin-right: 0px;width: 30px;height: 30px;">
		            	<path fill="#3e4042" fill-rule="evenodd" d="M15.593 14.54L20.5 19 19 20.5l-4.46-4.907a6.5 6.5 0 111.054-1.054zM10.5 15a4.5 4.5 0 100-9 4.5 4.5 0 000 9z" />
	            	</svg>	
	            </div>
	               <input type="hidden" id="currentPage" name="currentPage" value=""/>
	            <div class="manage-search-menu-div-left-sort" style="width: 300px;">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					     <div>					     
					     <select id="searchCondition" class="form-control cvzQqA" name="searchCondition" style="height: 41px;margin-left: 10px;background-color: #fafafa;">
						<option  selected disabled>회원자격</option>
						<option value="3" ${ ! empty search.searchCondition && search.searchCondition eq '3' ? "selected" : "" }>전체</option>
						<option  value="0" ${ ! empty search.searchCondition && search.searchCondition eq '0' ? "selected" : "" }>일반 회원</option>
						<option  value="1" ${ ! empty search.searchCondition && search.searchCondition eq '1' ? "selected" : "" }>크리에이터 회원</option>
						<option  value="2" ${ ! empty search.searchCondition && search.searchCondition eq '2' ? "selected" : "" }>관리자</option>
						<option  value="8" ${ ! empty search.searchCondition && search.searchCondition eq '8' ? "selected" : "" }>정지 회원</option>
						<option  value="9" ${ ! empty search.searchCondition && search.searchCondition eq '9' ? "selected" : "" }>탈퇴 회원</option>
						
						</select>
					  </div> 
					 
					</div>				
		            
	            </div>
	            
            </div>
            
            
            <div class="manager-content">
	            <table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">아이디(이메일)</th>
				      <th scope="col">이름</th>
				      <th scope="col">생년월일</th>
				      <th scope="col">회원자격</th>
				      <th scope="col">가입 날짜</th>
				      <th scope="col">정지 날짜</th>
				      <th scope="col">탈퇴 날짜</th>
				      <th scope="col">상태변경</th>				      
				    </tr>
				  </thead>
				  <tbody class="purchaseAdmin-tbody">
				  
			  		
				  	
				    <c:set var="i" value="0" />
					<c:forEach var="user" items="${userList}">
					<c:set var="i" value="${i+1}" />
					
				    <tr class="bg-basic">
				    
				      
				      <!-- 번호 -->
				      <td scope="row" class="purchaseIdAdmin" style="width: 64px">${i}</td>
				      
				      <!-- 유저 아이디 -->				      
				      <td class="userIdInfo" style="cursor: pointer;" style="width: 274px;"><input type="hidden" name="userId" value="${user.userId}">${user.userId}</td> 
				      
				      
				      <!-- 이름 -->
				      <td class="userNameInfo" style="width: 109px;">${user.name}</td>
				      
				      <!-- 생년월일 -->		 
				      <td class="userBirthInfo" style="width: 104px;">${fn:substring( user.birth,0,4 ) }.${fn:substring( user.birth,4,6 ) }.${fn:substring( user.birth,6,8 ) }</td>
				       <!-- 회원 자격 -->
				      <td class="userRoleInfo" style="width: 154px;">
				      <c:if test="${user.role == '0'}">일반 회원</c:if>
				      <c:if test="${user.role == '1'}">크리에이터 회원</c:if>
				       <c:if test="${user.role == '2'}">관리자</c:if>
				       <c:if test="${user.role == '8'}">정지 회원</c:if>
				       <c:if test="${user.role == '9'}">탈퇴 회원</c:if>
				       </td>
				      <!-- 가입 날짜 -->
				      <td class="addUserInfo" style="width: 129px;"><fmt:formatDate value="${user.addDate}" pattern="yyyy-MM-dd"/></td>
				      
				      <!-- 정지 날짜 -->
				      <td class="stopUserInfo" style="width: 129px;"><fmt:formatDate value="${user.stopDate}" pattern="yyyy-MM-dd"/></td>
				      
				      <!-- 탈퇴 날짜 -->
				      <td class="retireUserInfo" style="width: 129px;"><fmt:formatDate value="${user.retireDate}" pattern="yyyy-MM-dd"/></td>
				      
				      <!-- 상태 변경 -->
				      
				      <td class="addstopUser" style="font-size: 25px;width: 234px;">
				       <input type="hidden" id="secondUserId" value="${user.userId}">
				      <span id="doStopUser" > <i class="fas fa-user-times" style="cursor: pointer;"></i></span>&nbsp;&nbsp;
				      <span id="doRemoveStopUser"><i class="fas fa-user" style="cursor: pointer;"></i></span>&nbsp;&nbsp;
				      <i id="doRetireUser" class="fas fa-user-minus" style="cursor: pointer;"></i>&nbsp;&nbsp;
				      <i id="doRemoveRetireUser" class="fas fa-user-plus" style="cursor: pointer;"></i>
				      </td>
				  
				    </tr>	
				    					    
				    </c:forEach> 					
				  </tbody>
				</table>
				
				<!-- Pagination -->
					<jsp:include page="/common/pagenation.jsp"/>
				
			</div>


            
        </div>
    </div>

</form>

    <script type="text/javascript">
    
    
    
   function fncGetBoardArticleList(currentPage) {
	   $("#currentPage").val(currentPage);
	   $("form#userlistSend").attr("method","post").attr("action","/admin/user/listUserAdmin").submit();
   }
	   $(function(){
		  /////////// 유저 정보 상세 보기    //////
		   $(".userIdInfo").on("click", function(){
			  
			   self.location="/user/getUser?userId="+$(this).children("input[name='userId']").val();	
			   
		   });		  
		 //////////////////////////////////
			
		 $("#searchKeyword").on("keydown", function(key) {
			if (key.keyCode == 13) {
				fncGetBoardArticleList(1);
			}
		});
		 	
		///////////////////////컨디션 검색/////
		 $("#searchCondition").change("click",function(){
			 var searchCondition = $("select[name=searchCondition]").val();
			 fncGetBoardArticleList(1);
			 
		 }); 
		 //////////////////////키워드 검색////////
		 $(".SearchBox__SearchIcon-rplyxp-2.beZsar").on("click",function(){
			 var searchKeyword = $("input[name='searchKeyword']").val();
			 fncGetBoardArticleList(1);
		 });
		 
		 $(document).on("click","#doStopUser",function(){
			 Swal.fire({
				  title: '정말 정지 시키겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네, 정지 시키겠습니다',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire({
			    	  icon: 'success',
					  title: '정지 완료',
					  showConfirmButton: false,
					  timer : 800
				    }).then((result) => {
							self.location = "/admin/user/doUser?code=1&userId="+$(this).siblings("#secondUserId").val();
				    })
				  }
				})
		 });
		 $(document).on("click","#doRemoveStopUser",function(){
			 Swal.fire({
				  title: '정지 해제 할까요?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네, 정지 해제 하겠습니다',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire({
			    	  icon: 'success',
					  title: '정지 해제 ',
					  showConfirmButton: false,
					  timer : 800
				    }).then((result) => {
							 self.location = "/admin/user/doUser?code=2&userId="+$(this).siblings("#secondUserId").val();
				    })
				  }
				})
		 });
		 $(document).on("click","#doRetireUser",function(){
			 Swal.fire({
				  title: '정말 탈퇴 시키겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네, 탈퇴 시키겠습니다',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire({
			    	  icon: 'success',
					  title: '탈퇴 완료',
					  showConfirmButton: false,
					  timer : 800
				    }).then((result) => {
			 			self.location = "/admin/user/doUser?code=3&userId="+$(this).siblings("#secondUserId").val();
				    })
				  }
				})
				    
		 });
		 $(document).on("click","#doRemoveRetireUser",function(){
			 Swal.fire({
				  title: '탈퇴 해제 할까요?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네, 탈퇴 해제 하겠습니다',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire({
			    	  icon: 'success',
					  title: '탈퇴 해제 ',
					  showConfirmButton: false,
					  timer : 800
				    }).then((result) => {
							 self.location = "/admin/user/doUser?code=4&userId="+$(this).siblings("#secondUserId").val();
				    })
				  }
				})
 		 });
   });
	   
	  
    </script>
</body>

</html>