<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="hidden" class="user-hidden-value" value="${sessionScope.user.userId }"/>
	<div class="container border-bottom mb-5">
		<h4 class="recommend-hobby-class-list-h4-tag mt-3 mb-3">추천 클래스</h4>
	</div>
				<div class="container">
					<div class="row">
					
						<div class="col-1 nav">
							<button type="button" class="btn btn-light" id="recommendPrev"><i class="fa fas fa-chevron-left" style="font-size:48px"></i></button>
						</div>
						
						<div class="col-10">
							<!-- owl-carousel 시작 -->
							<div class="owl-carousel owl-theme" id="owl-recommend">
							   
							</div>
							<!-- owl-carousel 끝 -->
						</div>
						
						<div class="col-1 nav">
							<button type="button" class="btn btn-light" id="recommendNext"><i class="fa fas fa-chevron-right" style="font-size:48px"></i></button>
						</div>
						
					</div>
			</div>
