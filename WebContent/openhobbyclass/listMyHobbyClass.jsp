<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>GetHobby</title>
<%-- //2020-02-24 Git Commit --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>		
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../resources/css/saveHobbyClass.css">	
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
  <%-- <script src="lang/summernote-ko-KR.js"></script> --%>

	<style>
	.delete-button {
		color: rgb(243, 51, 64);
		box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px; font-size: 14px;
		font-weight: normal;
		line-height: 20px;
		letter-spacing: -0.2px;
		background-color: white;
		padding: 10px 14px;
		width:84px;
		hegiht:60px;
		border:0; 
		outline:none;
		position: relative;
		top:-65px;
		left: -25px;
		display: none;
	}
	.delete-button:focus {		
		color: rgb(243, 51, 64);
		box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px; font-size: 14px;
		font-weight: normal;
		line-height: 20px;
		letter-spacing: -0.2px;
		background-color: white;
		padding: 10px 14px;
		width:84px;
		hegiht:60px;
		border:0; 
		outline:none;
		position: relative;
		top:-65px;
		left: -25px;
		display: none;

	}
	
	@media (min-width: 992px) {
		body {
			padding-top : 62px;
		}
		
		.main_section {
			max-width: 662px;
			width: 60.18%;
			height: 100%;	
			margin-top: 40px;
			margin-left: 30px;
			padding: 0px 12px;		
		}
		.lmhc-da {
		margin-right: 4px;
		position:relative;
		top: -2px;
		
		}
		.lmhc-alert-div {
			 max-width: 1px; 
			 width: 1px; 
			 height:51px; 
			 z-index:1300; 
			 top: 15px; 
			 position:fixed;
			 text-align: center;
		}
		.lmhc-da-cs {
			min-width:280px;
			}
	
	}

	@media (max-width: 991px) {
		.lmhc-da-cs {
			min-width:90%;
		}
		body {
			padding: 24px;
		}
		
		.main_section {
			max-width: 100%;
			width: 100%;
			height: 100%;	
			margin-top: 60px;
		
			padding: 0px;		
		}
		.lmhc-alert-div {
			 max-width: 1px; 
			 width: 1px; 
			 height:51px; 
			 z-index:1300; 
			 top: 15px; 
			 position:fixed;
		}
		
	}

	.flex-column {
		width: 240px;
		height: calc(100vh - 72px);
		overflow-y: scroll;
	}
	
	.section {
		width: 100%;
		height: 100%;
	}
	
	.font {
	    font-size: 9px;
	    letter-spacing: normal;
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    font-weight: bold;
	    line-height: 1;
	    color: rgb(237, 239, 240);
	    margin: 0px;
	}
	
	.bottom_button_parent {
		position: relative;
		width: 100%;
	}
	
	.bottom_button {
		position: absolute;
		bottom: 0px;
	}
	
	.card-body_outdiv {
    height: 178px;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: justify;
    justify-content: space-between;
    flex: 1 1 0%;
	}
	
	.listMyHobbyClass-header {
		display: flex;
		justify-content: space-between;
	}

	 .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	    background-color: rgb(248, 248, 249);
	    border: 0;
	    outline: 0 none;
	    font-weight: bold; 
	} 
	  
	.android-listMyHobbyClass-button {
		border: 0;
		outline: 0 none;
		font-size: 14px;
	}
	.android-listMyHobbyClass-button:focus {
		border: 0;
		outline: 0 none;
		box-shadow: none;
	}
	.list-hobbyState-button:focus {
		background-color: #343a40;
	}
	.list-continue-button:focus {
		background-color: #343a40;
	}
	.listMyHobbyClass-button {
		margin-top: 12px;		
		padding: 6px 12px;
	}
	.list-hobbyclass-side-div {
		padding-left: 12px;
	}
	.listMyHobbyClass-card-div {
		box-shadow: rgba(41, 42, 43, 0.08) 0px 4px 8px, rgba(41, 42, 43, 0.12) 0px 12px 16px;
		margin-top: 16px; 
		width: 100%; 
		border: 0;
		height: 226.5px; 
		padding: 24px;
	}
	.addHobbyClass-button {
		padding: 0px;
		color: rgb(95, 174, 201);
		background-color:white;
		box-shadow: none;
		border: 0;
		outline: 0 none;
		font-size: 14px;
	}
	.addHobbyClass-button:focus {
		background-color:white;
		box-shadow: none;
		border: 0;
		outline: 0 none;
	}
	.listMyHobbyClass-newClass-div {
		padding-top:10px;
	}
	.lmhcMH {
		cursor: pointer;
	}
	.lmhcMH:hover {
		background-color: rgb(248, 248, 249);
		font-weight: bold;
	}
	.lmhc-logo-a {
		width:36px;
		height:36px;
	}
	
	.lmhc-da {
		margin-right: 4px;
		position:relative;
		top: -2px;
	}
	
	.lmhc-da-cs {
		 
		max-width:612px; 
		font-size:14px; 
		line-height:20px; 
		display: flex;
		-webkit-box-align: center; 
		flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    align-items: center;
		background-color: rgb(0, 183, 157);  
		color:white; 
		position:fixed; 
		z-index:1500; 
		margin-top: auto;  
		margin-right: auto; 
		margin-left: auto; 
		margin-bottom: 0px;
		box-shadow: rgba(41, 42, 43, 0.08) 0px 1px 3px, rgba(0, 0, 0, 0.04) 0px 1px 0px;
		padding: 14px 16px;
		border-radius: 3px;
		left: 50%;
    	transform: translate(-50%, 0);
    	display: none;	 
	}
	.delete-button:hover {
		color: rgb(243, 121, 64);
	}
	.lmhc-cc-text {
		font-weight: bold;
    	font-size: 1.1rem;
    	color: rgb(62, 64, 66);
    	cursor: default;
    	top:10px;
    	position:relative;
	}
	
	.btn-dark:focus {
		background: black;

	}

   </style>
	
