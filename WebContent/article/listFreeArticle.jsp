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



	<link rel="stylesheet" href="/resources/css/sol/article.css">
<style>
.inUTcF {
    margin-left: 12px !important;
    margin-right: 12px !important;
}
</style>

<script>



//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
function fncGetBoardArticleList(currentPage) {
	$("#currentPage").val(currentPage);
	//alert($("#currentPage").val());
	//console.log(boardCode);
	//var boardCode = $("input[name='boardCode']").val();
	$("#search").attr("method" , "POST").attr("action" , "/article/getBoardArticleList").submit();
}


//============= "검색"  Event  처리 =============	
 $(function() {
	 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 $( "button.btn.btn-outline-secondary" ).on("click" , function() {
		 var articleType = $("select[name='articleType']").val();
		 var searchCondition = $("select[name='searchCondition']").val();
		 var searchKeyword = $("input[name='searchKeyword']").val();
		 
		 
		 if(articleType == null || articleType.length < 1){
				alert("말머리를 선택해주세요.");
				return false;
		 }
		 if(searchCondition == null || searchCondition.length < 1){
				alert("검색범위를 선택해주세요.");
				return false;
		 }
		 if(searchKeyword == null || searchKeyword.length < 1){
				alert("검색어를 입력해주세요.");
				return false;
		 }
		 
		 fncGetBoardArticleList(1);
	});
 }); 

$(function() {
	
	$(".sol-article-table tbody th,  .s-tip-title").on("click", function() {
		var articleNo = $(this).find("input[name='articleNo']").val();
		self.location = "/article/getBoardArticle?boardCode=0&articleNo="+ articleNo;
		
	});
	
	$("button.btn.btn-basic.btn-sm").on("click", function(){
		self.location = "/article/addFreeArticle";
	});
	
});
	

	

</script>


</head>

