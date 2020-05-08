$(function(){
	// loop 설정용 변수
	var recentlyFlag;
	
	var userId = $('.user-hidden-value').val();

	var recentlyOwl = $('#owl-recently');
	
	$.ajax(
			{
				url : "/myHobbyClass/json/getRecentlyHobbyClassList", 
				method : "post", 
				dataType : "json",
				async : false, 
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
				success : function(JSONData, status) {
					
					if ( JSONData.recentlyHobbyClassList.length == 0 ) {
						$('.row-recently-hobby-class').hide();
					}
					else {
						$('.row-recently-hobby-class').show();
					}
					
					var display = "";
					var category = "";
					
					if ( JSONData.recentlyHobbyClassList.length > 3 ) {
						recentlyFlag = true; // 4개 초과면 무한루프
						
						$('#recentlyNext').show();
						$('#recentlyPrev').show();
						
						// 버튼 활성화
						
						$('#recentlyNext').attr('disabled', false);
						$('#recentlyPrev').attr('disabled', false);
					}
					else if ( JSONData.recentlyHobbyClassList.length <= 3) {
						recentlyFlag = false; // 3개 이하면 그런거 없음 
						
						$('#recentlyNext').hide();
						$('#recentlyPrev').hide();
						
						// 버튼 비활성화
						$('#recentlyNext').attr('disabled', true);
						$('#recentlyPrev').attr('disabled', true);
					}
					
					for(var i = 0; i < JSONData.recentlyHobbyClassList.length; i++) {
						// 카테고리 찾기 
						if ( JSONData.recentlyHobbyClassList[i].category == 'E' ) {
							category = "운동";
						}
						else if ( JSONData.recentlyHobbyClassList[i].category == 'A' ) {
							category = "미술";
						}
						else if ( JSONData.recentlyHobbyClassList[i].category == 'M' ) {
							category = "음악";
						}
						else if ( JSONData.recentlyHobbyClassList[i].category == 'L' ) {
							category = "라이프스타일";
						}
						else if ( JSONData.recentlyHobbyClassList[i].category == 'C' ) {
							category = "요리";
						}
						else if ( JSONData.recentlyHobbyClassList[i].category == 'H' ) {
							category = "공예";
						}
						
						// 부엉이 item 시작 
						display += "<div class='item'>";
						
						// bootstrap card 시작 
						display += "<div class='card mb-4'>";
						display += "<input type='hidden' name='recentlyHobbyClassNo' value='" + JSONData.recentlyHobbyClassList[i].hobbyClassNo +"'/>";
						display += "<input type='hidden' name='recentlySteamCount' value='" + JSONData.recentlyHobbyClassList[i].steamCount +"'/>";
						
						display += "<div id='recentlyCardImage'>";
						display += "<span>";
						display += "<img name='recentlyCardImage' src='/images/hobbyclass/" + JSONData.recentlyHobbyClassList[i].hobbyClassImage + "' class='card-img-top' style=height:250px>";
						
						if ( JSONData.recentlyHobbyClassList[i].event != null ) { 
							display += "<div class='outer-card-image'>";
							display += "<div class='inner-card-bottom-text'>최대";
							display += "</div>";
							display += "<div class='inner-card-top-text'>" + JSONData.recentlyHobbyClassList[i].event.eventDiscount +'%';
							display += "</div>";
							display += "<div class='inner-card-bottom-text'>할인 중";
							display += "</div>";
							display += "</div>";
						}
						
						display += "</div>";
						display += "</span>";
						// bootstrap card 본체 시작 
						display += "<div class='card-body'>";
						
						display += "<div class='card-title'>";
						display += "<div class='go-to-the-center-please'>";
						display += "<span class='card-title-class-title'>" + JSONData.recentlyHobbyClassList[i].hobbyClassName + "</span>";
						display += "</span>";
						display += "</div>";
						display += "</div>";
						
						display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
						
						display += "<p class='card-text'>";
						
						for (var k = 0; k < JSONData.recentlyHobbyClassList[i].hashtag.length; k++){
							display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.recentlyHobbyClassList[i].hashtag[k] + "</span>";
							display += "<br/>";
						}
						
						display += "</p>";
						
						display += "</div>";
						// bootstrap card 본체 끝 
						
						// bootstrap card 하단 시작 
						display += "<div class='card-footer'>";
						display += "<small class='text-muted'>";
						display += "<p class='card-text'>";
						display += "<button type='button' class='btn btn-light' name='recentlySteam' value='" + JSONData.recentlyHobbyClassList[i].steamCheck +"'>";
						
						if ( JSONData.recentlyHobbyClassList[i].steamCheck == '0' ) {
							display += "<i class='far fa-heart'></i>";
						}
						else if ( JSONData.recentlyHobbyClassList[i].steamCheck == '1' ) {
							display += "<i class='fas fa-heart'></i>";
						}
						display += "<span name='recentlySteamCount'>";
						display += "&nbsp;&nbsp;" + JSONData.recentlyHobbyClassList[i].steamCount;
						
						display += "</button>";
						display += "</span>";
						display += "</small>";
						display += "</div>";
						// bootstrap card 하단 끝
						
						display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
						display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
						
						var classState = '';
						
						if ( JSONData.recentlyHobbyClassList[i].hobbyClassState == 3 ) {
							classState = '수요조사 중';
						}
						else if ( JSONData.recentlyHobbyClassList[i].hobbyClassState == 5 ) {
							classState = '개강';
						}
						else if ( JSONData.recentlyHobbyClassList[i].hobbyClassState == 4 ) {
							classState = '수요조사 완료';
						}
						else if ( JSONData.recentlyHobbyClassList[i].hobbyClassState == 6 ) {
							classState = '종강';
						}
						else {
							classState = '그 외';
						}
						display += '&nbsp;';
						display += classState;
						
						
						display += "</div>";
						// bootstrap card 끝 
						
						display += "</div>";
						// 부엉이 item 끝 
					}
					
					recentlyOwl.html(display);
					
				}
			}
	)
	
	// 부엉이 설정 
	recentlyOwl.owlCarousel({
		loop : recentlyFlag,
	    margin : 20,
	    itemsScaleUp :true,
	    responsive:{
	        0 : {
	            items : 1
	        },
	        600 : {
	            items : 2
	        },
	        1000 : {
	            items : 3
	        }
	    }
	});
	
	// 부엉이 버튼 이벤트 시작 
  	$("#recentlyNext").click(function(){
  		recentlyOwl.trigger('next.owl.carousel');
  	})
  	$("#recentlyPrev").click(function(){
  		recentlyOwl.trigger('prev.owl.carousel');
  	})
  	// 부엉이 버튼 이벤트 끝 
  	
  	// 찜하기 이벤트 시작 
  	$(document).on('click', 'button[name="recentlySteam"]', function(){
  		console.log('최근에 본 클래스 찜하기 버튼 클릭');
  		// 로그인 안했으면 하라고 시키기 네비게이션 시키면 될듯 
  		if ( userId == null || userId == '' ) {
  			self.location = '/user/noLogonUser?type=mypageSteam';	
  			event.preventDafault();
  		}
  		
  		var steamButton = $(this);
  		var hobbyClassInput = $(this).parents('.card').find('input[name="recentlyHobbyClassNo"]');
  		var steamCountInput = $(this).parents('.card').find('input[name="recentlySteamCount"]');
  		var divCard = $(this).parents('.card');
  		
  		var url = '';
  		
  		// 찜하기 유무로 찜할지말건지 
  		if ( steamButton.val() == 0 ) {
  			url = '/myHobbyClass/json/addSteamHobbyClass';
  		}
  		else if ( steamButton.val() == 1 ) {
  			url = '/myHobbyClass/json/deleteSteamHobbyClass';
  		}
  		
  		
  		$.ajax(
  				{
  					url : url, 
  					method : "post",
  					dataType : "json", 
  					headers : {
  						"Accept" : "application/json",
  						"Content-Type" : "application/json"
  					},
  					data : JSON.stringify({
  						hobbyClassNo : hobbyClassInput.val(),
  						// 이거 삭제해도 될듯 
  						steamCount : steamCountInput.val()
  					}),
  					success : function(JSONData, status) {
  						if ( JSONData.result == 'error' ) {
  							self.location = '/user/noLogonUser?type=mypageSteam';	
  						}
  						else if ( JSONData.result == 'ok' ) {
	  							  						  						
	  						var display = "";
	  						display += "<button type='button' class='btn btn-light' name='recentlySteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
	  						
	  						if ( JSONData.hobbyClass.steamCheck == '0' ) {
								display += "<i class='far fa-heart'></i>";
							}
	  						/*
							else if ( JSONData.hobbyClass.steamCheck == '1' ) {
								display += "<i class='fas fa-heart'></i>";
							}
	  						*/
	  						else {
	  							display += "<i class='fas fa-heart'></i>";
	  						}
	  						display += "<span name='recentlySteamCount'>";
	  						display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
	  						display += "</button>";
	  						
							steamButton.parent().html(display);
							
							steamCountInput.val(JSONData.hobbyClass.steamCount);
							
							
							// 새롭게 steamList 추가 
							if ( JSONData.hobbyClass.steamCheck == '1' ) {
								display = '';
								
								// 카테고리 찾기 
								if ( JSONData.hobbyClass.category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClass.category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClass.category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClass.category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClass.category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClass.category == 'H' ) {
									category = "공예";
								}
								
								// 부엉이 item 시작 
								display += "<div class='item'>";
								
								
								
								// bootstrap card 시작 
								display += "<div class='card mb-4'>";
								display += "<input type='hidden' name='steamHobbyClassNo' value='" + JSONData.hobbyClass.hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamSteamCount' value='" + JSONData.hobbyClass.steamCount +"'/>";
								
								display += "<div id='steamCardImage'>";
								display += "<input type='hidden' class='hidden-image-to-steam' value='" + JSONData.hobbyClass.hobbyClassImage + "'";
								display += "<span>";
								display += "<img name='steamCardImage' src='/images/hobbyclass/" + JSONData.hobbyClass.hobbyClassImage + "' class='card-img-top' style=height:250px>";
								
								if ( JSONData.hobbyClass.event != null ) { 
									display += "<div class='outer-card-image'>";
									display += "<div class='inner-card-bottom-text'>최대";
									display += "</div>";
									display += "<div class='inner-card-top-text'>" + JSONData.hobbyClass.event.eventDiscount +'%';
									display += "</div>";
									display += "<div class='inner-card-bottom-text'>할인 중";
									display += "</div>";
									display += "</div>";
								}
								
								display += "</div>";
								display += "</span>";
								// bootstrap card 본체 시작 
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClass.hobbyClassName + "</span>";
								display += "</span>";
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClass.hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClass.hashtag[k] + "</span>";
									display += "<br/>";
								}
								
								display += "</p>";
								
								display += "</div>";
								// bootstrap card 본체 끝 
								
								// bootstrap card 하단 시작 
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								display += "<button type='button' class='btn btn-light' name='steamSteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
								
								if ( JSONData.hobbyClass.steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClass.steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamSteamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
								
								display += "</button>";
								display += "</span>";
								display += "</small>";
								display += "</div>";
								// bootstrap card 하단 끝
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClass.hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClass.hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClass.hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClass.hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								
								
								display += "</div>";
								// bootstrap card 끝 
								
								display += "</div>";
								// 부엉이 item 끝 
								
	//						    $("#owl-steam").trigger('add.owl.carousel', ['<div class="item"><img src="http://placehold.it/140x100" alt=""></div>']).trigger('refresh.owl.carousel');
								$("#owl-steam").trigger('add.owl.carousel', [display]).trigger('refresh.owl.carousel');
								
								
								if ( $('#owl-steam').find('.item').length >= 3 ) {
									$('#steamNext').attr('disabled', true);
									$('#steamPrev').attr('disabled', true);
								}
								else {
									$('#steamNext').attr('disabled', false);
									$('#steamPrev').attr('disabled', false);
								}
								
								if ( $('#owl-steam').find('.item').length == 0 ) {
									$('.row-steam-hobby-class-list').hide();
								}
								else {
									$('.row-steam-hobby-class-list').show();
								}
							}
							else if ( JSONData.hobbyClass.steamCheck == '0' ) {
								
								var changeSteamHobbyClass = $('.row-steam-hobby-class-list').find('input[name="steamHobbyClassNo');
								var deleteSteamHobbyClassNo = JSONData.hobbyClass.hobbyClassNo;
								
								for ( var i = 0; i < changeSteamHobbyClass.length; i++ ) {
									
									if ( changeSteamHobbyClass.eq(i).val() == deleteSteamHobbyClassNo ) {
										var index = i;
										$("#owl-steam").trigger('remove.owl.carousel', [index]).trigger('refresh.owl.carousel');
										
										if ( $('#owl-steam').find('.item').length == 0 ) {
											$('.row-steam-hobby-class-list').hide();
										}
										else {
											$('.row-steam-hobby-class-list').show();
										}
									}
									
								}
							}
	
							
							$("#owl-steam").trigger('refresh.owl.carousel');
	  						$("#owl-recently").trigger('refresh.owl.carousel');
							
	  					}
  					}
  				}
  		)
  	})
  	// 찜하기 이벤트 끝 
  	
  	// 이미지 클릭 이벤트(상세보기) 시작 
  	$(document).on('click', 'img[name="recentlyCardImage"]', function(){
		var hobbyClassNo = $(this).parents('.item').find('input[name="recentlyHobbyClassNo"]').val();
		console.log('img click');
		console.log('hobbyClassNo ? : ' + hobbyClassNo );
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
	});
 	// 이미지 클릭 이벤트(상세보기) 시작 
})