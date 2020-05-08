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

    <!-- 메인 메뉴 CSS -->
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 메인 메뉴 js -->
    <script src="/resources/javascript/header.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<style type="text/css">
    .btn-basic {
        background-color: #F2B33D;
        color: white;
    }

    .btn-basic:hover {
        background-color: #F2D64B;
        color: white;

    }
    
    .btn-outline-basic {
        border: 1px solid #F2B33D;
        color: #F2B33D;
    }
    
    .btn-outline-basic:hover {
        background-color: #F2B33D;
        color: white;
    }
	
    </style>
	<script type="text/javascript">
	
	var currentPage = 1;

	
	
	$(function() {
	
	/////더보기버튼 클릭시 BUTTON1
	$(document).on("click", "#moreCommunity_Button", function() {
	
		currentPage += 1;
		var hobbyClassNo = $("input:hidden[name=hidden_hobbyClassNo]").val();
		var totalCount =  $("input:hidden[name=hidden_totalCount]").val();
		var sessionUserId = $("input:hidden[name='hidden_session_userId']").val();
		var sessionProfileImage = $("input:hidden[name='hidden_session_profileImage']").val();
		
		alert('hobby'+hobbyClassNo);
		alert('sessionUserId'+sessionUserId);
		alert('sessionProfileImage'+sessionProfileImage);
		
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
					
					for(var i=0; i<data.articleList.length; i++){
					
	        			//var no = i+11; 
	        			var no = (currentPage-1)*10 +(i+1); 
	        			
	        			moreCommunity += "<div class='outer_div'>";
	    				
	    				<!-- ////// ARTICLE INPUT HIDDEN /////////// -->	
	    				moreCommunity +=	"<input type='hidden' class='hidden_articleNo' id='hidden_articleNo' value='"+data.articleList[i].articleNo+"'/>"
	    			
	    									+"<div class='article_div'>"
	    				
	    									+no+"번째 글 No: "+data.articleList[i].articleNo;
	    					<!-- 프로필 사진 -->
	    					if(data.articleList[i].user.profileImage == null){
	    				moreCommunity +=	"<img src='/resources/image/min/default-profile.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 40px; width: 50px;'>";
	    	  				 }else if(data.articleList[i].user.profileImage != null){
	    	  			moreCommunity +=	data.articleList[i].user.profileImage;	    	  			
	    	  				}	
	    					
	    					<!-- default가 닉네임 => 없으면 이름으로 표시 -->
		     				 if(data.articleList[i].user.nickName == null){
		     			moreCommunity +=	data.articleList[i].user.name;
		     				 }else if(data.articleList[i].user.nickName != null){
		     			moreCommunity +=	data.articleList[i].user.nickName;
		     				 }
	    				
	    					
		     			moreCommunity +="	<h6 class='articleRegDate'>"+data.articleList[i].regDate+"</h6>"
	    						
	    								+"	<span class='article_Content'><h5>"+data.articleList[i].articleContent+"</h5></span>"
	    	
	    								+"</div>";<!-- article_div 끝 -->
	    				
	    			moreCommunity +=	"<div class='outer_reply_div'>";
	    						for(var j=0; j<data.array[i].length; j++){
	    				        			
	    							var reply_no = j+1;
	    					
	    							<!-- ////// INPUT HIDDEN /////////// -->	
	    				
	    			moreCommunity +=	"<div class='reply_div'>"
	    							+  "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+data.array[i][j].replyNo+"'/>"
	    							+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+data.array[i][j].replyContent+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+data.array[i][j].user.profileImage+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+data.array[i][j].user.name+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+data.array[i][j].user.nickName+"'/>"
	    							+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+data.array[i][j].regDate+"'/>"
	    							+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+data.array[i][j].user.userId+"' />"


	    								+"==>"+reply_no+"번째 댓글 No: "+data.array[i][j].replyNo;
	    					
	    								<!-- 프로필 사진 -->
	    								if(data.array[i][j].user.profileImage == null){
	    			   moreCommunity +=	"<img src='/resources/image/min/default-profile.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 40px; width: 50px;'>";
	    			    	  			}else if(data.array[i][j].user.profileImage != null){
	    			   moreCommunity +=	data.array[i][j].user.profileImage;	    	  			
	    			    	  			}	
	    					
	    						
	    								<!-- default가 닉네임 => 없으면 이름으로 표시 -->
	    				moreCommunity += "<h6 class='replyUserName'>";
	    			    				 if(data.array[i][j].user.nickName == null){
	    			     moreCommunity +=	data.array[i][j].user.name;
	    			    				 }else if(data.array[i][j].user.nickName != null){
	    			     moreCommunity +=	data.array[i][j].user.nickName;
	    			     				 }
	    			     moreCommunity +="</h6>"
	    			     				 
	    					
	    						
	    								+"	<h6 class='replyRegDate'>"+data.array[i][j].regDate+"</h6>"
	    						
	    								+"<span class='reply_Content'><h5>"+data.array[i][j].replyContent+"</h5></span>";
	    								

										if(sessionUserId  == data.array[i][j].user.userId){
						moreCommunity	+="<button class='replyDelete_Button btn btn-outline-basic m-1' id='replyDelete_Button'>삭제</button>";
	    				moreCommunity	+="<button class='replyUpdate_Button btn btn-basic m-1' id='replyUpdate_Button'>수정</button>";
										}	    						
	    						
						moreCommunity	+="</div>";<!--// reply_div 끝 -->
	    					
	    							<!--+"<c:set var="j" value="${j+1}"/>"	-->
	    						}//inner-for
						moreCommunity	+="</div>";//<!--// reply_div 끝 -->
	    							
	    				moreCommunity	+="<div class='reply_write_div'>"
	    									+"<table class='table'>" 
	    									+"<tr>"
	    									+"  <textarea style='width: 800px' rows='3' cols='30' class='replyInput' id='replyInput' name='replyInput' placeholder='댓글을 입력하세요'></textarea>"
	                                 <!-- //등록버튼 등록버튼 -->                                                                                                                                                                                                                     <br>
	                           				 +"  <div>"
	                           				 +" <a id='addReply_Button' class='addReply_Button btn btn-basic m-1'>등록</a>"
	                           				 +" </div>"
	                             			 +"</tr>"
	                             			  +"</table>"
	                                    +"</div>"<!-- //reply_write_div 끝 -->
	    				
	                             +"</div>"<!--// outer_div 끝 -->
	        			
	                             +"<hr>";	
	        			
	        			
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
		
		//alert('글작성하기버튼');
		//로그인 정보는 세션에서 가져가고
		//클래스No는 input으로 Form전송으로 변경할 것
		self.location = "/community/addCommunityArticle.jsp";
	})//글작성하기 function
	
	
	///글내용 클릭시 BUTTON3 
	$(document).on("click", ".article_Content", function() {
		
		alert('상세보기버튼');
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('hidden_articleNo ? :' + articleNo);
		
		self.location = "/community/getCommunity?articleNo="+articleNo;

	})//글상세보기 function
	
	
	///댓글수정 버튼 클릭시 BUTTON4
	$(document).on("click", "#replyUpdate_Button", function() {

		//alert('수정');
		var replyNo = $(this).parents('.reply_div').find('.hidden_replyNo').val();
		console.log('hidden_replyNo ? :' + replyNo);
		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('articleNo ? :' + articleNo);
		 
		var sessionUserId =$('.hidden_session_userId').val();
		
		var replyContent = $(this).parents('.reply_div').find('.hidden_replyContent').val();
		console.log('hidden_replyContent ? :' + replyContent);
		
		
		var reply_userprofileImag = $(this).parents('.reply_div').find('.hidden_reply_userprofileImage').val();
		console.log('hidden_reply_userprofileImage ? :' + reply_userprofileImag);
		var hidden_reply_username = $(this).parents('.reply_div').find('.hidden_reply_username').val();
		console.log('hidden_reply_username ? :' + hidden_reply_username);
		var hidden_reply_usernickName = $(this).parents('.reply_div').find('.hidden_reply_usernickName').val();
		console.log('hidden_reply_usernickName ? :' + hidden_reply_usernickName);
		
		var thisOuterDiv = $(this).parents('.outer_div');
		
		var replyDiv = $(this).parents('.outer_reply_div').find('.reply_div');
		
	
		
		var index = $('.reply_div').index( $(this).parents('.reply_div') );
		console.log('--------------'+index);

		
		for( var i = 0; i < replyDiv.length; i++ ) {
			var forReplyNo = replyDiv.eq(i).find('.hidden_replyNo').val(); 
			var forReplyContent = replyDiv.eq(i).find('.hidden_replyContent').val(); 
			var forUserProfileImage = replyDiv.eq(i).find('.hidden_reply_userprofileImage').val(); 
			var forUserName = replyDiv.eq(i).find('.hidden_reply_username').val(); 
			var forUserId = replyDiv.eq(i).find('.hidden_reply_userId').val(); 
			var forUserNickName = replyDiv.eq(i).find('.hidden_reply_usernickName').val(); 
			var forReplyRegDate = replyDiv.eq(i).find('.hidden_reply_regDate').val(); 
			
			console.log('i ? : ' + i + ' / ' + forReplyContent + ' / ' + forReplyRegDate);
			
			var displayReply = "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+forReplyNo+"'/>"
			+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+forReplyContent+"'/>"
			+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+forUserProfileImage+"'/>"
			+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+forUserName+"'/>"
			+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+forUserNickName+"'/>"
			+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+forReplyRegDate+"'/>"
			+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+forUserId+"' />"


				+"==>"+(i+1)+"번째 댓글 No: "+forReplyNo;
	
				<!-- 프로필 사진 -->
				if(forUserProfileImage== null){
					displayReply +=	"<img src='/resources/image/min/default-profile.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 40px; width: 50px;'>";
	  			}else if(forUserProfileImage != null){
	  				displayReply +=	forUserProfileImage;	    	  			
	  			}	
	
		
				<!-- default가 닉네임 => 없으면 이름으로 표시 -->
				displayReply += "<h6 class='replyUserName'>";
				 if(forUserNickName == null){
					 displayReply +=	forUserName;
				 }else if(forUserNickName != null){
					 displayReply +=	forUserNickName;
 				 }
				 displayReply +="</h6>"
 				 
	
		
				+"	<h6 class='replyRegDate'>"+forReplyRegDate+"</h6>"
		
				+"<span class='reply_Content'><h5>"+forReplyContent+"</h5></span>";
				

				if(sessionUserId  == forUserId){
					displayReply	+="<button class='replyDelete_Button btn btn-outline-basic m-1' id='replyDelete_Button'>삭제</button>";
					displayReply	+="<button class='replyUpdate_Button btn btn-basic m-1' id='replyUpdate_Button'>수정</button>";
				}	  
				
				replyDiv.eq(i).html(displayReply);
		} ///////////////////////////////
		
		console.log('hidden_replyContent ? :' + replyContent);
 		var updateReply = "";
			//<!-- 프로필 사진 -->
			if(reply_userprofileImag == null){
				updateReply +=	"<img src='/resources/image/min/default-profile.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 40px; width: 50px;'>";
			}else if(reply_userprofileImag != null){
				updateReply +=	reply_userprofileImag;	    	  			
			}	


			//<!-- default가 닉네임 => 없으면 이름으로 표시 -->
				updateReply += "<h6 class='replyUserName'>";
			 if(hidden_reply_usernickName == null){
			 	updateReply +=	hidden_reply_username;
			 }else if(hidden_reply_usernickName != null){
				updateReply +=	hidden_reply_usernickName;
			 }
		 		updateReply +="</h6>";
 
 
			updateReply	+="<div class='reply_write_div'>"
						+"<table class='table'>" 
						+"<tr>"
						+"  <textarea style='width: 800px' rows='3' cols='30' class='replyInput' id='replyInput' name='replyInput' placeholder='댓글을 입력하세요'>"
						+ replyContent
						+ "</textarea>"
     		//<!-- 등록버튼 등록버튼 -->                                                                                                                                                                                                                     <br>
					 	+"  <div>"
						 +" <a id='update_reply_Update_Button' class='update_reply_Update_Button btn btn-basic m-1'>수정</a>"
						 +" <a id='update_reply_Before_Button' class='update_reply_Before_Button btn btn-basic m-1'>취소</a>"
				 		+" </div>"
 						 +"</tr>"
 			  			+"</table>"
 			  			+"<input type='hidden' class='hidden_replyNo' value='" + replyNo + "'>"
 			  			+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+replyContent+"'/>"
 						+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+forUserProfileImage+"'/>"
 						+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+hidden_reply_username+"'/>"
 						+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+hidden_reply_usernickName+"'/>"
 						+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+forReplyRegDate+"'/>"
 						+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+forUserId+"' />"
       				 +"</div>";//<!-- reply_write_div 끝 -->
       			
       				// thisButton.parents('.reply_div').html(updateReply);
       				 $('.reply_div').eq(index).html(updateReply);
       				 
       				
       				

	})//댓글수정버튼 function
	
	
	//수정버튼 클릭시 BUTTON4-1
		$(document).on("click", "#update_reply_Update_Button", function() {
			var replyNo = $(this).parents('.reply_div').find('.hidden_replyNo').val();
			var updateContent = $(this).parents('.reply_write_div').find('textarea').val();
			var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
			var thisOuterDiv = $(this).parents('.outer_div');
			
			//console.log('updateContent:'+updateContent);
			console.log('replyNo'+replyNo);
			$(this).parents('.reply_div').find('textarea').val("");
			
			//$("."+articleNo+"").html(updateContent); //실험
			
			fn_updateReply(replyNo, updateContent, articleNo, thisOuterDiv);

		})
		
		//취소버튼 클릭시 BUTTON4-2
		$(document).on("click", "#update_reply_Before_Button", function() {
			
			fn_getCommunityReplyList(articleNo);

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

		var articleNo = $(this).parents('.outer_div').find('.hidden_articleNo').val();
		console.log('articleNo ? :' + articleNo);
	
		var replyContent = $(this).parents('.reply_write_div').find('textarea').val();
		console.log('replyContent ? :' + replyContent);
		
		var thisOuterDiv = $(this).parents('.outer_div');
		
		if(replyContent == null || replyContent.length<1){
			alert("댓글내용을 입력해주세요.");
			return;
		} 
		
		$(this).parents('.reply_write_div').find('textarea').val("");
		
		fn_addReply(articleNo, replyContent, thisOuterDiv);
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
		        			});
		        		
		        	}//if
		        	fn_getCommunityReplyList(articleNo, thisOuterDiv);
		        },
		        error:function(request,status,error){
		            alert("ajax과정 실패");
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
				        		
					        		swal.fire({
					        			  title: '삭제완료!',
					        			  text: 'Get취미IfYouCAN',
					        			  imageUrl: '/resources/image/logo/logo-favicon.png'
					        			});
					        		fn_getCommunityReplyList(articleNo, thisOuterDiv);
				        	}//if
				        },//success
				        error:function(request,status,error){
				            alert("ajax과정 실패");
				       }//error
						
					});//ajax
	};//function fn_deleteReply
	
	
	/*
	* 댓글 수정하기(Ajax)
	*/	
		function fn_updateReply(replyNo, updateContent, articleNo, thisOuterDiv){
			console.log('updateContent--'+updateContent);
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
				            alert("ajax과정 실패");
				       }
					
				});//ajax
		
	};//function
	
	
	/*
	* 댓글 목록불러오기
	*/	
	function fn_getCommunityReplyList(articleNo, thisOuterDiv){

		var sessionUserId = $('.hidden_session_userId').val();
		console.log('getCommunityReplyList의 세션 userId---'+sessionUserId);
		
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
		            
		            	console.log('run');
		            	
		            	for(var i=0; i<data.length; i++){

		            		
		            		displayReply +=	"<div class='reply_div'>"
    							+  "<input type='hidden' class='hidden_replyNo' id='hidden_replyNo' value='"+data[i].replyNo+"'/>"
    							+  "<input type='hidden' class='hidden_replyContent' id='hidden_replyContent' value='"+data[i].replyContent+"'/>"
    							+  "<input type='hidden' class='hidden_reply_userprofileImage' id='hidden_reply_userprofileImage' value='"+data[i].user.profileImage+"'/>"
    							+  "<input type='hidden' class='hidden_reply_username' id='hidden_reply_username' value='"+data[i].user.name+"'/>"
    							+  "<input type='hidden' class='hidden_reply_usernickName' id='hidden_reply_usernickName' value='"+data[i].user.nickName+"'/>"
    							+  "<input type='hidden' class='hidden_reply_regDate' id='hidden_reply_regDate' value='"+data[i].regDate+"'/>"
    							+ "<input type='hidden' class='hidden_reply_userId' id='hidden_reply_userId' value='"+data[i].user.userId+"' />"

    								+"==>"+(i+1)+"번째 댓글 No: "+data[i].replyNo;
    					
    								<!-- 프로필 사진 -->
    								if(data[i].user.profileImage == null){
    									displayReply +=	"<img src='/resources/image/min/default-profile.jpg' class='RatioImage__Img-wwqqoo-1 gRslZu' style='size: 40px; width: 50px;'>";
    			    	  			}else if(data[i].user.profileImage != null){
    			    	  				displayReply +=	data[i].user.profileImage;	    	  			
    			    	  			}	
    					
    						
    								<!-- default가 닉네임 => 없으면 이름으로 표시 -->
    								displayReply += "<h6 class='replyUserName'>";
    			    				 if(data[i].user.nickName == null){
    			    					 displayReply +=	data[i].user.name;
    			    				 }else if(data[i].user.nickName != null){
    			    					 displayReply +=	data[i].user.nickName;
    			     				 }
    			    				 displayReply +="</h6>"
    			     				 
    					
    						
    								+"	<h6 class='replyRegDate'>"+data[i].regDate+"</h6>"
    						
    								+"<span class='reply_Content'><h5>"+data[i].replyContent+"</h5></span>";
    								

									if(sessionUserId  == data[i].user.userId){
										displayReply	+="<button class='replyDelete_Button btn btn-outline-basic m-1' id='replyDelete_Button'>삭제</button>";
										displayReply	+="<button class='replyUpdate_Button btn btn-basic m-1' id='replyUpdate_Button'>수정</button>";
									}	    						
    						
									displayReply	+="</div>";<!-- reply_div 끝 -->
		            		
		            		
		            	}//for
		            		
		            	//$("."+articleNo+"").html(displayReply);
		            	
		            	thisOuterDiv.find('.outer_reply_div').html(displayReply);
		            	
		
		        
		        },//success
		        error:function(request,status,error){
		        	alert("ajax  실패 getCommunityReplyList");
		       }//error 
		        
		    });//ajax
		        
		
	};//function
	</script>
	</head>
	<!-- ////////////////////////////////////////////////////////========HEAD 끝==========/////////////////////////////////////////////////////////// -->
	<body>
															<!-- toolbar -->
													<jsp:include page="/common/header.jsp"/>
				
	<div class="container mt-5">
	
		<div>
			<h1>클래스 커뮤니티총 ${resultPage.totalCount}개의 글</h1>
		</div>
			<button id="WriteArticleButton" type="button" class="btn btn-basic m-1">글 작성하기</button>
			
				
			<!-- ////// INPUT HIDDEN /////////// -->	
			<input type="hidden" name="hidden_hobbyClassNo" id="hidden_hobbyClassNo" value="${hobbyClassNo}">	
			<input type="hidden" name="hidden_totalCount" id="hidden_totalCount" value="${resultPage.totalCount}">	
			<input type="hidden" name="hidden_session_userId" id="hidden_session_userId" class="hidden_session_userId" value="${sessionUser.userId}">
			<input type="hidden" name="hidden_session_name" id=hidden_session_name class="hidden_session_name" value="${sessionUser.name}">
			<input type="hidden" name="hidden_session_profileImage" id="hidden_session_profileImage" class="hidden_session_profileImage" value="${sessionUser.profileImage}">
			<input type="hidden" name="hidden_session_nickName" id="hidden_session_nickName" class="hidden_session_nickName" value="${sessionUser.nickName}">
	
	
			<c:set var="i" value="1"/>
			<c:forEach var="articleList" items="${articleList}" varStatus="status">
			<div class="outer_div">
				
				<!-- ////// ARTICLE INPUT HIDDEN /////////// -->	
				<input type="hidden" class="hidden_articleNo" id="hidden_articleNo" value="${articleList.articleNo }" />
			
				<div class="article_div">
				
					${i}번째 글 No: ${articleList.articleNo}
					<!-- 프로필 사진 -->
					<c:if test="${articleList.user.profileImage == null }">
						<img src="/resources/image/min/default-profile.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 40px; width: 50px;">
					</c:if>
					<c:if test="${articleList.user.profileImage != null }">
						${articleList.user.profileImage }
					</c:if>
					
					<!-- default가 닉네임 => 없으면 이름으로 표시 -->
					<c:if test="${articleList.user.nickName == null}">
						${articleList.user.name }
					</c:if>
					<c:if test="${articleList.user.nickName != null}">
						${articleList.user.nickName }
					</c:if>
					
						<h6 class="articleRegDate">${articleList.regDate}</h6>
						
						<span class="article_Content"><h5>${articleList.articleContent}</h5></span>
	
				</div><!-- article_div 끝 -->
				
				
				
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
						
						
						==>${j}번째 댓글 No: ${array.replyNo}
						<!-- 프로필 사진 -->
						<c:if test="${array.user.profileImage == null }">
							<img src="/resources/image/min/default-profile.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 40px; width: 50px;">
						</c:if>
						<c:if test="${array.user.profileImage != null }">
							${array.user.profileImage }
						</c:if>
						
						<!-- default가 닉네임 => 없으면 이름으로 표시 -->
							<h6 class="replyUserName">
						<c:if test="${array.user.nickName == null}">
							${array.user.name }
						</c:if>
						<c:if test="${array.user.nickName != null}">
							${array.user.nickName }
						</c:if>
							</h6>
						
							<h6 class="replyRegDate">${array.regDate}</h6>
						
							<span class="reply_Content"><h5>${array.replyContent}</h5></span>
						
						<c:if test="${sessionUser.userId == array.user.userId}">
							<button class="replyDelete_Button btn btn-outline-basic m-1" id="replyDelete_Button">삭제</button>
							<button class="replyUpdate_Button btn btn-basic m-1" id="replyUpdate_Button">수정</button>
						</c:if>
						
					</div><!-- reply_div 끝 -->
					
				<c:set var="j" value="${j+1}"/>	
				</c:forEach>
				
				</div>
				
				
				<div class="reply_write_div">
					<table class="table"> 
                    	<tr>
                            <textarea style="width: 800px" rows="3" cols="30" class="replyInput" id="replyInput" name="replyInput" placeholder="댓글을 입력하세요"></textarea>
                             <!-- 등록버튼 등록버튼 -->                                                                                                                                                                                                                     <br>
                            <div>
                                <a id="addReply_Button" class="addReply_Button btn btn-basic m-1">등록</a>
                            </div>
                   		 </tr>
               		 </table>
				
				</div><!-- reply_write_div 끝 -->
				
			</div><!-- outer_div 끝 -->
			
			<hr>
			<c:set var="i" value="${i+1}"/>	
			</c:forEach>
			
			<div class="more_div">
			
			
			
			
			</div>
	
			<!-- 더보기버튼 -->
			<button type="button" class="btn btn-basic m-1" style="size: 20px" id="moreCommunity_Button">더보기</button>
			
	
	</div> 

</body>
</html> 