</head>
<body>

<!--------------------------------------- start of toolbar, left ---------------------------------------> 
	
		
	

	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	  <a class="navbar-brand lmhc-logo-a" href="/index.jsp"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
	  <span class="lmhc-cc-text">CREATOR CENTER</span>
	  	<button class="navbar-toggler android-listMyHobbyClass-button" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	   		<span class="navbar-toggler-icon"></span>
	 	</button>
	  	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	  	<div class="navbar-nav d-block d-lg-none d-none list-hobbyclass-side-div">
			  <a class="nav-link lmhcMH" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
		      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/>
		      		<path d="M12 5.69l5 4.5V18h-2v-6H9v6H7v-7.81l5-4.5M12 3L2 12h3v8h6v-6h2v6h6v-8h3L12 3z"/>
		      	</svg>
					<font size="3px" color="black">내 클래스</font>
		      </a> 

	       </div>
	    </div>
	    
	</nav><hr style="padding:0px; margin:0px; margin-bottom:8px;" />
	
	<div class="row" style="height:auto;">
	  <div class="col-3 d-none d-lg-block">
	    <div class="nav flex-column nav-pills list-hobbyclass-side-div" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	    	<div class="nav-link listMyHobbyClass-button lmhcMH thisismyclass" id="v-pills-home-tab" data-toggle="pill" role="tab" aria-controls="v-pills-home">
		      <svg xmlns="http://www.w3.org/2000/svg" width="24" height=24 viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/>
		      	<path d="M12 5.69l5 4.5V18h-2v-6H9v6H7v-7.81l5-4.5M12 3L2 12h3v8h6v-6h2v6h6v-8h3L12 3z"/>
		      </svg>
				<font color="black">내 클래스</font>
			</div>
	    </div>
	  </div> 

