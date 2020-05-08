<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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

	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- Header -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css">
	<link rel="stylesheet" href="/resources/css/kyung/listCommunity.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	
	<script type="text/javascript">
	
	var currentPage = 1;

	
    $(function () {

        $(".sol-to-the-top").on("click", function () {

            //window.scrollTo(0, 0);

        	$('body,html').animate({
				scrollTop: 0
			}, 200);
        	
			return false;

        	

        });

    });
	
	
	
	
	
	$(function() {
	
	/////더보기버튼 클릭시 BUTTON1
	$(document).on("click", "#moreCommunity_Button", function() {
	
		currentPage += 1;
		var hobbyClassNo = $("input:hidden[name=hidden_hobbyClassNo]").val();
		var totalCount =  $("input:hidden[name=hidden_totalCount]").val();
		var sessionUserId = $("input:hidden[name='hidden_session_userId']").val();
		var sessionProfileImage = $("input:hidden[name='hidden_session_profileImage']").val();
		
		//alert('hobby'+hobbyClassNo);
		//alert('sessionUserId'+sessionUserId);
		//alert('sessionProfileImage'+sessionProfileImage);

		//크리에이터 회원인티 체크
		var creatorName = $("input[id='hidden_creatorName']").val();
		console.log('creatorName-->'+creatorName);
		
		//구매 회원 체크
		var purchaseCheck = $("input[id='hidden_purchaseCheck']").val();
		console.log('purchaseCheck-->'+purchaseCheck);
		
		if(totalCount%10 == 0 ){
			if(currentPage > totalCount/10){
				alert('더보기할 리스트가 없습니다.');
				return;
			}//inner-if
		}else if(totalCount%10 > 0 ){
			if(currentPage > totalCount/10 +1){
				alert('더보기할 리스트가 없습니다.');
				return;
			}//inner-if
		}//if
		
		var search = {
				"currentPage" : currentPage
		};
		
 		$.ajax({
			
			url : "/community/json/listCommunity/"+hobbyClassNo,
			method : "POST", 
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			dataType: "json",
			data : JSON.stringify(search),
			success : function(data){
				if(data.success=="200"&&data.articleList.length>0){
					
					var moreCommunity = "";
					
					if( ( (totalCount/10) + 1) == currentPage){
						//alert('dd');
						$('.moreCommunity_Button').html("");
					}//inner-if
					
					for(var i=0; i<data.articleList.length; i++){
					
	        			//var no = i+11; 
	        			var no = (currentPage-1)*10 +(i+1); 
	        			
	        			moreCommunity += "<div class='outer_div'>";
	    				
	    				//<!-- ////// ARTICLE INPUT HIDDEN /////////// -->	
	    				moreCommunity +=	"<input type='hidden' class='hidden_articleNo' id='hidden_articleNo' value='"+data.articleList[i].articleNo+"'/>"
	    			
	    									+"<div class='article_div'>"
	    									
	    									
	    							//<!-- 작성 정보 -->	
	    							+"<div class='lcmnt-winf'>";
	    									
	    					///<!-- 프로필 사진 -->
	    					if(data.articleList[i].user.profileImage == null){
	    				moreCommunity +=	"<span class='lcmnt-fpiod'>";
	    				moreCommunity +=	"<img src='/resources/image/logo/unnamed.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi' style='size: 40px; width: 40px;'>";
	    	  				 }else if(data.articleList[i].user.profileImage != null){
	    	  			//moreCommunity +=	data.articleList[i].user.profileImage;	    	  			
	    				moreCommunity +=	"<img src='/resources/image/logo/"+data.articleList[i].user.profileImage+"' class='RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi lcmnt-form-fis' style='size: 40px; width: 40px;'>";
	    	  				}	
	    				moreCommunity += "</span>";
	    					
	    				
	    			moreCommunity += "<div class='lcmnet-ah34-od'>"
	    					//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
	    							+ "<h3 class='lcmnt-ah3'>";
		     				 if(data.articleList[i].user.nickName == null){
		     			moreCommunity +=	data.articleList[i].user.name;
		     				 }else if(data.articleList[i].user.nickName != null){
		     			moreCommunity +=	data.articleList[i].user.nickName;
		     				 }
		     				moreCommunity += "</h3>";
	    				
	    					
		     			moreCommunity +="	<h4 class='articleRegDate lcmnt-ah4'>"+data.articleList[i].regDate+"</h4>"
		     			moreCommunity += "</div>"		
		     		moreCommunity +="</div>"//작성정보 div		
		     			
	    								+"	<span class='article_Content lcmnt-span'>"+data.articleList[i].articleContent+"</span>"
	    	
	    								+"</div>";//<!-- article_div 끝 -->
	    								
	    			moreCommunity += "</br>"
	    						   +"<div class='reply_totalReport_div lcmnt-ah4_totalReport'>"
	    						   +data.articleList[i].totalReport+"개의 댓글"
	    						   +"</div>";
	    				
	    			moreCommunity +=	"<div class='outer_reply_div'>";
	    						for(var j=0; j<data.array[i].length; j++){
	    				        			
	    							var reply_no = j+1;
	    					
	    							//<!-- ////// INPUT HIDDEN /////////// -->	
	    				
	    			moreCommunity +=	"<div class='reply_div'>"
	    							+  "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+data.array[i][j].replyNo+"'/>"
	    							+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+data.array[i][j].replyContent+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+data.array[i][j].user.profileImage+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+data.array[i][j].user.name+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+data.array[i][j].user.nickName+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+data.array[i][j].regDate+"'/>"
	    							+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+data.array[i][j].user.userId+"' />"


	    								//+"==>"+reply_no+"번째 댓글 No: "+data.array[i][j].replyNo;
	    					
	    							
	    							
	    							//<!-- 작성 정보 -->
	    			   moreCommunity +=	"<div class='lcmnt-winf'>"
	    							
	    							
	    								//<!-- 프로필 사진 -->
	    			   				+"<span class='lcmnt-fpiod-reply'>";
	    				//				if(data.array[i][j].user.profileImage == null){
	    			   moreCommunity +=	"<img src='/resources/image/logo/unnamed.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";
	    			    //	  			}else if(data.array[i][j].user.profileImage != null){
	    			   //moreCommunity +=	data.array[i][j].user.profileImage;	    	  			
	    			 //  moreCommunity +=	"<img src='/resources/image/logo/"+data.array[i][j].user.profileImage+"' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";    	  			
	    			   // 	  			}	
	    				moreCommunity +="</span>";	
	    						
	    								//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
	    				moreCommunity +="<div class='lcmnet-ah34-od'>"		
	    				 			  +"<h6 class='replyUserName lcmnt-ah3'>";
	    			    				 if(data.array[i][j].user.nickName == null){
	    			     moreCommunity +=	data.array[i][j].user.name;
	    			    				 }else if(data.array[i][j].user.nickName != null){
	    			     moreCommunity +=	data.array[i][j].user.nickName;
	    			     				 }
	    			     moreCommunity +="</h6>"
	    			     				 
	    					
	    						
	    								+"	<h6 class='replyRegDate lcmnt-ah4'>"+data.array[i][j].regDate+"</h6>"
	    								+"</div>";
	    								

						moreCommunity	+="<div class='button-reply-wrapper'>";				
										if(sessionUserId  == data.array[i][j].user.userId && purchaseCheck == 1 ){
						moreCommunity	+="<button class='replyDelete_Button btn btn-outline-basic m-1 button-reply' id='replyDelete_Button'>삭제</button>";
	    				moreCommunity	+="<button class='replyUpdate_Button btn btn-basic m-1 button-reply' id='replyUpdate_Button'>수정</button>";
										}
										if(sessionUserId == creatorName && purchaseCheck == 1){
						moreCommunity	+="<button class='creator_replyDelete_Button btn btn-outline-basic m-1 button-reply' id='creator_replyDelete_Button'>처리</button>";					
										}
	    				moreCommunity	+="</div>";
	    								
	    		  	moreCommunity	+="</div>"
	    								
	    								+"<div class='reply_Content lcmnt-span'>"+data.array[i][j].replyContent+"</div>";
	    						
						moreCommunity	+="</div>";//<!--// reply_div 끝 -->
	    					
	    							//<!--+"<c:set var="j" value="${j+1}"/>"	-->
	    						}//inner-for
	    						
						moreCommunity	+="</div>";

						
						
						moreCommunity	+="<form id='textarea-form'>"
			    						+"<div class='reply_write_div lcmnt-form-od'>"
			    						
			    						//<!-- 프로필 사진 -->
										+"<div class='lcmnt-form-fid'>"
										+"<span class='lcmnt-form-fis'>";
    									if(data.articleList[i].user.profileImage == null){
    					moreCommunity +=	"<img src='/resources/image/logo/unnamed.jpg' class='lcmnt-form-fi'>";
    	  				 				}else if(data.articleList[i].user.profileImage != null){
    	  				//moreCommunity +=	data.articleList[i].user.profileImage;	  
    	  				moreCommunity +=	"<img src='/resources/image/logo/"+data.articleList[i].user.profileImage+"' class='lcmnt-form-fi'>";  
				    	  				}	
    	  				  moreCommunity += "</span>"
    	  				  				+"</div>"
    	  				  				
										
	    							   +"<textarea class='replyInput lcmnt-tf-textarea' id='replyInput' name='replyInput' placeholder='댓글을 입력하세요'></textarea>"
	                                
	    							   // <!-- //등록버튼 등록버튼 -->                                                                                                                                                                                                                     <br>
	                           		  +"<div class='lcmnt-bs-d'>"
	                           			+"<button id='addReply_Button' type='button' class='addReply_Button btn btn-basic m-1 lcmnt-bs-b'>"
	                           			+"<span class='lcmnt-bs-i'>"
	                           			+"	<svg width='24' height='24' viewBox='0 0 24 24'>"
	                           			+"         	<path fill=''#858a8d' fill-rule='evenodd' d='M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z'>"
	                           			+"         	</path>"
	                           			+"     	</svg>"
	                           			+" 	</span>"
	                           			+"</button>"
	                                  +"</div>"
	                             +"</div>"
	                             +"</form>"
	        			
	                        +"</div>";//outer_div 끝 
	        			
	        			
							   }//outter-for
					
							$(".more_div").append(moreCommunity);
							   
								   
					}//if
						else{
							return;
					}//else
				},//success
			 	error:function(request,status,error){
		            alert("ajax과정 실패");
		       }//error
			});//ajax
				
				
	})//더보기버튼 function
	
	
	///글작성하기 버튼 클릭시 BUTTON2 
	$(document).on("click", "#WriteArticleButton", function() {
		
		//구매 회원 체크
		var purchaseCheck = $("input[id='hidden_purchaseCheck']").val();
		console.log('purchaseCheck-->'+purchaseCheck);
		
		if( purchaseCheck == '0'){
			swal.fire("클래스 구매 후 이용해주세요", "비구매 회원은 글을 등록할 수 없습니다 :)", "error");
			return;
		}else{
		
		//alert('글작성하기버튼');
		var hobbyClassNo =$('#hidden_hobbyClassNo').val();
		var sessionUserId = $("input[class='hidden_session_userId']").val();
		//alert('글작성하기의 sessionUserId-'+sessionUserId);
		if(sessionUserId == ''){
			alert('로그인후 이용해주세요.');
			//return;
		}
		self.location = "/community/addCommunityArticleView?hobbyClassNo="+hobbyClassNo;
		
		}//구매회원체크 if
		
	})//글작성하기 function
	
	
	///글내용 클릭시 BUTTON3 
	$(document).on("click", ".article_Content", function() {
		
		//alert('상세보기버튼');
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('hidden_articleNo ? :' + articleNo);
		var hobbyClassNo = $('#hidden_hobbyClassNo').val();
		
		self.location = "/community/getCommunity?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;

	})//글상세보기 function
	
/* 	///처리 클릭시 BUTTON 
	$(document).on("click", ".creator_replyDelete_Button", function() {
		
		//alert('상세보기버튼');
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('hidden_articleNo ? :' + articleNo);
		var hobbyClassNo = $('#hidden_hobbyClassNo').val();
		
		self.location = "/community/getCommunity?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;

	})//크리에이터의 댓글 처리 function */
	
	
	///댓글수정 버튼 클릭시 BUTTON4 (최초요청)
	$(document).on("click", "#replyUpdate_Button", function() {

		//구매 회원 체크
		var purchaseCheck = $("input[id='hidden_purchaseCheck']").val();
		console.log('purchaseCheck-->'+purchaseCheck);
		
		//alert('수정');
		var replyNo = $(this).parents('.reply_div').find('.hidden_replyNo').val();
		console.log('hidden_replyNo ? :' + replyNo);
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('articleNo ? :' + articleNo);
		 
		var sessionUserId =$('.hidden_session_userId').val();
		
		var replyContent = $(this).parents('.reply_div').find('.hidden_replyContent').val();
		///<br> ==> \n으로 바꾸는 정규표현식
		resultReplyContent = replyContent.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		console.log(resultReplyContent);
		
		var reply_userprofileImag = $(this).parents('.reply_div').find('.hidden_reply_userprofileImage').val();
		console.log('hidden_reply_userprofileImage ? :' + reply_userprofileImag);
		var hidden_reply_username = $(this).parents('.reply_div').find('.hidden_reply_username').val();
		console.log('hidden_reply_username ? :' + hidden_reply_username);
		var hidden_reply_usernickName = $(this).parents('.reply_div').find('.hidden_reply_usernickName').val();
		console.log('hidden_reply_usernickName ? :' + hidden_reply_usernickName);
		
		var thisOuterDiv = $(this).parents('.outer_div'); //클릭한 댓글의 outer_div가져옴.
		
		var replyDiv = $(this).parents('.outer_reply_div').find('.reply_div');
						///reply_div 다 찾음. 클릭한 글에 달린 댓글 다 가져옴.
		
		//replyDiv.css("color", "red");
						
		//alert(';;'+replyDiv.length);
		var index = $('.reply_div').index( $(this).parents('.reply_div') );// 수정버튼 누른 글이 몇번째 글인지 가져옴. 0부터 시작.
		console.log('--------------'+index);

		for( var i = 0; i < replyDiv.length; i++ ) { //수정버튼 누른 글에 달린 댓글의 갯수만큼 돌림
			var forReplyNo = replyDiv.eq(i).find('.hidden_replyNo').val(); 
			var forReplyContent = replyDiv.eq(i).find('.hidden_replyContent').val(); 
			var forUserProfileImage = replyDiv.eq(i).find('.hidden_reply_userprofileImage').val(); 
			var forUserName = replyDiv.eq(i).find('.hidden_reply_username').val(); 
			var forUserId = replyDiv.eq(i).find('.hidden_reply_userId').val(); 
			var forUserNickName = replyDiv.eq(i).find('.hidden_reply_usernickName').val(); 
			var forReplyRegDate = replyDiv.eq(i).find('.hidden_reply_regDate').val(); 
			 
			console.log('i ? : ' + i + ' / ' + forReplyContent + ' / ' + forReplyRegDate); //수정버튼 누른 글에 달린 댓글
			
			var displayReply = "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+forReplyNo+"'/>"
			+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+forReplyContent+"'/>"
			+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+forUserProfileImage+"'/>"
			+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+forUserName+"'/>"
			+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+forUserNickName+"'/>"
			+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+forReplyRegDate+"'/>"
			+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+forUserId+"' />"

			//+"<div class='reply_div'>"
			  //<!-- 작성 정보 -->
			  +"<div class='lcmnt-winf'>"	
			
				//<!-- 프로필 사진 -->
			  	+"<span class='lcmnt-fpiod-reply'>";
 				//if(forUserProfileImage== null){
 					displayReply +=	"<img src='/resources/image/logo/unnamed.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";
	  			//}else if(forUserProfileImage != null){
	  				//displayReply += forUserProfileImage;
	  			//	displayReply +=	"<img src='/resources/image/logo/"+forUserProfileImage+"' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";	    	  			
	  			//}
			  	displayReply +="</span>"; 
	
		
				//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
				displayReply += "<div class='lcmnet-ah34-od'>"
							 + "  <h6 class='replyUserName lcmnt-ah3'>";
				 if(forUserNickName == null){
					 displayReply +=	forUserName;
				 }else if(forUserNickName != null){
					 displayReply +=	forUserNickName;
 				 }
				 displayReply +="</h6>"
				 				
							  +"<h6 class='replyRegDate lcmnt-ah4'>"+forReplyRegDate+"</h6>"
							  +"</div>";
		
				
				if(sessionUserId  == forUserId && purchaseCheck == 1){ 
					displayReply 	+="<div class='button-reply-wrapper'>";
					displayReply	+="<button class='replyDelete_Button btn btn-outline-basic m-1 button-reply' id='replyDelete_Button'>삭제</button>";
					displayReply	+="<button class='replyUpdate_Button btn btn-basic m-1 button-reply' id='replyUpdate_Button'>수정</button>";
					displayReply	+="</div>";
				}	  
				
				displayReply	+="</div>"
				
					+"<div class='reply_Content lcmnt-span'>"+forReplyContent+"</div>";
				//+"</div>";
					
				replyDiv.eq(i).html(displayReply);
				//replyDiv.eq(i).find(".lcmnt-winf").html(displayReply);
		} ///////////////////////////////for
		
		console.log('hidden_replyContent ? :' + replyContent);
 		
		var updateReply = "";
				
		  		//<!-- 작성 정보 -->
		  		updateReply += "<div class='lcmnt-winf'>"	
		
				//<!-- 프로필 사진 -->
		  				+"<span class='lcmnt-fpiod-reply'>";
 				//if(reply_userprofileImag == null){
					updateReply +=	"<img src='/resources/image/logo/unnamed.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";
				//}else if(reply_userprofileImag != null){
					//updateReply +=	reply_userprofileImag;	    	  			
				//	updateReply +=	"<img src='/resources/image/logo/"+reply_userprofileImag+"' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";	    	  			
				//}	 
					
 					updateReply +="</span>";
							
 				//var content =  replyContent.replace('<br>','\n');
			
				//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
					updateReply += "<div class='lcmnet-ah34-od'>"
 							 + "<h6 class='replyUserName lcmnt-ah3'>";
			 		if(hidden_reply_usernickName == null){
			 			updateReply +=	hidden_reply_username;
			 		}else if(hidden_reply_usernickName != null){
						updateReply +=	hidden_reply_usernickName;
			 		}
		 			     updateReply +="</h6>"
		 					+"<h6 class='replyRegDate lcmnt-ah4'>"+forReplyRegDate+"</h6>"
		 					+"</div>"
		 					
		 					+"<div class='button-reply-wrapper'>"
		 					+	"<button class='update_reply_Before_Button btn btn-outline-basic m-1 button-reply' id='update_reply_Before_Button'>취소</button>"
		 					+	"<button class='update_reply_Update_Button btn btn-basic m-1 button-reply' id='update_reply_Update_Button'>수정</button>"	
		 					+"</div>"
		 			+"</div>"
		 					
 		 			+"<div class='reply_write_div lcmnt-form-od'>"	
						+"  <textarea class='replyInput lcmnt-tf-textarea' id='replyInput' name='replyInput' placeholder='댓글을 입력하세요'>"
						//+ replyContent
						+ resultReplyContent
						+ "</textarea>"
     		//<!-- 등록버튼 등록버튼 -->                                                                                                                                                                                                                     <br>
						 +" <div class='lcmnt-bs-d'>"
						 +"		<span class='lcmnt-bs-i'>"
						 +"			<svg width='24' height='24' viewBox='0 0 24 24'>"	
						 +"				<path fill='#858a8d' fill-rule='evenodd' d='M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z'>"
						 +"				</path>"
						 +"			</svg>"
						//+	"<button class='update_reply_Update_Button btn btn-basic m-1 button-reply' id='update_reply_Update_Button'>수정</button>"	//=> 아이콘으로 바꿔서 넣기
						 +"		</span>"	
				 		+" </div>"
       				 +"</div>"//<!-- reply_write_div 끝 -->
       				// +"</form>"  
       				 
       				 
 			  			+"<input type='hidden' class='hidden_replyNo' value='" + replyNo + "'>"
 			  			+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+replyContent+"'/>"
 						+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+forUserProfileImage+"'/>"
 						+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+hidden_reply_username+"'/>"
 						+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+hidden_reply_usernickName+"'/>"
 						+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+forReplyRegDate+"'/>"
 						+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+forUserId+"' />";
       			
       				// thisButton.parents('.reply_div').html(updateReply);
       				 $('.reply_div').eq(index).html(updateReply);
       				 
       				
       				

	})//댓글수정버튼 function
	
	
	//수정화면에서 수정버튼 클릭시 BUTTON4-1
		$(document).on("click", "#update_reply_Update_Button", function() {
			var replyNo = $(this).parents('.reply_div').find('.hidden_replyNo').val();
			//var updateContent = $(this).parents('.reply_write_div').find('textarea').val();
			var updateContent = $(this).parents('.lcmnt-winf').next().find('textarea').val();
			var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
			var thisOuterDiv = $(this).parents('.outer_div');
			
			/// \n ==> <br> 로 바꾸는 정규표현식
			var updateContent = updateContent.replace(/(\n|\r\n)/g, '<br>');
			console.log('정규표현식 후 replyContent ? :' + updateContent);
			
			console.log('updateContent------>:'+updateContent);
			console.log('replyNo'+replyNo);
			$(this).parents('.reply_div').find('textarea').val("");
			
			//$("."+articleNo+"").html(updateContent); //실험
			
			fn_updateReply(replyNo, updateContent, articleNo, thisOuterDiv);

		})
		
		//취소버튼 클릭시 BUTTON4-2
		$(document).on("click", "#update_reply_Before_Button", function() {
			
			var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
			//alert('articleNo--'+articleNo);
			
			var thisOuterDiv = $(this).parents('.outer_div');
			fn_getCommunityReplyList(articleNo, thisOuterDiv);

		})
	
	
	
	///댓글 삭제 버튼 클릭시 BUTTON5
	$(document).on("click", "#replyDelete_Button", function() {
		var replyNo = $(this).parents('.reply_div').find('.hidden_replyNo').val();
		console.log('hidden_replyNo ? :' + replyNo); 
		
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('articleNo ? :' + articleNo);
		
		var thisOuterDiv = $(this).parents('.outer_div');

		
		fn_deleteReply(replyNo, articleNo, thisOuterDiv);
	})
	
	
	///댓글등록 버튼 클릭시 BUTTON6
	$(document).on("click", "#addReply_Button", function() {	
		
		var purchaseCheck = $("input[id='hidden_purchaseCheck']").val();
		//alert("purchaseCheck-->"+purchaseCheck);
		//구매 회원 체크
		if(purchaseCheck == '0'){
			swal.fire("클래스 구매 후 이용해주세요", "비구매 회원은 댓글을 등록할 수 없습니다 :)", "error");
			$(this).parents('.reply_write_div').find('textarea').val("");
			return;
		}else{
		
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('articleNo ? :' + articleNo);
	
		var replyContent = $(this).parents('.reply_write_div').find('textarea').val();
		/// \n ==> <br> 로 바꾸는 정규표현식
		var result_replyContent = replyContent.replace(/(\n|\r\n)/g, '<br>');
		console.log('정규표현식 후 replyContent ? :' + result_replyContent);
		
		var thisOuterDiv = $(this).parents('.outer_div');
		
			if(replyContent == null || replyContent.length<1){
				alert("댓글내용을 입력해주세요.");
				return;
			} 
		
		$(this).parents('.reply_write_div').find('textarea').val("");
		
		fn_addReply(articleNo, result_replyContent, thisOuterDiv);
		
		}//구매회원체크 if
	})
	
	
	});//function ==// BUTTON click
	
	
	/*
	* 댓글 등록하기(Ajax)
	*/
	 function fn_addReply(articleNo, replyContent, thisOuterDiv){
	
		 var hobbyClassNo =$('#hidden_hobbyClassNo').val();
		 console.log('hobbyClassNo ? :' + hobbyClassNo);
	 	
		 var sessionUserId =$('.hidden_session_userId').val();
		 console.log('sessionUserId ? :' + sessionUserId);  
		
		 
		 var user = {
					"userId" : sessionUserId
			};
			
			var hobbyClass = {
					"hobbyClassNo" : hobbyClassNo
			};
			
			var article = {
					"articleNo" : articleNo, //==>refNo 될 것
					"hobbyClass" : hobbyClass
			}; //=>Reply.java에  Article이 필드로 들어있으므로 이렇게 필요한 값 쓰고 Reply에 매핑. 
			
			var reply = {
			
			"article" : article,
			"replyContent": replyContent,
			"user" : user
			};
			
			//alert("댓글 등록 ajax진입");	
		    $.ajax(
		    		{
		        url : "/community/json/addCommunityReply",
		        method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType: "json", 
				data : JSON.stringify(reply),
		        success : function(data){
		        	if(data.success=="200"){
		        		swal.fire({
		        			  title: '등록완료!',
		        			  text: 'Get취미IfYouCAN',
		        			  imageUrl: '/resources/image/logo/logo-favicon.png'
		        			}).then((result) => {
		        				fn_getCommunityReplyList(articleNo, thisOuterDiv);
		        			});
		        		
		        	
		        	}//if
		        },
		        error:function(request,status,error){
		            //alert("ajax과정 실패");
		       }//error
		        
		    });//ajax
	
	 };//function
	 
	 
	/*
	* 댓글 삭제하기(Ajax)
	*/	
		function fn_deleteReply(replyNo, articleNo, thisOuterDiv){
	
			var reply = {
					"replyNo" : replyNo
			};

		    $.ajax(
		    		{
		        		url :  "/community/json/deleteReply",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType: "json", 
						data : JSON.stringify(reply),
						success : function(data){
				        	if(data.success=="200"){
				        		
					        		fn_getCommunityReplyList(articleNo, thisOuterDiv);
					        		
					        		swal.fire({
					        			  title: '삭제완료!',
					        			  text: 'Get취미IfYouCAN',
					        			  imageUrl: '/resources/image/logo/logo-favicon.png'
					        			});
				        	}//if
				        },//success
				        error:function(request,status,error){
				            //alert("ajax과정 실패");
				       }//error
						
					});//ajax
	};//function fn_deleteReply
	
	
	
	/*
	* 댓글 수정하기(Ajax)
	*/	
		function fn_updateReply(replyNo, updateContent, articleNo, thisOuterDiv){
			console.log('updateContent--'+updateContent);
			//alert('updateContent--'+updateContent);
			//alert('replyNo--'+replyNo);
			var reply = {
					"replyNo" : replyNo,
					"replyContent": updateContent
				};
		
			$.ajax(
					{
						url : "/community/json/updateReply",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType: "json", 
						data : JSON.stringify(reply),
						success : function(data){
				        	if(data.success=="200"){
				        		swal.fire({
				        			  title: '수정완료!',
				        			  text: 'Get취미IfYouCAN',
				        			  imageUrl: '/resources/image/logo/logo-favicon.png'
				        			});
				        		
				        		fn_getCommunityReplyList(articleNo, thisOuterDiv);
				        	}
				        },
				        error:function(request,status,error){
				            //alert("ajax과정 실패");
				       }
					
				});//ajax
		
	};//function
	
	
	/*
	* 댓글 목록불러오기
	*/	
	function fn_getCommunityReplyList(articleNo, thisOuterDiv){

		var sessionUserId = $('.hidden_session_userId').val();
		console.log('getCommunityReplyList의 세션 userId---'+sessionUserId);
		
		var purchaseCheck = $("input[id='hidden_purchaseCheck']").val();
		console.log('purchaseCheck-->'+purchaseCheck);
		
		 $.ajax(
		    		{
		        url : "/community/json/getReplyListUnderArticle/"+articleNo,
		    	method:"GET",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
		        dataType : "json",
		        success : function(data){
		        	
		        	var displayReply = "";
		            var count = data.length; 
		            var totalReplyCount = data.totalCountCommunityReply+"개의 댓글";
		            
		            	console.log('run');
		            	
		            	for(var i=0; i<data.list.length; i++){

		            		
		            		displayReply +=	"<div class='reply_div'>"
    							+  "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+data.list[i].replyNo+"'/>"
    							+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+data.list[i].replyContent+"'/>"
    							+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+data.list[i].user.profileImage+"'/>"
    							+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+data.list[i].user.name+"'/>"
    							+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+data.list[i].user.nickName+"'/>"
    							+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+data.list[i].regDate+"'/>"
    							+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+data.list[i].user.userId+"' />";

    								//+"==>"+(i+1)+"번째 댓글 No: "+data[i].replyNo;
    					
    							//<!-- 작성 정보 -->	
    							displayReply +=	"<div class='lcmnt-winf'>";
    								//<!-- 프로필 사진 -->
    								if(data.list[i].user.profileImage == null){
    							displayReply +=	"<span class='lcmnt-fpiod-reply'>";	
    									displayReply +=	"<img src='/resources/image/logo/unnamed.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";
    			    	  			}else if(data.list[i].user.profileImage != null){
    			    	  				//displayReply +=	data.list[i].user.profileImage;	    	  			
    			    	  				displayReply +=	"<img src='/resources/image/logo/"+data.list[i].user.profileImage+"' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 22px; width: 22px;'>";	    	  			
    			    	  			}	
    							displayReply += "</span>";
    						
    							
    							//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
    							displayReply +=	"<div class='lcmnet-ah34-od'>"
    								 		+ "<h6 class='replyUserName lcmnt-ah3'>";
    			    				 if(data.list[i].user.nickName == null){
    			    					 displayReply +=	data.list[i].user.name;
    			    				 }else if(data.list[i].user.nickName != null){
    			    					 displayReply +=	data.list[i].user.nickName;
    			     				 }
    			    				 displayReply +="</h6>"
    			     				 
    					
    						
    									+"<h6 class='replyRegDate lcmnt-ah4'>"+data.list[i].regDate+"</h6>"
    									+"</div>";
    								

									if(sessionUserId  == data.list[i].user.userId && purchaseCheck == 1){
										displayReply	+="<div class='button-reply-wrapper'>";
										displayReply	+="<button class='replyDelete_Button btn btn-outline-basic m-1  button-reply' id='replyDelete_Button'>삭제</button>";
										displayReply	+="<button class='replyUpdate_Button btn btn-basic m-1 button-reply' id='replyUpdate_Button'>수정</button>";
										displayReply	+="</div>";
									}	    						
    					
    								displayReply	+="</div>"	
    									+"<div class='reply_Content lcmnt-span'>"+data.list[i].replyContent+"</div>";
									displayReply	+="</div>";//<!-- reply_div 끝 -->
		            		
		            		
		            	}//for
		            		
		            	//$("."+articleNo+"").html(displayReply);
		            	
		            	thisOuterDiv.find('.outer_reply_div').html(displayReply);
		            	thisOuterDiv.find('.reply_totalReport_div').html(totalReplyCount);
		
		        
		        },//success
		        error:function(request,status,error){
		        	//alert("ajax  실패 getCommunityReplyList");
		       }//error 
		        
		    });//ajax
		        
	};//function
	
	$(function(){
		
		// 등록 버튼 활성화
		$(document).on("change keyup paste","textarea", function(){
			
			if( $(this).val().length > 0 ){
				$(".lcmnt-bs-i").css("cursor","pointer");
				$(".lcmnt-bs-b").css("cursor","pointer");
			}else if( $(this).val().length < 1 ){
				$(".lcmnt-bs-i").css("cursor","not-allowed");
				$(".lcmnt-bs-b").css("cursor","not-allowed");
			}
		});
		
	});
	</script>
	</head>
	<!-- ////////////////////////////////////////////////////////========HEAD 끝==========/////////////////////////////////////////////////////////// -->
	<body class="listcommunity-body-class">
															<!-- toolbar -->
													<jsp:include page="/common/header.jsp"/>
				
	<div class="container mt-5">
	
		<div class="lcmnt-top-out-div">
			<h3 class="lcmnt-top-h3">커뮤니티  <small class="lcmnt-top-small">${resultPage.totalCount}개의 글</small></h3>
			<button id="WriteArticleButton" type="button" class="btn btn-basic m-1 lcmnt-addwrite-button">글 작성하기</button>
		</div>
			
			
			<!-- ////// INPUT HIDDEN /////////// -->	
			<input type="hidden" name="hidden_hobbyClassNo" id="hidden_hobbyClassNo" value="${hobbyClassNo}">	
			<input type="hidden" name="hidden_purchaseCheck" id="hidden_purchaseCheck" value="${purchaseCheck }">	
			<input type="hidden" name="hidden_totalCount" id="hidden_totalCount" value="${resultPage.totalCount}">	
			<input type="hidden" name="hidden_session_userId" id="hidden_session_userId" class="hidden_session_userId" value="${sessionUser.userId}">
			<input type="hidden" name="hidden_session_name" id=hidden_session_name class="hidden_session_name" value="${sessionUser.name}">
			<input type="hidden" name="hidden_session_profileImage" id="hidden_session_profileImage" class="hidden_session_profileImage" value="${sessionUser.profileImage}">
			<input type="hidden" name="hidden_session_nickName" id="hidden_session_nickName" class="hidden_session_nickName" value="${sessionUser.nickName}">
			<input type="hidden" name="hidden_CreatorName" id="hidden_CreatorName" value="${creatorName}">	
			
	

			<c:set var="i" value="1"/>
			<c:forEach var="articleList" items="${articleList}" varStatus="status">
			<div class="outer_div">
				
				<!-- ////// ARTICLE INPUT HIDDEN /////////// -->	
				<input type="hidden" class="hidden_articleNo" id="hidden_articleNo" value="${articleList.articleNo }" />
			
				<div class="article_div">
				
					<!-- ${i}번째 글 No: ${articleList.articleNo} -->
					
					
					<!-- 작성 정보 -->
					<div class="lcmnt-winf">
					
						<!-- 프로필 사진 -->
						<span class="lcmnt-fpiod">
							<c:if test="${articleList.user.profileImage == null }">
								<img src="/resources/image/logo/unnamed.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
							<c:if test="${articleList.user.profileImage != null }">
								<img src="/resources/image/logo/${articleList.user.profileImage}" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
						</span>
						
						<!-- 작성자, 작성날짜 -->
						<div class="lcmnet-ah34-od">
							<!-- default가 닉네임 => 없으면 이름으로 표시 -->
							<h3 class="lcmnt-ah3">
							<c:if test="${articleList.user.nickName == null}">
								${articleList.user.name}
							</c:if>
							<c:if test="${articleList.user.nickName != null}">
								${articleList.user.nickName}
							</c:if>
							</h3>
							
							<h4 class="articleRegDate lcmnt-ah4">${articleList.regDate}</h4>
						</div>
					</div>	
					
						<span class="article_Content lcmnt-span">							
							${articleList.articleContent}
						</span>
	
				</div><!-- article_div 끝 -->
				
				
				<!-- 댓글 갯수 div -->
				</br>
				<div class="reply_totalReport_div lcmnt-ah4_totalReport">
					${articleList.totalReport}개의 댓글 
				</div>
				
				
				<c:set var="j" value="1"/>
				<div class="outer_reply_div" >
				
				    <c:forEach var="array" items="${array[i-1]}">
					<div class="reply_div" >

					
						<!-- ////// INPUT HIDDEN /////////// -->	
						<input type="hidden" class="hidden_replyNo" id="hidden_replyNo" value="${array.replyNo}" />
						<input type="hidden" class="hidden_replyContent" id="hidden_replyContent" value="${array.replyContent}" />
						<input type="hidden" class="hidden_reply_userprofileImage" id="hidden_reply_userprofileImage" value="${array.user.profileImage}" />
						<input type="hidden" class="hidden_reply_username" id="hidden_reply_username" value="${array.user.name}" />
						<input type="hidden" class="hidden_reply_userId" id="hidden_reply_userId" value="${array.user.userId}" />
						<input type="hidden" class="hidden_reply_usernickName" id="hidden_reply_usernickName" value="${array.user.nickName}" />
						<input type="hidden" class="hidden_reply_regDate" id="hidden_reply_regDate" value="${array.regDate}" />
						<input type="hidden" class="hidden_reply_totalReport" id="hidden_reply_totalReport" value="${array.totalReport }">

					  <!-- 작성 정보 -->
					 <div class="lcmnt-winf">	
					   
						
						<!-- 프로필 사진 -->
						<span class="lcmnt-fpiod-reply">
						<c:if test="${array.user.profileImage == null }">
							<img src="/resources/image/logo/unnamed.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 22px; width: 22px;">
						</c:if>
						<c:if test="${array.user.profileImage != null }">
							
							<img src="/resources/image/logo/${array.user.profileImage }" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 22px; width: 22px;">
						</c:if>
						</span>
						
						<!-- default가 닉네임 => 없으면 이름으로 표시 -->
						<div class="lcmnet-ah34-od">	
							<h6 class="replyUserName lcmnt-ah3">
							<c:if test="${array.user.nickName == null}">
							${array.user.name }
							</c:if>
							<c:if test="${array.user.nickName != null}">
							${array.user.nickName }
							</c:if>
							</h6>
							
							<h6 class="replyRegDate lcmnt-ah4">${array.regDate}</h6>
							
						</div>
						
						
						<div class="button-reply-wrapper"> <!-- 사망각 -->
							<c:if test="${sessionUser.userId == array.user.userId && purchaseCheck == 1}"> <!-- 댓글 쓴 사람이름이 세션이름이랑 같으면 -->
								<button class="replyDelete_Button btn btn-outline-basic m-1 button-reply" id="replyDelete_Button">삭제</button>
								<button class="replyUpdate_Button btn btn-basic m-1 button-reply" id="replyUpdate_Button">수정</button>
							</c:if>
							<c:if test="${sessionUser.userId == creatorName && purchaseCheck == 1 }"> <!-- 크리에이터면  -->
								<button class="creator_replyDelete_Button btn btn-outline-basic m-1 button-reply" id="creator_replyDelete_Button">처리</button>
							</c:if>
						</div> <!-- 사망각 -->
							
						
						
					</div>
						
						<%-- <span class="reply_Content lcmnt-span">${array.replyContent}</span> --%>
						<div class="reply_Content lcmnt-span">${array.replyContent}</div>
						
						
				  </div><!-- reply_div 끝 -->
					
				<c:set var="j" value="${j+1}"/>	
				</c:forEach>
				
				</div>
				
				
				<form id="textarea-form">
					<div class="reply_write_div lcmnt-form-od">
						
								<!-- 프로필 사진 -->
								<div class="lcmnt-form-fid">
									<span class="lcmnt-form-fis">
										<c:if test="${articleList.user.profileImage == null }">
										<img class="lcmnt-form-fi" src="/resources/image/logo/unnamed.jpg">
										</c:if>
										<c:if test="${articleList.user.profileImage != null }">
										<img class="lcmnt-form-fi" src="/resources/image/logo/${articleList.user.profileImage}">
										</c:if>
									</span>
								</div>
	                            <textarea class="replyInput lcmnt-tf-textarea" id="replyInput" name="replyInput" placeholder="댓글을 입력해주세요."></textarea>
	                             <!-- 등록버튼 등록버튼 -->                                                        
	                            <div class="lcmnt-bs-d">
	                                <button type="button" id="addReply_Button" class="addReply_Button btn btn-basic m-1 lcmnt-bs-b">
		                               	<span class="lcmnt-bs-i">
			                               	<svg width="24" height="24" viewBox="0 0 24 24">
				                               	<path fill="#858a8d" fill-rule="evenodd" d="M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z">
				                               	</path>
			                               	</svg>
		                               	</span>
	                                </button>
	                            </div>
					
				</div><!-- reply_write_div 끝 -->
				</form>
				
			</div><!-- outer_div 끝 -->
			
			<hr>
			<c:set var="i" value="${i+1}"/>	
			</c:forEach>
			
			<div class="more_div">
			
			
			
			
			</div>
	
			<c:if test="${resultPage.totalCount > 10}">
			<!-- 더보기버튼 -->
			<div class="moreCommunity_Button d-flex justify-content-center">
			<button type="button" class="btn btn-basic m-1 more_button " style="size: 20px" id="moreCommunity_Button">더보기</button>
			</div>
			</c:if>
			
	
	</div> 
	
	<span class="sol-to-the-top shadow">
         <i class="fas fa-arrow-up"></i>
    </span>
	
	
	   	</br>
    	</br>
    	</br>
    	</br>
  	<jsp:include page="/common/footer.jsp" />
	

</body>
</html>