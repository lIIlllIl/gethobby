<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- //2020-02-24 Git Commit --%>
	<style>
	
		.shclm-btn-lights {
			 background-color: white;
   			 border: 0;
   			 color: black;
   			 width: 100%;
   			 height: 40px;
		}
		
		.shclm-btn_light {			 
			 width: 56px;
			 height: 40px;
		}
		
		.right-checkbox {
			position: absolute;			
			width: 50%;
			left: 50%;
			top: 5%;
		}
		
		.custom-control {			
			height: 50px;		
		}
		
		.bottom_blank {
			height: 200px;
			width: 100%;
		}
		
		.shclm-btn-lights:focus {
			border-color: black;
			box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(126, 239, 104, 0.6);
		 	outline: 0 none;
		}
		.close-lessonModal:focus {
			border: 0;
			outline: 0 none;
			background-color: red;
		}
		@media (min-width: 992px){
			.shclm-div {
				height: 506px;
			}
		}
		@media (max-width: 991px){
			.shclm-div {
				height: 410px;
			}
		}
		#exampleModalCenter {
			padding:0px !important;
		}
		
		
	</style>
</head>
<body>

	<!-- Button trigger modal -->
	<div style="background-color: rgb(255, 146, 43);">
		<button class="close-lessonModal" type="button" style="color: rgb(255, 146, 43); background-color: white; border:0;" data-toggle="modal" data-target="#exampleModalCenter">
		 강의정보
		 
		 <svg  width="12" height="12" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" stroke="rgb(255, 146, 43)"></path></svg>
		 
		</button>
	</div>
	
	<!-- Modal -->
	<div class="modal fade shclmob" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle"><b>강의정보</b></h5>
	        <button type="button" class="close shclm-cb" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		      
	      <div class="modal-body shclm-div" style="overflow-y: scroll; width:100%;">
	        
	        <c:set var="i" value="0" />
			<c:forEach var="lesson" items="${hobbyClass.lesson}">
			<c:set var="i" value="${i+1}" />   
			<input type="hidden" name="lessonNo-modal" value="${lesson.lessonNo}">
			<input type="hidden" name="lessonVideo-modal" value="${lesson.lessonVideo}">
			<input type="hidden" name="lessonTitle-modal" value="${lesson.lessonTitle}">
			<input type="hidden" name="lessonProject-modal" value="${lesson.lessonProject}">
			<input type="hidden" name="lessonIntro-modal" value="${lesson.lessonIntro}">
			<input type="hidden" name="lessonImage-modal" value="${lesson.lessonImage}">
			<div class="alert alert-light lessonIndex" role="alert">
			  ${lesson.lessonNo}. ${lesson.lessonTitle}
			</div>
			
			</c:forEach>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-lights addLesson-Button shclm-btn-lights">
	     	<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#3e4042" fill-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6z"></path></svg>   
	        	강의 추가하기</button>        
	      </div>	     
	    </div>
	  </div>
	</div>
	<script type="text/javascript">

		$(function(){
			
			// 모달창 오픈이벤트 : 현재 강의정보 저장
			$(document).on('show.bs.modal','.shclmob', function(event) {

				// 강의정보 저장 후
				$.ajax(
	    				{
	    					url: "/hobbyclass/json/saveLesson",
	    					method: "POST",
	    					data: JSON.stringify({
	    							lessonNo: $("input[name='lessonNo']").val(),
	    							hobbyClass: {hobbyClassNo : $("input[name='hobbyClassNo']").val()},
	    							lessonVideo: $("input[name='lessonVideo']").val(),
	    							lessonTitle: $("input[name='lessonTitle']").val(),
	    							lessonProject: $("input[name='lessonProject']").val(),
	    							lessonIntro: $("input[name='lessonIntro']").val(),
	    							lessonImage: $("input[name='lessonImage']").val(),
	    							lessonContent: $('#summernote2').summernote('code')
	    					}),
	    					dataType : "text" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
								var currentSpace = $(".lessonIndex:contains('"+$("input[name='lessonNo']").val()+"')");
								//currentSpace.prev().prev().prev().prev().prev().prev("input[name='lessonNo-modal']").val($("input[name='lessonNo']").val());
								currentSpace.prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val($("input[name='lessonVideo']").val());
								currentSpace.prev().prev().prev().prev("input[name='lessonTitle-modal']").val($("input[name='lessonTitle']").val());
								currentSpace.prev().prev().prev("input[name='lessonProject-modal']").val($("input[name='lessonProject']").val());
								currentSpace.prev().prev("input[name='lessonIntro-modal']").val($("input[name='lessonIntro']").val());
								currentSpace.prev("input[name='lessonImage-modal']").val($("input[name='lessonImage']").val());
								currentSpace.html($("input[name='lessonNo']").val()+". "+$("input[name='lessonTitle']").val());
							}//end of Call Back Function			
   				});//end of ajax
			});
			
			// 강의 이동하기
			$(document).on("click", ".lessonIndex", function(){
					
					/* 
		    		$.ajax(
		    				{
		    					url: "/hobbyclass/json/getLesson",
		    					method: "POST",
		    					data: JSON.stringify({
		    							lessonNo: $(this).prev().prev().prev().prev().prev().prev("input[name='lessonNo-modal']").val()
		    						}),
		    					dataType : "json" ,
	        					headers : {
	        						"Accept" : "application/json" ,
	        						"Content-Type" : "application/json"
	        					} ,
		    					success : function(JSONData, status) {
		    						$(this).prev().prev().prev().prev().prev().prev("input[name='lessonNo-modal']").val(JSONData.lessonNo);
		    						$(this).prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val(JSONData.lessonVideo);
		    						$(this).prev().prev().prev().prev("input[name='lessonTitle-modal']").val(JSONData.lessonTitle);
		    						$(this).prev().prev().prev("input[name='lessonProject-modal']").val(JSONData.lessonProject);
		    						$(this).prev().prev("input[name='lessonIntro-modal']").val(JSONData.lessonIntro);
		    						$(this).prev("input[name='lessonImage-modal']").val(JSONData.lessonImage);
		    						$(this).text( JSONData.lessonNo+'. '+JSONData.lessonTitle );
		    					}//end of Call Back Function
	   				});//end of ajax
	   				*/
			
				$("input[name='sumb-lesson']").val( $(this).prev().prev().prev().prev().prev().prev().prev("input[name='lessonContent-modal']").val() );
				$("input[name='lessonNo']").val( $(this).prev().prev().prev().prev().prev().prev("input[name='lessonNo-modal']").val() );
				if( $(this).prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val() != null  
						&& $(this).prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val() != ""	){
					$(".classLesson_image_one").remove();
					$("input[name='lessonVideo']").after('<iframe src="/video/'+$(this).prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val()+'" class="file_input_test lessonInput classLesson_image_one"></iframe>');
					$("input[name='lessonVideo']").val( $(this).prev().prev().prev().prev().prev("input[name='lessonVideo-modal']").val() );
					$(".classLesson_file_one").attr("disabled",true);
					$(".classLesson_file_one").css("cursor","default");
					$(".shc-lesson-one-ImageDeleteButton").css("display","block");
					$(".shclm-cb").click();
				}else{
					$(".classLesson_image_one").remove();
					$("input[name='lessonVideo']").after('<input type="image" src="/resources/image/gon/addVideo.png" style="overflow:hidden; " class="file_input_test lessonInput classLesson_image_one">');
					$(".classLesson_file_one").attr("disabled",false);
					$(".classLesson_file_one").css("cursor","pointer");
					$(".shc-lesson-one-ImageDeleteButton").css("display","none");
					$(".shclm-cb").click();
				}

				$("input[name='lessonTitle']").val( $(this).prev().prev().prev().prev("input[name='lessonTitle-modal']").val() );		
				$("input[name='lessonProject']").val( $(this).prev().prev().prev("input[name='lessonProject-modal']").val() );
				$("input[name='lessonIntro']").val( $(this).prev().prev("input[name='lessonIntro-modal']").val() );
				$("input[name='lessonImage']").val( $(this).prev("input[name='lessonImage-modal']").val() );
				
				if( $(this).prev("input[name='lessonImage-modal']").val() != null && $(this).prev("input[name='lessonImage-modal']").val() != "" ){
					$(".classLesson_image_two").attr("src", "/images/hobbyclass/"+$(this).prev("input[name='lessonImage-modal']").val() );
					$(".classLesson_file_two").attr("disabled",true);
					$(".classLesson_file_two").css("cursor","default");
					$(".shc-lesson-two-ImageDeleteButton").css("display","block");
				}else{
					$(".classLesson_image_two").attr("src", "/resources/image/gon/lessonaddimage.jpg" );
					$(".classLesson_file_two").attr("disabled",false);
					$(".classLesson_file_two").css("cursor","pointer");
					$(".shc-lesson-two-ImageDeleteButton").css("display","none");
					
				}
				
				$.ajax(
	    				{
	    					url: "/hobbyclass/json/getLesson",
	    					method: "POST",
	    					data: JSON.stringify({
	    						lessonNo: $(this).prev().prev().prev().prev().prev().prev("input[name='lessonNo-modal']").val()
	    					}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						$('#summernote2').summernote('code', JSONData.lessonContent);
	    					}
	    				});
				return false;
			});
			
			
			$(document).on("mouseover",".shclm-btn-lights", function(){
				$(this).css("background-color","rgb(200, 200, 200)");
			});
			$(document).on("mouseleave",".shclm-btn-lights", function(){
				$(this).css("background-color","white");
			});
			$(document).on("mouseover",".alert-light", function(){
				$(this).css("background-color","rgb(255, 146, 43)");
				$(this).css("color","white");
			});
			$(document).on("mouseleave",".alert-light", function(){
				$(this).css("background-color","white");
				$(this).css("color","#818182");
			});

			// 강의 추가하기
			$(".addLesson-Button").off().on("click", function(){
								
	    		// 새로운 강의 추가
	    		$.ajax(
	    				{
	    					url: "/hobbyclass/json/addLesson",
	    					method: "POST",
	    					data: JSON.stringify({
	    							hobbyClassNo: $("input[name='hobbyClassNo']").val()	
	    						}),
	    					dataType : "json" ,
        					headers : {
        						"Accept" : "application/json" ,
        						"Content-Type" : "application/json"
        					} ,
	    					success : function(JSONData, status) {
	    						var displayValue = '<input type="hidden" name="lessonContent-modal" value="">' 
	    										+ '<input type="hidden" name="lessonNo-modal" value="'+JSONData.lessonNo+'">'
	    										+ '<input type="hidden" name="lessonVideo-modal" value="">'
	    										+ '<input type="hidden" name="lessonTitle-modal" value="">'
	    										+ '<input type="hidden" name="lessonProject-modal" value="">'
	    										+ '<input type="hidden" name="lessonIntro-modal" value="">'
	    										+ '<input type="hidden" name="lessonImage-modal" value="">'
	    										+ '<div class="alert alert-light lessonIndex" role="alert">';
	    										if( JSONData.lessonTitle != null && JSONData.lessonTitle != "" ){
	    											displayValue += JSONData.lessonNo+". "+JSONData.lessonTitle;
	    										}else{
	    											displayValue += JSONData.lessonNo+". 새로운 강의";
	    										}
	    							displayValue += '</div>';						
								$(".shclm-div").prepend(displayValue);
	    					}
   				});	
			});
		});
	</script>