<!--------------------------------------- end of toolbar, left --------------------------------------->
  
  <div class="main_section">
  	
		<div class="section">
		
			<div class="lmhc-alert-div">

				<!-- delete alert -->
				<div class="alert alert-warning alert-dismissible fade show lmhc-da-cs lmhc-da-d" role="alert">
				
				  <span>
				  	<span  class="lmhc-da">
					  <svg width="18" height="18" viewBox="0 0 24 24">
						  <path fill="#FFF" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
						  </path>
					  </svg>
					  </span>
				 	 성공적으로 상품이 삭제되었습니다.
				  </span>
				</div>
				
				<!-- add alert -->
				<div class="alert alert-warning alert-dismissible fade show lmhc-da-cs lmhc-da-a" role="alert"">
				  <span>
				  	<span  class="lmhc-da">
					  <svg width="18" height="18" viewBox="0 0 24 24">
						  <path fill="#FFF" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
						  </path>
					  </svg>
					  </span>
				 	 성공적으로 상품이 추가되었습니다.
				  </span>
				</div>
				
			</div>
			
			
			<!-- header -->
			<div>
		  		<header class="listMyHobbyClass-header">
		  		
		  			<div>
		  				<h4 style="font-weight: bold; color: rgb(62, 64, 66);">온라인 클래스</h4>
		  			</div>
		  			
		  			<div class="listMyHobbyClass-newClass-div">
			  			<svg width="18" height="18" viewBox="0 0 24 28">
				  			<path fill="#5faec9" fill-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6z">
				  			</path>
			  			</svg>
			  			<button type="button" class="addHobbyClass-button">새로운 클래스</button>
		  			</div>
		  				
		  		</header>
		  		
		  	</div>
 		
 		<!---------------------------------------------------------------------- WebMyClass Start ---------------------------------------------------------------------->
 		
 		
 		<div class="d-none d-lg-block lmhc-wb-div">
 		<input type="hidden" name="currentPage" value="${hobbyClassMap.resultPage.currentPage}">
 		<c:set var="i" value="0" />
		<c:forEach var="hobbyClass" items="${hobbyClassMap.hobbyClass}">
		<c:set var="i" value="${i+1}" />
			<div class="card mb-3 listMyHobbyClass-card-div">
			  <input type="hidden" name="classState-web" value="${hobbyClass.hobbyClassState}">
			  <div class="row no-gutters" style="padding: 0px;">
			    <div style="width:238px; height:178.5px; margin-right:24px;">	
			      <c:if test="${!empty hobbyClass.hobbyClassImage}">	    
			      <img src="/images/hobbyclass/${hobbyClass.hobbyClassImage}" style="width:100%; height:100%;" class="card-img" alt="...">	  
			      </c:if>
			      <c:if test="${empty hobbyClass.hobbyClassImage}">	
			      <img src="/resources/image/gon/ohcbImage.png" style="width:100%; min-height:100%;" class="card-img" alt="...">	   
			      </c:if>
			    </div>
			    
			    <div class="card-body_outdiv">
			      <div class="card-body" style=" margin-right:0%; padding: 0px; width:100%; height:100%;">
			        <!-- ---------------------------------------------------------------------------------------------------------- -->
			        <!-- Card Div -->	
				        <div class="bottom_button_parent" style="height: 100%; width:100%;">	
				        	
						    <!-- Card Title -->    	
						    <div style="position:relative;">
							    <div style="width:90%;">
					        		<p class="card-title" style="margin-bottom: 0px;">   
					        			<c:if test="${empty hobbyClass.hobbyClassName}">
					        				클래스 제목을 지어주세요
					        			</c:if>    		
					        			<c:if test="${!empty hobbyClass.hobbyClassName}">
						        			${hobbyClass.hobbyClassName}
						        		</c:if>
					        		</p>
				        		</div>
				        		
				        		<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">
				        			<c:if test="${hobbyClass.hobbyClassState == '클래스 작성 중'}">				  
				        			<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />
				        			<button class="delete-button">삭제하기</button>		
				        			</c:if>			        			
			  						<input type="hidden" name="hobbyClassNo" value="${hobbyClass.hobbyClassNo}">
				        		</div>
				        		
			        		</div>
			        		
					        <!-- Card Text -->
					        <p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">
					        	<button type="button" class="btn btn-dark list-hobbyState-button" style="width:92px; height:20px; padding: 0px;"><div class="font">${hobbyClass.hobbyClassState}</div></button>
					        </p> 			        
					        <!-- Card Text -->
					        <p class="card-text bottom_button" style="width:100%;">
					        	<c:if test="${hobbyClass.hobbyClassState == '클래스 작성 중'}">		
					        		<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>
					        	</c:if>
					        	<c:if test="${hobbyClass.hobbyClassState == '심사 중' || hobbyClass.hobbyClassState == '심사완료' || hobbyClass.hobbyClassState == '종강'}">					        	
					        		<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>
					        	</c:if>
					        	<c:if test="${hobbyClass.hobbyClassState == '수요조사 중' || hobbyClass.hobbyClassState == '수요조사완료' || hobbyClass.hobbyClassState == '개강 중' }">
					        		<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>
					        	</c:if>
					        	
					        </p>
				       </div>
			        <!-- ---------------------------------------------------------------------------------------------------------- -->
			      </div>
			    </div>
			  </div>
			</div>		
			</c:forEach>
		</div>
		
		
		<!---------------------------------------------------------------------- WebMyClass End ---------------------------------------------------------------------->
			
				
				
		</div>
		
	</div>
	
