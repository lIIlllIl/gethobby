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
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 메인 메뉴 js -->
    <script src="/resources/javascript/header.js"></script>


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
</style>

<script>
//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
function fncGetBoardArticleList(currentPage) {
	$("#currentPage").val(currentPage);
	//console.log(boardCode);
	//var boardCode = $("input[name='boardCode']").val();
	$("form").attr("method" , "POST").attr("action" , "/article/getMyBoardArticleList").submit();
}




$(function() {
	
	$(".grid-item").on("click", function() {
		var articleNo = $(this).find("input[name='articleNo']").val();
		self.location = "/article/getBoardArticle?boardCode=1&articleNo="+ articleNo;
		
	});
	
	$(document).on("click", ".grid-item", function(event){
		var articleNo = $(this).find("input[name='articleNo']").val();
		self.location = "/article/getBoardArticle?boardCode=1&articleNo="+ articleNo;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	var $grid = $('.grid').imagesLoaded(function () {
        $grid.masonry({
            itemSelector: '.grid-item',
            //fitwidth: true,
            columnWidth: '.grid-sizer',
            percentPosition: true,
            gutter: 20,
            //horizontalOrder: true
        });
        
    });
	
	
	
	
	
	// 스크롤 이벤트 --------------------------------------------------------------
    $(window).scroll(function(){
    	clearTimeout( null );
    	
    	setTimeout(function() { scrollMyBoardArticleList(); }, 100); 
    });
    // 스크롤 이벤트 --------------------------------------------------------------
    
    
    
    
    
    // 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
        	function scrollMyBoardArticleList() {
        		var currentPage = ( $('#currentPage').val() * 1 ) + 1;
        		var pageSize = ( $('#pageSize').val() );
        		var totalCount = ( $('#totalCount').val() );
        		var userId = ( $('#userId').val() );
        		var boardCode = ( $('#boardCode').val() );
        		console.log(pageSize);
        		console.log(totalCount);
        		
        		console.log("현재 페이지>>>>>>" + currentPage);
        		var maxPage = $('#maxPage').val();
        		console.log("최대 페이지>>>>>>" + maxPage);
        		
        		if(currentPage == 2) {
//        			currentPage += 9;
        			currentPage += (pageSize - 1);
        			//maxPage += 9;
        			//totalCount +=
        		} // end if
        		
        		var search = new Object();
        		search.currentPage = currentPage;
        		search.boardCode = boardCode;
        		
        		
        		if ( $(document).height() - 300 <= $(window).scrollTop() + $(window).height() ) {
        			//if ( maxPage >= currentPage ) {
        			if ( totalCount >= currentPage ) {
        				console.log('scroll이 됩니까');
        				
        				$.ajax({
        							url : "/article/json/getMyBoardArticleList", 
        							method : "post",
        							dataType : "json",
        							async : false,
        							headers : {
        								"Accept" : "application/json",
        								"Content-Type" : "application/json"
        							},
        							data : JSON.stringify({
        								search : search
        							}), 
        							success : function(JSONData, status) {
        								var items = [];
        								
        								console.log('scroll ajax');
        								for(var i = 0; i < JSONData.list.length; i++) {
        									var display = '';
        									var $item = null;
        									console.log(">>>>>>>>>>>>>>>>>");
        									console.log(JSONData.list[i]);
        									console.log(">>>>>>>>>>>>>>>>>");
        									
        									var regDate = (JSONData.list[i].regDate).substring(0, 10);
        									
        									display += '<div class="grid-item">';
        									display += '<input type="hidden" id="articleNo" name="articleNo" value="' + JSONData.list[i].articleNo + '"/>';
        									display += '<img src="/images/sol/photo_board/' + JSONData.list[i].articleImage + '" onError="this.src=\'https://dummyimage.com/600x400/000/fff\';" />';
        									display += '<div class="sol-image-caption">';
        									display += '<div>';
        									display += '<div class="row">';
        									display += '<span class="col-6">' + regDate + '</span>';
        									display += '<span class="col-6 d-flex justify-content-end"> ';
        									display += '<i class="far fa-comment-dots my-auto mx-1"></i>';
        									display += '<span>' + JSONData.list[i].totalReply + ' &nbsp;</span>';	
        									display += '<i class="fas fa-heart my-auto mx-1"></i>';		
        									display += JSONData.list[i].totalFavor;			 
        									display += '</span>';			
        									display += '</div>';			
        									display += '<h4 class="mt-1">' + JSONData.list[i].user.nickName + JSONData.list[i].articleNo + '</h4>';			
        									display += '</div>';			
        									display += '</div>';			
        									display += '</div>';	
        									
        									////items.push(display);
        									
        									//$item = $(display);
        									//$item.push($(display));
        									//$grid.append( $item ).masonry( 'appended', $item).masonry("layout");
        									//$grid.append( $item );
        									//$grid.masonry( 'addItems', $item );
        									//$grid.masonry("layout");
        									//$grid.masonry( 'layoutItems', $item, false );
        									
        									var item = display;
//        									items.push(item);
        									var $items = $(display);
//        									setTimeout(function() { 
//        										$grid.append( $items ).masonry("appended", $items, true).masonry("layout");
//        									}, 500);
        									$grid.append( $items ).masonry( 'appended', $items).masonry("layout");
        								} // end for loop
        								


        								$('#maxPage').val(JSONData.resultPage.maxPage);
        								$('#currentPage').val( currentPage );
        								
        							} // end ajax success
        						}); // end ajax 
        				
        			} // end if (totalCount이하일 때까지)
        		} // end if 무한스크롤
        	
    } // end scrollMyBoardArticleList()
        	// 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
	
});
</script>


</head>

<body>
<jsp:include page="/common/header.jsp"/>
<%-- <div class="fixed-top">${ search.currentPage }</div> --%>
    <div class="container">
        <h1 class="sol-board-header">Get취미 커뮤니티</h1>

        <form class="form-group search my-5 pt-5 d-flex justify-content-between">
            <h4 class="font-weight-bold"><i class="far fa-file-image mx-3"></i>사진게시판</h4>
            <input type="hidden" name="boardCode" value="1">
            <%-- <div class="form-row">
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
            </div> --%>
            <input type="hidden" id="currentPage" name="currentPage" value="${ search.currentPage }"/>
            <input type="hidden" id="pageSize" name="pageSize" value="${ search.pageSize }"/>
            <input type="hidden" id="maxPage" name="maxPage" value="${ resultPage.maxPage }"/>
            <input type="hidden" id="totalCount" name="totalCount" value="${ totalCount }"/>
            <input type="hidden" id="userId" name="userId" value="${ sessionScope.user.userId }"/>
        </form>


${ totalCount }
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
							<h4 class="mt-1">${ list.user.nickName }${ list.articleNo }</h4>
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
							<form>
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

</body>

</html>