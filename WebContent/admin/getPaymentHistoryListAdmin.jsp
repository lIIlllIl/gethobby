<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- //2020-02-21 Git Commit --%>
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


		<!-- select2 cdn -->
	<link
		href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"
		rel="stylesheet" />
	<script
		src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/sol/delivery.css">

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
<input type="hidden" name="purchaseId2" value=""/>
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
            	<h1>구매 관리
            	<span class="manager-title-state">구매 개수 : ${purchaseMap.purchaseTotalCount}개</span>
            	<span class="manager-title-state">구매 완료 : ${purchaseMap.purchasePaymentCount}개</span>
            	<span class="manager-title-state">환불 : ${purchaseMap.purchaseRefundCount}개</span>
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
					    <a class="dropdown-item" href="#">구매 완료</a>
					    <a class="dropdown-item" href="#">발송 완료</a>
					    <!-- <a class="dropdown-item" href="#">배송 완료</a> -->
					    <a class="dropdown-item" href="#">환불 대기</a>
					    <a class="dropdown-item" href="#">환불 완료</a>
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
				      <th scope="col">구매상품</th>
				      <th scope="col">결제금액</th>
				      <th scope="col">결제수단</th>
				      <th scope="col">아이디</th>
				      <th scope="col">구매날짜</th>
				      <th scope="col">환불날짜</th>
				      <th scope="col">배송정보</th>				      
				      <th scope="col">환불</th>				      
				    </tr>
				  </thead>
				  <tbody class="purchaseAdmin-tbody">
				  
			  		
				  	
				    <c:set var="i" value="0" />
					<c:forEach var="purchase" items="${purchaseMap.purchase}">
					<c:set var="i" value="${i+1}" />
					
				    <tr class="purchaseAdmin">
				    
				      <input type="hidden" name="hobbyClassNoAdmin" value="${purchase.hobbyClass.hobbyClassNo}">
				      <input type="hidden" name="purchaseId" value="${purchase.purchaseId}"/>
				      <!-- 번호 -->
				      <th scope="row" class="purchaseIdAdmin">${fn:substring( purchase.purchaseId,4,16 ) }</th>
				      
				      <!-- 진행상태 -->				      
				      <td class="purchaseStateAdmin">
				      <c:if test="${purchase.purchaseState == '0' }">
				      	<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">구매 완료</div></button>    	
				      </c:if>
				      <c:if test="${purchase.purchaseState == '1' }">
				      	<button type="button" class="btn btn-success" style="border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">발송 완료</div></button>
				      </c:if>
				      <c:if test="${purchase.purchaseState == '2' }">
				      	<button type="button" class="btn btn-success" style="border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">발송 완료</div></button>
				      </c:if>
				      <c:if test="${purchase.purchaseState == '3' }">
				      	<button type="button" class="btn btn-dark" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">환불 대기</div></button>
				      </c:if>
				      <c:if test="${purchase.purchaseState == '4' }">
				      	<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">환불 완료</div></button>
				      </c:if>
				      </td>		
				      
				      <!-- 구매상품 --> 
				      <c:if test="${purchase.componentOption == '1'}">
				      	<td class="componentOptionAdmin">${purchase.hobbyClass.kitName}</td>
				      </c:if>
				      <c:if test="${purchase.componentOption == '0'}">
				      	<td class="componentOptionAdmin">15주 수강권</td>
				      </c:if>
				      
				      <!-- 결제금액 -->		 
				      <td class="priceAdmin"><fmt:formatNumber value="${purchase.purchasePrice}" pattern="#,###" />원</td>
				      
				      <!-- 결제수단 -->
				      <td class="payMethodAdmin">
				      <c:if test="${purchase.payMethod == '0' }">
				          카드
				      </c:if>
				      <c:if test="${purchase.payMethod == '1' }">
				          휴대폰
				      </c:if>
				      </td>
				      
				      <!-- 아이디 -->
				      <td class="userIdAdmin">${purchase.user.userId}</td>
				      
				      <!-- 구매날짜 -->
				      <td class="purchaseDateAdmin">${fn:substring( purchase.purchaseDate,0,4 ) }.${fn:substring( purchase.purchaseDate,5,7 ) }.${fn:substring( purchase.purchaseDate,8,10 ) }</td>
				      
				      <!-- 환불날짜 -->
				      <td class="refundDateAdmin">
				      <c:if test="${!empty purchase.refundDate}">
				      	${fn:substring( purchase.refundDate,0,4 ) }.${fn:substring( purchase.refundDate,5,7 ) }.${fn:substring( purchase.refundDate,8,10 ) }
				      </c:if>
				      </td>
				      
				      <!-- 배송정보 -->
				      <td class="deliveryStateAdmin">

						  <!-- 발송 완료일 경우  / 배송 조회-->
				      	  <c:if test="${purchase.componentOption == '1' && (purchase.purchaseState == '1' || purchase.purchaseState == '2')}">
					      <button type="button" class="btn btn-dark"  data-toggle="modal" data-target="#delivery-info-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button>
					      </c:if>
					      
					      <!-- 구매 완료일 경우 / 운송장 입력 -->
					      <c:if test="${purchase.componentOption == '1' && purchase.purchaseState == '0'}">
					      <button type="button" class="btn btn-dark sol-btn-delivery"  data-toggle="modal" data-target="#delivery-modal"  style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">운송장 입력</div></button>
					      </c:if>

				      </td>    
				      
				      <!-- 환불 -->
				      <td class="refundButton">			      
					      <c:if test="${purchase.purchaseState == '1' or purchase.purchaseState == '2' or purchase.purchaseState == '4'}">
					      	<button type="button" class="btn btn-dark" style="background-color:#8496BA; border:0; outline: none; width:40px; height:24px; padding: 0px; cursor:not-allowed;"><div class="font">환불</div></button>
					      </c:if>
					      <c:if test="${purchase.purchaseState == '0' or purchase.purchaseState == '3'}">
					      	<button type="button" class="btn btn-dark" style="background-color:#4267b2; border:0; outline: none; width:40px; height:24px; padding: 0px;"><div class="font">환불</div></button>
					      </c:if>
				      </td>    
				    </tr>
				    </c:forEach>
 
				  </tbody>
				</table>

				<!-- Modal -->
				<div class="modal fade" id="delivery-modal" tabindex="-1"
					role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="delivery-modal">운송장 정보 입력</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<form id="sol-delivery-info">
									<input type="hidden" name="purchaseId" value="" />
									<div class="form-group mb-5">
										<label for="dlvyCompany">택배회사</label> <select
											class="custom-select" style="width: 100%" id="dlvyCompany"
											name="dlvyCompany">
											<option value="" disabled selected hidden></option>
											<c:set var="i" value="0" />
											<c:forEach var="list" items="${companyListMap}">
												<c:set var="i" value="${i+1}" />
												<option value="${ list.Code }">${ list.Name }</option>
											</c:forEach>
										</select> <small id="emailHelp" class="form-text text-muted">현재
											국내택배(25개사)와 국제택배(17사)의 목록을 제공하고있습니다.</small>
									</div>
									<div class="form-group">
										<label for="trackingNo">운송장번호</label> <input type="text"
											class="form-control" id="trackingNo" name="trackingNo">
									</div>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-outline-warning">입력</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end Modal -->
				
				
				<!-- Modal -->
				<div class="modal fade" id="delivery-info-modal" tabindex="-1" role="dialog">
			        <div class="modal-dialog" role="document">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <h5 class="modal-title">배송정보 조회</h5>
			                    <button type="button" class="close" data-dismiss="modal">
			                        <span>&times;</span>
			                    </button>
			                </div>
			                <div class="modal-body my-3">
			                   <!-- <div class="row mx-1 mb-4 bg-light">
			                        <small class="text-muted col-3 text-left">배송물품</small>
			                        <div class="col-9"></div>                   
			                   </div> -->
			                    <table class="table table-borderless table-sm ">
			                        <thead>
			                            <tr class="bg-warning">
			                                <td scope="col" style="width: 30%">배송물품</td>
			                                <th scope="col" style="width: 70%" id="sol-delivery-kit"></th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr>
			                                <td>운송장번호</td>
			                                <th scope="row" id="sol-trackingNo" ></th>
			                            </tr>
			                            <tr>
			                                <td>배송업체</td>
			                                <th scope="row" id="sol-dlvyCompany"></th>
			                            </tr>
			                            <tr>
			                                <td>배송기사</td>
			                                <th scope="row" id="sol-deliverName"></th>
			                            </tr>
			                            <tr>
			                                <td>받는 사람</td>
			                                <th scope="row" id="sol-receiverName"></th>
			                            </tr>
			                            <tr>
			                                <td>보낸 사람</td>
			                                <th scope="row">Get취미</th>
			                            </tr>
			                            <tr>
			                                <td>우편주소</td>
			                                <th scope="row" id="sol-postcode"></th>
			                            </tr>
			                            <tr>
			                                <td>수령 주소</td>
			                                <th scope="row" id="sol-address"></th>
			                            </tr>
			                        </tbody>
			                    </table>
			
			
			
			
			                    <table class="table table-striped">
			                        <thead>
			                            <tr class="border-bottom border-top">
			                                <th scope="col">시간</th>
			                                <th scope="col">현재위치</th>
			                                <th scope="col">배송 상태</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            
			                        </tbody>
			                    </table>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">확인</button>
			                </div>
			            </div>
			        </div>
			    </div>
				<!-- end Modal -->
				
				
				
				
				
				


				<!-- Pagination -->
					<jsp:include page="/admin/paginationAdmin.jsp" />
				
			</div>


            
        </div>
    </div>

   			<form id="purchaseForm">
		   		<input type="hidden" name="searchKeyword" value="">
		   		<input type="hidden" name="searchCondition" value="">
		   		<input type="hidden" name="category" value="">
		   		<input type="hidden" name="currentPage" value="${resultPage.currentPage}">
		   		<input type="hidden" name="maxPage" value="${resultPage.maxPage}">
		   	</form>

    <script type="text/javascript">
    
    
	    //////////////////////////////////////// 운송장 입력 ////////////////////////////////////////
	    function fncAddDeliveryInfo(){
	    	
	    	var purchaseId = $("input[name='purchaseId2']").val();
	    	var dlvyCompany =$("select[name='dlvyCompany']").val();
	    	var trackingNo = $("input[name='trackingNo']").val();
	    	
	    	if(dlvyCompany == null){
	    		alert("택배회사를 선택해주세요.")
	    		return false;
	    	}
	    	 if(trackingNo == null || trackingNo == ""){
	    		alert("운송장번호를 입력해주세요.")
	    		return false;
	    	}
	    	 
	    	 
	    	 var idx = 0;
	    	 
	    	 $( "tr" ).each(function( index ) {

    		  	if( $(this).find("input[name='purchaseId']").val() == purchaseId ) {
	   	    		 
    		  		//console.log(">>>>>" + index);
    		  		$tr = $(this).html()
    		  		idx = index;
	   	    		 return idx;
	   	    	 }
    		 });

		    
		    console.log(purchaseId);
		    console.log(dlvyCompany);
		    console.log(trackingNo);
		    
	    	$.ajax({
    					url: "/admin/json/purchase/addDeliveryInfo",
    					method: "POST",
    					data: JSON.stringify({
    							purchaseId: purchaseId,
    							dlvyCompany: dlvyCompany,
    							trackingNo: trackingNo
    					}),
    					dataType : "json" ,
       					headers : {
       						"Accept" : "application/json" ,
       						"Content-Type" : "application/json"
       					} ,
    					success : function(JSONData, status) {
    						
    						 $("tr").eq(idx).find(".purchaseStateAdmin").html('<button type="button" class="btn btn-success" style="border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">발송 완료</div></button>');
    				    	 $("tr").eq(idx).find(".deliveryStateAdmin").html('<button type="button" class="btn btn-dark" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button>');
    				    	 $("tr").eq(idx).find(".refundButton").html('<button type="button" class="btn btn-dark" style="background-color:#8496BA; border:0; outline: none; width:40px; height:24px; padding: 0px; cursor:not-allowed;"><div class="font">환불 </div></button>');


    					}
			        					
			});  //end of ajax
	    	
	    	$('#delivery-modal').modal('hide');
	    }
	    
	    
	    
    	$(function() {
    		
    		$('#delivery-modal').on('hidden.bs.modal', function (e) {
                console.log('modal close');
                $('#delivery-modal #sol-delivery-info')[0].reset();
                $("#delivery-modal .modal-body #dlvyCompany").select2('val', '[]');
            });
    		
    		$("#delivery-modal .modal-body #dlvyCompany").select2({
    			placeholder : "택배회사를 선택해주세요",
    			language : "kr",
    			allowClear : true,
    			selectOnClose : true,
    			language : {
    				noResults : function() {
    					return "찾을 수 없습니다. 다시 검색해주세요.";
    				}
    			}
    		});
    		
    		$("button.btn-outline-warning").on("click", function(){

    			fncAddDeliveryInfo();
    		});


    		$(document).on("click", ".sol-btn-delivery", function(){

    			var purchaseId = $(this).parents('tr').find('input[name="purchaseId"]').val();
    			//console.log(purchaseId);
    			$("#delivery-modal .modal-body input[name='purchaseId']").val(purchaseId);
    			console.log($("#delivery-modal .modal-body input[name='purchaseId']").val());
    			
    			$("input[name='purchaseId2']").val(purchaseId);
    		});
    		
    		
    		
    		
    		$(document).on("click", "button div:contains('배송 조회')", function(){
    			
    			
    			var purchaseId = $(this).parents('tr').find('input[name="purchaseId"]').val();
    			console.log(purchaseId);
    			
    			var dlvyCompany = null;
    	    	var trackingNo = null; 
				
				var companyList = JSON.parse('${jsonString}');
	            
				console.log(">>>>>>>>>>");
				console.log(">>>>>>>>>>");
    			
    			$.ajax({
							url: "/admin/json/purchase/getDeliveryInfo/" + purchaseId,
							method: "GET",
							dataType : "json" ,
							async : false, 
		   					headers : {
		   						"Accept" : "application/json" ,
		   						"Content-Type" : "application/json"
		   					} ,
							success : function(JSONData, status) {
								
								console.log(JSONData);
								dlvyCompany = JSONData.dlvyCompany;
								trackingNo = JSONData.trackingNo;
								 
								console.log(dlvyCompany);
								console.log(trackingNo);
								
								var dlvyCompanyName = null;
								for(var i = 0; i < companyList.Company.length; i++){
					            	if(companyList.Company[i].Code == dlvyCompany) {
					            		console.log(companyList.Company[i].Name);
					            		dlvyCompanyName = companyList.Company[i].Name;
					            	} 
					            }
								
								
								$("#sol-delivery-kit").text(JSONData.hobbyClass.kitName);
								$("#sol-trackingNo").text(trackingNo);
								$("#sol-dlvyCompany").text(dlvyCompanyName);
								$("#sol-receiverName").text(JSONData.receiverName);
								$("#sol-postcode").text(JSONData.dlvyPostcode);
								$("#sol-address").text(JSONData.dlvyAddr + " " + JSONData.dlvyDetailAddr);
								
		
							}
				        					
				});  //end of ajax
	    		console.log("첫번째 ajax 끝");

				var display = "";
	    		$.ajax({
							url: "/admin/json/purchase/getDeliveryInfoDetail/" + dlvyCompany + "/" + trackingNo,
							method: "GET",
							dataType : "json" ,
							async : false, 
		   					headers : {
		   						"Accept" : "application/json" ,
		   						"Content-Type" : "application/json"
		   					} ,
							success : function(JSONData, status) {
								
								console.log(JSONData);
								$("#sol-deliverName").text(JSONData.lastDetail.manName);
								
								
								for(var i = 0; i < JSONData.trackingDetails.length; i++) {
									display += '<tr>';
									display += '<td>' + JSONData.trackingDetails[i].timeString + '</td>';
									display += '<td>' + JSONData.trackingDetails[i].where + '</td>';
									display += '<td>' + JSONData.trackingDetails[i].kind + '</td>';
								}
								$("#delivery-info-modal .table-striped tbody").html(display);
								
								
							}
				        					
				});  //end of ajax
				$("#delivery-info-modal").modal('show');
				
    		});
    		
    		
    	});
    	
		////////////////////////////////////////운송장 입력 ////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	    function numberFormat(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	    
	    function removeComma(str){
			n = parseInt(str.replace(/,/g,""));
			return n;
		}


        $(function () {
        	
        	// 환불 버튼 이벤트
        	$(document).on("click", "button div:contains('환불')", function(){
        		
        		
	        		if( $(this).parent().css("cursor") == 'not-allowed' ){
	 					// 비활성화 환불 버튼 클릭시 이벤트 없음
	        		}else {
	        			var refundConfirm = confirm("구매번호 : imp_"+$(this).parent().parent().parent().find(".purchaseIdAdmin").text().trim()
								+"\n구매상품 : "+$(this).parent().parent().parent().find(".componentOptionAdmin").text().trim()
								+"\n결제금액 : "+$(this).parent().parent().parent().find(".priceAdmin").text().trim()
								+"\n결제수단 : "+$(this).parent().parent().parent().find(".payMethodAdmin").text().trim()+"\n\n정말로 환불하시겠습니까?");
	        			if( refundConfirm == true ){
	        				
			        		var purchaseId = "imp_" + $(this).parent().parent().parent().find(".purchaseIdAdmin").text().trim();
			        		var refundDateAdmin = $(this).parent().parent().parent().find(".refundDateAdmin");
			        		var stateButton = $(this).parent().parent().parent().find(".purchaseStateAdmin");
			        		var refundButton = $(this).parent().parent().parent().find(".refundButton");
			        		var tempPurchasePrice = $(this).parent().parent().parent().find(".priceAdmin").text().trim();
							var purchasePrice = tempPurchasePrice.substring(0, tempPurchasePrice.length-1);
			        		
			        		$.ajax(
				    				{
				    					url: "/admin/json/purchase/updateRefund",
				    					method: "POST",
				    					data: JSON.stringify({
				    							purchaseId: purchaseId,
				    							purchasePrice: removeComma(purchasePrice),
				    							hobbyClass: {hobbyClassNo : $(this).parent().parent().parent().find("input[name='hobbyClassNoAdmin']").val()}
				    					}),
				    					dataType : "json" ,
			        					headers : {
			        						"Accept" : "application/json" ,
			        						"Content-Type" : "application/json"
			        					} ,
				    					success : function(JSONData, status) {
											
				    						// 환불 진행 후 화면에 환불 완료 버튼 생성 및 환불날짜 생성
											var refundDate = JSONData.refundDate.substring(0,4) + '.'
															+ JSONData.refundDate.substring(5,7) + '.'
															+ JSONData.refundDate.substring(8,10);
											
											refundDateAdmin.text(refundDate);
											stateButton.html('<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">환불 완료</div></button>');
											refundButton.html('<button type="button" class="btn btn-dark" style="background-color:#8496BA; border:0; outline: none; width:40px; height:24px; padding: 0px; cursor:not-allowed;"><div class="font">환불</div></button>');
				    					}
			        					
			   				});//end of ajax
	        			}//end of confirm
	        		}//end of refundMethod
	
   				
        	});
        	
        	// 페이지네이션 이벤트
            $(document).on("click", ".manage-pagination", function(){
	            	$("#purchaseForm").children("input[name='currentPage']").val( $(this).text().trim() );
	            	
	            	purchaseAdminAjax();    	
            });
        	
        	// 페이지네이션 이전, 다음 이벤트
        	$(document).on("click", ".page-link", function(){
        		
        		// 이전 버튼일 경우
        		if( $(this).attr("aria-label") == 'Previous' && !($(this).children().attr("class") == 'manage-no-page-span') ){
        			
        			if( $("#purchaseForm").children("input[name='currentPage']").val() == 1){
                		$("#purchaseForm").children("input[name='currentPage']").val(1);
                	}else{
                		$("#purchaseForm").children("input[name='currentPage']").val( Number( $("#purchaseForm").children("input[name='currentPage']").val() ) -Number(5) );
                	}
                	purchaseAdminAjax();
        			// 다음 버튼일 경우
        		}else if( $(this).attr("aria-label") == 'Next' && !($(this).children().attr("class") == 'manage-no-page-span') ){
        			if( $("#purchaseForm").children("input[name='currentPage']").val() == $("#purchaseForm").children("input[name='maxPage']").val() ){
                   		$("#purchaseForm").children("input[name='currentPage']").val( $("#purchaseForm").children("input[name='maxPage']").val() );

                	}else{
                		$("#purchaseForm").children("input[name='currentPage']").val( Number( $("#purchaseForm").children("input[name='currentPage']").val() ) +Number(5) );

                	}
               		purchaseAdminAjax();
        		}	
            });

            // 페이지 이전 이벤트
            $(document).on("click", ".forward-button", function(){
            	if( $("#purchaseForm").children("input[name='currentPage']").val() == 1){
            		$("#purchaseForm").children("input[name='currentPage']").val(1);
            	}else{
            		$("#purchaseForm").children("input[name='currentPage']").val( Number( $("#purchaseForm").children("input[name='currentPage']").val() ) -Number(1) );
            	}
            	purchaseAdminAjax();
            });
            
            // 페이지 다음 이벤트
            $(document).on("click", ".backward-button", function(){

           		if( $("#purchaseForm").children("input[name='currentPage']").val() == $("#purchaseForm").children("input[name='maxPage']").val() ){
               		$("#purchaseForm").children("input[name='currentPage']").val( $("#purchaseForm").children("input[name='maxPage']").val() );

            	}else{
            		$("#purchaseForm").children("input[name='currentPage']").val( Number( $("#purchaseForm").children("input[name='currentPage']").val() ) +Number(1) );

            	}
           		purchaseAdminAjax();
	        });

            // 정렬 버튼 이벤트
            $(document).on("click", ".dropdown-item", function(){
            	$(".manage-sort-button").html( $(this).text() + ' <svg width="20" height="20" viewBox="0 0 24 28"><path fill="#ff922b" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
            	$(".manage-sort-button").css("color","rgb(255, 146, 43)");
            	
            	$("#purchaseForm").children("input[name='currentPage']").val(1);

            	
            	if( $("#purchaseForm").children("input[name='searchCondition']").val() == 'all'
       				&& $("#purchaseForm").children("input[name='searchKeyword']").val() != ''
       				&& $("#purchaseForm").children("input[name='searchKeyword']").val() != null){
       	
            	}else if( $(this).text().trim() == '전체' ){
            		$("#purchaseForm").children("input[name='searchCondition']").val("all");
            	}else{
            		$("#purchaseForm").children("input[name='searchCondition']").val("purchaseState");
            	}
            	
            	if( $("#purchaseForm").children("input[name='searchCondition']").val() == 'all'
    				&& $("#purchaseForm").children("input[name='searchKeyword']").val() != ''
    				&& $("#purchaseForm").children("input[name='searchKeyword']").val() != null){
        	       	
            		if( $(this).text().trim() == '구매 완료' ){
	            		$("#purchaseForm").children("input[name='category']").val("0");
	            	}else if( $(this).text().trim() == '발송 완료' ){
	            		$("#purchaseForm").children("input[name='category']").val("1");
	            	}else if( $(this).text().trim() == '배송 완료' ){
	            		$("#purchaseForm").children("input[name='category']").val("2");
	            	}
	            	else if( $(this).text().trim() == '환불 대기' ){
	            		$("#purchaseForm").children("input[name='category']").val("3");
	            	}
	            	else if( $(this).text().trim() == '환불 완료' ){
	            		$("#purchaseForm").children("input[name='category']").val("4");
	            	}else{
	            		$("#purchaseForm").children("input[name='category']").val("");
	            	}
            		
            		
	       		 }else{
	       			if( $(this).text().trim() == '구매 완료' ){
	            		$("#purchaseForm").children("input[name='searchKeyword']").val("0");
	            	}else if( $(this).text().trim() == '발송 완료' ){
	            		$("#purchaseForm").children("input[name='searchKeyword']").val("1");
	            	}else if( $(this).text().trim() == '배송 완료' ){
	            		$("#purchaseForm").children("input[name='searchKeyword']").val("2");
	            	}
	            	else if( $(this).text().trim() == '환불 대기' ){
	            		$("#purchaseForm").children("input[name='searchKeyword']").val("3");
	            	}
	            	else if( $(this).text().trim() == '환불 완료' ){
	            		$("#purchaseForm").children("input[name='searchKeyword']").val("4");
	            	}
	       		 }

            	purchaseAdminAjax();

        });//end of function
            
            // 검색창 엔터 이벤트
            $(document).on("keydown", ".manager-title-search-input-box", function(key){
    			if(key.keyCode == 13){    				
    				
    				$("#purchaseForm").children("input[name='currentPage']").val(1);
    				$("#purchaseForm").children("input[name='searchCondition']").val("all");
    				$("#purchaseForm").children("input[name='searchKeyword']").val( $(this).val() );
    				
    				purchaseAdminAjax();
    				
    			}//end of if
    		});//end of function
            
            // 검색창 돋보기 클릭 이벤트
            $(document).on("click", ".manager-title-searchbar svg", function(){            	
            	
            	$("#purchaseForm").children("input[name='currentPage']").val(1);
            	$("#purchaseForm").children("input[name='searchCondition']").val("all");
            	$("#purchaseForm").children("input[name='searchKeyword']").val( $(".manager-title-search-input-box").val() );
            	
            	purchaseAdminAjax();
            });
    		
    		$(document).on("focusout", ".manager-title-search-input-box", function(){
    			
    				$("#purchaseForm").children("input[name='searchKeyword']").val( $(this).val() );
    			
    		});
    		
    		function purchaseAdminAjax(){
    			$.ajax(
	    				{
	    					url: "/admin/json/purchase/getPaymentHistoryListAdmin",
	    					method: "POST",
	    					data: JSON.stringify({
	    							currentPage: $("#purchaseForm").children("input[name='currentPage']").val(),
	    							searchCondition: $("#purchaseForm").children("input[name='searchCondition']").val(),
	    							searchKeyword: $("#purchaseForm").children("input[name='searchKeyword']").val(),
	    							category: $("#purchaseForm").children("input[name='category']").val()
	    						}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						var displayValue = "";
								for(var i=0; i<JSONData.purchase.length; i++){
									
									displayValue += '<tr class="purchaseAdmin">' +
												'<input type="hidden" name="hobbyClassNoAdmin" value="'+JSONData.purchase[i].hobbyClass.hobbyClassNo+'">' +
												'<input type="hidden" name="purchaseId" value="'+JSONData.purchase[i].purchaseId+'">' +
												'<th scope="row" class="purchaseIdAdmin">'+JSONData.purchase[i].purchaseId.substring(4,16)+'</th>' +
												'<td class="purchaseStateAdmin">';
												if( JSONData.purchase[i].purchaseState == '0' ){
													displayValue += '<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">구매 완료</div></button>';
												}else if( JSONData.purchase[i].purchaseState == '1' ){
													displayValue += '<button type="button" class="btn btn-success" style="border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">발송 완료</div></button>';
												}else if( JSONData.purchase[i].purchaseState == '2' ){
													displayValue += '<button type="button" class="btn btn-success" style="border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">발송 완료</div></button>';
												}else if( JSONData.purchase[i].purchaseState == '3' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">환불 대기</div></button>';
												}else if( JSONData.purchase[i].purchaseState == '4' ){
													displayValue += '<button type="button" class="btn btn-dark" style="color:rgb(62, 64, 66);; background-color:rgb(168, 174, 179); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">환불 완료</div></button>';
												}
									displayValue +=	'</td>';
												if( JSONData.purchase[i].componentOption == '1' ){
													displayValue += '<td class="componentOptionAdmin">'+JSONData.purchase[i].hobbyClass.kitName+'</td>';
												}else if( JSONData.purchase[i].componentOption == '0') {
														displayValue += '<td class="componentOptionAdmin">15주 수강권</td>';
												}
												
									displayValue +=	'<td class="priceAdmin">'+numberFormat(JSONData.purchase[i].purchasePrice)+'원</td>' +
												'<td class="payMethodAdmin">';
												if( JSONData.purchase[i].payMethod == '0' ){
													displayValue += '카드';
												}else if( JSONData.purchase[i].payMethod == '1' ){
													displayValue += '휴대폰';
												}
									displayValue +=	'</td>' +
												'<td class="userIdAdmin">'+JSONData.purchase[i].user.userId+'</td>' +
												'<td class="purchaseDateAdmin">'+JSONData.purchase[i].purchaseDate.substring(0,4) + '.'
																				+JSONData.purchase[i].purchaseDate.substring(5,7) + '.'
																				+JSONData.purchase[i].purchaseDate.substring(8,10) +
												'</td>' +
												'<td class="refundDateAdmin">';
												if( JSONData.purchase[i].refundDate != null ){
													displayValue += JSONData.purchase[i].refundDate.substring(0,4) + '.'
																	+ JSONData.purchase[i].refundDate.substring(5,7) + '.'
																	+ JSONData.purchase[i].refundDate.substring(8,10);
												}
									displayValue +=	'</td>' +
												'<td class="deliveryStateAdmin">';
												if( JSONData.purchase[i].componentOption == '1' ){
													if( JSONData.purchase[i].purchaseState == '1' || JSONData.purchase[i].purchaseState == '2' ){
														displayValue += '<button type="button" class="btn btn-dark"  data-toggle="modal" data-target="#delivery-info-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button>';
													}else if( JSONData.purchase[i].purchaseState == '0' ){
														displayValue += '<button type="button" class="btn btn-dark sol-btn-delivery"  data-toggle="modal" data-target="#delivery-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">운송장 입력</div></button>';
													}
												}
									displayValue += '</td>' +
												'<td class="refundButton">';
												if( JSONData.purchase[i].purchaseState == '1' || JSONData.purchase[i].purchaseState == '2' || JSONData.purchase[i].purchaseState == '4' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:#8496BA; border:0; outline: none; width:40px; height:24px; padding: 0px; cursor:not-allowed;"><div class="font">환불 </div></button>';
												}else if( JSONData.purchase[i].purchaseState == '0' || JSONData.purchase[i].purchaseState == '3' ){
													displayValue += '<button type="button" class="btn btn-dark" style="background-color:#4267b2; border:0; outline: none; width:40px; height:24px; padding: 0px;"><div class="font">환불</div></button>';
													
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
								
								$(".purchaseAdmin-tbody").html(displayValue);
								$(".pagination").html(paginationDisplayValue);
								$("#purchaseForm").children("input[name='maxPage']").val( JSONData.resultPage.maxPage );
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