</div>

	<!---------------------------------------------------------------------- Android Start ---------------------------------------------------------------------->
	<div class="lmhc-adr-div">
	<input type="hidden" name="currentPage" value="${hobbyClassMap.resultPage.currentPage}">
	<c:set var="i" value="0" />
	<c:forEach var="hobbyClass" items="${hobbyClassMap.hobbyClass}">
	<c:set var="i" value="${i+1}" />
	<div class="card col-md-12 d-block d-lg-none lmhc-adr-div-in" style="margin-top: 16px; padding:0px; border: 0; box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">
		  <input type="hidden" name="classState-andr" value="${hobbyClass.hobbyClassState}">	   
		  <c:if test="${!empty hobbyClass.hobbyClassImage}">	    
	      <img src="/images/hobbyclass/${hobbyClass.hobbyClassImage}" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">	  
	      </c:if>
	      <c:if test="${empty hobbyClass.hobbyClassImage}">	
	      <img src="/resources/image/gon/ohcbImage.png" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">	   
	      </c:if>
		  <div class="card-body_outdiv">
			  <div class="card-body" style="padding: 16px;">
				  <div class="bottom_button_parent" style="height: 100%; width:100%;">	
				    <!-- Card Title -->    	
				    <div style="position:relative;">
					    <div style="width:90%;">
			        		<p class="card-title" style="margin-bottom: 0px;">        				
				        		${hobbyClass.hobbyClassName}
			        		</p>
			       		</div>
			       		<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">
			       			<c:if test="${hobbyClass.hobbyClassState == '클래스 작성 중'}">	
			       			<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />	
			       			<button class="delete-button">삭제하기</button>
			       			</c:if>
			       			<input id="test" type="hidden" name="hobbyClassNo" value="${hobbyClass.hobbyClassNo}">
			       		</div>
			      	</div>
						        		
				     <!-- Card Text -->
			        <p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">
			        	<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">${hobbyClass.hobbyClassState}</div></button>
			        </p> 			        
			        <!-- Card Text -->
			        <p class="card-text bottom_button" style="width:100%;">
			        	<c:if test="${hobbyClass.hobbyClassState == '클래스 작성 중'}">	
			        		<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>
			        	</c:if>
			        	<c:if test="${hobbyClass.hobbyClassState == '심사 중' || hobbyClass.hobbyClassState == '심사완료' || hobbyClass.hobbyClassState == '종강'}">					        	
			        		<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>
			        	</c:if>
			        	<c:if test="${hobbyClass.hobbyClassState == '수요조사 중' || hobbyClass.hobbyClassState == '수요조사완료' || hobbyClass.hobbyClassState == '개강 중' }">
			        		<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>
			        	</c:if>
			        </p>
				  </div>
			</div>	
		
		</div>
	</div>
	</c:forEach>
	</div>
	<!---------------------------------------------------------------------- Android End ---------------------------------------------------------------------->

	<input type="hidden" id="maxPage" value="${hobbyClassMap.resultPage.maxPage}">
	<script type="text/javascript">
	$(function(){

		// CREATOR CENTER TEXT Click Event
		$(document).on("click", ".lmhc-cc-text", function(){
			self.location = "/hobbyclass/getMyHobbyClassList";
		});
		
		// 삭제하기 버튼 활성화/비활성화 이벤트
		$(document).on("click", ".delete_div", function(){
			if( $(this).find(".delete-button").css("display") == "block" ){
				$(this).find(".delete-button").css("display","none");			

			}else{
				$(this).find(".delete-button").css("display","block");
			}
		});
		
		// 삭제하기 버튼 외부영역 클릭 시 비활성화 이벤트
		$('html').click(function(e) {
			if(!$(e.target).hasClass("delete-button")) {
				$(".delete-button").css("display","none");
			}else{
				$(this).find(".delete-button").css("display") == "block"
			} 
		});

		// 카드에서 삭제하기 영역을 제외한 나머지 영역을 클릭할 경우
		$(document).on("click", ".listMyHobbyClass-card-div", function(e){
			var state = $(this).find("input[name='classState-web']").val();
			if( state == '클래스 작성 중' ) {
				if(!$(e.target).hasClass("delete_div") && !$(e.target).hasClass("delete-button") && !$(e.target).hasClass("delete_image")){
					self.location = "/hobbyclass/getSaveHobbyClass?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
				}
			}else if( state == '심사 중' || state == '심사완료' || state == '종강' ){
				self.location = "/hobbyclass/getDetailView?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
			}else if( state == '수요조사 중' || state == '수요조사완료' || state == '개강 중'){
				self.location = "/myHobbyClass/getHobbyClassBuyerStats?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
			}

		});
		
		// 안드로이드 카드에서 삭제하기 영역을 제외한 나머지 영역을 클릭할 경우
		$(document).on("click", ".lmhc-adr-div-in", function(e){
			var state = $(this).find("input[name='classState-andr']").val();
			if( state == '클래스 작성 중' ) {
				if(!$(e.target).hasClass("delete_div") && !$(e.target).hasClass("delete-button") && !$(e.target).hasClass("delete_image")){
					
					self.location = "/hobbyclass/getSaveHobbyClass?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
				}
			}else if( state == '심사 중' || state == '심사완료' || state == '종강' ){
				self.location = "/hobbyclass/getDetailView?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
			}else if( state == '수요조사 중' || state == '수요조사완료' || state == '개강 중'){
				self.location = "/myHobbyClass/getHobbyClassBuyerStats?hobbyClassNo="+$(this).children().find(".delete_div input[name='hobbyClassNo']").val();
			}

		});

		// 새로운 클래스
		$(document).on("click", ".addHobbyClass-button", function(){
			$(".lmhc-da-a").css("display","block");
			setTimeout(function() {  self.location = "/hobbyclass/addHobbyClass"; }, 400);				
		});
			
		// 삭제하기
		$(document).on("click", ".delete-button", function(){
			
			
			var deleteConfirm = confirm("정말로 해당 클래스를 삭제하시겠어요?");
			var deleteDiv = $(this).parent().parent().parent().parent().parent().parent().parent();
			var hobbyClassNo = $(this).next("input[name='hobbyClassNo']").val();
			var anrdDeleteDiv;
			var currentPage = $(".lmhc-wb-div input[name='currentPage']").val();
			
			for(var i=2; i<=( Number($(".lmhc-adr-div input[name='currentPage']").val()*10)+Number(1) ); i++){
				
				if( $(".lmhc-adr-div-in:nth-child("+i+") input[name='hobbyClassNo']").val() == hobbyClassNo ){
					
					anrdDeleteDiv = $(".lmhc-adr-div-in:nth-child("+i+")");
				}
			}

			if(deleteConfirm == true ){
				$(".lmhc-da-d").css("display","block");

					$.ajax(
							{
								url: "/hobbyclass/json/deleteHobbyClass",
								method: "POST",
								data: JSON.stringify({
									hobbyClassNo: hobbyClassNo
								}),
								headers : {
		    						"Accept" : "application/json" ,
		    						"Content-Type" : "application/json"
		    					} ,
		    					success : function(JSONData, status) {	                	    						
		    						if(JSONData == 1){
		    							deleteDiv.remove();
		    							anrdDeleteDiv.remove();
		    							
		    							if( $(".lmhc-wb-div input[name='currentPage']").val() != $("#maxPage").val() ){
			    							$.ajax(
			    									{
			    										url: "/hobbyclass/json/getMyHobbyClassList",
			    										method: "POST",
			    										data: JSON.stringify({
			    											currentPage: currentPage
			    										}),
			    										headers : {
			    				    						"Accept" : "application/json" ,
			    				    						"Content-Type" : "application/json"
			    				    					} ,
			    				    					success : function(JSONData, status) {	
			    				    						
			    				    						// (현재페이지*10) : 테이블 데이터 1개 삭제 후 페이지 재정렬 ex) 1페이지 = 10개 데이터 일 때, 현재페이지 데이터 1개 삭제 후 2페이지의 첫번째 ROWNUM이 1페이지 10번째  ROWNUM으로 재정렬 됨 
			    				    						// (현재페이지*10)-1 : 데이터 1개 삭제 후 재정렬 없음
			    				    						// TotalCOunt = 총 데이터 열 수, currentPage*10 = 1페이지 데이터 열 수
			    				    						// 1페이지에서 1개 삭제를 해도 데이터 수가 현재페이지 데이터 개수보다 많거나 같을 경우 실행
			    				    						if( JSONData.resultPage.totalCount >= (currentPage*10) ){
	
			    				    						var displayValue = '<div class="card mb-3 listMyHobbyClass-card-div">'
			    				    										+ '<div class="row no-gutters" style="padding: 0px;">'
			    				    										+ '<div style="width:238px; height:178.5px; margin-right:24px;">';
			    				    										if( JSONData.hobbyClass[9].hobbyClassImage != null ){
			    				    											displayValue += '<img src="/images/hobbyclass/'+JSONData.hobbyClass[9].hobbyClassImage+'" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
			    				    										}else if( JSONData.hobbyClass[9].hobbyClassImage == null ){
			    				    											displayValue += '<img src="/resources/image/gon/ohcbImage.png" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
			    				    										}
			    				    							displayValue += '</div>'
			    				    										+ '<div class="card-body_outdiv">'
			    				    										+ '<div class="card-body" style=" margin-right:0%; padding: 0px; width:100%; height:100%;">'
			    				    										+ '<div class="bottom_button_parent" style="height: 100%; width:100%;">'
			    				    										+ '<div style="position:relative;">'
			    				    										+ '<div style="width:90%;">'
			    				    										+ '<p class="card-title" style="margin-bottom: 0px;">'
			    				    										+ JSONData.hobbyClass[9].hobbyClassName
			    				    										+ '</p>'
			    				    										+ '</div>'
			    				    										+ '<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">'
			    				    										+ '<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />'
			    				    										+ '<button class="delete-button">삭제하기</button>'
			    				    										+ '<input type="hidden" name="hobbyClassNo" value="'+JSONData.hobbyClass[9].hobbyClassNo+'">'
			    				    										+ '</div>'
			    				    										+ '</div>'
			    				    										+ '<p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">'
			    				    										+ '<button type="button" class="btn btn-dark list-hobbyState-button" style="width:92px; height:20px; padding: 0px;"><div class="font">'+JSONData.hobbyClass[9].hobbyClassState+'</div></button>'
			    				    										+ '</p>'
			    				    										+ '<p class="card-text bottom_button" style="width:100%;">';
			    				    										if( JSONData.hobbyClass[9].hobbyClassState == '클래스 작성 중' ){
			    				    											displayValue += '<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>';
			    				    										}else if( JSONData.hobbyClass[9].hobbyClassState == '클래스 심사 중' || JSONData.hobbyClass[9].hobbyClassState == '심사완료' || JSONData.hobbyClass[9].hobbyClassState == '종강' ){
			    				    											displayValue += '<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>';
			    				    										}else if( JSONData.hobbyClass[9].hobbyClassState == '수요조사 중' || JSONData.hobbyClass[9].hobbyClassState == '수요조사완료' || JSONData.hobbyClass[9].hobbyClassState == '개강 중' ){
			    				    											displayValue += '<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>';
			    				    										}
			    				    							displayValue += '</p>'
			    				    										+ '</div>'
			    				    										+ '</div>'
			    				    										+ '</div>'
			    				    										+ '</div>'
			    				    										+ '</div>';
			    				    										
			    				    						var anrdDisplayValue = '<div class="card col-md-12 d-block d-lg-none lmhc-adr-div-in" style="margin-top: 16px; padding:0px; border: 0; box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">';
								    				    						if( JSONData.hobbyClass[9].hobbyClassImage != null ){
								    				    							anrdDisplayValue += '<img src="/images/hobbyclass/'+JSONData.hobbyClass[9].hobbyClassImage+'" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
									    										}else if( JSONData.hobbyClass[9].hobbyClassImage == null ){
									    											anrdDisplayValue += '<img src="/resources/image/gon/ohcbImage.png" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
									    										}
								    				    		anrdDisplayValue += '<div class="card-body_outdiv">'	
								    				    						+ '<div class="card-body" style="padding: 16px;">'
								    				    						+ '<div class="bottom_button_parent" style="height: 100%; width:100%;">'
								    				    						+ '<div style="position:relative;">'
								    				    						+ '<div style="width:90%;">'
								    				    						+ '<p class="card-title" style="margin-bottom: 0px;">'
								    				    						+ JSONData.hobbyClass[9].hobbyClassName
								    				    						+ '</p>'
								    				    						+ '</div>'
								    				    						+ '<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">'
								    				    						+ '<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />'
								    				    						+ '<button class="delete-button">삭제하기</button>'
								    				    						+ '<input type="hidden" name="hobbyClassNo" value="'+JSONData.hobbyClass[9].hobbyClassNo+'">'
								    				    						+ '</div>'
								    				    						+ '</div>'
								    				    						+ '<p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">'
								    				    						+ '<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">'+JSONData.hobbyClass[9].hobbyClassState+'</div></button>'
								    				    						+ '</p>'
								    				    						+ '<p class="card-text bottom_button" style="width:100%;">';
												    				    		if( JSONData.hobbyClass[9].hobbyClassState == '클래스 작성 중' ){
												    				    			anrdDisplayValue += '<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>';
				    				    										}else if( JSONData.hobbyClass[9].hobbyClassState == '클래스 심사 중' || JSONData.hobbyClass[9].hobbyClassState == '심사완료' || JSONData.hobbyClass[9].hobbyClassState == '종강' ){
				    				    											anrdDisplayValue += '<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>';
				    				    										}else if( JSONData.hobbyClass[9].hobbyClassState == '수요조사 중' || JSONData.hobbyClass[9].hobbyClassState == '수요조사완료' || JSONData.hobbyClass[9].hobbyClassState == '개강 중' ){
				    				    											anrdDisplayValue += '<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>';
				    				    										}			
												    			anrdDisplayValue += '</p>'
								    				    						+ '</div>'
								    				    						+ '</div>'
								    				    						+ '</div>'
								    				    						+ '</div>';
								    				    	$(".lmhc-wb-div").append(displayValue);					
								    				    	$(".lmhc-adr-div").append(anrdDisplayValue);
			    				    						}//end of if
			    				    					}//end of callBackFunction
			    							});//end of ajax
			    							
			    							$(".lmhc-wb-div input[name='currentPage']").val( Number( $(".lmhc-wb-div input[name='currentPage']").val() ) + Number(1) );
		    							}
		    							
		    						}
		    					}//end of callBackFunction
					});//end of ajax
					setTimeout(function() {  
						$(".lmhc-da-d").css("display","none"); }, 5000);
			}//end of confirm
			
		});
		
		
		// 내 클래스 버튼 이벤트
		$(document).on("click", ".thisismyclass", function(){
			self.location = "/hobbyclass/getMyHobbyClassList";
		});
		
		//  버튼 이벤트
		$(document).on("click", ".thisismyananlysis", function(){
			self.location = "/hobbyclass/getMyHobbyClassList";
		});
		
		// 새로운 클래스 밑줄 이벤트
		$(document).on("mouseover", ".listMyHobbyClass-newClass-div", function(){
			$(".addHobbyClass-button").css("text-decoration","underline");
		});
		$(document).on("mouseleave", ".listMyHobbyClass-newClass-div", function(){
			$(".addHobbyClass-button").css("text-decoration","none");
		});
		
		
		
	});
	
