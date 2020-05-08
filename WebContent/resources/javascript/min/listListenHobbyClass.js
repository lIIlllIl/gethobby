

// loop 설정용 변수 
var listenFlag;

$(function(){	
	// 로그인 상태를 확인하기 위한 변수 
	var userId = $('.user-hidden-value').val();
	
	// 부엉이 본체 
	var listenOwl = $("#owl-listen");
	
	// 바로 ajax로 데이터 불러오기 때문에 동기화로 
	$.ajax(
			{
				url : "/myHobbyClass/json/getListenHobbyClassList",
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
					
					if ( JSONData.listenHobbyClassList.length > 3 ) {
						listenFlag = true; // 4개 초과면 무한루프 
						
						$('#listenNext').show();
						$('#listenPrev').show();
						
						// 버튼 활성화 
						$('#listenNext').attr('disabled', false);
						$("#listenPrev").attr('disabled', false);
					}
					else if ( JSONData.listenHobbyClassList.length < 3 ) {
						listenFlag = false; // 3개 이하면 그런거 없음 
						
						$('#listenNext').hide();
						$('#listenPrev').hide();
						
						// 버튼 비활성화 
						$('#listenNext').attr('disabled', true);
						$("#listenPrev").attr('disabled', true);
					}
					else if ( JSONData.listenHobbyClassList.length == 0 ) {
						listenFlag = false; // 3개 이하면 그런거 없음 
						$('#listenNext').hide();
						$('#listenPrev').hide();
					}
					for(var i = 0; i < JSONData.listenHobbyClassList.length; i++) {
						// 카테고리 찾기 
						if ( JSONData.listenHobbyClassList[i].category == 'E' ) {
							category = "운동";
						}
						else if ( JSONData.listenHobbyClassList[i].category == 'A' ) {
							category = "미술";
						}
						else if ( JSONData.listenHobbyClassList[i].category == 'M' ) {
							category = "음악";
						}
						else if ( JSONData.listenHobbyClassList[i].category == 'L' ) {
							category = "라이프스타일";
						}
						else if ( JSONData.listenHobbyClassList[i].category == 'C' ) {
							category = "요리";
						}
						else if ( JSONData.listenHobbyClassList[i].category == 'H' ) {
							category = "공예";
						}
						
						// 부엉이 item 시작 
						display += "<div class='item'>";
						
						// bootstrap card 시작 
						display += "<div class='card mb-4'>";
						display += "<input type='hidden' name='listenHobbyClassNo' value='" + JSONData.listenHobbyClassList[i].hobbyClassNo +"'/>";
						display += "<input type='hidden' name='listenSteamCount' value='" + JSONData.listenHobbyClassList[i].steamCount +"'/>";
						
						display += "<div id='listenCardImage'>";
						
						display += "<span>";
						display += "<img name='listenCardImage' src='/images/hobbyclass/" + JSONData.listenHobbyClassList[i].hobbyClassImage + "' class='card-img-top' style=height:250px>";

						display += "</div>";
						display += "</span>";
						// bootstrap card 본체 시작 
						display += "<div class='card-body'>";
						
						display += "<div class='card-title'>";
						display += "<div class='go-to-the-center-please'>";
						display += "<span class='card-title-class-title'>" + JSONData.listenHobbyClassList[i].hobbyClassName + "</span>";
						display += "</span>";
						display += "</div>";
						display += "</div>";
						
						display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
						
						display += "<p class='card-text'>";
						
						for (var k = 0; k < JSONData.listenHobbyClassList[i].hashtag.length; k++){
							display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.listenHobbyClassList[i].hashtag[k] + "</span>";
							display += "<br/>";
						}
						
						display += "</p>";
						
						display += "</div>";
						// bootstrap card 본체 끝 
						
						
						// bootstrap card 하단 시작 
						display += "<div class='card-footer'>";
						display += "<p class='card-text'>";
						display += "<span class='badge wrapper-yello text-wrap'><i class='far fa-calendar-alt'></i>클래스 오픈기간</span>";
						display += "<br/>";
						display += "<span class='badge wrapper-yello text-wrap'>" + JSONData.listenHobbyClassList[i].startDate + "</span>";
						display += "&nbsp;~&nbsp";
						display += "<span class='badge wrapper-yello text-wrap'>" + JSONData.listenHobbyClassList[i].endDate + "</span>";
						display += "</span>";
						display += "</div>";
						// bootstrap card 하단 끝
						
						/*
						display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
						display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
						
						var classState = '';
						
						if ( JSONData.listenHobbyClassList[i].hobbyClassState == 3 ) {
							classState = '수요조사 중';
						}
						else if ( JSONData.listenHobbyClassList[i].hobbyClassState == 5 ) {
							classState = '개강';
						}
						else if ( JSONData.listenHobbyClassList[i].hobbyClassState == 4 ) {
							classState = '수요조사 완료';
						}
						else if ( JSONData.listenHobbyClassList[i].hobbyClassState == 6 ) {
							classState = '종강';
						}
						else {
							classState = '그 외';
						}
						display += '&nbsp;';
						display += classState;
						*/
						
						display += "</div>";
						// bootstrap card 끝 
						
						display += "</div>";
						// 부엉이 item 끝 
					}
					
					listenOwl.html(display);
				}
			}
	)
	
	// 부엉이 설정 
	listenOwl.owlCarousel({
		loop : listenFlag,
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
  	$("#listenNext").on('click', function(){
  		listenOwl.trigger('next.owl.carousel');
  	})
  	$("#listenPrev").on('click', function(){
  		listenOwl.trigger('prev.owl.carousel');
  	})
  	// 부엉이 버튼 이벤트 끝 

  	// 찜하기 이벤트 시작 
  	$(document).on('click', 'button[name="listenSteam"]', function(){
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

				self.location = '/user/noLogonUser?type=steam';	
				event.preventDafault();
			});
			*/
  			$('.spinner-border').show();		
  			self.location = '/user/noLogonUser?type=steam';	
  			event.preventDafault();
  		}
  		else {
  			console.log('userId ? : ' + userId);
  	  		var steamButton = $(this);
  	  		var hobbyClassInput = $(this).parents('.card').find('input[name="listenHobbyClassNo"]');
  	  		var steamCountInput = $(this).parents('.card').find('input[name="listenSteamCount"]');
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
	  	  						display += "<button type='button' class='btn btn-light' name='listenSteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
	  	  						
	  	  						if ( JSONData.hobbyClass.steamCheck == '0' ) {
	  								display += "<i class='far fa-heart'></i>";
	  							}
	  							else if ( JSONData.hobbyClass.steamCheck == '1' ) {
	  								display += "<i class='fas fa-heart'></i>";
	  							}
	  	  						
	  	  						display += "<span name='listenSteamCount'>";
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
  	$(document).on('click', 'img[name="listenCardImage"]', function(){
		var hobbyClassNo = $(this).parents('.item').find('input[name="listenHobbyClassNo"]').val();
		console.log('img click');
		console.log('hobbyClassNo ? : ' + hobbyClassNo );
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
	});
 	// 이미지 클릭 이벤트(상세보기) 시작 
})