<body>
<jsp:include page="/common/header.jsp"/>

		<div class="mt-5">&nbsp;</div>
	    <div class="container sol-free-board">
        <h1 class="sol-board-header">Get취미 커뮤니티</h1>

        <form  id="search" class="form-group search my-5 pt-5 d-flex justify-content-between">
            <h4 class="font-weight-bold"><i class="far fa-file-alt mx-3"></i>아무말대잔치</h4>
            <input type="hidden" name="boardCode" value="0">
            <div class="form-row">
                <div class="input-group col-lg-3">
                    <select class="form-control" name="articleType">
                        <option selected disabled>말머리</option>
                        <option value="000" ${ ! empty search.articleType && search.articleType eq '000' ? "selected" : "" }>전체</option>
                        <option value="001" ${ ! empty search.articleType && search.articleType eq '001' ? "selected" : "" }>꿀팁</option>
                        <option value="002" ${ ! empty search.articleType && search.articleType eq '002' ? "selected" : "" }>잡담</option>
                        <option value="003" ${ ! empty search.articleType && search.articleType eq '003' ? "selected" : "" }>질문</option>
                    </select>
                </div>
                <div class="input-group col-lg-3">
                    <select class="form-control" name="searchCondition">
                        <option selected disabled>검색 범위</option>
                        <option value="000" ${ ! empty search.searchCondition && search.searchCondition eq '000' ? "selected" : "" }>전체</option>
                        <option value="001" ${ ! empty search.searchCondition && search.searchCondition eq '001' ? "selected" : "" }>게시글 제목</option>
                        <%-- <option value="002" ${ ! empty search.searchCondition && search.searchCondition eq '002' ? "selected" : "" }>게시글 내용</option> --%>
                        <option value="003" ${ ! empty search.searchCondition && search.searchCondition eq '003' ? "selected" : "" }>작성자 닉네임</option>
                    </select>
                </div>
                <div class="input-group col-lg-6">
                    <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
            <input type="hidden" id="currentPage" name="currentPage" value=""/>
        </form>

        <table class="table table-borderless sol-article-table">
            <thead>
                <tr>
                    <th class="py-3" scope="col" style="width: 10%">말머리</th>
                    <th class="py-3" scope="col" style="width: 44%">글제목</th>
                    <th class="py-3" scope="col" style="width: 15%">작성자</th>
                    <th class="py-3" scope="col" style="width: 15%">작성날짜</th>
                    <th class="py-3" scope="col" style="width: 8%">조회수</th>
                    <th class="py-3" scope="col" style="width: 8%">좋아요</th>
                </tr>
            </thead>
            <tbody>

            	<c:set var="i" value="0" />
				<c:forEach var="list" items="${list}">
					<c:set var="i" value="${i+1}" />
					
					<jsp:useBean id="today" class="java.util.Date" />
					<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
					<fmt:parseDate var="regDate" value="${list.regDate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="regDate" value="${regDate}" pattern="yyyy-MM-dd" />
					
					<c:if test="${list.user.userId eq sessionScope.user.userId}">
					<tr class="bg-basic">
					</c:if>
					
					<c:if test="${list.user.userId ne sessionScope.user.userId}">
					<tr>
					<%-- <input type="text" name="articleNo" value="${ list.articleNo }"> --%>
					</c:if>
					
						<c:if test="${list.articleType eq '001'}">
							<td>꿀팁</td>
						</c:if>
						<c:if test="${list.articleType eq '002'}">
							<td>잡담</td>
						</c:if>
						<c:if test="${list.articleType eq '003'}">
							<td>질문</td>
						</c:if>
						
						<c:if test="${ regDate == now }">
							<c:if test="${ list.totalReply != 0 }">
								<th scope="row"><input type="hidden" name="articleNo" value="${ list.articleNo }">${list.articleTitle}<span class="sol-total-reply text-danger"> (${ list.totalReply }) </span><span class="ml-1 badge badge-pill badge-danger"> N </span></th>
							</c:if>
							<c:if test="${ list.totalReply == 0 }">
								<th scope="row"><input type="hidden" name="articleNo" value="${ list.articleNo }">${list.articleTitle}<span class="ml-1 badge badge-pill badge-danger">N</span></th>
							</c:if>
						</c:if>
						<c:if test="${ regDate != now }">
							<c:if test="${ list.totalReply != 0 }">
								<th scope="row"><input type="hidden" name="articleNo" value="${ list.articleNo }">${list.articleTitle}<span class="sol-total-reply text-danger"> (${ list.totalReply }) </span></th>
							</c:if>
							<c:if test="${ list.totalReply == 0 }">
								<th scope="row"><input type="hidden" name="articleNo" value="${ list.articleNo }">${list.articleTitle}</th>
							</c:if>
						</c:if>

						<td>${list.user.nickName}</td>
											
						<c:set var = "length" value = "${fn:length(list.regDate)}"/>
	    				<c:set var = "regTime" value = "${fn:substring(list.regDate, length-5, length)}" />
	    				<c:if test="${ regDate == now }">
	    					<td>${regTime}</td>
	    				</c:if>
	    				<c:if test="${ regDate != now }">
	    					<td>${regDate}</td>
	    				</c:if>
						<td>${list.totalView}</td>
						<td>${list.totalFavor}</td>
					</tr>
				</c:forEach>
            </tbody>
        </table>

		<c:if test="${ ! empty sessionScope.user.userId }">
	        <div class="row d-flex justify-content-end">
	            <button type="button" class="btn btn-basic btn-sm"> <i class="fas fa-pencil-alt"></i> 작성</button>
	        </div>
		</c:if>

    </div>
    
    
	<div class="container-fluid sol-free-board-res">
        <h1 class="sol-board-header">Get취미 커뮤니티</h1>

        <div class="row d-flex justify-content-between mx-1">
            <h4 class="font-weight-bold"><i class="far fa-file-alt"></i>아무말대잔치</h4>
            <c:if test="${ ! empty sessionScope.user.userId }">
            <button type="button" class="btn btn-basic btn-sm"> <i class="fas fa-pencil-alt"></i> 작성</button>
            </c:if>
        </div>
        <div class="s-res-table mt-1">

			<c:set var="i" value="0" />
			<c:forEach var="list" items="${list}">
				<c:set var="i" value="${i+1}" />

				<%-- <jsp:useBean id="today" class="java.util.Date" /> --%>
				<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
				<fmt:parseDate var="regDate" value="${list.regDate}"
					pattern="yyyy-MM-dd" />
				<fmt:formatDate var="regDate" value="${regDate}"
					pattern="yyyy-MM-dd" />

				<c:if test="${list.user.userId eq sessionScope.user.userId}">
					<div class="col py-3 bg-basic">
				</c:if>

				<c:if test="${list.user.userId ne sessionScope.user.userId}">
					<div class="col py-3">
				</c:if>
				
					<div class="row">
						<div class="col-12">${list.user.nickName}</div>
						<div class="col-12 s-tip-title">[
							<c:if test="${list.articleType eq '001'}">
								꿀팁
							</c:if>
							<c:if test="${list.articleType eq '002'}">
								잡담
							</c:if>
							<c:if test="${list.articleType eq '003'}">
								질문
							</c:if>
							] 
							<input type="hidden" name="articleNo"value="${ list.articleNo }">${list.articleTitle}
							<c:if test="${ regDate == now }">
								<span class="ml-1 badge badge-pill badge-danger" style="color:white"> &nbsp; N &nbsp;</span>
							</c:if>	
						</div>
					</div>
					<div class="row">
						<c:set var="length" value="${fn:length(list.regDate)}" />
						<c:set var="regTime" value="${fn:substring(list.regDate, length-5, length)}" />
						<div class="col-4">
						<c:if test="${ regDate == now }">${regTime}</c:if>
						<c:if test="${ regDate != now }">${regDate}</c:if>
						</div>
						<div class="col-3">
							<i class="far fa-eye"></i>${list.totalView}
						</div>
						<div class="col-3">
							<i class="fas fa-heart"></i> ${list.totalFavor}
						</div>
						<div class="col-2">
							<i class="far fa-comment"></i> ${ list.totalReply }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
        
        
        

   
        <form class="mt-5 form-group search d-flex justify-content-between">
            <input type="hidden" name="boardCode" value="1">
            <div class="form-row">
                <div class="input-group col-6 pr-0">
                    <select class="form-control" name="articleType">
                        <option selected disabled>말머리</option>
                        <option value="001">꿀팁</option>
                        <option value="002">잡담</option>
                        <option value="003">질문</option>
                    </select>
                </div>
                <div class="input-group col-6 pl-0">
                    <select class="form-control" name="searchCondition">
                        <option selected disabled>검색 범위</option>
                        <option value="001">전체</option>
                        <option value="003">게시글 내용</option>
                        <option value="003">작성자 닉네임</option>
                    </select>
                </div>
                <div class="input-group col-12">
                    <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </form>



    </div>    
<jsp:include page="/common/pagenation.jsp"/>
<jsp:include page="/common/footer.jsp"/>
</body>

</html>