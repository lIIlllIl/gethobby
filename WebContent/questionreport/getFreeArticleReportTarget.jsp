<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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



    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">


    <!-- 메인 메뉴 CSS -->
<!--     <link rel="stylesheet" href="/resources/css/header.css"> -->
    <!-- 메인 메뉴 js -->
<!--     <script src="/resources/javascript/header.js"></script> -->


	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Header js & css -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />




<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->



	<link rel="stylesheet" href="/resources/css/sol/article.css">
	<script type="text/javascript" src="/resources/javascript/sol/article.js"></script>
<style>
</style>

<script>

</script>


</head>

<body>
	<div class="container">
		<input type="hidden" name="articleNo" value="${ article.articleNo }" >
        <div class="sol-article-header mb-1">
            <div class="row">
                <h6 class="col-lg d-flex align-items-center font-weight-bold text-secondary">
					<c:if test="${ article.articleType eq '001' }"> 꿀팁 </c:if>
					<c:if test="${ article.articleType eq '002' }"> 잡담 </c:if>
					<c:if test="${ article.articleType eq '003' }"> 질문 </c:if>
				</h6>
                <h3 class="col-lg-11 text-break">${ article.articleTitle }</h3>
            </div>
        </div>
        
		<!-- <input type="hidden" id="currentPage" name="currentPage"/> 
        <input type="hidden" id="maxPage" name="maxPage" value=""/> -->
        
         
        <div class="row d-flex justify-content-between">
            <div class="sol-user mr-auto">
            	<%-- <c:if test="${ !empty article.user.profileImage }"> --%>
            		<img src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" class="" alt="...">
            	<%-- </c:if>
            	<c:if test="${ empty article.user.profileImage }">        	
	                <img src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" class="" alt="...">
            	</c:if> --%>
                <span class="m-auto px-2">${ article.user.nickName }</span>
            </div>
            <div class="my-auto sol-article-regdate pr-2">
                ${ article.regDate }
            </div>
            <div class="my-auto sol-article-total-view">
                조회수: ${ article.totalView }
            </div>
        </div>
			${ article.articleContent }

    </div>
</body>

</html>