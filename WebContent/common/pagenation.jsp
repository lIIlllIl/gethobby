<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <nav class="my-5 py-5">
        <ul class="pagination justify-content-center">
            
            
            <%-- <c:if test="${ empty search.boardCode }"> --%>
	            <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
	            <li class="page-item">    
	            </c:if>
	            <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
	            <li class="page-item disabled">
	            </c:if>    
	                <a class="page-link" href="javascript:fncGetBoardArticleList('${ resultPage.currentPage-1}')">
	                    <i class="fas fa-angle-left"></i>
	                </a>
	            </li> 
	            
	            
	            <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
					<c:if test="${ resultPage.currentPage == i }">
						<!--  현재 page 가르킬경우 : active -->
					    <li class="page-item active">
					    	<a class="page-link" href="javascript:fncGetBoardArticleList('${ i }');">${ i }</a>
					    </li>
					</c:if>	
					<c:if test="${ resultPage.currentPage != i}">	
						<li class="page-item">
							<a class="page-link" href="javascript:fncGetBoardArticleList('${ i }');">${ i }</a>
						</li>
					</c:if>
				</c:forEach>
	                        
	            
	            <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
	            	<li class="page-item">    
	            </c:if>
	            <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	            	<li class="page-item disabled">
	            </c:if>     
	                <a class="page-link" href="javascript:fncGetBoardArticleList('${resultPage.endUnitPage+1}')">
	                    <i class="fas fa-angle-right"></i>
	                </a>
	            </li>
            <%-- </c:if> --%>
            
            
            
            
            
            <%-- <c:if test="${ ! empty search.boardCode }">
            	<c:if test="${ search.boardCode eq '0'}">
            	
            		<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		            <li class="page-item">    
		            </c:if>
		            <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		            <li class="page-item disabled">
		            </c:if>    
		                <a class="page-link" href="javascript:fncGetBoardArticleList('${ resultPage.currentPage-1}', 0)">
		                    <i class="fas fa-angle-left"></i>
		                </a>
		            </li> 
		            
		            
		            <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
						<c:if test="${ resultPage.currentPage == i }">
							<!--  현재 page 가르킬경우 : active -->
						    <li class="page-item active">
						    	<a class="page-link" href="javascript:fncGetBoardArticleList('${ i }', 0);">${ i }</a>
						    </li>
						</c:if>	
						<c:if test="${ resultPage.currentPage != i}">	
							<li class="page-item">
								<a class="page-link" href="javascript:fncGetBoardArticleList('${ i }', 0);">${ i }</a>
							</li>
						</c:if>
					</c:forEach>
		                        
		            
		            <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		            <li class="page-item">    
		            </c:if>
		            <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		            <li class="page-item disabled">
		            </c:if>    
		                <a class="page-link" href="javascript:fncGetBoardArticleList('${resultPage.endUnitPage+1}', 0)">
		                    <i class="fas fa-angle-right"></i>
		                </a>
		            </li>
            	
            	</c:if>
            </c:if> --%>
            
            
            
            
            
            
            
            
            
            
            
            
        </ul>
    </nav>

