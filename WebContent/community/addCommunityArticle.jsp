<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- 메인 메뉴 CSS 
<link rel="stylesheet" href="/resources/css/header.css">-->
<!-- 메인 메뉴 js 
<script src="/resources/javascript/header.js"></script>-->


<link rel="shortcut icon" href="/static/pc/images/favicon.ico">
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
 
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
	////////////////////////////////////////////////////////////////////////////////////
		$(function() {
			
			///글 등록하기 버튼 클릭시
			$(document).on("click", "#updateArticleContentButton", function() {
				
				//alert('글 등록 버튼');
				//로그인 정보는 세션에서 가져가고
				var articleContent = $('#summernote').val();
				console.log(articleContent);
				var hobbyClassNo = $("input[class='hidden_hobbyClassNo']").val();
				console.log(hobbyClassNo);
				
				//alert(articleContent);
				
				
				if(articleContent == null || articleContent.length<1){
					alert('글 내용을 입력해주세요.....');
					return;
				}
				
				
				$("form#addCommunityArticle").attr("method", "POST").attr("action", "/community/addCommunityArticle").submit();
				//self.location = "/community/addCommunityArticle?hobbyClassNo="+hobbyClassNo+"&articleContent="+articleContent;
				
				swal.fire({
      			  title: '등록완료!',
      			  text: 'Get취미IfYouCAN',
      			  imageUrl: '/resources/image/logo/logo-favicon.png'
      			});
			})
			
			/// 취소 버튼 클릭시
			$(document).on("click", "#beforeUpdateArticleButton", function() {
				
				var hobbyClassNo = $("input[class='hidden_hobbyClassNo']").val();
				//alert('hobbyClassNo'+hobbyClassNo);
/* 				swal({
					title : '취소하시겠습니까?',
					text : '작성한 내용은 저장되지않습니다',
					icon : 'info',
					closeOnClickOutside : false,
					button : {
						cancle : {
							text : '페이지 머물기',
							value : false,
							className : 'btn btn-outline-primary'
						},
						confirm : {
							text : '로그인 창으로',
							value : true,
							className : 'btn btn-outline-primary'
						}
					}
				}); */
				
				
				self.location = "/community/listCommunity?hobbyClassNo="+hobbyClassNo;
			})
			
			
		});
	

	    $(document).ready(function() {
	    	
	    	$('#summernote').summernote({
	    		placeholder: '글씨를 입력해주세요',
	    		lang: 'ko-KR',
	    		tabsize: 2,
	    		height: 700,
	    		minHeight : 700,
	    		maxHeight : 700,
	    		maxWidth: 1024,
	/*     		  toolbar: [
	    		    // [groupName, [list of button]]
	    		    ['style', ['bold', 'italic', 'underline', 'clear']],
	    		    ['font', ['strikethrough', 'superscript', 'subscript']],
	    		    ['fontsize', ['fontsize']],
	    		    ['color', ['color']],
	    		    ['para', ['ul', 'ol', 'paragraph']],
	    		    ['height', ['height']],
	    		    ['view', ['codeview', 'help']]
	    		  ], */
	    		callbacks : {
	    			onImageUpload: function(files, editor, welEditable) {
	    				//alert(files);
	    				//alert(editor);
	    				//alert(welEditable);
	    				for (var i = files.length-1 ; i >=0 ; i--) {
							sendArticleFile(files[i], this);
							
						}
					}
	    		}  
	    		  
	    		});//summerNote
	    	
	    });//ready
	    
		function sendArticleFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '/community/json/makeArticleFileUpload',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		console.log('파일이 저장된 path--'+img_name);
	        		var path = "";
	        		var result_img_name = img_name+'" style="width: 1024px;"';
	        		console.log(path);
	        		//var url = ""
	        		//$(el).summernote('editor.insertImage', path);
	        		$('#summernote').summernote('insertImage', '/images/kyung/'+img_name);
	        		//$('#summernote').summernote('insertImage', '/images/kyung/'+result_img_name);
	        		//$("textarea").html(path);
					
	        	},
	        	error:function(request,status,error){
			            //alert("ajax과정 실패");
			       }
			}); //ajax
		}//sendArticleFile    
	    
    
	</script>
</head>

<body>

	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />

	<!-- 전체 묶음 -->
	<div class="container">

	</br></br></br></br>
	</br></br></br></br>
	
	
	<h1 class="sol-board-header">클래스커뮤니티 게시글 등록</h1>
	<hr>

	 <form id="addCommunityArticle" name="addCommunityArticle" class="addCommunityArticle"> 
	 
		<input type="hidden" name="hobbyClass.hobbyClassNo" class="hidden_hobbyClassNo" value="${hobbyClassNo }">
	
<!--   
        <div class="p-3 py-4 mb-2 text-left rounded">
          <svg id="beforeAddArticleButton" class="bi bi-chevron-left" width="4em" height="4em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 	<path fill-rule="evenodd" d="M13.354 3.646a.5.5 0 010 .708L7.707 10l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
		 </svg>
		 글 작성하기
		   	<button id="addArticleButton" type="button" class="btn btn-basic m-1" >
  				등록
  			</button>
        </div> -->
  
 	<!-- 이벤트 내용 --> 
 		</br>
			<textarea  class="form-control" id="summernote" name="articleContent"  aria-label="With textarea"></textarea>
			
 			<div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-basic m-1" id="updateArticleContentButton">등록</button>
                <button type="button" class="btn btn-outline-basic m-1" id="beforeUpdateArticleButton">취소</button>
            </div>
	
  	
  	</form>

</div>

		</br>
    	</br>
    	</br>
    	</br>
  	<jsp:include page="/common/footer.jsp" />

</body>
</html>