<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container border-bottom mb-5">
	<h4 class="recently-hobby-class-list-h4-tag mt-3 mb-3">최근에 본 클래스</h4>
</div>
		<input type="hidden" class="user-hidden-value" value="${sessionScope.user.userId }" />
		<div class="container">
			<div class="row row-recently-hobby-class">
			
				<div class="col-1 nav">
					<button type="button" class="btn btn-light" id="recentlyPrev"><i class="fa fas fa-chevron-left" style="font-size:48px"></i></button>
				</div>
				
				<div class="col-10">
					<!-- owl-carousel 시작 -->
					<div class="owl-carousel owl-theme" id="owl-recently">
					   
					</div>
					<!-- owl-carousel 끝 -->
				</div>
				
				<div class="col-1 nav">
					<button type="button" class="btn btn-light" id="recentlyNext"><i class="fa fas fa-chevron-right" style="font-size:48px"></i></button>
				</div>
				
			</div>
	</div>
