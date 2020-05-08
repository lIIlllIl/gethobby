<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>GetHobby</title>
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
	
	<!-- owl -->
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
	<script src="../resources/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

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
	text-align : center;
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

.btn-process-done-report {
	cursor : not-allowed;
}

.report-target-number {
	cursor : pointer;
}			
	</style>
	
	<script type="text/javascript">
		$(function(){
			$('.page-link.manage-pagination').eq(0).css('font-weight', 'bold');
			/*
			$(document).on("click", ".manage-pagination", function(){
            	var currentPage = $(this).text().trim();
				var searchCondition = $('.hidden-search-condition').val();	
            	
       		 	console.log('currentPage ? : ' + currentPage);   

       		 	var search = new Object();
       		 	search.currentPage = currentPage;
       		 	search.searchCondition = searchCondition;
        	});
			*/
			$('.dropdown-item').on('click', function(){
				var lastText = $(this).text();
				$('.manage-sort-button').html(lastText + '<svg width="20" height="20" viewBox="0 0 24 28"><path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
				
				var classState = $(this).find('input').val();
				console.log('classState ? : ' + classState);
				
				$('.hidden-search-condition').val( classState );
				
				classState = $('.hidden-search-condition').val();
				
				var search = new Object();
				search.searchCondition = classState;
				search.currentPage = 1;
				
				reportListAjax(search);
			})
			
			$(document).on('click', '.page-link.manage-pagination', function(){
				var currentPage = $(this).text().trim();
				
				var classState = $('.hidden-search-condition').val();
				
				var search = new Object();
				search.searchCondition = classState;
				search.currentPage = currentPage;
				console.log('하단 페이지 클릭');
				console.log(search);
				reportListAjax(search);
				
			})
			
			$(document).on('click', '.class-state-button', function(){
				var buttonValue = $(this).val();
				var buttonText = $(this).text().trim();
				
				console.log(buttonValue);
				$('.hidden-search-condition').val( buttonValue );
				buttonValue = $('.hidden-search-condition').val();
				var search = new Object();
				search.searchCondition = buttonValue;
				search.currentPage = 1;
				
				$('.manage-sort-button').html( buttonText + '<svg width="20" height="20" viewBox="0 0 24 28"><path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
				
				reportListAjax(search);
			})
			
			$(document).on('click', '.process-report-button', function(){
				console.log('click');
				
				var reportNo = $(this).parent().find('input').val();
				console.log(reportNo);
				$('.hidden-report-number').val(reportNo);
				
				Swal.mixin({
					icon : 'info',
					showCancelButton : false,
					showConfirmButton: false,
					allowOutsideClick : true, 
					progressSteps : ['1', '2']
				}).queue([
					{
						html : 	'<span class="first-title">신고 처리 방식을 선택해주세요.</span>' + 
						'<br/><br/>' + 
						'<button type="button" class="btn btn-basic swal-ok-button mr-5">신고 처리</button>' + 
						'<button type="button" class="btn btn-basic swal-cancel-button">신고 반려</button>' 
					},
					{	
						html : '<br/><br/>' + 
							   '<span>' + $('.hidden-report-number').val() + '번 신고를 <br/>' + 
							   '<span id="swal-inner" class="inner-swal">선택하신 방법</span>' + ' 으로 처리하시겠습니까?</span>' +  
							   '<br/><br/>' + 
							   '<button type="button" class="btn btn-basic swal-reply-next-button mr-5">다음</button>' + 
							   '<button type="button" class="btn btn-basic swal-reply-next-cancel-button">취소</button>',
						showLoaderOnConfirm: true, 
						preConfirm : () => {
							return fetch("/questionReport/json/processReportAdmin", {
								method : "POST", 
								headers : {
			    					"Accept" : "application/json", 
			    					"Content-Type" : "application/json"
			    				},
			    				body : JSON.stringify({
			    					reportState : $('.hidden-report-state').val(),
									reportNo : $('.hidden-report-number').val(),
									currentPage : 1, 
									searchCondition : $('.hidden-search-condition').val() 
								})
							}).then(JSONData => JSONData.json()).then(JSONData => {
								console.log(JSONData);	
								var display = '';
								
								for(var i = 0; i < JSONData.reportList.length; i++) {
									display += '<tr class="report-admin-content">';	
									display += '<td scope="row" class="report-number">' + JSONData.reportList[i].reportNo + '</td>';
									display += '<td class="report-user-id">' + JSONData.reportList[i].user.userId + '</td>';
									display += '<td class="report-target-type">';
									
									
									if ( JSONData.reportList[i].replyNo == 0 ) {
										display += '게시글</td>';
									}
									else if ( JSONData.reportList[i].replyNo != 0 ) {
										display += '댓글</td>';
									}	
									
									display += '<td scope="row" class="report-target-number">';
									
									if ( JSONData.reportList[i].replyNo == 0 ) {
										display += JSONData.reportList[i].articleNo;
										display += '<input type="hidden" class="report-target-type" value="article" />';
										display += '</td>';
									}
									else if ( JSONData.reportList[i].replyNo != 0 ) {
										display += JSONData.reportList[i].replyNo;
										display += '<input type="hidden" class="report-target-type" value="reply" />';
										display += '</td>';
									}	
									
									display += '<td class="report-add-date">' + JSONData.reportList[i].regDate + '</td>';
									display += '<td class="report-state-button">';
									
									if ( JSONData.reportList[i].reportState == '0' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="0" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 대기</div></button>';
									}
									else if ( JSONData.reportList[i].reportState == '2' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="2" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 반려</div></button>';
									}
									else if ( JSONData.reportList[i].reportState == '1' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="1" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>';
									}
									
									display += '</td>';
									display += '<td class="report-state-button">';
									
									if ( JSONData.reportList[i].reportState == '0' ) {
										display += '<button type="button" class="btn btn-dark process-report-button" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>';
									}
									else if ( JSONData.reportList[i].reportState != '0' ) {
										display += '<button type="button" class="btn btn-dark btn-process-done-report" style="width:92px; height:20px; padding: 0px;" disabled><div class="font">처리 완료</div></button>';
									}
									display += '<input type="hidden" value="' + JSONData.reportList[i].reportNo + '" />';
									display += '</td>';
									display += '</tr>';
								}
								
								var paginationDisplayValue = '';
								
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
								
								$('.pagination').html(paginationDisplayValue);
								$('.report-tbody').html(display);
								
								$('.hidden-current-page').val(1);
								
								var currentPage = $('.hidden-current-page').val();
								console.log('ajax currentPage' + currentPage);
							})
						}
					}
				]).then((result) => {
					console.log(result)
					
					if ( !result.dismiss ) {
						Swal.fire({
							icon: 'success',
							title: '신고 처리 완료',
							showConfirmButton : false,
							allowOutsideClick : true, 
							timer: 800
						})
						
						return; 
					}
					
				})
				
			});
			$(document).on('click', '.swal-ok-button', function(){
				$('.hidden-report-state').val('1');
				$('.inner-swal').text('신고 처리');
    			Swal.clickConfirm();
    		})
    		
    		$(document).on('click', '.swal-cancel-button', function(){
    			$('.hidden-report-state').val('2');
    			$('.inner-swal').text('신고 반려');
    			Swal.clickConfirm();
    		})
			
    		$(document).on('click', '.swal-reply-next-button', function(){
    			Swal.clickConfirm();
    		})
    		
    		$(document).on('click', '.swal-reply-next-cancel-button', function(){
    			Swal.clickCancel();
    		})
			function reportListAjax(search) {
				$.ajax(
						{
							url : "/questionReport/json/getReportList", 
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							}, 
							data : JSON.stringify(
								search 
							), 
							success : function(JSONData, status) { 
								console.log('ajax function run');
								console.log(JSONData);
								
								var display = '';
								
								for(var i = 0; i < JSONData.reportList.length; i++) {
									display += '<tr class="report-admin-content">';	
									display += '<td scope="row" class="report-number">' + JSONData.reportList[i].reportNo + '</td>';
									display += '<td class="report-user-id">' + JSONData.reportList[i].user.userId + '</td>';
									display += '<td class="report-target-type">';
									
									
									if ( JSONData.reportList[i].replyNo == 0 ) {
										display += '게시글</td>';
									}
									else if ( JSONData.reportList[i].replyNo != 0 ) {
										display += '댓글</td>';
									}	
									
									display += '<td scope="row" class="report-target-number">';
									
									if ( JSONData.reportList[i].replyNo == 0 ) {
										display += JSONData.reportList[i].articleNo;
										display += '<input type="hidden" class="report-target-type" value="article" />';
										display += '</td>';
									}
									else if ( JSONData.reportList[i].replyNo != 0 ) {
										display += JSONData.reportList[i].replyNo;
										display += '<input type="hidden" class="report-target-type" value="reply" />';
										display += '</td>';
									}	
									
									
									
									display += '<td class="report-add-date">' + JSONData.reportList[i].regDate + '</td>';
									display += '<td class="report-state-button">';
									
									if ( JSONData.reportList[i].reportState == '0' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="0" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 대기</div></button>';
									}
									else if ( JSONData.reportList[i].reportState == '2' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="2" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 반려</div></button>';
									}
									else if ( JSONData.reportList[i].reportState == '1' ) {
										display += '<button type="button" class="btn btn-dark class-state-button" value="1" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>';
									}
									
									display += '</td>';
									display += '<td class="report-state-button">';
									
									if ( JSONData.reportList[i].reportState == '0' ) {
										display += '<button type="button" class="btn btn-dark process-report-button" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>';
									}
									else if ( JSONData.reportList[i].reportState != '0' ) {
										display += '<button type="button" class="btn btn-dark btn-process-done-report" style="width:92px; height:20px; padding: 0px;" disabled><div class="font">처리 완료</div></button>';
									}
									display += '<input type="hidden" value="' + JSONData.reportList[i].reportNo + '" />';
									display += '</td>';
									display += '</tr>';
								}
								
								var paginationDisplayValue = '';
								
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
								
								$('.pagination').html(paginationDisplayValue);
								$('.report-tbody').html(display);
								
								$('.hidden-current-page').val(search.currentPage);
								
								var currentPage = $('.hidden-current-page').val();
								console.log('ajax currentPage' + currentPage);
								
							}
						}
				)
			}
			
			$(document).on('click', '.report-target-number', function(){
				console.log('click');
				var reportTargetNo = $(this).text().trim();
				console.log('reportTargetNo ? : ' + reportTargetNo);
				var reportTargetType = $(this).find('.report-target-type').val();
				console.log('reportTargetType ? : ' + reportTargetType);
				
				if ( reportTargetType == 'reply' && reportTargetNo >= 10000 ) {
					$.ajax(
							{
								url : "/lesson/json/getLessonReply",
								method : "post", 
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								data : JSON.stringify({
									replyNo : reportTargetNo
								}),
								success : function(JSONData, status) {
									var replyContent = JSONData.reply.replyContent;
									Swal.fire({
										icon : 'info',
										title : '신고 댓글 내용 확인',
										text : replyContent, 
										showConfirmButton : true, 
										confirmButtonText : '확인', 
										allowOutsideClick : true
									})
									
								}
							}
					)
				}
				else if ( reportTargetType == 'article' && reportTargetNo < 1000 ) {
					var reportTargetArticle = window.open('/admin/getReportTargetArticle?boardCode=1&articleNo=' + reportTargetNo , 'reportTarget', '_blank', "width=537, height=500, left=450, top=90, height=500, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
				}
				/*
				else if ( reportTargetType == 'reply' && 1000 <= reportTargetType < 10000 ) {
					$.ajax(
							{
								url : "/searchHobbyClass/json/getReportTagetCommunityReply",
								method : "post", 
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								data : JSON.stringify({
									replyNo : reportTargetNo
								}),
								success : function(JSONData, status) {
									var replyContent = JSONData.reply.replyContent;
									Swal.fire({
										icon : 'info',
										title : '신고 댓글 내용 확인',
										text : replyContent, 
										showConfirmButton : true, 
										confirmButtonText : '확인', 
										allowOutsideClick : true
									})
									
								}
							}
					)
				}
				else if ( reportTargetType == 'article' && reportTargetNo >= 1000 ) {
					var popupX = (document.body.offsetWidth / 2) - (200 / 2);
					var popupY= (document.body.offsetHeight / 2) - (300 / 2);
					
					var reportTargetArticle = window.open('/searchHobbyClass/getCommunity?articleNo=' + reportTargetNo , 'reportTarget', 'width=700,height=600,left=350,top=150');

						
				}
				*/
			})
			
			
			
		})	
		
		
	</script>
</head>

<body>
	<input type="hidden" class="hidden-current-page" value="1" />
	<input type="hidden" class="hidden-search-condition" value="3" />
	<input type="hidden" class="hidden-report-number"/>
	<input type="hidden" class="hidden-report-state"/>
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
            	<h1>신고 관리
	            	<span class="manager-title-state">신고 총합 : ${count.all } 개 </span>
	            	<span class="manager-title-state">신고 처리 : ${count.approval } 개</span>
	            	<span class="manager-title-state">신고 반려 : ${count.refusal } 개</span>
	            	<span class="manager-title-state">신고 대기 : ${count.atomosphere } 개</span>
            	</h1>          	
            </div>
            
            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
	            
	            <div class="manage-search-menu-div-left-sort">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					  <button type="button" class="btn-outline-light manage-sort-button black-hover" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	전체
					    	<svg width="20" height="20" viewBox="0 0 24 28">
						    	<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" />
					    	</svg>
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item">전체<input type="hidden" value="3"/></a>
					    <a class="dropdown-item">신고 처리<input type="hidden" value="1"/></a>
					    <a class="dropdown-item">신고 반려<input type="hidden" value="2"/></a>
					    <a class="dropdown-item">신고 대기<input type="hidden" value="0"/></a>
					  </div>
					</div>				
	            </div>
            </div>
            
            <div class="manager-content">
	            <table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col">신고 번호</th>
				      <th scope="col">신고자 아이디</th>
				      <th scope="col">신고대상 종류</th>
				      <th scope="col">신고대상 번호</th>
				      <th scope="col">신고 날짜</th>
				      <th scope="col">처리 상태</th>	
				      <th scope="col">신고 처리</th>				      
				    </tr>
				  </thead>
				  <tbody class="report-tbody">
				    
				    <c:forEach var="report" items="${reportList }" >
					    <!-- 밖에서 list만큼 forEach -->
					    <tr class="report-admin-content">
					    
					      <!-- 번호 -->
					      <td scope="row" class="report-number">${report.reportNo }</td>
					      
					      <!-- 신고자 아이디 -->
					      <td class="report-user-id">${report.user.userId }</td>
					      
					      <!-- 신고대상 종류 -->
					      <td class="report-target-type">${ report.replyNo eq 0 ? "게시글" : "댓글" }</td>
					      
					      <!-- 신고대상 번호 -->
					      <td scope="row" class="report-target-number">
					      	${ report.replyNo eq 0 ? report.articleNo : report.replyNo }
					      	<input type="hidden" class="report-target-type" value="${ report.replyNo eq 0 ? 'article' : 'reply' }" />
					      </td>
					      
					      <!-- 신고 날짜 -->
					      <td class="report-add-date">${report.regDate }</td>
					      
					      <!-- 처리 상태 -->
					      <td class="report-state-button">
					      	<c:if test="${report.reportState == '0' }">
					      		<button type="button" class="btn btn-dark class-state-button" value="0" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 대기</div></button>  
					      	</c:if>
					      	<c:if test="${report.reportState == '2' }">
					      		<button type="button" class="btn btn-dark class-state-button" value="2" style="background-color:rgb(252, 61, 70); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 반려</div></button>
					      	</c:if>
					      	<c:if test="${report.reportState == '1' }">
					      		<button type="button" class="btn btn-dark class-state-button" value="1" style="background-color:rgb(253, 126, 20); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>
					      	</c:if>
					      </td>
					      
					      <td class="report-state-button">
					      	<c:if test="${report.reportState == '0' }">
					      		<button type="button" class="btn btn-dark process-report-button" style="width:92px; height:20px; padding: 0px;"><div class="font">신고 처리</div></button>  
					      	</c:if>
					      	<c:if test="${report.reportState != '0' }">
					      		<button type="button" class="btn btn-dark btn-process-done-report" style="width:92px; height:20px; padding: 0px;" disabled><div class="font">처리 완료</div></button>  
					      	</c:if>
					      	<input type="hidden" value="${report.reportNo }" />
					      </td>
					    </tr>
						<!-- 밖에서 list만큼 forEach -->
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