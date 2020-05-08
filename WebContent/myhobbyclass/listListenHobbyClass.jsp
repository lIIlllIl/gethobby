<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container border-bottom mb-5">
	<h4 class="listen-hobby-class-list-h4-tag mt-3 mb-3">수강중인 클래스</h4>
</div>
<div class="container">
	<div class="row">
	
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="listenPrev"><i class="fas fa-chevron-left" style="font-size:48px"></i></button>
		</div>
		
		<div class="col-10">
			<!-- owl-carousel 시작 -->
			<div class="owl-carousel owl-theme" id="owl-listen">
			   
			</div>
			<!-- owl-carousel 끝 -->
		</div>
		
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="listenNext"><i class="fas fa-chevron-right" style="font-size:48px"></i></button>
		</div>
		
	</div>
</div>
