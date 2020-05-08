<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>GetHobby</title>
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

    <!-- masonry 로딩 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js"></script>
    <!-- imagesloaded 로딩 (모든 이미지가 로딩된 후 실행되도록 할때 필요) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
	
	
	
	<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script>
	<!-- <script src="https://unpkg.com/@webcreate/infinite-ajax-scroll/dist/infinite-ajax-scroll.min.js"></script> -->
	

	<link rel="stylesheet" href="/resources/css/sol/article.css">
	<script type="text/javascript" src="/resources/javascript/sol/photo-article-list.js"></script>
<style>
	.inUTcF {
	    margin-left: 4px !important;
	    margin-right: 4px !important;
	}
	footer {
		margin-top: 80px;
		z-index: -99999999;
	}
	.eHZNoL {
		z-index: -99999999;
	}
	@media( min-width: 991px ){
		.QtLBl {
			margin: 0px 24px !important;
			
		}
	}
	.container {
		margin-bottom: 80px;	
	}
</style>

<script>
//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
/* function fncGetBoardArticleList(currentPage) {
	$("#currentPage").val(currentPage);
	//console.log(boardCode);
	//var boardCode = $("input[name='boardCode']").val();
	$("form").attr("method" , "POST").attr("action" , "/article/getBoardArticleList").submit();
} 
*/


//============= "검색"  Event  처리 =============	
/*  $(function() {
	 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 $( "button.btn.btn-outline-secondary" ).on("click" , function() {
		 
		 var searchCondition = $("select[name='searchCondition']").val();
		 var searchKeyword = $("input[name='searchKeyword']").val();
		 
		 
		 
		 if(searchCondition == null || searchCondition.length < 1){
				alert("검색범위를 선택해주세요.");
				return false;
		 }
		 if(searchKeyword == null || searchKeyword.length < 1){
				alert("검색어를 입력해주세요.");
				return false;
		 }
		 
		 //alert("검색 범위" + searchCondition + "검색어" + searchKeyword);
		 
		 fncGetBoardArticleList(1);
	});
 }); 
 */
$(function() {
	
	$(".grid-item").on("click", function() {
		var articleNo = $(this).find("input[name='articleNo']").val();
		self.location = "/article/getBoardArticle?boardCode=1&articleNo="+ articleNo;
		
	});
	
	$(document).on("click", ".grid-item", function(event){
		var articleNo = $(this).find("input[name='articleNo']").val();
		self.location = "/article/getBoardArticle?boardCode=1&articleNo="+ articleNo;
	});
	

});
</script>


</head>

<body>
<jsp:include page="/common/header.jsp"/>
<%-- <div class="fixed-top">${ search.currentPage }</div> --%>
	<div class="mt-5">&nbsp;</div>
    <div class="container">
        <h1 class="sol-board-header">Get취미 커뮤니티</h1>

        <h4 class="font-weight-bold"><i class="far fa-file-image mx-3 mb-5"></i>하루 한 장</h4>
        <%-- <form class="form-group search my-5 pt-5 d-flex justify-content-between">
            <input type="hidden" name="boardCode" value="1">
            <div class="form-row">
                <div class="input-group col-lg-5">
                    <select class="form-control" name="searchCondition">
                        <option selected disabled>검색 범위</option>
                        <option value="000" ${ ! empty search.searchCondition && search.searchCondition eq '000' ? "selected" : "" }>전체</option>
                        <option value="001" ${ ! empty search.searchCondition && search.searchCondition eq '001' ? "selected" : "" }>게시글 내용</option>
                        <option value="002" ${ ! empty search.searchCondition && search.searchCondition eq '002' ? "selected" : "" }>작성자 닉네임</option>
                    </select>
                </div>
                <div class="input-group col-lg-7">
                    <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </form> --%>
        	<input type="hidden" name="boardCode" value="1">
            <input type="hidden" id="currentPage" name="currentPage" value="${ search.currentPage }"/>
            <input type="hidden" id="pageSize" name="pageSize" value="${ search.pageSize }"/>
            <input type="hidden" id="maxPage" name="maxPage" value="${ resultPage.maxPage }"/>
            <input type="hidden" id="totalCount" name="totalCount" value="${ totalCount }"/>



        <div class="grid">
            <div class="grid-sizer"></div>

            

			<c:set var="i" value="0" />
			<c:forEach var="list" items="${list}">
				<c:set var="i" value="${i+1}" />


				<fmt:parseDate var="regDate" value="${list.regDate}"
					pattern="yyyy-MM-dd" />
				<fmt:formatDate var="regDate" value="${regDate}"
					pattern="yyyy-MM-dd" />





				<div class="grid-item">
					<input type="hidden" id="articleNo" name="articleNo" value="${ list.articleNo }"/>
					<img src="/images/sol/photo_board/${ list.articleImage }"
						onError="this.src='https://dummyimage.com/600x400/000/fff';" />
					<div class="sol-image-caption">
						<div>
							<div class="row">
								<span class="col-6">${ regDate }</span> <span
									class="col-6 d-flex justify-content-end"> <i
									class="far fa-comment-dots my-auto mx-1"></i><span>${ list.totalReply }
										&nbsp;</span> <i class="fas fa-heart my-auto mx-1"></i>${ list.totalFavor }
								</span>
							</div>
							<h4 class="mt-1">${ list.user.nickName }</h4>
							<%-- <h4 class="mt-1">${ list.articleNo }</h4> --%>
						</div>
					</div>

				</div>






			</c:forEach>



			<!-- <div style="margin-top:500px"></div> -->


			<c:if test="${ ! empty sessionScope.user.userId }">			
				<span class="sol-add-article shadow" data-toggle="modal" data-target=".sol-article-upload-modal">
	                <i class="fas fa-edit"></i>
	            </span>
			</c:if>
            <span class="sol-to-the-top shadow">
                <i class="fas fa-arrow-up"></i>
            </span>



			<div class="modal fade sol-article-upload-modal" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">게시글 작성하기</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>
						<div class="modal-body my-3">
							<form id="sol-add-photo">
								<input type="hidden" name="boardCode" value="1">
								<input type="hidden" name="articleImage" value="">
								<div id="sol-image-drag-and-drop">드래그하거나 클릭하여 업로드</div>
								<div>
									<input type="file" id="sol-image"
										style="cursor: pointer; height: 0%; opacity: 0; position: absolute; width: 0%; left: 0px; top: 0px; font-size: 0px;"
										accept="image/gif,image/jpeg,image/png">
								</div>

								<textarea class="form-control mt-3" placeholder="게시글 내용을 입력해주세요"
									rows="3" name="articleContent"></textarea>

							</form>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-basic">등록</button>
						</div>
					</div>
				</div>
			</div>



		</div>
			<!-- <button type="button" class="btn btn-basic">더보기</button> -->
	


    </div>	
		<div class="footerDiv">
		<div style="width:100%; height:100px;">&nbsp;</div>
    	<jsp:include page="/common/footer.jsp"></jsp:include>
    	</div>

	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</body>

</html>