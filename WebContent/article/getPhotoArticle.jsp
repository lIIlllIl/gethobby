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
	<script type="text/javascript" src="/resources/javascript/sol/article.js"></script>
<style>
</style>

<script>

function fncAddBoardArticle(){
	var boardCode = $("input[name='boardCode']").val();
	var articleNo = $("input[name='articleNo']").val();
	var articleContent = $("textarea[name='articleContent']").val();

	
	if(articleContent == null || articleContent.length < 1){
		alert("게시글 내용을 입력해주세요.");
		return false;
	}
	 
	$("form.sol-modal-form").attr("method","POST").attr("action","/article/updateBoardArticle").submit();
}

$(function() {
	$(".modal-footer button.btn-basic:contains('등록')").on("click", function() {
		fncAddBoardArticle();	
	});
})

</script>


</head>

<body>
<jsp:include page="/common/header.jsp"/>


<input type="hidden" class="article-board-type" value="${article.boardCode }" />	


<div class="mt-5">&nbsp;</div>

	<div class="container mb-5">
		<%-- <input type="hidden" name="articleNo" value="${ article.articleNo }" > --%>
        <div class="sol-article-header mb-1">
        </div>

        <div class="row d-flex justify-content-between px-3 mb-5">
            <div class="sol-user mr-auto">
            	<%-- <c:if test="${ !empty article.user.profileImage }">
            		<img src="/resources/image/min/default-profile.jpg" class="" alt="...">
            	</c:if>
            	<c:if test="${ empty article.user.profileImage }">        	
	                <img src="/resources/image/min/default-profile.jpg" class="" alt="...">
            	</c:if> --%>
            	<img src="../resources/image/logo/${!empty article.user.profileImage ? article.user.profileImage : 'unnamed.jpg'}" class="" alt="...">
                <span class="m-auto px-2">${ article.user.nickName }</span>
            </div>
            <div class="my-auto sol-article-regdate pr-2">
                ${ article.regDate }
            </div>
            <div class="my-auto sol-article-total-view">
                조회수: ${ article.totalView }
            </div>
        </div>

        <div class="sol-image-frame d-flex justify-content-center mb-5">
            <img src="/images/sol/photo_board/${ article.articleImage }" class="img-fluid" alt="...">
        </div>


        <p class="text-center">
            ${ article.articleContent }
        </p>


    </div>


	

		<jsp:include page="../article/listBoardReply.jsp"/> 
		
		
		<button type="button" class="btn btn-basic col-2 offset-5 my-5" onclick="location.href='/article/getBoardArticleList?boardCode=1'">목록</button>
		
		<div class="modal fade sol-article-update-modal" tabindex="-1" role="dialog">
	        <div class="modal-dialog modal-lg" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title">게시글 수정하기</h5>
	                    <button type="button" class="close" data-dismiss="modal">
	                        <span>&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body my-3">
	                    <form id="sol-update-photo" class="sol-modal-form">
		                    <input type="hidden" name="articleNo" value="${ article.articleNo }" >
	                    	<input type="hidden" name="boardCode" value="1"/>
	                        <div class="sol-image-frame d-flex justify-content-center">
	                            <img src="/images/sol/photo_board/${ article.articleImage }" class="img-fluid" alt="...">
	                        </div>
	
	                        <textarea class="form-control mt-3" name="articleContent" placeholder="게시글 내용을 입력해주세요" rows="3">${ article.articleContent }</textarea>
	                    </form>
	
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    <button type="button" class="btn btn-basic">등록</button>
	                </div>
	            </div>
	        </div>
	    </div>
    
    
    
    
    
    <!-- 신고 모달창 시작 -->
		<div class="modal fade report-madal-total" tabindex="-1" role="dialog" aria-labelledby="report-modal-label" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="report-modal-label">신고하기</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container report-container">
							<input type="hidden" class="report-reply-number-hidden" />
							<input type="hidden" class="report-hidden-input-value" value="0" />
							<input type="hidden" class="report-reply-hidden-content" />
							<div class="row report-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-select"></div>
									<div color="#3e4042" class="report-div report-text-select">
										부적절한 내용
									</div>
									<input type="hidden" class="report-hidde-value" value="0" />
								</div>
							</div>
							<br/>
							<div class="row report-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
									<div color="#3e4042" class="report-div report-text-non-select">
										광고
									</div>
									<input type="hidden" class="report-hidde-value" value="1" />
								</div>
							</div>
							<br/>
							<div class="row report-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
									<div color="#3e4042" class="report-div report-text-non-select">
										욕설
									</div>
									<input type="hidden" class="report-hidde-value" value="2" />
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-sm-12">
									<span class="report-reply-content-check">
										
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary modal-to-report-process-button">신고</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 신고 모달창 끝 -->
		
		<!-- 신고처리 완료 모달창 시작 -->
		<div class="modal fade report-result-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="report-result-modal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title report-result-modal" id="report-result-modal">신고 결과 확인</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="report-navi-span-text">신고가 정상적으로 접수되었습니다.</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary report-result-modal-close-button" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 신고처리 완료 모달창 끝 -->
		
		<!-- 신고 모달창 시작 -->
		<div class="modal fade report-article-madal-total" tabindex="-1" role="dialog" aria-labelledby="report-modal-label" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="report-modal-label">신고하기</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container report-article-container">
							<input type="hidden" class="report-article-number-hidden" />
							<input type="hidden" class="report-article-hidden-input-value" value="0" />
							<input type="hidden" class="report-article-hidden-content" />
							<div class="row report-article-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-select"></div>
									<div color="#3e4042" class="report-div report-text-select">
										부적절한 내용
									</div>
									<input type="hidden" class="report-hidde-value" value="0" />
								</div>
							</div>
							<br/>
							<div class="row report-article-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
									<div color="#3e4042" class="report-div report-text-non-select">
										광고
									</div>
									<input type="hidden" class="report-hidde-value" value="1" />
								</div>
							</div>
							<br/>
							<div class="row report-article-row-div">
								<div class="col-sm-12 report-col">
									<div color="#3e4042" class="report-cirlce report-cirlce-non-select"></div>
									<div color="#3e4042" class="report-div report-text-non-select">
										욕설
									</div>
									<input type="hidden" class="report-hidde-value" value="2" />
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-sm-12">
									<span class="report-article-reply-content-check">
										
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary modal-to-report-article-process-button">신고</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 신고 모달창 끝 -->
<%-- <jsp:include page="/common/footer.jsp"/>   --%>
</body>

</html>