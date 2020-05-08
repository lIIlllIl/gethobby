// loop 설정용 변수 
var steamFlag;

$(function(){	
	// 부엉이 본체 
	var steamOwl = $("#owl-steam");
	
	// 바로 ajax로 데이터 불러오기 때문에 동기화로 
	$.ajax(
	{
		url : "/myHobbyClass/json/getSteamHobbyClassList", 
		method : "post", 
		dataType : "json",
		async : false, 
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		}, 
		success : function(JSONData, status) {
			
			if ( JSONData.steamHobbyClassList.length == 0 ) {
				$('.row-steam-hobby-class-list').hide();
			}
			else {
				$('.row-steam-hobby-class-list').show();
			}
			
			var display = "";
			var category = "";
			
			if ( JSONData.steamHobbyClassList.length > 3 ) {
				steamFlag = true; // 4개 초과면 무한루프
				
				// 버튼 활성화
				
				$('#steamNext').attr('disabled', false);
				$('#steamPrev').attr('disabled', false);
			}
			else if ( JSONData.steamHobbyClassList.length <= 3) {
				steamFlag = false; // 3개 이하면 그런거 없음 
				
				// 버튼 비활성화
				$('#steamNext').attr('disabled', true);
				$('#steamPrev').attr('disabled', true);
			}
			
			for(var i = 0; i < JSONData.steamHobbyClassList.length; i++) {
				// 카테고리 찾기 
				if ( JSONData.steamHobbyClassList[i].category == 'E' ) {
					category = "운동";
				}
				else if ( JSONData.steamHobbyClassList[i].category == 'A' ) {
					category = "미술";
				}
				else if ( JSONData.steamHobbyClassList[i].category == 'M' ) {
					category = "음악";
				}
				else if ( JSONData.steamHobbyClassList[i].category == 'L' ) {
					category = "라이프스타일";
				}
				else if ( JSONData.steamHobbyClassList[i].category == 'C' ) {
					category = "요리";
				}
				else if ( JSONData.steamHobbyClassList[i].category == 'H' ) {
					category = "공예";
				}
				
				// 부엉이 item 시작 
				display += "<div class='item'>";
				
				
				
				// bootstrap card 시작 
				display += "<div class='card mb-4'>";
				display += "<input type='hidden' name='steamHobbyClassNo' value='" + JSONData.steamHobbyClassList[i].hobbyClassNo +"'/>";
				display += "<input type='hidden' name='steamSteamCount' value='" + JSONData.steamHobbyClassList[i].steamCount +"'/>";
				
				display += "<div id='steamCardImage'>";
				display += "<input type='hidden' class='hidden-image-to-steam' value='" + JSONData.steamHobbyClassList[i].hobbyClassImage + "'";
				display += "<span>";
				display += "<img name='steamCardImage' src='/images/hobbyclass/" + JSONData.steamHobbyClassList[i].hobbyClassImage + "' class='card-img-top' style=height:250px>";
				
				if ( JSONData.steamHobbyClassList[i].event != null ) { 
					display += "<div class='outer-card-image'>";
					display += "<div class='inner-card-bottom-text'>최대";
					display += "</div>";
					display += "<div class='inner-card-top-text'>" + JSONData.steamHobbyClassList[i].event.eventDiscount +'%';
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
				display += "<span class='card-title-class-title'>" + JSONData.steamHobbyClassList[i].hobbyClassName + "</span>";
				display += "</span>";
				display += "</div>";
				display += "</div>";
				
				display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
				
				display += "<p class='card-text'>";
				
				for (var k = 0; k < JSONData.steamHobbyClassList[i].hashtag.length; k++){
					display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.steamHobbyClassList[i].hashtag[k] + "</span>";
					display += "<br/>";
				}
				
				display += "</p>";
				
				display += "</div>";
				// bootstrap card 본체 끝 
				
				// bootstrap card 하단 시작 
				display += "<div class='card-footer'>";
				display += "<small class='text-muted'>";
				display += "<p class='card-text'>";
				display += "<button type='button' class='btn btn-light' name='steamSteam' value='" + JSONData.steamHobbyClassList[i].steamCheck +"'>";
				
				if ( JSONData.steamHobbyClassList[i].steamCheck == '0' ) {
					display += "<i class='far fa-heart'></i>";
				}
				else if ( JSONData.steamHobbyClassList[i].steamCheck == '1' ) {
					display += "<i class='fas fa-heart'></i>";
				}
				display += "<span name='steamSteamCount'>";
				display += "&nbsp;&nbsp;" + JSONData.steamHobbyClassList[i].steamCount;
				
				display += "</button>";
				display += "</span>";
				display += "</small>";
				display += "</div>";
				// bootstrap card 하단 끝
				
				display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
				display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
				
				var classState = '';
				
				if ( JSONData.steamHobbyClassList[i].hobbyClassState == 3 ) {
					classState = '수요조사 중';
				}
				else if ( JSONData.steamHobbyClassList[i].hobbyClassState == 5 ) {
					classState = '개강';
				}
				else if ( JSONData.steamHobbyClassList[i].hobbyClassState == 4 ) {
					classState = '수요조사 완료';
				}
				else if ( JSONData.steamHobbyClassList[i].hobbyClassState == 6 ) {
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
				
				steamOwl.html(display);
				
			}
		}
)
		
		// 부엉이 설정 
	steamOwl.owlCarousel({
		loop : steamFlag,
	    margin : 20,
	    itemsScaleUp :true,
	    dots : true, 
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
  	$("#steamNext").click(function(){
  		steamOwl.trigger('next.owl.carousel');
  	})
  	$("#steamPrev").click(function(){
  		steamOwl.trigger('prev.owl.carousel');
  	})
  	// 부엉이 버튼 이벤트 끝 
  	
  	// 찜하기 이벤트 시작 
  	$(document).on('click', 'button[name="steamSteam"]', function(){
  		var steamButton = $(this);
  		var hobbyClassInput = $(this).parents('.item').find('input[name="steamHobbyClassNo"]');
  		var steamCountInput = $(this).parents('.item').find('input[name="steamSteamCount"]');
  		var divCard = $(this).parents('.card');
  		
  		var hobbyClassInputNo = hobbyClassInput.val();
  		
  		var url = '';
  		
  		// 찜하기 유무로 찜할지말건지 
  		if ( steamButton.val() == 0 ) {
  			url = '/myHobbyClass/json/addSteamHobbyClass';
  		}
  		else if ( steamButton.val() == 1 ) {
  			url = '/myHobbyClass/json/deleteSteamHobbyClass';
  		}
  		
  		var thisHobbyClassNo = $(this).parents('.card').find('input[name="steamHobbyClassNo').val();
  		
  		var topParent = $(this).parents('.owl-item.active');
  		
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
  						var deleteSteamTargetList = $('#owl-steam').find('input[name="steamHobbyClassNo"]');
  						
  						var index; 
  						
  						for (var i = 0; i < deleteSteamTargetList.length; i++) {
  							if ( deleteSteamTargetList.eq(i).val() == thisHobbyClassNo ) {
  								index = i;
  								break;
  							}
  						}
  						
  						$("#owl-steam").trigger('remove.owl.carousel', [index]).trigger('refresh.owl.carousel');
  						
  						if ( $("#owl-steam").find('.item').length == 0 ) {
  							$('.row-steam-hobby-class-list').hide();
  						}
  						else {
  							$('.row-steam-hobby-class-list').show();
  						}
  						
  						var changeSteamHobbyClassNo = JSONData.hobbyClass.hobbyClassNo;
  						var changeSteamCount = JSONData.hobbyClass.steamCount;
  						
  						var recentlyHiddenHobbyClass = $('.row-recently-hobby-class').find('input[name="recentlyHobbyClassNo"]');
  						
  						for (var i = 0; i < recentlyHiddenHobbyClass.length; i++) {
  							if ( recentlyHiddenHobbyClass.eq(i).val() == changeSteamHobbyClassNo ) {
  								
  								
  								var changeCardFooter = recentlyHiddenHobbyClass.eq(i).parents('.item').find('.card-footer').find('p').find('.text-muted');
  								
  								var changeSteamButtonDisplay = '<button type="button" class="btn btn-light" name="recentlySteam" value="0">';
  								changeSteamButtonDisplay += '<i class="far fa-heart"></i>';
  								changeSteamButtonDisplay += '<span name="recentlySteamCount">';
  								changeSteamButtonDisplay += '&nbsp;&nbsp;' + changeSteamCount;
  								changeSteamButtonDisplay += '</button>';
  								
  								changeCardFooter.html(changeSteamButtonDisplay);
  							}
  							
  						}
  						
  						$("#owl-steam").trigger('refresh.owl.carousel');
  						$("#owl-recently").trigger('refresh.owl.carousel');
  						
  						/*
  						var display = "";
  						display += "<button type='button' class='btn btn-light' name='steamSteam' value='" + JSONData.hobbyClass.steamCheck +"'>";
  						
  						
  						if ( JSONData.hobbyClass.steamCheck  == '0' ) {
  							// 이미지 더미데이터로 바꾸기 
  							steamButton.parents('.item').find('img[name="steamCardImage"]').attr('src', 'http://placehold.it/250/E8117F/ffffff?text=sample');
  							display += "<i class='far fa-heart'></i>";
  							
  						}		  				
  						else if ( JSONData.hobbyClass.steamCheck == '1' ) {
  							// 기존 데이터로 복구시키기 
  							var changeImage = steamButton.parents('.item').find('.hidden-image-to-steam').val();
  							var changeImageUrl = '/images/hobbyclass/' + changeImage;
  							console.log('changeImageUrl ? : ' + changeImageUrl);
  							steamButton.parents('.item').find('img[name="steamCardImage"]').attr('src', changeImageUrl);
  							display += "<i class='fas fa-heart'></i>";
  						}
  						
  						display += "<span name='steamSteamCount'>";
  						display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
  						display += "</button>";
  						
						steamButton.parent().html(display);
						*/
  					}
  				}
  		)
  	})
  	// 찜하기 이벤트 끝 
  	
  	// 이미지 클릭 이벤트(상세보기) 시작 
  	$(document).on('click', 'img[name="steamCardImage"]', function(){
		var hobbyClassNo = $(this).parent().parent().children('input[name="steamHobbyClassNo"]').val();
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
	});
 	// 이미지 클릭 이벤트(상세보기) 시작 
})