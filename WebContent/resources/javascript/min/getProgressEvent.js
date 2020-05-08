$(function(){
	var eventOwl = $('#event-owl-carousel');
	
	var colorArray = ['#6ec1d2', '#93c868', '#da88a2', '#d44320', '#0c0b0b', '#4a4b58', '#a6b096', '#ff3037', '#5e2e37', '#5ab0a9'];
	var eventStartDateArray = [];
	var eventEndDateArray = [];
	var eventTitleArray = [];
	var eventDiscountArray = [];
	var eventCategoryArray = [];
	$.ajax(
			{
				url : "/searchHobbyClass/json/getNowEventList", 
				method : "post", 
				dataType : "json", 
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
				async : false,
				success : function(JSONData, status) {
					if ( JSONData.eventList.length > 0 ) {
						console.log(JSONData);
						var display = '';
						for ( var i = 0; i < JSONData.eventList.length; i++) {
							display += '<div class="event-owl-img-outer-div">';
							display += '<div class="item event-img-carousel-tag">';
							display += '<img src="/images/kyung/' + JSONData.eventList[i].eventImage + '" id="event-image-id">';
							display += '</div>';
							display += '<input type="hidden" class="hidden-event-img-event-id" value="' + JSONData.eventList[i].eventId + '" />';
							display += '</div>';
							
							eventStartDateArray.push(JSONData.eventList[i].eventStartDate);
					    	eventEndDateArray.push(JSONData.eventList[i].eventEndDate); 
					    	eventTitleArray.push(JSONData.eventList[i].eventTitle);
					    	eventDiscountArray.push(JSONData.eventList[i].eventDiscount); 
					    	eventCategoryArray.push(JSONData.eventList[i].hobbyClass.category);
						}
						
						var miniText = '';
						
						miniText += JSONData.eventList[0].eventStartDate + ' 부터 ~ ' + JSONData.eventList[0].eventEndDate + ' 까지';
						miniText += '<br/>';
						miniText += JSONData.eventList[0].eventDiscount + ' % 할인';
						miniText += '<br/>';
						
						var splitCategory = JSONData.eventList[0].hobbyClass.category.split(',');
						
						for( var i = 0; i < splitCategory.length; i++ ) {
							var category = '';
							
							if ( splitCategory[i] == 'E' ) {
								category = "운동";
							}
							else if ( splitCategory[i] == 'A' ) {
								category = "미술";
							}
							else if ( splitCategory[i] == 'M' ) {
								category = "음악";
							}
							else if ( splitCategory[i] == 'L' ) {
								category = "라이프스타일";
							}
							else if ( splitCategory[i] == 'C' ) {
								category = "요리";
							}
							else if ( splitCategory[i] == 'H' ) {
								category = "공예";
							}
							
							miniText += '<span class="badge wrapper-basic-event text-wrap"><i class="fas fa-list"></i>&nbsp;' + category + '</span>';
							miniText += '&nbsp;&nbsp;';
							if ( i == 3 ) {
								miniText += '<br/>';
							}
						}
						console.log(miniText);
						$('.p-small-text').html(miniText);
						$('.p-big-text').text(JSONData.eventList[0].eventTitle);
						$('#event-owl-carousel').html(display);
						$('.total-current-output').text(eventStartDateArray.length);
					}
				}
				
			}
	)
	
	
	eventOwl.owlCarousel({
		loop:true,
	    margin:10,
	    nav:false,
	    dots:false,
	    autoplay:true,
	    autoplayTimeout:1000,
	    autoplaySpeed:1000,
	    autoplayHoverPause:true,
	    items : 1
	})
	
	$(document).on('click', '.event-carousel-prev', function(){
		eventOwl.trigger('prev.owl.carousel', [1000]);
	})
	
	$(document).on('click', '.event-carousel-next', function(){
		eventOwl.trigger('next.owl.carousel', [1000]);
	})
	
	eventOwl.on('changed.owl.carousel', function(event){
		var index = event.item.index - event.relatedTarget._clones.length / 2 % event.item.count;
//	    		$('.p-small-text').html('');
//				$('.p-big-text').text('');
		
		eventOwl.trigger('stop.owl.autoplay');
		if ( index == -1 || index == (eventEndDateArray.length - 1)) {
			var target = eventEndDateArray.length - 1;
			var miniText = '';
			miniText += eventStartDateArray[target] + ' 부터 ~ ' + eventEndDateArray[target] + ' 까지';
			miniText += '<br/>';
			miniText += eventDiscountArray[target] + ' % 할인';
			miniText += '<br/>'
			
			var splitCategory = eventCategoryArray[target].split(',')
			
			for( var i = 0; i < splitCategory.length; i++ ) {
				var category = '';
				
				if ( splitCategory[i] == 'E' ) {
					category = "운동";
				}
				else if ( splitCategory[i] == 'A' ) {
					category = "미술";
				}
				else if ( splitCategory[i] == 'M' ) {
					category = "음악";
				}
				else if ( splitCategory[i] == 'L' ) {
					category = "라이프스타일";
				}
				else if ( splitCategory[i] == 'C' ) {
					category = "요리";
				}
				else if ( splitCategory[i] == 'H' ) {
					category = "공예";
				}
				
				miniText += '<span class="badge wrapper-basic-event text-wrap"><i class="fas fa-list"></i>&nbsp;' + category + '</span>';
				miniText += '&nbsp;&nbsp;';
				
				if ( i == 2 ) {
					miniText += '<br/>';
				}
				
			}
			$('.p-small-text').html(miniText);
			
			$('.p-big-text').text(eventTitleArray[target]);
			$('.now-current-output').text(( target * 1 ) +  1);
		}
		else {
			var target = index;
			
			var miniText = '';
			miniText += eventStartDateArray[target] + ' 부터 ~ ' + eventEndDateArray[target] + ' 까지';
			miniText += '<br/>';
			miniText += eventDiscountArray[target] + ' % 할인';
			miniText += '<br/>'
			
			var splitCategory = eventCategoryArray[target].split(',')
			
			for( var i = 0; i < splitCategory.length; i++ ) {
				var category = '';
				
				if ( splitCategory[i] == 'E' ) {
					category = "운동";
				}
				else if ( splitCategory[i] == 'A' ) {
					category = "미술";
				}
				else if ( splitCategory[i] == 'M' ) {
					category = "음악";
				}
				else if ( splitCategory[i] == 'L' ) {
					category = "라이프스타일";
				}
				else if ( splitCategory[i] == 'C' ) {
					category = "요리";
				}
				else if ( splitCategory[i] == 'H' ) {
					category = "공예";
				}
				
				miniText += '<span class="badge wrapper-basic-event text-wrap"><i class="fas fa-list"></i>&nbsp;' + category + '</span>';
				miniText += '&nbsp;&nbsp;';
				
				if ( i == 3 ) {
					miniText += '<br/>';
				}
			}
			
			$('.p-small-text').html(miniText);
			$('.now-current-output').text( ( target * 1 ) + 1 );
			$('.p-big-text').text(eventTitleArray[target]);
		}

	})
	
	eventOwl.on('translated.owl.carousel', function(event){
		eventOwl.trigger('play.owl.autoplay',[1000]);
	});
	
	eventOwl.on('resized.owl.carousel', function(event){
		console.log('resize owl carousel run');
		eventOwl.trigger('stop.owl.autoplay');
		
		eventOwl.trigger('play.owl.autoplay',[1000]);
	});

	// 나중에 이벤트 상세보기 이벤트 처리할것 
	$(document).on('click', '.event-img-carousel-tag img', function(){
		var eventId = $(this).parents('.event-owl-img-outer-div').find('.hidden-event-img-event-id').val();
		console.log('eventId ? : ' + eventId);
		self.location = '/event/getEvent?eventId=' + eventId;
	})
})