//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////

$(function(){
		var bool = true;
		 var currentPage = 2;
		
		$(window).scroll(function(){
			var window = $(this);
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();            
           
            if(bool){          	
	            if( scrollTop + windowHeight + 300 > documentHeight ){
	            	bool = false;
	            	//쓰로틀링 설정
	            	var timeout = setTimeout(function(){
	            		bool = true;
	            		
	            		
	            	},1000);//end of setTimeout

	            	//쓰로틀링 종료
	            	if( $("#maxPage").val() == currentPage ){
	            		clearTimeout(timeout);
	            	}//end of clearTimeout
	            		
	            		$.ajax(
	            				{
	            					url : "/hobbyclass/json/getMyHobbyClassList" ,
	            					method : "POST" ,
	            					data : JSON.stringify({
	            						currentPage : currentPage
	            					}) ,
	            					dataType : "json" ,
	            					headers : {
	            						"Accept" : "application/json" ,
	            						"Content-Type" : "application/json"
	            					} ,
	            					success : function(JSONData , status){
										var displayValue = "";
										var anrdDisplayValue = "";
										for(var i=0; i<JSONData.hobbyClass.length; i++){				
											
									displayValue += '<div class="card mb-3 listMyHobbyClass-card-div">'
	    										+ '<div class="row no-gutters" style="padding: 0px;">'
	    										+ '<div style="width:238px; height:178.5px; margin-right:24px;">';
	    										if( JSONData.hobbyClass[i].hobbyClassImage != null ){
	    											displayValue += '<img src="/images/hobbyclass/'+JSONData.hobbyClass[i].hobbyClassImage+'" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
	    										}else if( JSONData.hobbyClass[i].hobbyClassImage == null ){
	    											displayValue += '<img src="/resources/image/gon/ohcbImage.png" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
	    										}
	    							displayValue += '</div>'
	    										+ '<div class="card-body_outdiv">'
	    										+ '<div class="card-body" style=" margin-right:0%; padding: 0px; width:100%; height:100%;">'
	    										+ '<div class="bottom_button_parent" style="height: 100%; width:100%;">'
	    										+ '<div style="position:relative;">'
	    										+ '<div style="width:90%;">'
	    										+ '<p class="card-title" style="margin-bottom: 0px;">'
	    										+ JSONData.hobbyClass[i].hobbyClassName
	    										+ '</p>'
	    										+ '</div>'
	    										+ '<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">'
	    										+ '<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />'
	    										+ '<button class="delete-button">삭제하기</button>'
	    										+ '<input type="hidden" name="hobbyClassNo" value="'+JSONData.hobbyClass[i].hobbyClassNo+'">'
	    										+ '</div>'
	    										+ '</div>'
	    										+ '<p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">'
	    										+ '<button type="button" class="btn btn-dark list-hobbyState-button" style="width:92px; height:20px; padding: 0px;"><div class="font">'+JSONData.hobbyClass[i].hobbyClassState+'</div></button>'
	    										+ '</p>'
	    										+ '<p class="card-text bottom_button" style="width:100%;">';
				    							if( JSONData.hobbyClass[i].hobbyClassState == '클래스 작성 중' ){
				    								displayValue += '<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '클래스 심사 중' || JSONData.hobbyClass[i].hobbyClassState == '심사완료' || JSONData.hobbyClass[i].hobbyClassState == '종강' ){
													displayValue += '<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>';
												}else if( JSONData.hobbyClass[i].hobbyClassState == '수요조사 중' || JSONData.hobbyClass[i].hobbyClassState == '수요조사완료' || JSONData.hobbyClass[i].hobbyClassState == '개강 중' ){
													displayValue += '<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>';
												}	
	    							displayValue += '</p>'
	    										+ '</div>'
	    										+ '</div>'
	    										+ '</div>'
	    										+ '</div>'
	    										+ '</div>';
	    										
	    							anrdDisplayValue += '<div class="card col-md-12 d-block d-lg-none lmhc-adr-div-in" style="margin-top: 16px; padding:0px; border: 0; box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;">';
	    				    						if( JSONData.hobbyClass[i].hobbyClassImage != null ){
	    				    							anrdDisplayValue += '<img src="/images/hobbyclass/'+JSONData.hobbyClass[i].hobbyClassImage+'" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
		    										}else if( JSONData.hobbyClass[i].hobbyClassImage == null ){
		    											anrdDisplayValue += '<img src="/resources/image/gon/ohcbImage.png" style="min-width:238px; min-height:178.5px;" class="card-img" alt="...">';
		    										}
	    				    		anrdDisplayValue += '<div class="card-body_outdiv">'	
	    				    						+ '<div class="card-body" style="padding: 16px;">'
	    				    						+ '<div class="bottom_button_parent" style="height: 100%; width:100%;">'
	    				    						+ '<div style="position:relative;">'
	    				    						+ '<div style="width:90%;">'
	    				    						+ '<p class="card-title" style="margin-bottom: 0px;">'
	    				    						+ JSONData.hobbyClass[i].hobbyClassName
	    				    						+ '</p>'
	    				    						+ '</div>'
	    				    						+ '<div class="delete_div" style="width:10%; top:0px; right:0px; position:absolute;">'
	    				    						+ '<img class="delete_image" src="/resources/image/gon/jumjumjum.jpg" />'
	    				    						+ '<button class="delete-button">삭제하기</button>'
	    				    						+ '<input type="hidden" name="hobbyClassNo" value="'+JSONData.hobbyClass[i].hobbyClassNo+'">'
	    				    						+ '</div>'
	    				    						+ '</div>'
	    				    						+ '<p class="card-text" style="margin-top: 8px; margin-bottom: 10px;">'
	    				    						+ '<button type="button" class="btn btn-dark" style="width:92px; height:20px; padding: 0px;"><div class="font">'+JSONData.hobbyClass[i].hobbyClassState+'</div></button>'
	    				    						+ '</p>'
	    				    						+ '<p class="card-text bottom_button" style="width:100%;">';
					    				    		if( JSONData.hobbyClass[i].hobbyClassState == '클래스 작성 중' ){
					    				    			anrdDisplayValue += '<button type="button" class="btn btn-dark list-continue-button" style="width:100%;">계속 작성하기</button>';
													}else if( JSONData.hobbyClass[i].hobbyClassState == '클래스 심사 중' || JSONData.hobbyClass[i].hobbyClassState == '심사완료' || JSONData.hobbyClass[i].hobbyClassState == '종강' ){
														anrdDisplayValue += '<button type="button" class="btn btn-dark list-review-button" style="width:100%;">클래스 상세보기</button>';
													}else if( JSONData.hobbyClass[i].hobbyClassState == '수요조사 중' || JSONData.hobbyClass[i].hobbyClassState == '수요조사완료' || JSONData.hobbyClass[i].hobbyClassState == '개강 중' ){
														anrdDisplayValue += '<button type="button" class="btn btn-dark list-ananlysis-button" style="width:100%;">클래스 통계보기</button>';
													}	
	    				    		anrdDisplayValue += '</p>'
	    				    						+ '</div>'
	    				    						+ '</div>'
	    				    						+ '</div>'
	    				    						+ '</div>';
	    				    	
											
										}										
										$(".lmhc-wb-div").append(displayValue);					
			    				    	$(".lmhc-adr-div").append(anrdDisplayValue);
			    				    	$(".lmhc-wb-div input[name='currentPage']").val( JSONData.resultPage.currentPage );
			    				    	$(".lmhc-adr-div input[name='currentPage']").val( JSONData.resultPage.currentPage );
										currentPage ++;
	            					}//end of Call Back Function
	            				})//end of ajax
	            	
	            } 
            }
            
        });//end of scroll
	});//end of function

//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////

		
		
	</script>
</body>
</html>