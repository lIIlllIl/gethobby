$(function(){
	// loop 설정용 변수
	var recommendFlag;
	
	var userId = $('.user-hidden-value').val();

	var recommendOwl = $('#owl-recommend');
	
	$.ajax(
			{
				url : "/myHobbyClass/json/getRecommendHobbyClassList", 
				method : "post", 
				dataType : "json",
				async : false, 
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
				success : function(JSONData, status) {
					
					if ( JSONData.recommendHobbyClassList.length == 0 ) {
						$('.row-recommend-hobby-class-list').hide();
						$('#recommendPrev').hide();
						$('#recommendNext').hide();
					}
					else {
						$('.row-recommend-hobby-class-list').show();
						$('#recommendPrev').show();
						$('#recommendNext').show();						
					}
					
					var display = "";
					var category = "";
					
					if ( JSONData.recommendHobbyClassList.length > 3 ) {
						recommendFlag = true; // 4개 초과면 무한루프
						
						// 버튼 활성화
						
						$('#recommendNext').attr('disabled', false);
						$('#recommendPrev').attr('disabled', false);
					}
					else if ( JSONData.recommendHobbyClassList.length <= 3) {
						recommendFlag = false; // 3개 이하면 그런거 없음 
						
						// 버튼 비활성화
						$('#recommendNext').attr('disabled', true);
						$('#recommendPrev').attr('disabled', true);
					}
					
					for(var i = 0; i < JSONData.recommendHobbyClassList.length; i++) {
						// 카테고리 찾기 
						if ( JSONData.recommendHobbyClassList[i].category == 'E' ) {
							category = "운동";
						}
						else if ( JSONData.recommendHobbyClassList[i].category == 'A' ) {
							category = "미술";
						}
						else if ( JSONData.recommendHobbyClassList[i].category == 'M' ) {
							category = "음악";
						}
						else if ( JSONData.recommendHobbyClassList[i].category == 'L' ) {
							category = "라이프스타일";
						}
						else if ( JSONData.recommendHobbyClassList[i].category == 'C' ) {
							category = "요리";
						}
						else if ( JSONData.recommendHobbyClassList[i].category == 'H' ) {
							category = "공예";
						}
						
						// 부엉이 item 시작 
						display += "<div class='item'>";
						
						// bootstrap card 시작 
						display += "<div class='card mb-4'>";
						display += "<input type='hidden' name='recommendHobbyClassNo' value='" + JSONData.recommendHobbyClassList[i].hobbyClassNo +"'/>";
						display += "<input type='hidden' name='recommendSteamCount' value='" + JSONData.recommendHobbyClassList[i].steamCount +"'/>";
						
						display += "<div id='recommendCardImage'>";
						console.log(JSONData.recommendHobbyClassList[i].hobbyClassImage);
						display += "<span>";
						display += "<img name='recommendCardImage' src='/images/hobbyclass/" + JSONData.recommendHobbyClassList[i].hobbyClassImage + "' class='card-img-top' style=height:250px>";
						
						if ( JSONData.recommendHobbyClassList[i].event != null ) { 
							display += "<div class='outer-card-image'>";
							display += "<div class='inner-card-bottom-text'>최대";
							display += "</div>";
							display += "<div class='inner-card-top-text'>" + JSONData.recommendHobbyClassList[i].event.eventDiscount +'%';
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
						display += "<span class='card-title-class-title'>" + JSONData.recommendHobbyClassList[i].hobbyClassName + "</span>";
						display += "</span>";
						display += "</div>";
						display += "</div>";
						
						display += "<p class='card-text'><span class='badge wrapper-basic text-wrap text-wrap-width-class'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
						
						display += "<p class='card-text'>";
						
						for (var k = 0; k < JSONData.recommendHobbyClassList[i].hashtag.length; k++){
							display += "<span class='badge wrapper-basic text-wrap text-hashtag-wrap-width-class'><i class='fas fa-hashtag'></i>" + JSONData.recommendHobbyClassList[i].hashtag[k] + "</span>";
							display += "<br/>";
						}
						
						display += "</p>";
						
						display += "</div>";
						// bootstrap card 본체 끝 
						
						// bootstrap card 하단 시작 
						display += "<div class='card-footer'>";
						display += "<small class='text-muted'>";
						display += "<p class='card-text'>";
						display += "<button type='button' class='btn btn-light' name='recommendSteam' value='" + JSONData.recommendHobbyClassList[i].steamCheck +"'>";
						
						if ( JSONData.recommendHobbyClassList[i].steamCheck == '0' ) {
							display += "<i class='far fa-heart'></i>";
						}
						else if ( JSONData.recommendHobbyClassList[i].steamCheck == '1' ) {
							display += "<i class='fas fa-heart'></i>";
						}
						display += "<span name='recommendSteamCount'>";
						display += "&nbsp;&nbsp;" + JSONData.recommendHobbyClassList[i].steamCount;
						
						display += "</button>";
						display += "</span>";
						display += "</small>";
						display += "</div>";
						// bootstrap card 하단 끝
						
						display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
						display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
						
						var classState = '';
						
						if ( JSONData.recommendHobbyClassList[i].hobbyClassState == 3 ) {
							classState = '수요조사 중';
						}
						else if ( JSONData.recommendHobbyClassList[i].hobbyClassState == 5 ) {
							classState = '개강';
						}
						else if ( JSONData.recommendHobbyClassList[i].hobbyClassState == 4 ) {
							classState = '수요조사 완료';
						}
						else if ( JSONData.recommendHobbyClassList[i].hobbyClassState == 6 ) {
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
					
					recommendOwl.html(display);
					
				}
			}
	)
	
	// 부엉이 설정 
	recommendOwl.owlCarousel({
		loop : recommendFlag,
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
  	$("#recommendNext").click(function(){
  		recommendOwl.trigger('next.owl.carousel');
  	})
  	$("#recommendPrev").click(function(){
  		recommendOwl.trigger('prev.owl.carousel');
  	})
  	// 부엉이 버튼 이벤트 끝 
  	
  	// 찜하기 이벤트 시작 
  	$(document).on('click', 'button[name="recommendSteam"]', function(){
  		// 로그인 안했으면 하라고 시키기 네비게이션 시키면 될듯 
  		if ( userId == null || userId == '' ) {
  			$('.spinner-border').show();		
  			self.location = '/user/noLogonUser?type=steam';	
  			event.preventDafault();
  		}
  		else {
  			console.log('userId ? : ' + userId);
  	  		var steamButton = $(this);
  	  		var hobbyClassInput = $(this).parents('.card').find('input[name="recommendHobbyClassNo"]');
  	  		var steamCountInput = $(this).parents('.card').find('input[name="recommendSteamCount"]');
  	  		var divCard = $(this).parents('.card');
  	  		
  	  		var url = '';
  	  		
  	  		// 찜하기 유무로 찜할지말건지 
  	  		if ( steamButton.val() == 0 ) {
  	  			url = '/myHobbyClass/json/addSteamHobbyClass';
  	  		}
  	  		else if ( steamButton.val() == 1 ) {
  	  			url = '/myHobbyClass/json/deleteSteamHobbyClass';
  	  		}
  	  		
  	  		console.log('url ? : ' + url);
  	  		
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
  	  							$('.spinner-border').show();								
  	  							self.location = '/user/noLogonUser?type=steam';
  	  						}
  	  						else if ( JSONData.result == 'ok' ) {
  	  						
	  	  						var display = "";
	  	  						display += "<button type='button' class='btn btn-light' name='recommendSteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
	  	  						
	  	  						if ( JSONData.hobbyClass.steamCheck == '0' ) {
	  								display += "<i class='far fa-heart'></i>";
	  							}
	  							else if ( JSONData.hobbyClass.steamCheck == '1' ) {
	  								display += "<i class='fas fa-heart'></i>";
	  							}
	  	  						
	  	  						display += "<span name='recommendSteamCount'>";
	  	  						display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
	  	  						display += "</button>";
	  	  						
	  	  						steamCountInput.val(JSONData.hobbyClass.steamCount);
	  							steamButton.parent().html(display);
  	  						}
  	  					}
  	  				}
  	  		)
  		}
  		
  	})
  	// 찜하기 이벤트 끝 
  	
  	// 이미지 클릭 이벤트(상세보기) 시작 
  	$(document).on('click', 'img[name="recommendCardImage"]', function(){
		var hobbyClassNo = $(this).parents('.item').find('input[name="recommendHobbyClassNo"]').val();
		console.log('img click');
		console.log('hobbyClassNo ? : ' + hobbyClassNo );
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
	});
 	// 이미지 클릭 이벤트(상세보기) 시작 
})