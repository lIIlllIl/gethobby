<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="my-3" style="clear:both"></div>
<div class="mt-3" style="clear:both">&nbsp;</div>
<div class="container">
        <div class="row px-1 d-flex justify-content-between">
            <div class="sol-reply-count mr-5 d-flex align-items-center">
                	댓글<span class="">(${ article.totalReply })</span>
            </div>
            <div class="sol-article-etc">
            	<c:if test="${ empty sessionScope.user.userId || sessionScope.user.userId ne article.user.userId }">            	
	                <button type="button" class="btn btn-light btn-sm"> 
	                	<c:if test="${ ! empty favored  }">
	                		<i class="fas fa-heart"></i> 
	                	</c:if>
	                	<c:if test="${ empty favored  }">
	                		<i class="far fa-heart"></i>
	                	</c:if>
	                	<span> ${ article.totalFavor } </span> 
	                </button>
	                <span class="article-report-span"> 신고 </span>
            	</c:if>
            	<c:if test="${ sessionScope.user.userId eq article.user.userId }">
            		<c:if test="${ param.boardCode eq '0' }">
            			<button type="button" class="btn btn-basic btn-sm" id="sol-free-article-update" onclick="location.href='/article/updateBoardArticle?articleNo=${article.articleNo }'"> 수정 </button>
            		</c:if>
            		<c:if test="${ param.boardCode eq '1' }">
            			<button type="button" class="btn btn-basic btn-sm"  data-toggle="modal" data-target=".sol-article-update-modal"> 수정 </button>
            		</c:if>             	
                		<button type="button" class="btn btn-outline-basic btn-sm" onclick="location.href='/article/deleteBoardArticle?articleNo=${article.articleNo }'"> 삭제 </button>
            	</c:if>
            </div>
        </div>
</div>

<input type="hidden" name="sessionUserId" value="${ sessionScope.user.userId }" />
    <div class="container sol-reply-container mt-1 mb-5 py-3">
        <div class="border-bottom mt-2 mb-4 py-4 sol-add-reply">
            <div class="form-row d-flex justify-content-center">
                <textarea class="form-control col-9 col-md-10 mr-1" id="reply-textarea" name="replyContent" rows="3" maxlength="500"></textarea>
                <button class="col-2 col-md-1 btn btn-basic">등록</button>
            </div>
            <span class="m-3 m-md-5"><strong class="text-danger" id="counter">0</strong> / 500자</span>
        </div>
        
        
        
        
           <!-- <input type="hidden" id="currentPage" name="currentPage"/> 
           <input type="hidden" id="maxPage" name="maxPage" value=""/> -->
        <ul class="list-unstyled px-lg-5">
        </ul>
    </div>


    <span class="sol-to-the-top shadow">
        <i class="fas fa-arrow-up"></i>
    </span>


<%-- <jsp:include page="/common/pagenation.jsp"/> --%>


    
