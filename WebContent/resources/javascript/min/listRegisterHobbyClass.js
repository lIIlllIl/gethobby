// loop 설정용 변수 
var registerFlag;

$(function(){	
	// 로그인 상태를 확인하기 위한 변수 
	var userId = $('.user-hidden-value').val();

	// 부엉이 본체 
	var registerOwl = $("#owl-register");
	
	// 바로 ajax로 데이터 불러오기 때문에 동기화로 
	$.ajax(
			{
				url : "/searchHobbyClass/json/getRegisterHobbyClassList",
				method : "post",
				dataType : "json",
				async : false,
				headers : {
					"Accept" : "application/json", 
					"Content-Type" : "application/json"
				}, 
				success : function(JSONData, status) {
					console.log(JSONData);
					
					var display = "";
					var category = "";
					
					if ( JSONData.registerHobbyClassList.length > 3 ) {
						registerFlag = true; // 4개 초과면 무한루프 
						
						// 버튼 활성화 
						$('#registerNext').attr('disabled', false);
						$("#registerPrev").attr('disabled', false);
					}
					else if ( JSONData.registerHobbyClassList.length <= 3 ) {
						registerFlag = false; // 3개 이하면 그런거 없음 
						
						// 버튼 비활성화 
						$('#registerNext').attr('disabled', true);
						$("#registerPrev").attr('disabled', true);
					}
					
					for(var i = 0; i < JSONData.registerHobbyClassList.length; i++) {
						// 카테고리 찾기 
						if ( JSONData.registerHobbyClassList[i].category == 'E' ) {
							category = "운동";
						}
						else if ( JSONData.registerHobbyClassList[i].category == 'A' ) {
							category = "미술";
						}
						else if ( JSONData.registerHobbyClassList[i].category == 'M' ) {
							category = "음악";
						}
						else if ( JSONData.registerHobbyClassList[i].category == 'L' ) {
							category = "라이프스타일";
						}
						else if ( JSONData.registerHobbyClassList[i].category == 'C' ) {
							category = "요리";
						}
						else if ( JSONData.registerHobbyClassList[i].category == 'H' ) {
							category = "공예";
						}
						
						// 부엉이 item 시작 
						display += "<div class='item'>";
						
						// bootstrap card 시작 
						display += "<div class='card mb-4'>";
						display += "<input type='hidden' name='registerHobbyClassNo' value='" + JSONData.registerHobbyClassList[i].hobbyClassNo +"'/>";
						display += "<input type='hidden' name='registerSteamCount' value='" + JSONData.registerHobbyClassList[i].steamCount +"'/>";
						
						display += "<div id='registerCardImage'>";
						console.log(JSONData.registerHobbyClassList[i].hobbyClassImage);
						display += "<span>";
						display += "<img name='registerCardImage' src='/images/hobbyclass/" + JSONData.registerHobbyClassList[i].hobbyClassImage + "' class='card-img-top' style=height:250px>";
						
						if ( JSONData.registerHobbyClassList[i].event != null ) { 
							display += "<div class='outer-card-image'>";
							display += "<div class='inner-card-bottom-text'>최대";
							display += "</div>";
							display += "<div class='inner-card-top-text'>" + JSONData.registerHobbyClassList[i].event.eventDiscount +'%';
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
						display += "<span class='card-title-class-title'>" + JSONData.registerHobbyClassList[i].hobbyClassName + "</span>";
						display += "</span>";
						display += "</div>";
						display += "</div>";
						
						display += "<p class='card-text'><span class='badge wrapper-basic text-wrap text-wrap-width-class'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
						
						display += "<p class='card-text'>";
						
						for (var k = 0; k < JSONData.registerHobbyClassList[i].hashtag.length; k++){
							display += "<span class='badge wrapper-basic text-wrap text-hashtag-wrap-width-class'><i class='fas fa-hashtag'></i>" + JSONData.registerHobbyClassList[i].hashtag[k] + "</span>";
							display += "&nbsp;";
						}
						
						display += "</p>";
						
						display += "</div>";
						// bootstrap card 본체 끝 
						
						// bootstrap card 하단 시작 
						display += "<div class='card-footer'>";
						display += "<small class='text-muted'>";
						display += "<p class='card-text'>";
						display += "<button type='button' class='btn btn-light' name='registerSteam' value='" + JSONData.registerHobbyClassList[i].steamCheck +"'>";
						
						if ( JSONData.registerHobbyClassList[i].steamCheck == '0' ) {
							display += "<i class='far fa-heart'></i>";
						}
						else if ( JSONData.registerHobbyClassList[i].steamCheck == '1' ) {
							display += "<i class='fas fa-heart'></i>";
						}
						display += "<span name='registerSteamCount'>";
						display += "&nbsp;&nbsp;" + JSONData.registerHobbyClassList[i].steamCount;
						
						display += "</button>";
						display += "</span>";
						display += "</small>";
						display += "</div>";
						// bootstrap card 하단 끝
						
						display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
						display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
						
						var classState = '';
						
						if ( JSONData.registerHobbyClassList[i].hobbyClassState == 3 ) {
							classState = '수요조사 중';
						}
						else if ( JSONData.registerHobbyClassList[i].hobbyClassState == 5 ) {
							classState = '개강';
						}
						else if ( JSONData.registerHobbyClassList[i].hobbyClassState == 4 ) {
							classState = '수요조사 완료';
						}
						else if ( JSONData.registerHobbyClassList[i].hobbyClassState == 6 ) {
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
					
					registerOwl.html(display);
				}
			}
	)
	
	// 부엉이 설정 
	registerOwl.owlCarousel({
		loop : registerFlag,
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
  	$("#registerNext").click(function(){
  		registerOwl.trigger('next.owl.carousel');
  	})
  	$("#registerPrev").click(function(){
  		registerOwl.trigger('prev.owl.carousel');
  	})
  	// 부엉이 버튼 이벤트 끝 
  	
  	// 찜하기 이벤트 시작 
  	$(document).on('click', 'button[name="registerSteam"]', function(){
  		// 로그인 안했으면 하라고 시키기 네비게이션 시키면 될듯 
  		if ( userId == null || userId == '' ) {
  			/*
  			Swal.fire({
				icon : 'error',
				title : '로그인이 필요합니다.',
				showConfirmButton : false, 
				allowOutsideClick : true,
				timer : 800
			}).then((result) => {
				console.log(result);
				
				if ( result.dismiss ) {
					self.location = '/user/noLogonUser?type=steam';	
				}
				return false;
			});
  			*/
  			$('.spinner-border').show();		
  			self.location = '/user/noLogonUser?type=steam';	
  			return false;
  		}
  		
  		console.log('userId ? : ' + userId);
  		var steamButton = $(this);
  		var hobbyClassInput = $(this).parents('.card').find('input[name="registerHobbyClassNo"]');
  		var steamCountInput = $(this).parents('.card').find('input[name="registerSteamCount"]');
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
	  						display += "<button type='button' class='btn btn-light' name='registerSteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
	  						
	  						if ( JSONData.hobbyClass.steamCheck == '0' ) {
								display += "<i class='far fa-heart'></i>";
							}
							else if ( JSONData.hobbyClass.steamCheck == '1' ) {
								display += "<i class='fas fa-heart'></i>";
							}
	  						
	  						display += "<span name='registerSteamCount'>";
	  						display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
	  						display += "</button>";
	  						
	  						steamCountInput.val(JSONData.hobbyClass.steamCount);
							steamButton.parent().html(display);
							
  						}
  					}
  				}
  		)
  	})
  	// 찜하기 이벤트 끝 
  	
  	// 이미지 클릭 이벤트(상세보기) 시작 
  	$(document).on('click', 'img[name="registerCardImage"]', function(){
		var hobbyClassNo = $(this).parents('.item').find('input[name="registerHobbyClassNo"]').val();
		console.log('img click');
		console.log('hobbyClassNo ? : ' + hobbyClassNo );
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
	});
 	// 이미지 클릭 이벤트(상세보기) 시작 
})