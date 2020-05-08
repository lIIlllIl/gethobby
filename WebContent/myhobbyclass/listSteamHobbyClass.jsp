<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="container border-bottom mb-5">
			<h4 class="steam-hobby-class-list-h4-tag mt-3 mb-3">찜한 클래스</h4>
		</div>
		<input type="hidden" class="user-hidden-value" value="${sessionScope.user.userId }" />
		<div class="container">
			<div class="row row-steam-hobby-class-list">
			
				<div class="col-1 nav">
					<button type="button" class="btn btn-light" id="steamPrev"><i class="fa fa-chevron-left" style="font-size:48px"></i></button>
				</div>
				
				<div class="col-10">
					<!-- owl-carousel 시작 -->
					<div class="owl-carousel owl-theme" id="owl-steam">
						<!-- 찜한 클래스 없을 때 새로 붙일 때 기준이 되어주는 친구 -->
						<span class="add-to-new-staem-hobby-class-span"></span> 	  	
					</div>
					<!-- owl-carousel 끝 -->
				</div>
				
				<div class="col-1 nav">
					<button type="button" class="btn btn-light" id="steamNext"><i class="fa fa-chevron-right" style="font-size:48px"></i></button>
				</div>
				
			</div>
		</div>
