$(function(){
	// 시작하자마자 화면 컨트롤 하기 
	var onloadWidth = $(window).width();
	
	   if ( onloadWidth <= 1090 ) {
		   $('.lesson-project-content-outer-div').hide();
		   $('.lesson-reply-content-total-outer-div').hide();
		   $('.col-lg-4.fixed-right-tool-bar').hide();
		   $('.small-width-row').show();
		   $('.lesson-header-total-arrow').hide();
	   }
	   else {
		   $('.lesson-project-content-outer-div').show();
		   $('.lesson-reply-content-total-outer-div').show();
		   $('.col-lg-4.fixed-right-tool-bar').show();
		   $('.small-width-row').hide();
		   $('.lesson-header-total-arrow').show();
	   }
	   
	   if ( onloadWidth >= 600 ) { // max-height: 500px;
		   $('.lesson-project-content-outer-div').css('max-height', '500px');				   
	   }
	   else if ( onloadWidth >= 500 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '400px');	
	   }
	   else if ( onloadWidth >= 400 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '300px');	
	   }
	   else if ( onloadWidth >= 300 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '200px');	
	   }
	   else if ( onloadWidth >= 200 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '100px');	
	   }
	
	
	
	// 화면 작아지면 띄울 맨밑에 그거 숨기기
	$('.small-width-row').hide();

	$('.lesson-reply-list-current-page').val(1);
	
	// 클래스를 소개합니다 클릭 시 강의 목록나오는 모달창 이벤트 ------------
	$('.lesson-header-title-div').on('click', function(){
		$('#lesson-content-modal').modal('show');
	})
	// 클래스를 소개합니다 클릭 시 강의 목록나오는 모달창 이벤트 ------------
	
	var currentCount = $('.current-count').val();
	var totalCount = $('.total-count').val();
	var hobbyClassNo = $('.class-number').val();
	var lessonNo = $('.lesson-number').val();
	
	// 화살표 버튼 활성화 비활성화 결정 ---------------
	if ( currentCount == 1 ) {
		$('.left-arrow').attr('disabled', true);
		$('.right-arrow').attr('disabled', false);
	}
	else if ( currentCount == totalCount ) {
		$('.left-arrow').attr('disabled', false);
		$('.right-arrow').attr('disabled', true);
	}
	else {
		$('.left-arrow').attr('disabled', false);
		$('.right-arrow').attr('disabled', false);
	}
	// 화살표 버튼 활성화 비활성화 결정 ---------------
	
	// textarea 활성화 비활성화 결정 --------------------------------
	/* 댓글양식 복붙한걸로 바꾸면서 안써도될듯 
	$('.lesson-reply-add-textarea').attr('disabled', true);
	
	$('.lesson-reply-add-textarea').on('blur', function(){
		console.log('포커스 벗어남');
		$('.lesson-reply-add-textarea').attr('disabled', true);
	})
	
	$('.leeson-reply-add-container').on('click', function(){
		console.log('포커스 들어옴');
		$('.lesson-reply-add-textarea').attr('disabled', false);
		$('.lesson-reply-add-textarea').focus();
	})
	*/
	// textarea 활성화 비활성화 결정 --------------------------------
	
	// onload 되자마자 동작하는 모달창에 데이터 업데이트 ----------------
	$.ajax(
			{
				url : "/lesson/json/getHobbyClassLessonContent",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
				anysc : false,
				data : JSON.stringify({
					hobbyClassNo : hobbyClassNo
				}),
				success : function(JSONData, status) {
					var display = '';
					for (var i = 0; i < JSONData.lessonList.length; i++) {
						if (JSONData.lessonList[i].lesson.lessonNo == lessonNo) {
							// 현재 재생중인 강의 
							display += '<li class="inner-modal-li inner-modal-li-now">';
							display += '<input type="hidden" class="inner-modal-lesson-number" value="' + JSONData.lessonList[i].lesson.lessonNo + '"/>';
							display += '<input type="hidden" class="inner-modal-hobbyclass-number" value="' + JSONData.lessonList[i].hobbyClass.hobbyClassNo + '"/>';
							display += '<div class="outer-now-svg1 outer-now-svg2">';
							display += '<div color="#FFF" class="inner-now-svg">';
							display += '<svg width="8" height="8" viewBox="0 0 24 24"><path fill="#FFF" fill-rule="evenodd" d="M5 19.29V4.71a1 1 0 011.49-.872l12.96 7.29a1 1 0 010 1.744l-12.96 7.29A1 1 0 015 19.29z"></path></svg>';
							display += '</div>';
							display += '</div>';
							display += '<div class="now-div-text1 now-div-text2">';
							display += '<span class="now-span-text">';
							display += JSONData.lessonList[i].lesson.lessonTitle;
							display += '</span>';
							display += '<div>';
							display += '<div class="run-text-wrapper">';
							display += '<div colo="#FFF" class="run-text-inner-wrapper">';
							display += '재생 중';
							display += '</div>';
							display += '</div>';
							display += '</div>';
							display += '</div>';
							display += '</li>';
						}
						else {
							display += '<li class="inner-modal-li inner-modal-li-none">';
							display += '<input type="hidden" class="inner-modal-lesson-number" value="' + JSONData.lessonList[i].lesson.lessonNo + '"/>';
							display += '<input type="hidden" class="inner-modal-hobbyclass-number" value="' + JSONData.lessonList[i].hobbyClass.hobbyClassNo + '"/>';
							display += '<div class="outer-none-svg1 outer-none-svg2">';
							display += '<div color="#3e4042" class="inner-none-svg">';
							display += '<svg width="8" height="8" viewBox="0 0 24 24"><path fill="#FFF" fill-rule="evenodd" d="M10 18l-6-6 1.5-1.5L10 15l9-9 1.5 1.5z"></path></svg>';
							display += '</div>';
							display += '</div>';
							display += '<div class="none-div-text1 none-div-text2">';
							display += '<span class="none-span-text">';
							display += JSONData.lessonList[i].lesson.lessonTitle;
							display += '</span>';
							
							// 그거 진행률 표시해야 할 구간 ------------------------------
							if ( JSONData.lessonList[i].maxTimes != 0 && JSONData.lessonList[i].totalTimes != 0 ) {
								
								var percent = (JSONData.lessonList[i].maxTimes / JSONData.lessonList[i].totalTimes).toFixed(3) * 100;
								
								display += '<div>';
								display += '<div class="run-text-wrapper">';
								display += '<div colo="#FFF" class="run-text-inner-wrapper">';
								display += '진행률 ' + percent.toFixed(1) + '%';
								display += '</div>';
								display += '</div>';
								display += '</div>';

							}
							// 그거 진행률 표시해야 할 구간 ------------------------------
							
							display += '</div>';
							display += '</li>';
						}
					}
					$('.inner-modal-ul').html(display);
				}
			}
	)
	// onload 되자마자 동작하는 모달창에 데이터 업데이트 ----------------
	
	// 모달창으로 강의 선택하는 이벤트 ----------------
	$(document).on('click', '.inner-modal-li', function(){
		var lessonNo = $(this).find('.inner-modal-lesson-number').val();
		var hobbyClassNo = $(this).find('.inner-modal-hobbyclass-number').val();

		self.location = "/lesson/getLesson?lessonNo=" + lessonNo + "&hobbyClassNo=" + hobbyClassNo;
	})
	// 모달창으로 강의 선택하는 이벤트 ----------------
	
	// 화살표 버튼으로 강의 이동 -----------------------------------
	$('.left-arrow').on('click', function(){
		currentCount *= 1
		currentCount -= 1;
		self.location = "/lesson/getArrowLesson?currentPage=" + currentCount + "&hobbyClassNo=" + hobbyClassNo;
	})
	
	$('.right-arrow').on('click', function(){
		currentCount *= 1
		currentCount += 1;
		self.location = "/lesson/getArrowLesson?currentPage=" + currentCount + "&hobbyClassNo=" + hobbyClassNo;
	})
	// 화살표 버튼으로 강의 이동 -----------------------------------
	
	// 댓글 입력에 따른 댓글 버튼 활성화 비활성화 선택 이벤트 ------------------------------------------
	$('.form-control.col-9.col-md-10.mr-1').on('keyup', function(event){
		var thisLength = $(this).val().length;
		$('.text-danger').text(thisLength);
		/* 복붙해서 양식 바뀜
		console.log('textarea 이벤트 발생 : ' + $('.lesson-reply-add-textarea').val());
		
		if ( $('.lesson-reply-add-textarea').val().length > 0 ) {
			console.log('댓글입력값이 존재한다');
			$(this).parents('.lesson-reply-add-format').find('.lesson-reply-add-button-div-disabled').attr('class', 'lesson-reply-add-button-div');
			$(this).parents('.lesson-reply-add-format').find('path').attr('fill', '#fd7e14');
			$('.lesson-reply-add-button').attr('disabled', false);
		}
		else {
			console.log('댓글입력값이 없다');
			$(this).parents('.lesson-reply-add-format').find('.lesson-reply-add-button-div').attr('class', 'lesson-reply-add-button-div-disabled');
			$(this).parents('.lesson-reply-add-format').find('path').attr('fill', '#cdd1d4');
			$('.lesson-reply-add-button').attr('disabled', true);
		}
		*/
	});
	// 댓글 입력에 따른 댓글 버튼 활성화 비활성화 선택 이벤트 ------------------------------------------
	
	$(document).on('keyup', '.lesson-reply-update-edit-textarea', function(event){
		var thisLength = $(this).val().length;
		$(this).parents('.here-is-change-update-div').find('.text-danger').text(thisLength);
	});
	
	// 댓글 추가 요청 --------------------------------------------------------------------------
	//$('.lesson-reply-add-button-div').on('click', function(){
	$(document).on('click', '.col-2.col-md-1.btn.btn-basic', function(){
		var totalReport = $('.lesson-user-report-count').val();
		
		if ( totalReport >= 5 ) {
			const Toast = Swal.mixin({
				toast : true, 
				position : 'top', 
				showConfirmButton : false, 
				showCancelButton : false,
				timer : 1500, 
				timerProgressBar : false, 
				onOpen : (toast) => {
					toast.addEventListener('mouseenter', Swal.stopTimer);
					toast.addEventListener('mouseleave', Swal.resumeTimer);
				}
			});
			
			Toast.fire({
				icon : 'error', 
				title : '댓글을 작성할 수 없는 상태입니다.'
			});
			
			
			return false;
		}
		
		
		var replyContent = $('.form-control.col-9.col-md-10.mr-1').val();
		$('.form-control.col-9.col-md-10.mr-1').val('');
		$('.form-control.col-9.col-md-10.mr-1').val(null);
		
		$(this).parents('.lesson-reply-add-format').find('.lesson-reply-add-button-div').attr('class', 'lesson-reply-add-button-div-disabled');
		$(this).parents('.lesson-reply-add-format').find('path').attr('fill', '#cdd1d4');
		$('.lesson-reply-add-button').attr('disabled', true);
		
		var lessonNo = $('.lesson-number').val();
		var reply = new Object();
		reply.lesson = {
				lessonNo : lessonNo
		}
		reply.replyContent = replyContent;
		
		var textDangerLength = $(this).parents('.border-bottom.mt-2.mb-4.py-4').find('.text-danger');
		
		$.ajax(
				{
					url : "/lesson/json/addLessonReply",
					method : "post", 
					dataType : "json", 
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify(
							reply
					),
					success : function(JSONData, status) {
						const Toast = Swal.mixin({
							toast : true, 
							position : 'top', 
							showConfirmButton : false, 
							showCancelButton : false,
							timer : 1500, 
							timerProgressBar : false, 
							onOpen : (toast) => {
								toast.addEventListener('mouseenter', Swal.stopTimer);
								toast.addEventListener('mouseleave', Swal.resumeTimer);
							}
						});
						
						Toast.fire({
							icon : 'success', 
							title : '댓글 작성이 완료되었습니다.'
						});
						
						
						var userId = $('.user-id-hidden').val();
				
						var display = '';
						display += '<ul class="list-unstyled">';
						for(var i = 0; i < JSONData.replyList.length; i++) {
							display += '<li class="media my-4">';
							display += '<input type="hidden" class="lesson-reply-number-hidden" value="' + JSONData.replyList[i].replyNo  + '"/>';
							display += '<input type="hidden" class="lesson-reply-content-hidden-value" value="' + JSONData.replyList[i].replyContent + '" />';
							display += '<input type="hidden" class="lesson-reply-user-userId-hidden-value" value="' + JSONData.replyList[i].user.userId + '" />';
							// 나중에 프로필 사진 바꾸기 
							// display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="...">';
							
							/*
							var profileImage = 'unnamed.jpg';
							
							if (JSONData.replyList[i].user.profileImage != null) {
								profileImage = JSONData.replyList[i].user.profileImage; 
							}
							
							display += '<span class="lesson-reply-profile-image-outer-span">';
							display += '<img src="/resources/image/logo/' + profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
							display += '</span>';
							*/
							console.log('JSONData profileImage ? : ' + JSONData.replyList[i].user.profileImage);
							if ( JSONData.replyList[i].user.profileImage != null ) {
								display += '<img src="/resources/image/woo/' + JSONData.replyList[i].user.profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
							}
							
							if ( JSONData.replyList[i].user.profileImage == null ) {
								display += '<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
							}
							
							display += '<div class="media-body">';
							display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
							display += '<span>';
							if ( JSONData.replyList[i].user.nickName != null ) {
								display += '<strong>' + JSONData.replyList[i].user.nickName + '</strong>';
							}
							else {
								display += '<strong>' + JSONData.replyList[i].user.name + '</strong>';
							}
							
							display += '<small class="text-muted">' + JSONData.replyList[i].regDate + '</small>';
							display += '</span>';
							
							display += '<span class="lesson-reply-reset-button-span">';
							
							if ( JSONData.replyList[i].user.userId == userId ) {
								display += '<span>';
								display += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
								display += '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
								display += '</span>';
							}
							else if ( JSONData.replyList[i].user.userId != userId ) {
								display += '<span>';
								display += '<small class="text-muted lesson-reply-content-right">신고<input type="hidden" class="lesson-reply-content-hidden" value="2"/></small>';
								display += '</span>';
							}
							
							display += '</span>';
							
							display += '</h6>';
							display += '<div class="here-is-change-update-div">';
							
							
							if( JSONData.replyList[i].totalReport >= 5 ) {
								display += '<p class="blind-reply-content">블라인드 처리된 댓글입니다.</p>'
							}
							else {
								display += '<p>' + JSONData.replyList[i].replyContent + '</p>'
							}
							
							display += '</div>';
							display += '</div>';
							display += '</li>';
							display += '<hr/>';
						}
						display += '</ul>';
						display += '<span class="scroll-page"></span>';
						
						$('.why-div-wrapper-need').html(display);
						$('.lesson-reply-list-max-page').val(JSONData.resultPage.maxPage);
						
						textDangerLength.text('0');
						
						$('.lesson-reply-list-current-page').val(1);
						
						$('.sc-bdVaJa.hBKkTB.KlassCommentContainer__Count-kq9l9j-3.iYqxgO').text(JSONData.resultPage.totalCount + ' 개');
					}
				}
		)
	});
	// 댓글 추가 요청 --------------------------------------------------------------------------
	
	// 댓글 삭제 수정 신고 요청하기 
	$(document).on('click', '.lesson-reply-content-right', function(){	
		// 최상위 부모 
		var thisButtonParent = $(this).parents('.media.my-4');
		
		// 댓글창 본체 div 부모 
		var thisButtonLessonContentBundle = $(this).parents('.media.my-4').find('.here-is-change-update-div');
		
		var contentValue = $(this).find('.lesson-reply-content-hidden').val();
		var replyNo = $(this).parents('.media.my-4').find('.lesson-reply-number-hidden').val();
		var display = '';
		
		var newRightButtonSpan = $(this).parents('.media.my-4').find('.lesson-reply-reset-button-span');
		
		
		
		if ( contentValue == '2' ) {
			
			var replyText = $(this).parents('.media.my-4').find('.lesson-reply-content-hidden-value').val();
			
			if ( replyText.length <= 10 ) {
				replyText = '(' + replyText + ')';
			}
			else {
				replyText = '(' + replyText.substr(0, 10) + '...)'
			}
			
			$('.report-reply-hidden-content').val( replyText );
			
			replyText = $('.report-reply-hidden-content').val();
			
			
			$('.report-reply-number-hidden').val(replyNo);
			
			var display = '';
			display += '<div class="report-check-reason-text"><h6>해당 댓글' + replyText + '을 <span class="text-danger">부적절한 내용</span> 사유로<br/> 신고하시겠습니까?</h6></div>';
			
			$('.report-reply-content-check').html(display);
			
			$('.report-madal-total').modal('show');
		}
		else if ( contentValue == '1' ) {

			// 기존 댓글 양식으로 초기화시키기 ------------------------------------------
			var resetTargetLength = $('.media.my-4').length;
			
			for (var i = 0; i < resetTargetLength; i++) {
				
				var resetDisplay = '';
				
				var resetReplyContent = $('.media.my-4').eq(i).find('.lesson-reply-content-hidden-value').val();
				var replyUserId = $('.lesson-reply-reset-button-span').eq(i).parents('.media.my-4').find('.lesson-reply-user-userId-hidden-value').val();
				var loginUserId = $('.user-id-hidden').val();
				
				
				if ( replyUserId == loginUserId ) {
					resetDisplay += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
					resetDisplay += '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
				}
				else {
					resetDisplay += '<small class="lesson-reply-content-right">신고<input type="hidden" class="lesson-reply-content-hidden" value="2"/></small>';
				}
				
				$('.lesson-reply-reset-button-span').eq(i).html(resetDisplay);
				
				var resetTextAreaDisplay = '<p>' + resetReplyContent + '</p>';
				$('.media.my-4').find('.here-is-change-update-div').eq(i).html(resetTextAreaDisplay);
			}
			// 기존 댓글 양식으로 초기화시키기 ------------------------------------------
			
			
			// 댓글 수정 양식으로 바꿔치기 -------------------------------------------------------------------
			var replyContent = thisButtonParent.find('.lesson-reply-content-hidden-value').val();
			
			
			display += '<textarea class="form-control lesson-reply-update-edit-textarea" rows="3" maxlength="500">' + replyContent + '</textarea>';
			display += '<span class="m-1"><strong class="text-danger">' + replyContent.length + '</strong> / 500자</span>';
			
			thisButtonLessonContentBundle.html(display);
			
			var rightButtonDisplay = '';
			rightButtonDisplay += '<span>';
			rightButtonDisplay += '<small class="lesson-reply-content-right lesson-reply-content-update-right ml-3">취소<input type="hidden" class="lesson-reply-content-update-hidden" value="0"/></small>';
			rightButtonDisplay += '<small class="lesson-reply-content-right lesson-reply-content-update-right ml-3">수정<input type="hidden" class="lesson-reply-content-update-hidden" value="1"/></small>';
			rightButtonDisplay += '</span>';
			
//			$(this).parents('.media.my-4').find('.lesson-reply-reset-button-span').html(rightButtonDisplay);
			newRightButtonSpan.html(rightButtonDisplay);
			// 댓글 수정 양식으로 바꿔치기 ------------------------------------------------------------------- 
			
			
			$('.lesson-reply-update-edit-textarea').focus();
			
			var textarea = document.getElementsByClassName('lesson-reply-update-edit-textarea');
			textarea[0].setSelectionRange(replyContent.length, replyContent.length);
			
			$('.update-textarea-check').val("1");
			
			
		}
		else if ( contentValue == '0' ) {
			
			// 왜 무고한 댓글을 삭제하려고 하십니까 선생님
			var replyNo = $(this).parents('.media.my-4').find('.lesson-reply-number-hidden').val();
			/*
			Swal.fire({
				icon : 'question', 
				showCancelButton : false,
				showConfirmButton : false,
				allowOutsideClick : true, 
				title : '<span class="delete-title">별점 선택</span>',
			})
			*/
			// 삭제 ajax 시작 --------------------------------------------------------------------------------------
			$.ajax(
					{
						url : "/lesson/json/deleteLessonReply",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							replyNo : replyNo,
							currentPage : $('.lesson-reply-list-current-page').val(), 
							lessonNo : $('.lesson-number').val() 
						}),
						async : false,
						success : function(JSONData, status) {
							const Toast = Swal.mixin({
								toast : true, 
								position : 'top', 
								showConfirmButton : false, 
								showCancelButton : false,
								timer : 1500, 
								timerProgressBar : false, 
								onOpen : (toast) => {
									toast.addEventListener('mouseenter', Swal.stopTimer);
									toast.addEventListener('mouseleave', Swal.resumeTimer);
								}
							});
							
							Toast.fire({
								icon : 'success', 
								title : '댓글 삭제가 완료되었습니다.'
							});
							
							
							var userId = $('.user-id-hidden').val();
					
							var display = '';
							display += '<ul class="list-unstyled">';
							for(var i = 0; i < JSONData.replyList.length; i++) {
								display += '<li class="media my-4">';
								display += '<input type="hidden" class="lesson-reply-number-hidden" value="' + JSONData.replyList[i].replyNo + '"/>';
								display += '<input type="hidden" class="lesson-reply-content-hidden-value" value="' + JSONData.replyList[i].replyContent + '" />';
								display += '<input type="hidden" class="lesson-reply-user-userId-hidden-value" value="' + JSONData.replyList[i].user.userId + '" />';
								// 나중에 프로필 사진 바꾸기 
								// display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="...">';
								
								/*
								var profileImage = 'unnamed.jpg';
								
								if (JSONData.replyList[i].user.profileImage != null) {
									profileImage = JSONData.replyList[i].user.profileImage; 
								}
								
								display += '<span class="lesson-reply-profile-image-outer-span">';
								display += '<img src="/resources/image/logo/' + profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
								display += '</span>';
								*/
								
								if ( JSONData.replyList[i].user.profileImage != null ) {
									display += '<img src="/resources/image/woo/' + JSONData.replyList[i].user.profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
								}
								
								if ( JSONData.replyList[i].user.profileImage == null ) {
									display += '<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
								}
								
								display += '<div class="media-body">';
								display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
								display += '<span>';
								if ( JSONData.replyList[i].user.nickName != null ) {
									display += '<strong>' + JSONData.replyList[i].user.nickName + '</strong>';
								}
								else {
									display += '<strong>' + JSONData.replyList[i].user.name + '</strong>';
								}
								
								display += '<small class="text-muted">' + JSONData.replyList[i].regDate + '</small>';
								display += '</span>';
								
								display += '<span class="lesson-reply-reset-button-span">';
								
								if ( JSONData.replyList[i].user.userId == userId ) {
									display += '<span>';
									display += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
									display += '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
									display += '</span>';
								}
								else if ( JSONData.replyList[i].user.userId != userId ) {
									display += '<span>';
									display += '<small class="text-muted lesson-reply-content-right">신고<input type="hidden" class="lesson-reply-content-hidden" value="2"/></small>';
									display += '</span>';
								}
								
								display += '</span>';
								
								display += '</h6>';
								display += '<div class="here-is-change-update-div">';
								
								if( JSONData.replyList[i].totalReport >= 5 ) {
									display += '<p class="blind-reply-content">블라인드 처리된 댓글입니다.</p>'
								}
								else {
									display += '<p>' + JSONData.replyList[i].replyContent + '</p>'
								}
								
								display += '</div>';
								display += '</div>';
								display += '</li>';
								display += '<hr/>';
							}
							display += '</ul>';
							display += '<span class="scroll-page"></span>';
							
							$('.why-div-wrapper-need').html(display);
							$('.lesson-reply-list-max-page').val(JSONData.resultPage.maxPage);
							
							$('.sc-bdVaJa.hBKkTB.KlassCommentContainer__Count-kq9l9j-3.iYqxgO').text(JSONData.resultPage.totalCount + ' 개');
						
							$('.lesson-reply-list-current-page').val(JSONData.resultPage.currentPage);
						}
					}
			)
			// 삭제 ajax 종료 --------------------------------------------------------------------------------------
		}
		
	});
	// 댓글 삭제 수정 신고 요청하기 
	
	// 댓글 수정누르면 생기는 버튼 (수정, 취소) 버튼 눌렀을 때 이벤트 ------------------
	$(document).on('click', '.lesson-reply-content-update-right', function(){
		var updateValue = $(this).find('.lesson-reply-content-update-hidden').val();
		var display = '';
		
		var userId = $('.user-id-hidden').val();
		var replyUserId = $(this).parents('.media.my-4').find('.lesson-reply-user-name').text().trim();
		
		
		var newRightButtonSpan = $(this).parents('.media.my-4').find('.lesson-reply-reset-button-span');
		var newReplyTextDiv = $(this).parents('.media.my-4').find('.here-is-change-update-div');
		var newReplyContent = $(this).parents('.media.my-4').find('.lesson-reply-content-hidden-value').val();
		
		var replyNo = $(this).parents('.media.my-4').find('.lesson-reply-number-hidden').val();
		var targetRightButton = $(this).parents('.media.my-4').find('.lesson-reply-reset-button-span');
		var targetReplyContentTextArea = $(this).parents('.media.my-4').find('.here-is-change-update-div');
		var hiddenReplyContent = $(this).parents('.media.my-4').find('.lesson-reply-content-hidden-value');
		
		if ( updateValue == 0 ) {
			display += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
			display +=  '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
			
			newRightButtonSpan.html(display);
			
			var replyContentDisplay = '';
			replyContentDisplay += '<p>' + newReplyContent + '</p>';
			newReplyTextDiv.html(replyContentDisplay);

			$('.update-textarea-check').val('0');
			
		}
		else if ( updateValue == 1 ) {
			var replyContent = $('.lesson-reply-update-edit-textarea').val();
			
			
			
			$.ajax(
					{
						url : "/lesson/json/updateLessonReply", 
						method : "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							replyNo : replyNo, 
							replyContent : replyContent 
						}),
						success : function(JSONData, status){
							var display = '';
							display += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
							display +=  '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
							
							targetRightButton.html(display);
							hiddenReplyContent.val(JSONData.reply.replyContent);
							
							var textAreaDisplay = '';
							textAreaDisplay += '<p>' + JSONData.reply.replyContent + '</p>';
							targetReplyContentTextArea.html(textAreaDisplay);
							
							/*
							Swal.fire({
								icon : 'success',
								title : '댓글 수정 완료',
								showConfirmButton : false, 
								allowOutsideClick : true,
								timer : 800
							});
							*/
							const Toast = Swal.mixin({
								toast : true, 
								position : 'top', 
								showConfirmButton : false, 
								showCancelButton : false,
								timer : 1500, 
								timerProgressBar : false, 
								onOpen : (toast) => {
									toast.addEventListener('mouseenter', Swal.stopTimer);
									toast.addEventListener('mouseleave', Swal.resumeTimer);
								}
							});
							
							Toast.fire({
								icon : 'success', 
								title : '댓글 수정이 완료되었습니다.'
							});
						}
					}
			)
			
			
		}
		
	})

	// 스크롤 이벤트 --------------------------------------------------------------
	$(window).scroll(function(){
		clearTimeout( null );
	    timer = setTimeout( scrollLessonReplyList, 100 );
	});
	// 스크롤 이벤트 --------------------------------------------------------------
	
	// 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
	function scrollLessonReplyList() {
		var currentPage = ( $('.lesson-reply-list-current-page').val() * 1 ) + 1;
		var maxPage = $('.lesson-reply-list-max-page').val();
		
		if ( $(document).height() <= $(window).scrollTop() + $(window).height() ) {
			if ( maxPage >= currentPage ) {
				
				$.ajax(
						{
							url : "/lesson/json/getLessonReplyList", 
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								currentPage : currentPage,
								lessonNo : $('.lesson-number').val() 
							}), 
							success : function(JSONData, status) {
								var userId = $('.user-id-hidden').val();
								var display = '';
								display += '<ul class="list-unstyled">';
								for(var i = 0; i < JSONData.replyList.length; i++) {
									display += '<li class="media my-4">';
									display += '<input type="hidden" class="lesson-reply-number-hidden" value="' + JSONData.replyList[i].replyNo + '"/>';
									display += '<input type="hidden" class="lesson-reply-content-hidden-value" value="' + JSONData.replyList[i].replyContent + '" />';
									display += '<input type="hidden" class="lesson-reply-user-userId-hidden-value" value="' + JSONData.replyList[i].user.userId + '" />';
									// 나중에 프로필 사진 바꾸기 
									// display += '<img src="/resources/image/min/default-profile.jpg" class="mr-3 rounded-circle" alt="...">';
									
									/*
									var profileImage = 'unnamed.jpg';
									
									if (JSONData.replyList[i].user.profileImage != null) {
										profileImage = JSONData.replyList[i].user.profileImage; 
									}
									
									display += '<span class="lesson-reply-profile-image-outer-span">';
									display += '<img src="/resources/image/logo/' + profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
									display += '</span>';
									*/
									
									if ( JSONData.replyList[i].user.profileImage != null ) {
										display += '<img src="/resources/image/woo/' + JSONData.replyList[i].user.profileImage + '" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
									}
									
									if ( JSONData.replyList[i].user.profileImage == null ) {
										display += '<img src="/resources/image/logo/unnamed.jpg" class="mr-3 lesson-reply-profile-image" onError="this.src="/resources/image/logo/unnamed.jpg"">';
									}

									display += '<hr/>';
									
									display += '<div class="media-body">';
									display += '<h6 class="mt-0 mb-1 d-flex justify-content-between">';
									display += '<span>';
									if ( JSONData.replyList[i].user.nickName != null ) {
										display += '<strong>' + JSONData.replyList[i].user.nickName + '</strong>';
									}
									else {
										display += '<strong>' + JSONData.replyList[i].user.name + '</strong>';
									}
									
									display += '<small class="text-muted">' + JSONData.replyList[i].regDate + '</small>';
									display += '</span>';
									
									display += '<span class="lesson-reply-reset-button-span">';
									
									if ( JSONData.replyList[i].user.userId == userId ) {
										display += '<span>';
										display += '<small class="lesson-reply-content-right ml-3">삭제<input type="hidden" class="lesson-reply-content-hidden" value="0"/></small>';
										display += '<small class="lesson-reply-content-right ml-3">수정<input type="hidden" class="lesson-reply-content-hidden" value="1"/></small>';
										display += '</span>';
									}
									else if ( JSONData.replyList[i].user.userId != userId ) {
										display += '<span>';
										display += '<small class="text-muted lesson-reply-content-right">신고<input type="hidden" class="lesson-reply-content-hidden" value="2"/></small>';
										display += '</span>';
									}
									
									display += '</span>';
									
									display += '</h6>';
									display += '<div class="here-is-change-update-div">';
									
									if( JSONData.replyList[i].totalReport >= 5 ) {
										display += '<p class="blind-reply-content">블라인드 처리된 댓글입니다.</p>'
									}
									else {
										display += '<p>' + JSONData.replyList[i].replyContent + '</p>'
									}
									
									display += '</div>';
									display += '</div>';
									display += '</li>';
									display += '<hr/>';
								}
								display += '</ul>';
								display += '<span class="scroll-page"></span>';
								
								$('.scroll-page:last').after(display);
								$('.lesson-reply-list-max-page').val(JSONData.resultPage.maxPage);
								$('.lesson-reply-list-current-page').val( currentPage );
								
							}
						}
				)
				
			}
		}
	}
	// 댓글 리스트 스크롤로 추가할때 쓸 function ----------------------------------------
	
	// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
	$('.report-row-div').on('click', function(){
		$('.report-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
		$('.report-container').find('.report-div').attr('class', 'report-div report-text-non-select');
		
		$(this).find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-select');
		$(this).find('.report-div').attr('class', 'report-div report-text-select');
		
		var stateValue = $(this).find('.report-hidde-value').val();
		
		var buttonText = $(this).find('.report-div').text().trim();
		
		var replyContent = $('.report-reply-hidden-content').val();
		
		$('.report-hidden-input-value').val(stateValue);
		
		var display = '';
		display += '<div class="report-check-reason-text"><h6>해당 댓글' + replyContent + '을 <span class="text-danger">' + buttonText + '</span> 사유로 <br/>신고하시겠습니까?</h6></div>';
		$('.report-reply-content-check').html(display);
	});
	// 신고 모달창 클릭시 이벤트 -------------------------------------------------------
	
	// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
	$('.report-madal-total').on('hidden.bs.modal', function(){
		$('.report-container').find('.report-cirlce').attr('class', 'report-cirlce report-cirlce-non-select');
		$('.report-container').find('.report-div').attr('class', 'report-div report-text-non-select');
		
		$('.report-container').find('.report-cirlce').eq(0).attr('class', 'report-cirlce report-cirlce-select');
		$('.report-container').find('.report-div').eq(0).attr('class', 'report-div report-text-select');
		
	})
	// 신고 모달창 그냥 닫혔을때 초기화 이벤트 -----------------------------------------------
	
	$('.modal-to-report-process-button').on('click', function(){
		var reportCode = $('.report-hidden-input-value').val();
		var replyNo = $('.report-reply-number-hidden').val();
		var report = new Object();
		report.replyNo = replyNo;
		report.reportCode = reportCode;
		
		$.ajax(
				{
					url : "/questionReport/json/addReport",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify(
						report		
					),
					success : function(JSONData, status) {
						
						if (JSONData.result == 'true') {
							$('.report-madal-total').modal('hide');
							$('.report-navi-span-text').text('신고가 정상적으로 접수되었습니다.');
							$('.report-result-modal').modal('show');
						}
						else {
							$('.report-madal-total').modal('hide');
							$('.report-navi-span-text').text('이미 신고한 상태입니다.');
							$('.report-result-modal').modal('show');
						}
					}
				}
		)
	})
	
	$('.report-result-modal-close-button').on('click', function(){
		$('.modal-backdrop').remove();
	})
	
	
	$( window ).resize(function() {
	   var windowWidth = $(this).width(); // 화면 창 변화 그대로 가져오기 
	   var windowHeight = $(this).height();
	   console.log('----' + windowWidth);
//	   if ( windowWidth <= 1090 ) {
	   if ( windowWidth <= 980 ) {
		   console.log('hide');
		   $('.lesson-project-content-outer-div').hide();
		   $('.lesson-reply-content-total-outer-div').hide();
		   $('.col-lg-4.fixed-right-tool-bar').hide();
		   $('.small-width-row').show();
		   $('.lesson-header-total-arrow').hide();
		   $('.fixed-right-tool-bar').hide();
//		   $('.col-lg-4.fixed-right-tool-bar').attr('class', 'col-lg-4 fixed-bottom');
	   }
	   else {
		   $('.lesson-project-content-outer-div').show();
		   $('.lesson-reply-content-total-outer-div').show();
		   $('.col-lg-4.fixed-right-tool-bar').show();
		   $('.small-width-row').hide();
		   $('.lesson-header-total-arrow').show();
		   $('.fixed-right-tool-bar').show();
//		   $('.col-lg-4.fixed-bottom').attr('class', 'col-lg-4 fixed-right-tool-bar');
	   }
	   
	   if ( windowHeight >= 600 ) { // max-height: 500px;
		   $('.lesson-project-content-outer-div').css('max-height', '500px');				   
	   }
	   else if ( windowHeight >= 500 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '400px');	
	   }
	   else if ( windowHeight >= 400 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '300px');	
	   }
	   else if ( windowHeight >= 300 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '200px');	
	   }
	   else if ( windowHeight >= 200 ) {
		   $('.lesson-project-content-outer-div').css('max-height', '100px');	
	   }
	});
	
	// 강의에서 클래스 상세보기로 가게 하는 버튼 이벤트 ------------------------------------------
	$('.go-to-the-class-intro-button').on('click', function(){
		self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + $('.class-number').val();
	})
	// 강의에서 클래스 상세보기로 가게 하는 버튼 이벤트 ------------------------------------------
	
	// 블라인드 처리된 댓글 상세보기 -------------------------------------------------------
	$(document).on('click', '.here-is-change-update-div > .blind-reply-content', function(){
		var blindReplyContent = $(this).parents('.media.my-4').find('.lesson-reply-content-hidden-value').val();
		Swal.fire({
			icon : 'info',
			title : '블라인드 댓글 확인',
			showConfirmButton : false, 
			allowOutsideClick : true,
			text : blindReplyContent 
		});
	})
	// 블라인드 처리된 댓글 상세보기 -------------------------------------------------------
})	
