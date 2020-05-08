<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    
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

	<!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>  

    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

    <!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />


<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->



	<link rel="stylesheet" href="/resources/css/woo/article.css">

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/javascript/summernote/lang/summernote-ko-KR.js"></script>
<style>
*, body, p, h1, h2, h3, h4, h5, h6, button, a, ul, li, ol, div, span,
	input, textarea, table, th, tr, td, nav, header, article, footer,
	select, small {
	font-family: "Nanum Gothic"
}
</style>
<script type="text/javascript">
function fncAddNotice(){
	var articleTitle = $("#articleTitle").val();
	var articleContent = $("#summernote").val();
	
	if(articleTitle == null || articleTitle.length <1){
		Swal.fire({
			  icon: 'warning',
			  title: '글 제목을 입력해 주세요',
			  showConfirmButton: false,
			  timer: 800
			}).then((result)=>{
				return;
			})
		
	}else if(articleContent == null || articleContent.lengh <1){
		Swal.fire({
		icon: 'warning',
		  title: '게시글 내용을 입력해 주세요',
		  showConfirmButton: false,
		  timer: 800
		}).then((result)=>{
			return;
		})
	}else{
		Swal.fire({
			icon: 'success',
			  title: '공지사항 등록 완료',
			  showConfirmButton: false,
			  timer: 800
			}).then((result)=>{
				$("form").attr("method","post").attr("action","/user/addNotice").submit();
			})	
	}
}

    $(function() {
        $('#summernote').summernote({
        	minHeight : 600,
        	maxHeight : 600,
        	lang : 'ko-KR' 
        });
        
        $("button.btn.btn-basic.m-1").on("click",function(){        	
        	fncAddNotice();
        });
        
        $("button.btn.btn-outline-basic.m-1").on("click",function(){        	
        	self.location="/user/listNotice";
        });
        
    });
    
    
  </script>
</head>
<body>
<jsp:include page="/common/header.jsp"/>
	<!-- <div class="container">
	
	
	<form>
	
	
	<div class="form-row">
		<div class="form-group col-md-10">
			<h1><label> 공지사항 작성</label></h1>
			</div>			
		</div>
	<hr>	
	<div class="form-row">
		<div class="form-group col-md-1">
			<h3>제목 :</h3>
		</div>
		<div class="form-group col-md-11">
		<input type="text" class="form-control" id="articleTitle" name="articleTitle" >
		</div>
	</div>
	<hr>
	
	<textarea  id="summernote" name="articleContent" ></textarea>
	<br>
		<div class="form-row">
			<div class="form-group col-md-11">
			<button type="button" class="btn btn-success">목록</button>
			</div>
			<div class="form-group col-md-1">
			<button type="button" class="btn btn-primary">등록</button>
			</div>
			
		</div>
	</form>	
	</div>
 -->
<div class="container">
	
    <h1 class="sol-board-header">공지사항 작성</h1>
        <form class="form-group my-5 py-5">
        <input type="hidden" name="boardCode" value="4">
		<input type="hidden" name="userId" value="${sessionScope.user.userId}">
            <div class="form-row my-3">
                <div class="input-group col-lg-12">
                    <input type="text" class="form-control" id="articleTitle" name="articleTitle" placeholder="제목을 입력하세요">
                </div>
            </div>
            <textarea id="summernote" name="articleContent"></textarea>
            
            <div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-outline-basic m-1">취소</button>
                <button type="button" class="btn btn-basic m-1">등록</button>
            </div>
        </form>

    </div>
  
  

</body>
</html>