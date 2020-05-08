<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
				
	<nav aria-label="Page navigation example" class="page-navigation">
	  <ul class="pagination"  style="position: flex; justify-content: center;">
	    
	    <li class="page-item">
	    
	    <!-- 이전 버튼 활성화 -->
	    <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">
	        	&lt;
	        </span>
	      </a>
	    </c:if>  
	    
	    <!-- 이전 버튼 비활성화 -->
	    <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
	      <a class="page-link" aria-label="Previous">
	        <span aria-hidden="true" class="manage-no-page-span">
	        	&lt;
	        </span>
	      </a>
	    </c:if>
	    
	    </li>

	    <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	    	<li class="page-item"><a class="page-link manage-pagination" href="#">${ i }</a></li>
	    </c:forEach>

		<li class="page-item">
		
	    <!-- 다음 버튼 활성화 -->
	    <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">
	        	&gt;
	        </span>
	      </a>
	    </c:if>
	    
	    <!-- 다음 버튼 비활성화 -->
	    <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	      <a class="page-link" aria-label="Next">
	        <span aria-hidden="true" class="manage-no-page-span">
	        	&gt;
	        </span>
	      </a>	    
	    </c:if>
	    
		</li>
	  </ul>
	</nav>