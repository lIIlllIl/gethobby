	
	$(function() {
		var currentPage = 1;
		var maxPage;
		var categoryValue = '';
		var categoryName;
		var hashtagSelectCount = 0;
		var hashtagArray = [];
		var hashtagNameArray = [];
		var searchCondition = '';
		var searchKeyword = '';
		var stateValue = '0';
		var delta = 50;
		var timer = null;
		
		// 메인창에 새롭게 스크롤 추가되서 푸터 컨트롤
		$('.footer-outer-div').hide();
		
		
		// 스피너 무조건 감추기
		$('.spinner-outer-div').hide();
		
		// 시작하자마자 창 크기 재서 뭘 숨기고 뭘 감추고 하기 
		var onloadWidth = $(window).width();
		
		if ( onloadWidth <= 980 ) {
			 $('.outer-event-carousel-div').hide();
			 $('.mini-size-category-total-outer-container-div').show();
			 $('#popularPrev').hide();
			 $('#popularNext').hide();
			 $('#registerPrev').hide();
			 $('#registerNext').hide();
			 $('#recommendPrev').hide();
			 $('#recommendNext').hide();
			 $('.main-scroll-outer-div').hide();
		}
		else if ( onloadWidth > 980 ) {
			 $('.outer-event-carousel-div').show();
			 $('.mini-size-category-total-outer-container-div').hide();
			 $('#popularPrev').show();
			 $('#popularNext').show();
			 $('#registerPrev').show();
			 $('#registerNext').show();
			 $('#recommendPrev').show();
			 $('#recommendNext').show();
			 $('.main-scroll-outer-div').show();
		}
		// 시작하자마자 창 크기 재서 뭘 숨기고 뭘 감추고 하기 
		
		// 클래스 진행상태 정렬버튼 숨기기 --------
		$('#search-alignment-button-div').hide();
		// 클래스 진행상태 정렬버튼 숨기기 --------
	
		// 모달창 spinner 숨기기 --------------------
		$('.spinner-border').hide();
		// 모달창 spinner 숨기기 --------------------
		
		// 처음에는 메인창 -------------------------
		
		/* 메인 메뉴 바에서 퇴출되어 이건 사라짐 
		$('.nav-span-text').eq(0).css({
			'font-weight' : 'bold'
		});
		*/
		
		$('.include-for-popular-hobby-class').show();
		
		$('.include-for-register-hobby-class').show();
		
		$('.include-for-recommend-hobby-class').show();
		// 처음에는 메인창 -------------------------
		
		// 경고창 감추기
		$('.warning-text').attr('style', 'visibility:hidden');
		
		// 선택된 메뉴 글씨 굵게 -------------------------------------------------------
		$('.nav-link').on('click', function(){
			// 클래스 진행상태 가리기
			$('#search-alignment-button-div').hide();
			
			// 검색 설정 초기화 
			maxPage = null;
			currentPage = 1;
			hashtagArray = [];
			hashtagNameArray = [];
			hashtagSelectCount = 0;
			searchKeyword = null;
			searchCondition = 0;
			
			$('.search-button-but-form').val('');
			
			$('.dropdown-main-button').text('검색조건');
			$('.search-keyword-input').val('');
			
			// 검색창 가리기 
			$('#search-form-group').attr('style', 'visibility:hidden');
	
			// 기존 검색결과 삭제 
			$('.card-deck').parent().remove();
			$('.scroll-page').remove();
			$('.this-is-not').after("<span class='scroll-page'></span>");
			
			$('.nav-span-text').css({
				'font-weight' : 'normal'
			});
			
			$(this).find('.nav-span-text').css({
				'font-weight' : 'bold'
			});
			
			$('.check-search').val('0');
			$('.main-scroll-outer-div').show();
			$('.main-scroll-current-page').val(1);
			
			$('.footer-outer-div').hide();
			
			var mainSearchObj = new Object();
			
			mainSearchObj.currentPage = 1;
			mainSearchObj.category = 'all'; 
			
			$.ajax(
					{
						url : "/searchHobbyClass/json/getHobbyClassList", 
						method :  "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							search : mainSearchObj, 
							stateValue : "0" 
						}), 
						success : function(JSONData, status) {
							
							var display = "";
							var category = ""; 
							
							display += "<div class='container'>";
							display += "<div class='card-deck'>";
							for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
								if ( JSONData.hobbyClassList[i].category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClassList[i].category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClassList[i].category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClassList[i].category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClassList[i].category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClassList[i].category == 'H' ) {
									category = "공예";
								}
								display += "<div class='col-md-4'>";
								display += "<div class='card'>";
								display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
								display += "<div id='cardImage'>";
								display += "<span>";
								display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
								
								if ( JSONData.hobbyClassList[i].event != null ) { 
									if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
										display += "<div class='outer-card-image'>";
										
										display += "<div class='inner-card-bottom-text'>최대";
										display += "</div>";
										
										display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
										display += "</div>";
										display += "<div class='inner-card-bottom-text'>할인 중";
										display += "</div>";
										display += "</div>";
									}
								}

								display += "</div>";
								display += "</span>";
								
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
								display += "</span>";
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
									display += "<br/>";
								}
								display += "</p>";
								// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
								display += "</p>";
								display += "</div>";
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								
								

								if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
								}		
								
								
								if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
								display += "</span>";
								display += "</button>";
								
								display += "</small>";
								display += "</div>";
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								display += "</div>";
								display += "</div>";
							}
							
							display += "</div>";
							display += "<br/><br/><br/><br/><br/>";
							display += "</div>";
							display += "<span class='main-scroll-page'></span>"
							
							$(".main-scroll-page:last").after(display);
							
							$('.main-scroll-max-page').val(JSONData.resultPage.maxPage);
							
							$('#search-alignment-button-div').hide();
							
							$('.main-scroll-current-page').val(2);
							
							if ( JSONData.resultPage.maxPage < ( $('.main-scroll-current-page').val() * 1 )  ) {
								$('.footer-outer-div').show();
							}
							
							$('.main-scroll-outer-div').show;
						}
					}
			)
			
			
			var index = $(this).find('.navbar-nav-link-input').val();
			
			if ( index == 0 ) {
				// 메인 삭제됨 
				$('.include-for-popular-hobby-class').show();
				$('.include-for-register-hobby-class').show();
				$('.outer-event-carousel-div').show();
			}
			else if ( index == 1 ) {
				$('.include-for-popular-hobby-class').hide();
				$('.include-for-register-hobby-class').show();
				$('.outer-event-carousel-div').show();
			}
			else if ( index == 2 ) {
				$('.include-for-popular-hobby-class').show();
				$('.include-for-register-hobby-class').hide();
				$('.outer-event-carousel-div').show();
			}
			else if ( index == 3 ) {

				self.location = "/event/eventList";
			}
			
			
		});
		// 선택된 메뉴 글씨 굵게 -------------------------------------------------------
		
		// nav-bar dropdown dropdown-article-inner-text 클릭 시 이벤트 ------------------------------------------
		$('.dropdown-article-inner-text').on('click', function(){
			var targetValue = $(this).find('.nav-bar-dropdown-hidden-input').val();
			
			if ( targetValue == '0' ) {
				alert('자유게시판 선택');
			}
			else if ( targetValue == '1' ) {
				alert('사진게시판 선택');
			}
		})
		// nav-bar dropdown 클릭 시 이벤트 ------------------------------------------
		
		// 모달 창 입력창 비활성화------------------------------------------------------
		$('.search-keyword-input').attr('disabled', true);
		// 모달 창 입력창 비활성화------------------------------------------------------
		
		// 검색창 가리기 ------------------------------------------------
		$('#search-form-group').attr('style', 'visibility:hidden');
		// 검색창 가리기 ------------------------------------------------
		
		// 카테고리 선택 시 이벤트 (a 태그) ------------------------------------------------------
		$('.dropdown-span-text').on('click', function(){
			$('.include-for-popular-hobby-class').hide();
			$('.include-for-register-hobby-class').hide();
			$('.include-for-recommend-hobby-class').hide();
			$('.outer-event-carousel-div').hide();
			
			$('.footer-outer-div').hide();
			
			$('.nav-span-text').css({
				'font-weight' : 'normal'
			});
			
			$('.search-button-but-form').val('');
			
			$('.dropdown-main-button').text('검색조건');
			$('.search-keyword-input').val('');
			
			$('.check-search').val('1');
			$('.main-scroll-outer-div').hide();
			
			maxPage = null;
			currentPage = 1;
			hashtagArray = [];
			hashtagNameArray = [];
			hashtagSelectCount = 0;
			searchKeyword = null;
			searchCondition = 0;
			
			$('.card-deck').parent().remove();
			$('.scroll-page').remove();
			$('.this-is-not').after("<span class='scroll-page'></span>");
			
			$('button[name="hashtagButton').attr('class', 'btn btn-outline-secondary btn-sm btn-block');
			
			categoryValue = $(this).find('input[name="categoryValue"]').val();
			categoryName = $(this).text().trim();
			
			$('.input-group-text').text(categoryName);
			$('.category-name').text('카테고리 : ' + categoryName);
			
			$('#searchForm').attr('style', 'visibility:visibie');
			$('#search-form-group').attr('style', 'visibility:visibie');
			
			var obj = new Object();
			
			obj.currentPage = currentPage;
			obj.category = categoryValue; 
			
			// 카테고리 선택하자마자 클래스 일단 검색하는 ajax---------------------------------
			$.ajax(
							{
								url : "/searchHobbyClass/json/getHobbyClassList", 
								method :  "post", 
								dataType : "json", 
								headers : {
									"Accept" : "application/json", 
									"Content-Type" : "application/json"
								}, 
								data : JSON.stringify({
									search : obj, 
									stateValue : stateValue 
								}), 
								success : function(JSONData, status) {
									currentPage += 1;
									
									var display = "";
									var category = ""; 
									
									display += "<div class='container'>";
									display += "<div class='card-deck'>";
									for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
										
										var sessionUserId = $('.user-hidden-value').val();
										
										if ( JSONData.hobbyClassList[i].category == 'E' ) {
											category = "운동";
										}
										else if ( JSONData.hobbyClassList[i].category == 'A' ) {
											category = "미술";
										}
										else if ( JSONData.hobbyClassList[i].category == 'M' ) {
											category = "음악";
										}
										else if ( JSONData.hobbyClassList[i].category == 'L' ) {
											category = "라이프스타일";
										}
										else if ( JSONData.hobbyClassList[i].category == 'C' ) {
											category = "요리";
										}
										else if ( JSONData.hobbyClassList[i].category == 'H' ) {
											category = "공예";
										}
										display += "<div class='col-md-4'>";
										display += "<div class='card'>";
										display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
										display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
										display += "<div id='cardImage'>";
										display += "<span>";
										display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
										
										if ( JSONData.hobbyClassList[i].event != null ) { 
											if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
												display += "<div class='outer-card-image'>";
												
												display += "<div class='inner-card-bottom-text'>최대";
												display += "</div>";
												
												display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
												display += "</div>";
												display += "<div class='inner-card-bottom-text'>할인 중";
												display += "</div>";
												display += "</div>";
											}
										}
	
										display += "</div>";
										display += "</span>";
										
										display += "<div class='card-body'>";
										
										display += "<div class='card-title'>";
										display += "<div class='go-to-the-center-please'>";
										display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName;
										
										if ( JSONData.hobbyClassList[i].user.userId == sessionUserId ) {
											display += '&nbsp;<i class="fas fa-star"></i>';
										}
										
										display += "</span>";
										display += "</span>";
										display += "</div>";
										display += "</div>";
										
										display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
										display += "<p class='card-text'>";
										
										for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
											display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
											display += "<br/>";
										}
										display += "</p>";
										// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
										display += "</p>";
										display += "</div>";
										display += "<div class='card-footer'>";
										display += "<small class='text-muted'>";
										display += "<p class='card-text'>";
										
										
										if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
										}	
										
										if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
											display += "<i class='far fa-heart'></i>";
										}
										else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
											display += "<i class='fas fa-heart'></i>";
										}
										display += "<span name='steamCount'>";
										display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
										display += "</span>";
										
										display += "</button>";
										
										display += "</small>";
										display += "</div>";
										
										display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
										display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
										
										var classState = '';
										
										if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
											classState = '수요조사 중';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
											classState = '개강';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
											classState = '수요조사 완료';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
											classState = '종강';
										}
										else {
											classState = '그 외';
										}
										display += '&nbsp;';
										display += classState;
										display += "</div>";
										display += "</div>";
									}
									
									display += "</div>";
									display += "<br/><br/><br/><br/><br/>";
									display += "</div>";
									display += "<span class='scroll-page'></span>"
									
									$(".scroll-page:last").after(display);
									
									maxPage = JSONData.resultPage.maxPage;
									
									$('#search-alignment-button-div').show();
									
									console.log(maxPage + ' / ' + currentPage);
									
									if ( maxPage < currentPage ) {
										$('.footer-outer-div').show();
									}
								}
							}
					)
			
			// 카테고리 선택하자마자 클래스 일단 검색하는 ajax---------------------------------
		});
		// 카테고리 선택 시 이벤트 (a 태그) ------------------------------------------------------
		
		// 클래스 검색 버튼 클릭 시 이벤트-------------------------------------------------
		$('.search-button-but-form').on('click', function(){
			// 경고창 가리기
			$('.warning-text').attr('style', 'visibility:hidden');
			
			
			if ( categoryValue == '' ) {
				return false;
			}
			
			if ( categoryValue == 'all' ) {
//				$('button[name="hashtagButton"]').text('카테고리 : 전체'); 이거 왜있음? 그냥 가리기만 하면 되지않나
				$('button[name="hashtagButton"]').hide();
			}
			else {
				$('button[name="hashtagButton"]').show();
				
				$.ajax(
						{
							url : "/searchHobbyClass/json/getSearchHashtag",  
							method : "post", 
							dataType : "json", 
							headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json" 
							}, 
							data : JSON.stringify({
								categoryCode : categoryValue 
							}), 
							success : function(JSONData, status) {
								for(var i = 0; i < 10; i++) {
									$("button[name='hashtagButton']").eq(i).text(JSONData.hashtagNameList[i]);
									$("button[name='hashtagButton']").eq(i).val(JSONData.hashtagCodeList[i]);
								}
							}
						}
				);
				
				
				$('button[name="hashtag"]').show();
			}
			
			$('#searchModal').modal('show');
		});
		// 클래스 검색 버튼 클릭 시 이벤트-------------------------------------------------
		
		// 모달 안 해쉬태그 버튼 클릭 시 이벤트------------------------------------------------
		$('button[name="hashtagButton"]').on('click', function(){
			// 경고창 가리기
			$('.warning-text').attr('style', 'visibility:hidden');
			
			var hashtagText = $(this).text();
			var hashtagValue = $(this).val();
			
			var currentButtonClass = $(this).attr('class');
			
			if ( currentButtonClass == 'btn btn-outline-secondary btn-sm btn-block' ) {
				
				if ( hashtagValue == 'all' ) {
					$('button[name="hashtagButton"]').attr('class', 'btn btn-outline-secondary btn-sm btn-block');
					$(this).attr('class','btn btn-secondary btn-sm btn-block');
					
					hashtagArray = []; 
					hashtagNameArray = []; 
					
					hashtagArray.push(hashtagValue);
					hashtagNameArray.push('전체');
					
					hashtagSelectCount = 1;
					
					return false;
				}
				
				if ( hashtagSelectCount > 2 ) {
					
					var display = '';
					display += '<h6 class="warning-h6">';
					display += '<svg width="16" height="16" viewBox="0 0 24 24"><path fill="#ff5252" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path></svg>';
					display += '<span class="warning-inner-span-text">';
					display += '해쉬태그는 최대 3개까지 선택 가능합니다.';
					display += '</span>';
					display += '</h6>';
					
					// 경고창 표시
//					$('.warning-text').text('해쉬태그는 최대 3개까지 선택 가능합니다.');
					$('.warning-text').html(display);
					$('.warning-text').attr('style', 'visibility:visibie');
					return false;
				}
				
				if ( hashtagArray.indexOf('all') != -1 ) {
					
					var display = '';
					display += '<h6 class="warning-h6">';
					display += '<svg width="16" height="16" viewBox="0 0 24 24"><path fill="#ff5252" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path></svg>';
					display += '<span class="warning-inner-span-text">';
					display += '이미 해쉬태그 전체를 선택하셨습니다.';
					display += '</span>';
					display += '</h6>';
					
					
					// 경고창 표시
					$('.warning-text').html(display);
					$('.warning-text').attr('style', 'visibility:visibie');
					return;
				}
										
				$(this).attr('class', 'btn btn-secondary btn-sm btn-block');
				hashtagSelectCount++;
				
				hashtagArray.push(hashtagValue);
				hashtagNameArray.push(hashtagText);
				
				
			}
			else {
				$(this).attr('class', 'btn btn-outline-secondary btn-sm btn-block');
				hashtagSelectCount--;
				hashtagArray.splice(hashtagArray.indexOf(hashtagValue), 1);
				hashtagNameArray.splice(hashtagNameArray.indexOf(hashtagText), 1);
				
			}
			
		});
		// 모달 안 해쉬태그 버튼 클릭 시 이벤트------------------------------------------------
		
		// 검색조건 드랍다운 이벤트-------------------------------------------------------
		$('.search-condition-dropdown').on('click', function(){
			// 경고창 가리기
			$('.warning-text').attr('style', 'visibility:hidden');
			
			$('.dropdown-main-button').text($(this).text());
			
			searchCondition = $(this).find('input').val();
			
			if (searchCondition != '0' ) {
				$('.search-keyword-input').attr('disabled', false);
			}
			else {
				$('.search-keyword-input').attr('disabled', true);
				$('.search-keyword-input').val('');
			}
			
			
		});
		// 검색조건 드랍다운 이벤트-------------------------------------------------------
		
		// 스크롤 이벤트 --------------------------------------------------------------
		$(window).scroll(function(){
			if ( $('.check-search').val() != 0 ) {
				clearTimeout( timer );
			    timer = setTimeout( scrollHobbyClass, delta );
	//			timer = setTimeout( scrollHobbyClass, 20 );
			}
		});
		// 스크롤 이벤트 --------------------------------------------------------------
		
		// 스크롤 내려서 다음페이지에 넘길 때 쓸 function--------------------------------------
		function scrollHobbyClass() {
			
			if( $(document).height() - 100 <= $(window).scrollTop() + $(window).height() ){
//			if( $(document).height() - 1000 <= $(window).scrollTop() + $(window).height() ){
	 			if ( maxPage >= currentPage ) {
									
					var obj = new Object();
					obj.currentPage = currentPage;
					obj.searchCondition = searchCondition;
					obj.category = categoryValue; 
					obj.hashtag = hashtagArray;
					obj.searchKeyword = searchKeyword;
					
					$.ajax(
							{
								url : "/searchHobbyClass/json/getHobbyClassList", 
								method :  "post", 
								dataType : "json", 
								headers : {
									"Accept" : "application/json", 
									"Content-Type" : "application/json"
								}, 
								data : JSON.stringify({
									search : obj, 
									stateValue : stateValue 
								}), 
								success : function(JSONData, status) {
									currentPage += 1;
									
									var display = "";
									var category = ""; 
									
									display += "<div class='container'>";
									display += "<div class='card-deck'>";
									for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
										if ( JSONData.hobbyClassList[i].category == 'E' ) {
											category = "운동";
										}
										else if ( JSONData.hobbyClassList[i].category == 'A' ) {
											category = "미술";
										}
										else if ( JSONData.hobbyClassList[i].category == 'M' ) {
											category = "음악";
										}
										else if ( JSONData.hobbyClassList[i].category == 'L' ) {
											category = "라이프스타일";
										}
										else if ( JSONData.hobbyClassList[i].category == 'C' ) {
											category = "요리";
										}
										else if ( JSONData.hobbyClassList[i].category == 'H' ) {
											category = "공예";
										}
										display += "<div class='col-md-4'>";
										display += "<div class='card'>";
										display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
										display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
										display += "<div id='cardImage'>";
										display += "<span>";
										display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
										
										if ( JSONData.hobbyClassList[i].event != null ) { 
											if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
												display += "<div class='outer-card-image'>";
												
												display += "<div class='inner-card-bottom-text'>최대";
												display += "</div>";
												
												display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
												display += "</div>";
												display += "<div class='inner-card-bottom-text'>할인 중";
												display += "</div>";
												display += "</div>";
											}
										}
	
										display += "</div>";
										display += "</span>";
										
										display += "<div class='card-body'>";
										
										display += "<div class='card-title'>";
										display += "<div class='go-to-the-center-please'>";
										display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
										display += "</span>";
										display += "</div>";
										display += "</div>";
										
										display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
										display += "<p class='card-text'>";
										
										for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
											display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
											display += "<br/>";
										}
										display += "</p>";
										// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
										display += "</p>";
										display += "</div>";
										display += "<div class='card-footer'>";
										display += "<small class='text-muted'>";
										display += "<p class='card-text'>";
										
										
										if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
										}	
										
										if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
											display += "<i class='far fa-heart'></i>";
										}
										else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
											display += "<i class='fas fa-heart'></i>";
										}
										display += "<span name='steamCount'>";
										display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
										display += "</span>";
										display += "</button>";
										
										display += "</small>";
										display += "</div>";
										
										display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
										display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
										
										var classState = '';
										
										if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
											classState = '수요조사 중';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
											classState = '개강';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
											classState = '수요조사 완료';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
											classState = '종강';
										}
										else {
											classState = '그 외';
										}
										display += '&nbsp;';
										display += classState;
										display += "</div>";
										display += "</div>";
									}
									
									display += "</div>";
									display += "<br/><br/><br/><br/><br/>";
									display += "</div>";
									display += "<span class='scroll-page'></span>"
										
									$(".scroll-page:last").after(display);
									
									console.log(JSONData.resultPage.maxPage + ' / ' + currentPage);
									
									if ( maxPage < currentPage ) {
										console.log('maxPage < currentPage run');
										console.log('==>' + JSONData.resultPage.maxPage + ' / ' + currentPage);
										$('.footer-outer-div').show();
									}
								}
							}
					)
						 										
	 	 		}        
	 	 	}               		           
	 	}
		// 스크롤 내려서 다음페이지에 넘길 때 쓸 function--------------------------------------
		
		// 클래스 찜하기 이벤트----------------------------------------------------------
		$(document).on('click', 'button[name="steam"]', function(){
			var steamButton = $(this);
			var hobbyClassInput = $(this).parent().parent().parent().parent().children('input[name="hobbyClassNo"]');
			var steamCountInput = $(this).parent().parent().parent().parent().children('input[name="steamCount"]');
			var divCard = $(this).parent().parent().parent().parent();
			
			
			var steamCheck = $(this).val();
			var hobbyClassNo = $(this).parent().parent().parent().parent().children('input[name="hobbyClassNo"]').val();
			var steamCount = $(this).parent().parent().parent().parent().children('input[name="steamCount"]').val();
			
			var url = '';
			
			if ( steamCheck == 0 ) {
				url = '/myHobbyClass/json/addSteamHobbyClass';
			}
			else {
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
							hobbyClassNo : hobbyClassNo,
							steamCount : steamCount 
						}), 
						success : function(JSONData, status) {
							steamButton.html('');
			
							var display = "";
							steamButton.val(JSONData.hobbyClass.steamCheck);
							if ( JSONData.hobbyClass.steamCheck == '0' ) {
								display += "<i class='far fa-heart'></i>";
							}
							else if ( JSONData.hobbyClass.steamCheck == '1' ) {
								display += "<i class='fas fa-heart'></i>";
							}
							display += "<span name='steamCount'>";
							display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
							display += "</span>";
							steamButton.html(display);
							
							steamCountInput.val(JSONData.hobbyClass.steamCount);
							/*
							display = "";
							display += "<span name='steamCount'>";
							display += "&nbsp;&nbsp;" + JSONData.hobbyClass.steamCount;
							display += "</span>";
							
							steamButton.parent().children('span').html(display);
							*/
						}
					}
			)
			
		});
		// 클래스 찜하기 이벤트----------------------------------------------------------
		
		// 모달 검색 이벤트--------------------------------------------------------------
		$('.search-button').on('click', function(){
			searchKeyword = $('.search-keyword-input').val().trim();
			
			if ( $('.dropdown-main-button').text() == '검색조건' ) {
				var display = '';
				display += '<h6 class="warning-h6">';
				display += '<svg width="16" height="16" viewBox="0 0 24 24"><path fill="#ff5252" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path></svg>';
				display += '<span class="warning-inner-span-text">';
				display += '검색조건을 선택해주세요.';
				display += '</span>';
				display += '</h6>';

				$('.warning-text').html(display);
				$('.warning-text').attr('style', 'visibility:visibie');
				return;
			}
			
			if ( $('.dropdown-main-button').text() == '클래스 제목' && searchKeyword == '' ) {
				var display = '';
				display += '<h6 class="warning-h6">';
				display += '<svg width="16" height="16" viewBox="0 0 24 24"><path fill="#ff5252" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path></svg>';
				display += '<span class="warning-inner-span-text">';
				display += '검색어를 입력해주세요.';
				display += '</span>';
				display += '</h6>';
				
				$('.warning-text').html(display);
				$('.warning-text').attr('style', 'visibility:visibie');
				return;
			}
			
			if ( $('.dropdown-main-button').text() == '크리에이터 닉네임' && searchKeyword == '' ) {
				var display = '';
				display += '<h6 class="warning-h6">';
				display += '<svg width="16" height="16" viewBox="0 0 24 24"><path fill="#ff5252" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path></svg>';
				display += '<span class="warning-inner-span-text">';
				display += '검색어를 입력해주세요.';
				display += '</span>';
				display += '</h6>';
				
				$('.warning-text').html(display);
				$('.warning-text').attr('style', 'visibility:visibie');
				return;
			}
			
			$('.warning-text').attr('style', 'visibility:hidden');
			
			var obj = new Object();
	
			currentPage = 1;
			
			obj.currentPage = currentPage;
			obj.searchCondition = searchCondition;
			obj.category = categoryValue; 
			obj.hashtag = hashtagArray;
			obj.searchKeyword = searchKeyword; 
			
			$('.footer-outer-div').hide();
			
			$.ajax(
					{
						url : "/searchHobbyClass/json/getHobbyClassList", 
						method :  "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							search : obj, 
							stateValue : stateValue 
						}), 
						success : function(JSONData, status) {
							$('.card-deck').parent().remove();
							$('.scroll-page').remove();
							$('.this-is-not').after("<span class='scroll-page'></span>");
							
							currentPage += 1;
							
							var display = "";
							var category = ""; 
							
							display += "<div class='container'>";
							display += "<div class='card-deck'>";
							for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
								if ( JSONData.hobbyClassList[i].category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClassList[i].category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClassList[i].category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClassList[i].category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClassList[i].category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClassList[i].category == 'H' ) {
									category = "공예";
								}
								display += "<div class='col-md-4'>";
								display += "<div class='card'>";
								display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
								display += "<div id='cardImage'>";
								display += "<span>";
								display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
								
								if ( JSONData.hobbyClassList[i].event != null ) { 
									if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
										display += "<div class='outer-card-image'>";
										
										display += "<div class='inner-card-bottom-text'>최대";
										display += "</div>";
										
										display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
										display += "</div>";
										display += "<div class='inner-card-bottom-text'>할인 중";
										display += "</div>";
										display += "</div>";
									}
								}
	
								display += "</div>";
								display += "</span>";
								
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
								display += "</span>";
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
									display += "<br/>";
								}
								display += "</p>";
								// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
								display += "</p>";
								display += "</div>";
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								
								
	
								if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
								}	
								
								if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
								display += "</span>";
								display += "</button>";
								
								display += "</small>";
								display += "</div>";
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								display += "</div>";
								display += "</div>";
							}
							
							display += "</div>";
							display += "<br/><br/><br/><br/><br/>";
							display += "</div>";
							display += "<span class='scroll-page'></span>"
								
							$(".scroll-page:last").after(display);
							
							maxPage = JSONData.resultPage.maxPage;
							
							$('.search-button-but-form option')
							
							var count = 0;
							var inputData = ''; 
							
							if ( hashtagNameArray.length != 0 ) {
								inputData += '해쉬태그 : ';
								for(count = 0; count < hashtagNameArray.length; count++) {
									inputData += hashtagNameArray[count];
									if ( count < hashtagNameArray.length - 1 ) {
										inputData += ", ";
									}
								}
								inputData += ' / ';
							}
							
							inputData += " 검색조건 : ";
							
							if ( searchCondition == '0' ) {
								inputData += "전체보기";
							}
							else if ( searchCondition == '1' ) {
								inputData += "클래스 제목";
								inputData += ' / ';
								inputData += " 검색어 : " + searchKeyword;
							}
							else if ( searchCondition == '2' ) {
								inputData += "크리에이터 닉네임";
								inputData += ' / ';
								inputData += " 검색어 : " + searchKeyword;
							}
							
							$('.search-button-but-form').text(inputData);
							$('.search-button-but-form').val(inputData);
							$('#searchModal').modal('hide');				
							
							if ( maxPage < currentPage ) {
								$('.footer-outer-div').show();
							}
						}
					}
			)
		})
		// 모달 검색 이벤트--------------------------------------------------------------
		
		// 클래스 정렬버튼 이벤트 -----------------------------------
		$('.search-alignment-button').on('click', function(){
			$('.search-alignment-modal').modal('show');
		})
		// 클래스 정렬버튼 이벤트 -----------------------------------
		
		// 클래스 진행상태 결정 이벤트 ------------------------------------
		$('.aligment-row-div').on('click', function(){
			$('.alignment-container').find('.alignment-cirlce').attr('class', 'alignment-cirlce alignment-cirlce-non-select');
			$('.alignment-container').find('.alignment-div').attr('class', 'alignment-div alignment-text-non-select');
			
			$(this).find('.alignment-cirlce').attr('class', 'alignment-cirlce alignment-cirlce-select');
			$(this).find('.alignment-div').attr('class', 'alignment-div alignment-text-select');
			
			stateValue = $(this).find('.alignment-hidde-value').val();
			
			var buttonText = $(this).find('.alignment-div').text();
			
			// 클래스 진행상태에 따른 리스트 출력 ajax -----------------------
			var obj = new Object();
	
			currentPage = 1;
			
			obj.currentPage = currentPage;
			obj.searchCondition = searchCondition;
			obj.category = categoryValue; 
			obj.hashtag = hashtagArray;
			obj.searchKeyword = searchKeyword; 
			
			$('.footer-outer-div').hide();
			
			$.ajax(
					{
						url : "/searchHobbyClass/json/getHobbyClassList", 
						method :  "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						},
						async : false,
						data : JSON.stringify({
							search : obj, 
							stateValue : stateValue 
						}), 
						beforesend : function() {
							$('.spinner-border').show();
							$('.class-state-cancle').attr('disabled', true);
						},
						success : function(JSONData, status) {
							$('.card-deck').parent().remove();
							$('.scroll-page').remove();
							$('.this-is-not').after("<span class='scroll-page'></span>");
							
							currentPage += 1;
							
							var display = "";
							var category = ""; 
							
							display += "<div class='container'>";
							display += "<div class='card-deck'>";
							for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
								if ( JSONData.hobbyClassList[i].category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClassList[i].category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClassList[i].category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClassList[i].category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClassList[i].category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClassList[i].category == 'H' ) {
									category = "공예";
								}
								display += "<div class='col-md-4'>";
								display += "<div class='card'>";
								display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
								display += "<div id='cardImage'>";
								display += "<span>";
								display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
								
								if ( JSONData.hobbyClassList[i].event != null ) { 
									if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
										display += "<div class='outer-card-image'>";
										
										display += "<div class='inner-card-bottom-text'>최대";
										display += "</div>";
										
										display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
										display += "</div>";
										display += "<div class='inner-card-bottom-text'>할인 중";
										display += "</div>";
										display += "</div>";
									}
								}
	
								display += "</div>";
								display += "</span>";
								
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
								display += "</span>";
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
									display += "<br/>";
								}
								display += "</p>";
								// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
								display += "</p>";
								display += "</div>";
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
								}	
								
								if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
								display += "</span>";
								display += "</button>";
		
								display += "</small>";
								display += "</div>";
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								display += "</div>";
								display += "</div>";
							}
							
							display += "</div>";
							display += "<br/><br/><br/><br/><br/>";
							display += "</div>";
							display += "<span class='scroll-page'></span>"
								
							$(".scroll-page:last").after(display);
							
							maxPage = JSONData.resultPage.maxPage;
							
	//						$('.search-button-but-form option') 무슨용도임이거?
							
							var count = 0;
							var inputData = ''; 
							
							if ( hashtagNameArray.length != 0 ) {
								inputData += '해쉬태그 : ';
								for(count = 0; count < hashtagNameArray.length; count++) {
									inputData += hashtagNameArray[count];
									if ( count < hashtagNameArray.length - 1 ) {
										inputData += ", ";
									}
								}
								inputData += ' / ';
							}
							
							inputData += " 검색조건 : ";
							
							if ( searchCondition == '0' ) {
								inputData += "전체보기";
							}
							else if ( searchCondition == '1' ) {
								inputData += "클래스 제목";
								inputData += ' / ';
								inputData += " 검색어 : " + searchKeyword;
							}
							else if ( searchCondition == '2' ) {
								inputData += "크리에이터 닉네임";
								inputData += ' / ';
								inputData += " 검색어 : " + searchKeyword;
							}
							
							//$('.search-button-but-form').text(inputData);
							//$('.search-button-but-form').val(inputData);
							$('#searchModal').modal('hide');	
							
							$('.spinner-border').hide();
							$('.class-state-cancle').attr('disabled', false);
							
							$('.in-the-aligment-button-text').text( buttonText );
							
							if ( maxPage < currentPage ) {
								$('.footer-outer-div').show();
							}
						}
					}
			)
			
			$('.search-alignment-modal').modal('hide');
			// 클래스 진행상태에 따른 리스트 출력 ajax -----------------------
			
		});
	
		// 이미지 클릭시 클래스 상세보기로 이동 ---------------------------------
		$(document).on('click', '#cardImage', function(){
			var hobbyClassNo = $(this).parents('.card').find('input[name="hobbyClassNo"]').val();
			self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
		})
		// 이미지 클릭시 클래스 상세보기로 이동 ---------------------------------
		
		// 카테고리 선택 시 이벤트 (img 태그) ------------------------------------------------------
		$('.dropdown-inner-text img').on('click', function(){
			$('.include-for-popular-hobby-class').hide();
			$('.include-for-register-hobby-class').hide();
			$('.include-for-recommend-hobby-class').hide();
			$('.outer-event-carousel-div').hide();
			
			// 푸터 가리기
			$('.footer-outer-div').hide();
			
			$('.nav-span-text').css({
				'font-weight' : 'normal'
			});
			
			$('.search-button-but-form').val('');
			
			$('.dropdown-main-button').text('검색조건');
			$('.search-keyword-input').val('');
			
			$('.check-search').val('1');
			$('.main-scroll-outer-div').hide();
			
			maxPage = null;
			currentPage = 1;
			hashtagArray = [];
			hashtagNameArray = [];
			hashtagSelectCount = 0;
			searchKeyword = null;
			searchCondition = 0;
			
			$('.card-deck').parent().remove();
			$('.scroll-page').remove();
			$('.this-is-not').after("<span class='scroll-page'></span>");
			
			$('button[name="hashtagButton').attr('class', 'btn btn-outline-secondary btn-sm btn-block');
			
			categoryValue = $(this).parents('.dropdown-inner-text').find('input[name="categoryValue"]').val();
			categoryName = $(this).parents('.dropdown-inner-text').find('.dropdown-span-text').text().trim();
			
			$('.input-group-text').text(categoryName);
			$('.category-name').text('카테고리 : ' + categoryName);
			
			$('#searchForm').attr('style', 'visibility:visibie');
			$('#search-form-group').attr('style', 'visibility:visibie');
			
			var obj = new Object();
			
			obj.currentPage = currentPage;
			obj.category = categoryValue; 
			
			// 카테고리 선택하자마자 클래스 일단 검색하는 ajax---------------------------------
			$.ajax(
							{
								url : "/searchHobbyClass/json/getHobbyClassList", 
								method :  "post", 
								dataType : "json", 
								headers : {
									"Accept" : "application/json", 
									"Content-Type" : "application/json"
								}, 
								data : JSON.stringify({
									search : obj, 
									stateValue : stateValue 
								}), 
								success : function(JSONData, status) {
									currentPage += 1;
									
									var sessionUserId = $('.user-hidden-value').val();
									
									var display = "";
									var category = ""; 
									
									display += "<div class='container'>";
									display += "<div class='card-deck'>";
									for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
										if ( JSONData.hobbyClassList[i].category == 'E' ) {
											category = "운동";
										}
										else if ( JSONData.hobbyClassList[i].category == 'A' ) {
											category = "미술";
										}
										else if ( JSONData.hobbyClassList[i].category == 'M' ) {
											category = "음악";
										}
										else if ( JSONData.hobbyClassList[i].category == 'L' ) {
											category = "라이프스타일";
										}
										else if ( JSONData.hobbyClassList[i].category == 'C' ) {
											category = "요리";
										}
										else if ( JSONData.hobbyClassList[i].category == 'H' ) {
											category = "공예";
										}
										display += "<div class='col-md-4'>";
										display += "<div class='card'>";
										display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
										display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
										display += "<div id='cardImage'>";
										display += "<span>";
										display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
										
										if ( JSONData.hobbyClassList[i].event != null ) { 
											if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
												display += "<div class='outer-card-image'>";
												
												display += "<div class='inner-card-bottom-text'>최대";
												display += "</div>";
												
												display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
												display += "</div>";
												display += "<div class='inner-card-bottom-text'>할인 중";
												display += "</div>";
												display += "</div>";
											}
										}
	
										display += "</div>";
										display += "</span>";
										
										display += "<div class='card-body'>";
										
										display += "<div class='card-title'>";
										display += "<div class='go-to-the-center-please'>";
										display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName;
										
										if ( JSONData.hobbyClassList[i].user.userId == sessionUserId ) {
											display += '&nbsp;<i class="fas fa-star"></i>';
										}
										
										display += "</span>";
										display += "</span>";
										display += "</div>";
										display += "</div>";
										
										display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
										display += "<p class='card-text'>";
										
										for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
											display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
											display += "<br/>";
										}
										display += "</p>";
										// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
										display += "</p>";
										display += "</div>";
										display += "<div class='card-footer'>";
										display += "<small class='text-muted'>";
										display += "<p class='card-text'>";
										
										
	
										if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
										}
										else {
											display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
										}	
										
										if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
											display += "<i class='far fa-heart'></i>";
										}
										else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
											display += "<i class='fas fa-heart'></i>";
										}
										display += "<span name='steamCount'>";
										display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
										display += "</span>";
										display += "</button>";
										
										display += "</small>";
										display += "</div>";
										
										display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
										display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
										
										var classState = '';
										
										if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
											classState = '수요조사 중';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
											classState = '개강';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
											classState = '수요조사 완료';
										}
										else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
											classState = '종강';
										}
										else {
											classState = '그 외';
										}
										display += '&nbsp;';
										display += classState;
										display += "</div>";
										display += "</div>";
									}
									
									display += "</div>";
									display += "<br/><br/><br/><br/><br/>";
									display += "</div>";
									display += "<span class='scroll-page'></span>"
									
									$(".scroll-page:last").after(display);
									
									maxPage = JSONData.resultPage.maxPage;
									
									$('#search-alignment-button-div').show();
									
									if ( maxPage < currentPage ) {
										$('.footer-outer-div').show();
									}
								}
							}
					)
			
			// 카테고리 선택하자마자 클래스 일단 검색하는 ajax---------------------------------
		});
		// 카테고리 선택 시 이벤트 (img 태그) ------------------------------------------------------
		
		$( window ).resize(function() {
			   var windowWidth = $(this).width(); // 화면 창 변화 그대로 가져오기 
			   var windowHeight = $(this).height();
			   
			   if ( windowWidth <= 980 ) {
				   
				   $('.outer-event-carousel-div').hide();
				   $('#search-alignment-button-div').hide();
				   $('#search-form-group').hide();
				   
				   $('.mini-size-category-total-outer-container-div').show();
				   
				   $('#popularPrev').hide();
				 $('#popularNext').hide();
				 $('#registerPrev').hide();
				 $('#registerNext').hide();
				 $('#recommendPrev').hide();
				 $('#recommendNext').hide();
				 $('.main-scroll-outer-div').hide();
			   }
			   else if ( windowWidth > 980 ) {
				   $('.mini-size-category-total-outer-container-div').hide();
				   
				   
				   if ( categoryValue != '' ) {
					   $('.outer-event-carousel-div').hide();
					   $('#search-form-group').show();
					   $('#search-alignment-button-div').show();
					   $('.input-search-form-but-not-button-outer-div').show();
				   }
				   else {
					   $('.outer-event-carousel-div').show();
					   $('#search-form-group').hide();
					   $('#search-alignment-button-div').hide();
					   $('.main-scroll-outer-div').show();
				   }
				   
				   $('#popularPrev').show();
					 $('#popularNext').show();
					 $('#registerPrev').show();
					 $('#registerNext').show();
					 $('#recommendPrev').show();
					 $('#recommendNext').show();
					
			   }
		});
		
		$(document).on('click', '.mini-size-category-li', function(){
//		$('.mini-size-category-li').on('click', function(){
			
			$('.include-for-popular-hobby-class').hide();
			$('.include-for-register-hobby-class').hide();
			$('.include-for-recommend-hobby-class').hide();
			$('.outer-event-carousel-div').hide();
			
			$('.input-search-form-but-not-button-outer-div').hide();
			
			categoryValue = $(this).find('.mini-category-value').val();
			console.log(categoryValue);
			categoryName = $(this).text().trim();
			
			$('.search-button-but-form').val('');
			
			$('.dropdown-main-button').text('검색조건');
			$('.search-keyword-input').val('');
			
			$('.check-search').val('1');
			$('.main-scroll-outer-div').hide();
			
			maxPage = null;
			currentPage = 1;
			hashtagArray = [];
			hashtagNameArray = [];
			hashtagSelectCount = 0;
			searchKeyword = null;
			searchCondition = 0;
			
			$('.card-deck').parent().remove();
			$('.scroll-page').remove();
			$('.this-is-not').after("<span class='scroll-page'></span>");
			
			$('button[name="hashtagButton').attr('class', 'btn btn-outline-secondary btn-sm btn-block');
			
			// 푸터 가리기
			$('.footer-outer-div').hide();
			
			$('.input-group-text').text(categoryName);
			$('.category-name').text('카테고리 : ' + categoryName);
			
			$('#searchForm').attr('style', 'visibility:visibie');
			$('#search-form-group').attr('style', 'visibility:visibie');
			
			var obj = new Object();
			
			obj.currentPage = currentPage;
			obj.category = categoryValue; 
			
			$.ajax(
					{
						url : "/searchHobbyClass/json/getHobbyClassList", 
						method :  "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							search : obj, 
							stateValue : "0" 
						}), 
						success : function(JSONData, status) {
							currentPage += 1;
							
							var display = "";
							var category = ""; 
							
							display += "<div class='container'>";
							display += "<div class='card-deck'>";
							for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
								if ( JSONData.hobbyClassList[i].category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClassList[i].category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClassList[i].category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClassList[i].category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClassList[i].category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClassList[i].category == 'H' ) {
									category = "공예";
								}
								display += "<div class='col-md-4'>";
								display += "<div class='card'>";
								display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
								display += "<div id='cardImage'>";
								display += "<span>";
								display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
								
								if ( JSONData.hobbyClassList[i].event != null ) { 
									if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
										display += "<div class='outer-card-image'>";
										
										display += "<div class='inner-card-bottom-text'>최대";
										display += "</div>";
										
										display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
										display += "</div>";
										display += "<div class='inner-card-bottom-text'>할인 중";
										display += "</div>";
										display += "</div>";
									}
								}

								display += "</div>";
								display += "</span>";
								
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
								display += "</span>";
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
									display += "<br/>";
								}
								display += "</p>";
								// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
								display += "</p>";
								display += "</div>";
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								
								

								if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
								}		
								
								
								if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
								display += "</span>";
								display += "</button>";
								
								display += "</small>";
								display += "</div>";
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								display += "</div>";
								display += "</div>";
							}
							
							display += "</div>";
							display += "<br/><br/><br/><br/><br/>";
							display += "</div>";
							display += "<span class='scroll-page'></span>"
							
							$(".scroll-page:last").after(display);
							
							maxPage = JSONData.resultPage.maxPage;
							
							$('#search-alignment-button-div').hide();
							
							if ( maxPage < currentPage ) {
								$('.footer-outer-div').show();
							}
						}
					}
			)
		})
		
		
			

			var mainSearchObj = new Object();
			
			mainSearchObj.currentPage = 1;
			mainSearchObj.category = 'all'; 
			
			$.ajax(
					{
						url : "/searchHobbyClass/json/getHobbyClassList", 
						method :  "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							search : mainSearchObj, 
							stateValue : "0" 
						}), 
						success : function(JSONData, status) {
							
							var sessionUserId = $('.user-hidden-value').val();
							
							var display = "";
							var category = ""; 
							
							display += "<div class='container'>";
							display += "<div class='card-deck'>";
							for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
								// alert(JSONData.hobbyClassList[i].user.userId + ' / ' + sessionUserId);
								
								if ( JSONData.hobbyClassList[i].category == 'E' ) {
									category = "운동";
								}
								else if ( JSONData.hobbyClassList[i].category == 'A' ) {
									category = "미술";
								}
								else if ( JSONData.hobbyClassList[i].category == 'M' ) {
									category = "음악";
								}
								else if ( JSONData.hobbyClassList[i].category == 'L' ) {
									category = "라이프스타일";
								}
								else if ( JSONData.hobbyClassList[i].category == 'C' ) {
									category = "요리";
								}
								else if ( JSONData.hobbyClassList[i].category == 'H' ) {
									category = "공예";
								}
								display += "<div class='col-md-4'>";
								display += "<div class='card'>";
								display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
								display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
								display += "<div id='cardImage'>";
								display += "<span>";
								display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
								
								if ( JSONData.hobbyClassList[i].event != null ) { 
									if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
										display += "<div class='outer-card-image'>";
										
										display += "<div class='inner-card-bottom-text'>최대";
										display += "</div>";
										
										display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
										display += "</div>";
										display += "<div class='inner-card-bottom-text'>할인 중";
										display += "</div>";
										display += "</div>";
									}
								}

								display += "</div>";
								display += "</span>";
								
								display += "<div class='card-body'>";
								
								display += "<div class='card-title'>";
								display += "<div class='go-to-the-center-please'>";
								display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName;
								
								if ( JSONData.hobbyClassList[i].user.userId == sessionUserId ) {
									display += '&nbsp;<i class="fas fa-star"></i>';
								}
								
								display += "</span>";						
								
								display += "</div>";
								display += "</div>";
								
								display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
								display += "<p class='card-text'>";
								
								for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
									display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
									display += "<br/>";
								}
								display += "</p>";
								// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
								display += "</p>";
								display += "</div>";
								display += "<div class='card-footer'>";
								display += "<small class='text-muted'>";
								display += "<p class='card-text'>";
								
								

								if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
								}
								else {
									display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
								}		
								
								
								if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
									display += "<i class='far fa-heart'></i>";
								}
								else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
									display += "<i class='fas fa-heart'></i>";
								}
								display += "<span name='steamCount'>";
								display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
								display += "</span>";
								display += "</button>";
								
								display += "</small>";
								display += "</div>";
								
								display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
								display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
								
								var classState = '';
								
								if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
									classState = '수요조사 중';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
									classState = '개강';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
									classState = '수요조사 완료';
								}
								else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
									classState = '종강';
								}
								else {
									classState = '그 외';
								}
								display += '&nbsp;';
								display += classState;
								display += "</div>";
								display += "</div>";
							}
							
							display += "</div>";
							display += "<br/><br/><br/><br/><br/>";
							display += "</div>";
							display += "<span class='main-scroll-page'></span>"
							
							$(".main-scroll-page:last").after(display);
							
							$('.main-scroll-max-page').val(JSONData.resultPage.maxPage);
							
							$('#search-alignment-button-div').hide();
							
							$('.main-scroll-current-page').val(2);
							
							if ( JSONData.resultPage.maxPage < ( $('.main-scroll-current-page').val() * 1 )  ) {
								alert('abc');
								$('.footer-outer-div').show();
							}
							
							$('.main-scroll-outer-div').show;
						}
					}
			)
			
			
			// 스크롤 이벤트 --------------------------------------------------------------
			
			$(window).scroll(function(){
				if ( $('.check-search').val() == '0' ) {
					clearTimeout( timer );
				    timer = setTimeout( scrollHobbyClassMain, delta );
	//				timer = setTimeout( scrollHobbyClass, 20 );
				}
			});
			
			// 스크롤 이벤트 --------------------------------------------------------------
			
			// 스크롤 내려서 다음페이지에 넘길 때 쓸 function--------------------------------------
			function scrollHobbyClassMain() {
				var currentPage = ( $('.main-scroll-current-page').val() * 1 );
				var maxPage = ( $('.main-scroll-max-page').val() * 1 );
				if( $(document).height() - 250 <= $(window).scrollTop() + $(window).height() ){
					console.log(currentPage + ' / ' + maxPage);
		 			if ( maxPage >= currentPage ) {
		 				$('.footer-outer-div').hide();
		 				currentPage++;
						$('.main-scroll-current-page').val(currentPage);
						var obj = new Object();
						
						obj.currentPage = currentPage;
						obj.category = 'all'; 
						
						$.ajax(
								{
									url : "/searchHobbyClass/json/getHobbyClassList", 
									method :  "post", 
									dataType : "json", 
									headers : {
										"Accept" : "application/json", 
										"Content-Type" : "application/json"
									}, 
									data : JSON.stringify({
										search : obj, 
										stateValue : "0" 
									}), 
									success : function(JSONData, status) {
										
										var display = "";
										var category = ""; 
										
										display += "<div class='container'>";
										display += "<div class='card-deck'>";
										for(var i = 0; i < JSONData.hobbyClassList.length; i++) {
											if ( JSONData.hobbyClassList[i].category == 'E' ) {
												category = "운동";
											}
											else if ( JSONData.hobbyClassList[i].category == 'A' ) {
												category = "미술";
											}
											else if ( JSONData.hobbyClassList[i].category == 'M' ) {
												category = "음악";
											}
											else if ( JSONData.hobbyClassList[i].category == 'L' ) {
												category = "라이프스타일";
											}
											else if ( JSONData.hobbyClassList[i].category == 'C' ) {
												category = "요리";
											}
											else if ( JSONData.hobbyClassList[i].category == 'H' ) {
												category = "공예";
											}
											display += "<div class='col-md-4'>";
											display += "<div class='card'>";
											display += "<input type='hidden' name='hobbyClassNo' value='" + JSONData.hobbyClassList[i].hobbyClassNo +"'/>";
											display += "<input type='hidden' name='steamCount' value='" + JSONData.hobbyClassList[i].steamCount +"'/>";
											display += "<div id='cardImage'>";
											display += "<span>";
											display += "<img name='cardImage' src='/images/hobbyclass/" + JSONData.hobbyClassList[i].hobbyClassImage + "' class='card-img-top' height='250px'>";
											
											if ( JSONData.hobbyClassList[i].event != null ) { 
												if ( JSONData.hobbyClassList[i].hobbyClassState != '6' && JSONData.hobbyClassList[i].hobbyClassState != '5' ) {
													display += "<div class='outer-card-image'>";
													
													display += "<div class='inner-card-bottom-text'>최대";
													display += "</div>";
													
													display += "<div class='inner-card-top-text'>" + JSONData.hobbyClassList[i].event.eventDiscount +'%';
													display += "</div>";
													display += "<div class='inner-card-bottom-text'>할인 중";
													display += "</div>";
													display += "</div>";
												}
											}

											display += "</div>";
											display += "</span>";
											
											display += "<div class='card-body'>";
											
											display += "<div class='card-title'>";
											display += "<div class='go-to-the-center-please'>";
											display += "<span class='card-title-class-title'>" + JSONData.hobbyClassList[i].hobbyClassName + "</span>";
											display += "</span>";
											display += "</div>";
											display += "</div>";
											
											display += "<p class='card-text'><span class='badge wrapper-basic text-wrap'><i class='fas fa-list'></i>&nbsp;" + category + "</span></p>";	
											display += "<p class='card-text'>";
											
											for (var k = 0; k < JSONData.hobbyClassList[i].hashtag.length; k++){
												display += "<span class='badge wrapper-basic text-wrap'><i class='fas fa-hashtag'></i>" + JSONData.hobbyClassList[i].hashtag[k] + "</span>";
												display += "<br/>";
											}
											display += "</p>";
											// display += "<p class='card-text'><i class='fa fa-heart' aria-hidden='true'></i> " + JSONData.hobbyClassList[i].steamCount;
											display += "</p>";
											display += "</div>";
											display += "<div class='card-footer'>";
											display += "<small class='text-muted'>";
											display += "<p class='card-text'>";
											
											

											if ( JSONData.hobbyClassList[i].hobbyClassState == '5' ) {
												display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
											}
											else if ( JSONData.hobbyClassList[i].hobbyClassState == '6' ) {
												display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"' disabled>";
											}
											else {
												display += "<button type='button' class='btn btn-light' name='steam' value='" + JSONData.hobbyClassList[i].steamCheck +"'>";
											}		
											
											
											if ( JSONData.hobbyClassList[i].steamCheck == '0' ) {
												display += "<i class='far fa-heart'></i>";
											}
											else if ( JSONData.hobbyClassList[i].steamCheck == '1' ) {
												display += "<i class='fas fa-heart'></i>";
											}
											display += "<span name='steamCount'>";
											display += "&nbsp;&nbsp;" + JSONData.hobbyClassList[i].steamCount;
											display += "</span>";
											display += "</button>";
											
											display += "</small>";
											display += "</div>";
											
											display += "<span class='badge wrapper-yello text-wrap please-go-right float-right'>";
											display += '<svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 19h18v-2H3v2zm0-6h18v-2H3v2zm0-8v2h18V5H3z" fill="#FFFFFF"></path><circle cx="8" cy="18" r="2" fill="#FFFFFF"></circle><circle cx="8" cy="6" r="2" fill="#FFFFFF"></circle><circle cx="16" cy="12" r="2" fill="#FFFFFF"></circle></svg>';
											
											var classState = '';
											
											if ( JSONData.hobbyClassList[i].hobbyClassState == 3 ) {
												classState = '수요조사 중';
											}
											else if ( JSONData.hobbyClassList[i].hobbyClassState == 5 ) {
												classState = '개강';
											}
											else if ( JSONData.hobbyClassList[i].hobbyClassState == 4 ) {
												classState = '수요조사 완료';
											}
											else if ( JSONData.hobbyClassList[i].hobbyClassState == 6 ) {
												classState = '종강';
											}
											else {
												classState = '그 외';
											}
											display += '&nbsp;';
											display += classState;
											display += "</div>";
											display += "</div>";
										}
										
										display += "</div>";
										display += "<br/><br/><br/><br/><br/>";
										display += "</div>";
										display += "<span class='main-scroll-page'></span>"
										
										$(".main-scroll-page:last").after(display);
										
										$('.main-scroll-max-page').val(JSONData.resultPage.maxPage);
										
										$('#search-alignment-button-div').hide();
										
										if ( maxPage < currentPage ) {
											$('.footer-outer-div').show();
										}
										
									}
								}
						)
							 										
		 	 		}        
		 	 	}               		           
		 	}
			// 스크롤 내려서 다음페이지에 넘길 때 쓸 function--------------------------------------
			
			// 클릭시 위로가기 ----------------------------------
			$(".mini-button-to-top").on("click", function () {
            	$('body,html').animate({
    				scrollTop: 0
    			}, 200);
    			return false;
            });
			// 클릭시 위로가기 ----------------------------------
		
	})
			