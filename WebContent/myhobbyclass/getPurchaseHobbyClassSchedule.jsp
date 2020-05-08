<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>GetHobby</title>
	<!-- 웹사이트 파비콘 -->
    <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
    <link rel="icon" href="/resources/image/logo/logo-favicon.png">
    
    <!-- favicon 404 에러 안보이게  -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">


    <!--부트스트랩 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

    <!-- 메인 메뉴 CSS -->
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 메인 메뉴 js -->
    <script src="/resources/javascript/header.js"></script>
	
	<!-- full calendar 설정 -->
	<link href='/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='/resources/fullcalendar/packages/timegrid/main.min.css' rel='stylesheet' />
	
	<script src='/resources/fullcalendar/packages/core/main.js'></script>
	<script src='/resources/fullcalendar/packages/daygrid/main.js'></script>
	<script src="/resources/fullcalendar/packages/interaction/main.min.js"></script>
	<script src="/resources/fullcalendar/packages/timegrid/main.min.js"></script>
	<script src='/resources/fullcalendar/packages/core/locales/ko.js'></script>

	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
    <!-- 헤더 -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css" /> 
    
	<script>
	
	$(function(){
		var eventRegisterArray;
		var eventStartArray;
		var eventArray; 
	
		$.ajax(
				{
					url : "/myHobbyClass/json/getPurchaseHobbyClassSchedule", 
					method : "get",
					dataType : "json",
					async : false, 
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData) {
						console.log(JSONData);
						eventRegisterArray = JSONData.eventRegister;
						eventStartArray = JSONData.eventStart;
						
						for (var i = 0; i < eventRegisterArray.length; i++) {
							var endDate = eventRegisterArray[i].end;
							var splitEndDate = endDate.split('-');
							
							if ( splitEndDate[2].indexOf('0') != -1 ) {
								var endDateDays = splitEndDate[2] * 1; 
								endDateDays += 1;
								
								if ( endDateDays < 10 ) { 
									endDateDays = '0' + endDateDays
								}
								
								endDate = splitEndDate[0] + '-' + splitEndDate[1] + '-' + endDateDays;
							}
							else if ( splitEndDate[2].indexOf('0') == -1 ) {
								var endDateDays = ( splitEndDate[2] * 1 ) + 1;
								var endDateMonths = splitEndDate[1] * 1;
								var endDateYears = splitEndDate[0] * 1;
								
								if ( endDateMonths == 2 ) {
									if ( endDateDays > 28 ) {
										endDateDays = '01';
										endDateMonths = '02';
									}
								}
								else if ( endDateMonths == 1 || endDateMonths == 3 || endDateMonths == 5 || endDateMonths == 7 || endDateMonths == 8 || endDateMonths == 10 ) {
									if ( endDateDays > 31 ) {
										endDateDays = '01';
										endDateMonths += 1;
									}
								}
								else if ( endDateMonths == 12 ) {
									if ( endDateDays > 31 ) {
										endDateDays = '01';
										endDateMonths = '01';
										endDateYears += 1;
									}
								}
								else {
									if ( endDateDays > 30 ) {
										endDateDays = '01';
										endDateMonths += 1;
									}
								}
								
								if ( endDateMonths <= 9 ) {
									endDateMonths = '0' + endDateMonths; 
								}
								
								endDate = endDateYears + '-' + endDateMonths + '-' + endDateDays; 
							}
							console.log('endDate ? : ' + endDate);
							eventRegisterArray[i].end = endDate;
						}
						
						
						for (var i = 0; i < eventStartArray.length; i++) {
							var endDate = eventStartArray[i].end;
							endDate = endDate + ' 23:59';
							eventStartArray[i].end = endDate;
						}
						
						eventArray = eventRegisterArray.concat(eventStartArray);
					}
				}
		)
		
		var Calendar = FullCalendar.Calendar;
		 
		var containerEl = document.getElementById('external-events');
		var calendarEl = document.getElementById('calendar');
			  
		var calendar = new Calendar(calendarEl, {
			contentHeight : 900,   
			eventLimit : 5,
	   		plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	   		header: {
	     		left: 'prev,next today',
	     		center: 'title',
	     		right: 'dayGridMonth'
	   		}, 
	   		editable: false,
	   		locale: 'ko',
	  		events: eventArray,
	   		eventClick: function (info) {
			   	/*
				var result = confirm("해당 클래스는 : " + info.event.extendedProps.classState + " 상태입니다. 상세보기 하시겠습니까?" );
				if ( result ) {
					self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + info.event.extendedProps.hobbyClassNo;
				}
				*/
				var display = '';
				
				if ( info.event.extendedProps.classState == '수요조사 중' ) {
					display += '<span class="schedule-text-blue-strong-span">수요조사 중</span>';
				}
				else if ( info.event.extendedProps.classState == '개강 중' ) {
					display += '<span class="schedule-text-strong-span">개강 중</span>';
				}
				
				Swal.fire({
					title : '<span class="first-title">클래스 간략보기</span>',
					html : 	'<br/><br/>' + 
					'<h5 class="schedule-text-small-span1 schedule-text-small-span2">' + 
					info.event.extendedProps.title + 
					'<br/>' + 
					display + 
					'<br/>' + 
					'<span class="badge wrapper-gray text-wrap">'	+
					info.event.extendedProps.startDate + 
					'</span>' + 
					' ~ ' + 
					'<span class="badge wrapper-gray text-wrap">'	+
					info.event.extendedProps.endDate + 
					'</span>' +
					'</div>' + 
					'</h5>' + 
					'<br/><br/>' + 
					'<button type="button" class="btn btn-basic swal-class-intro-button" value="' + info.event.extendedProps.hobbyClassNo + '">상세보기</button>',
					showCancelButton : false,
					showConfirmButton: false,
					allowOutsideClick : true 
				})
	   		}
	 	});
		
	 	calendar.render();
	
		$("#all-button").click(function(){
			$('.select-schedule-button').attr('class', 'select-schedule-button schedule-non-selected-button1 schedule-non-selected-button2');
			$('.select-schedule-button').attr('disabled', false);
			
			$(this).attr('class', 'select-schedule-button schedule-selected-button');
			$(this).attr('disabled', true);
	 		
			
			console.log("전체보기버튼클릭");
	 
	 		var event = calendar.getEvents();
	
	 		for ( var count = 0; count < event.length; count++){ 
				event[count].remove();  
	 		}
	 
	 		for(var i = 0; i < eventArray.length; i++) {
	  			calendar.addEvent( eventArray[i] );
	 		}
	    	calendar.render();
		});
	
		$("#open-button").click(function(){
			$('.select-schedule-button').attr('class', 'select-schedule-button schedule-non-selected-button1 schedule-non-selected-button2');
			$('.select-schedule-button').attr('disabled', false);
			
			$(this).attr('class', 'select-schedule-button schedule-selected-button');
			$(this).attr('disabled', true);
			
	 		console.log("초록버튼클릭");
	 
	 		var event = calendar.getEvents();
	
	 		for ( var count = 0; count < event.length; count++){ 
				event[count].remove();  
	 		}
	
	 		for(var i = 0; i < eventRegisterArray.length; i++) {
	  			calendar.addEvent( eventRegisterArray[i] );
	 		}
	    	calendar.render();
		});
	
		$("#stay-button").click(function(){
			$('.select-schedule-button').attr('class', 'select-schedule-button schedule-non-selected-button1 schedule-non-selected-button2');
			$('.select-schedule-button').attr('disabled', false);
			
			$(this).attr('class', 'select-schedule-button schedule-selected-button');
			$(this).attr('disabled', true);
			
	 		console.log("파란버튼클릭");
	 
	 		var event = calendar.getEvents();
	
	 		for ( var count = 0; count < event.length; count++){ 
				event[count].remove();  
	 		}
	 
	 		for(var i = 0; i < eventStartArray.length; i++) {
	  			calendar.addEvent( eventStartArray[i] );
	 		}
	    	calendar.render();
		});
		
		$(document).on('click', '.swal-class-intro-button', function(){
			console.log( $(this).val() );
			Swal.clickCancel();
			self.location = '/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=' + $(this).val();
		})
	})
	
	</script>
	<!-- 캘린더 한글 설정 -->

	<style>
		html, body {
		  margin: 0;
		  padding: 0;
		  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		  font-size: 14px;
		}
		
		#external-events {
		  position: fixed;
		  z-index: 2;
		  top: 300px;
		  left: 140px;
		  width: 150px;
		  padding: 0 10px;
		  border: 1px solid #ccc;
		  background: #eee;
		}
		
		.demo-topbar + #external-events { /* will get stripped out */
		  top: 60px;
		}
		
		#external-events .fc-event {
		  margin: 1em 0;
		  cursor: move;
		}
		
		#calendar-container {
		  position: relative;
		  z-index: 1;
		  margin-left: 200px;
		}
		
		#calendar {
		  max-width: 900px;
		  margin: 20px auto;
		}
	 
		.fc-content {
	    	cursor: pointer;
		}
		
		.fc-event, .fc-event:hover {
		    color: #fff !important; 
		    text-decoration: none;
		}
		
		.fixed-right-tool-bar {
			box-shadow: rgba(41, 42, 43, 0.16) 0px 2px 6px -2px;
		    position: sticky;
		    top: 0px;
		    max-height: 100vh;
		    padding: 24px;
		    border-radius: 3px;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(255, 255, 255);
		    border-image: initial;
		    overflow: auto;
		}
		
		.this-is-class-title-to-the-right-fixed-tool-bar {
		    font-size: 20px;
		    font-weight: bold;
		    line-height: 28px;
		    letter-spacing: -0.3px;
		    color: rgb(62, 64, 66);
		    word-break: keep-all;
		    margin: 0px 0px 8px;
		}
		
		.schedule-text-normal-span2 {
		    font-size: 20px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.schedule-text-normal-span1 {
		    word-break: keep-all;
		}
		
		.schedule-text-strong-span {
		    color: rgb(253, 126, 20);
		}
		
		.schedule-text-blue-strong-span {
		    color: rgb(42, 143, 180);
		}
		
		.schedule-text-gray-strong-span {
		    color: rgb(168, 174, 179);
		}
		
		.schedule-text-small-span2 {
		    font-size: 15px;
		    font-weight: bold;
		    color: rgb(62, 64, 66);
		    line-height: 32px;
		    letter-spacing: -0.4px;
		    margin: 0px;
		}
		
		.schedule-text-small-span1 {
		    word-break: keep-all;
		}
		
		.schedule-selected-button {
		    width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgba(255, 146, 43, 0.5);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
		
		.schedule-button-text {
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 0 auto;
		}
		
		.schedule-non-selected-button1 {
		    width: 100%;
		    display: flex;
		    vertical-align: middle;
		    color: rgb(255, 255, 255);
		    background-color: rgb(255, 146, 43);
		    font-weight: 700;
		    font-size: 16px;
		    letter-spacing: -0.2px;
		    height: 48px;
		    text-decoration-line: none;
		    border-radius: 3px;
		    padding: 0px 20px;
		    transition: background-color 0.1s ease 0s;
	    }
	    
	   	.schedule-non-selected-button2 {
		    box-sizing: border-box;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    flex-direction: row;
		    border-width: 0px;
		    border-style: initial;
		    border-color: initial;
		    border-image: initial;
		    outline: none;
		    margin: 0px;
		    padding: 0px;
		    flex: initial;
		}
	
		.swal-div {
			float : left !important;
		}
		
		
		.wrapper-gray {
	    	background-color: rgb(62, 64, 66);
	    	color: white;
		}
	</style>
 
</head>
<body>
	<jsp:include page="/common/header.jsp"/>
	<br/><br/><br/><br/><br/>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div id='calendar'></div>
			</div>
			
			<div class="col-lg-4 fixed-right-tool-bar">
				<h3 class="schedule-text-normal-span1 schedule-text-normal-span2">
					<span class="schedule-text-strong-span">
						${ !empty sessionScope.user.nickName ? sessionScope.user.nickName : sessionScope.user.name }
					</span>
					<br/>
					님이 
					<span class="schedule-text-blue-strong-span">
						구매
					</span>
					하신
					<br/>
					클래스 정보를 
					<br/>
					<span class="schedule-text-blue-strong-span">
						확인
					</span>
					할 수 있습니다.
				</h3>
				<br/>
				<h5 class="schedule-text-small-span1 schedule-text-small-span2">
					클래스는 
					<br/>
					<span class="schedule-text-blue-strong-span">
						수요조사 중
					</span>
					, 
					<span class="schedule-text-strong-span">
						개강
					</span> 
					<br/>
					으로 표기됩니다.
				</h5>
				<br/>
				<h5 class="schedule-text-small-span1 schedule-text-small-span2">
					하단의 버튼으로 
					<span class="schedule-text-strong-span">
						정렬
					</span>
					이 가능합니다. 
				</h5>
				<br/>
				<button type="button" id="all-button" class="select-schedule-button schedule-selected-button">
					<span class="schedule-button-text">
						전체
					</span>
				</button>
				<br/>
				<button type="button" id="stay-button" class="select-schedule-button schedule-non-selected-button1 schedule-non-selected-button2">
					<span class="schedule-button-text">
						게깅
					</span>
				</button>
				<br/>
				<button type="button" id="open-button" class="select-schedule-button schedule-non-selected-button1 schedule-non-selected-button2">
					<span class="schedule-button-text">
						수요조사 중
					</span>
				</button>				
			</div>		
		</div>
	</div>
	
	
	<div id='calendar'></div>
	
	<br/><br/><br/><br/><br/>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
