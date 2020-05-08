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

	<!-- highchart CDN -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
	<script type="text/javascript">
		var startDate = []; 
		var disabledButtonIndexArray = [];
		
		var hobbyClassNo = "${hobbyClassNo}";
		
		$(function(){
			// 바로 collapse를 표시하기 위해 document.ready시 ajax로 날짜 가져옴 -----------------------
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerDateStats",
						method : "post", 
						dataType : "json", 
						async : false,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : hobbyClassNo 
						}), 
						success : function(JSONData, status) {
							
							for(var i = 0; i < JSONData.calendarNameList.length; i++) {
								// 날짜 비교를 위해 현재시간 가져옴 
								var today = new Date();
								var nowMonth = today.getMonth() + 1;
								var nowYear = today.getFullYear();
								
								// 전체 통계를 위한 배열 push 
								startDate.push(JSONData.calendarList[i]);
								
								// JSON으로 가져온 날짜 년/월/일로 parsing  
								var dataSplit = JSONData.calendarList[i].split('-');
						
								if ( nowYear < dataSplit[0] ) {		// 현재 년도가 데이터 년도보다 작다면 
									$("button[name='selectDateButton']").eq(i + 1).attr('disabled', true);
									$("button[name='selectDateButton']").eq(i + 1).attr('class', 'class-statement-non-selected-disabled');
								}
								else if ( nowYear >= dataSplit[0] && nowMonth < dataSplit[1] ) {	// 현재 년도가 데이터 년도보다 크거나 같지만 현재 달이 데이터 달보다 작다면 
									console.log(nowYear + ' / ' + dataSplit[0] );
									console.log(nowMonth + ' / ' + dataSplit[1] );
									
									if ( nowYear <= dataSplit[0] ) {
										$("button[name='selectDateButton']").eq(i + 1).attr('disabled', true);
										$("button[name='selectDateButton']").eq(i + 1).attr('class', 'class-statement-non-selected-disabled');
										
										disabledButtonIndexArray.push(i + 1);
									}
									
								}
								else { // 그외에는 버튼 동작 
									$("button[name='selectDateButton']").attr('disabled', false);
								}
								
								// 전체 버튼을 제외한 나머지 버튼에 데이터 setting 
								$("button[name='selectDateButton']").eq(i + 1).text(JSONData.calendarNameList[i]);
								$("button[name='selectDateButton']").eq(i + 1).val(JSONData.calendarList[i]);
								
							}
						}
					}
			);
			// 바로 collapse를 표시하기 위해 document.ready시 ajax로 날짜 가져옴 -----------------------

			// 날짜 버튼 클릭시 -------------------------------------------------
			$('button[name="selectDateButton"]').on('click', function(){
				// 버튼 this로 가져옴 
				var selectDateButton = $(this);
				
				var url = '';
				
				$('input[name="targetValue"]').val(selectDateButton.val());
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButton.val() != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				// 전체 버튼일 때 
				if ( selectDateButton.val() == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';
				}
				
				$("button[name='selectDateButton']").attr('class', 'class-statement-non-selected-button1 class-statement-non-selected-button2');
				$("button[name='selectDateButton']").attr('disabled', false);
				
				$(this).attr('class', 'class-statement-selected-button');
				$(this).attr('disabled', true);
				
				for(var count = 0; count < disabledButtonIndexArray.length; count++) {
					$("button[name='selectDateButton']").eq(disabledButtonIndexArray[count]).attr('class', 'class-statement-selected-button');
					$("button[name='selectDateButton']").eq(disabledButtonIndexArray[count]).attr('disabled', true);
				}
				
				console.log('now url ? : ' + url);
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
								dateTarget : selectDateButton.val() 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '10대',
									       			y : JSONData.one
									       		}, 
									       		{
									       			name : '20대',
									       			y : JSONData.two
									       		},
									       		{
									       			name : '30대',
									       			y : JSONData.three
									       		},
									       		{
									       			name : '40대',
									       			y : JSONData.four
									       		},
									       		{
									       			name : '50대 이상',
									       			y : JSONData.overFive 
									       		}
									        ]
									    }]
									});
								}
								else {
									console.log('데이터가 읎읍니다');
									/*
									$('#chart_div').remove();
									$('span[name="buttonSpan"]').html('');
									$('.pie-chart-div').prepend('<div id="chart_div"><span class="no-purchase-data-span">구매 내력이 없습니다.</span></div>');
									*/
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '10대',
									       			y : 0
									       		}, 
									       		{
									       			name : '20대',
									       			y : 0
									       		},
									       		{
									       			name : '30대',
									       			y : 0
									       		},
									       		{
									       			name : '40대',
									       			y : 0
									       		},
									       		{
									       			name : '50대 이상',
									       			y : 0
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-basic' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-basic' name='maleButton'>성별</button>";
								$('span[name="buttonSpan"]').html(display);

							}
						}
				)
				
				
			});
			// 날짜 버튼 클릭시 -------------------------------------------------
			
			// 성별 버튼 클릭 시 ------------------------------------------------------
			$(document).on('click', 'button[name="maleButton"]', function(){
				console.log('malebutton click');
				var selectDateButtonValue = $('input[name="targetValue"]').val();
				console.log('selectDateButtonValue ? : ' + selectDateButtonValue);
				var url = '';
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButtonValue != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				
				// 전체 버튼일 때 
				if ( selectDateButtonValue == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';	
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
								// hobbyClassNo 그냥 10000이라고 침 
								hobbyClassNo : hobbyClassNo, 
								dateTarget : selectDateButtonValue 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#18A6E3', '#E01A1A'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 성별 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '남성',
									       			y : JSONData.male
									       		}, 
									       		{
									       			name : '여성',
									       			y : JSONData.female
									       		}
									        ]
									    }]
									});
									
									
								}
								else {
									$('#chart_div').highcharts({
										colors: ['#18A6E3', '#E01A1A'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 성별 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									       		{ 
									       			name : '남성',
									       			y : 0
									       		}, 
									       		{
									       			name : '여성',
									       			y : 0
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-basic' name='ageButton'>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-basic' name='maleButton' disabled>성별</button>";
								$('span[name="buttonSpan"]').html(display);

							}
						}
				)
			})
			// 성별 버튼 클릭 시 ------------------------------------------------------
			
			// 연령대 버튼 클릭 시 ------------------------------------------------------
			$(document).on('click', 'button[name="ageButton"]', function(){
				
				var selectDateButtonValue = $('input[name="targetValue"]').val();
				
				var url = '';
				
				// 전체 버튼이 아닐 때 
				if ( selectDateButtonValue != 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAgeStats';
				}
				
				// 전체 버튼일 때 
				if ( selectDateButtonValue == 'all' ) {
					url = '/myHobbyClass/json/getHobbyClassBuyerAllAgeStats';	
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
								// hobbyClassNo 그냥 10000이라고 침 
								hobbyClassNo : hobbyClassNo, 
								dateTarget : selectDateButtonValue 
							}), 
							success : function(JSONData, status) {
								if ( JSONData.checkValue != 0 ) {
									console.log(JSONData);
									$('#chart_div').highcharts({
										colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
										chart: {
									        plotBackgroundColor: null,
									        plotBorderWidth: null,
									        plotShadow: false,
									        type: 'pie'
									    },
									    title: {
									        text: '수강생 연령대 통계'
									    },
									    tooltip: {
									        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
									    },
									    plotOptions: {
									        pie: {
									            allowPointSelect: true,
									            cursor: 'pointer',
									            dataLabels: {
									                enabled: false
									            },
									            showInLegend: true
									        }
									    },
									    series: [{
									        name: '연령대',
									        colorByPoint: true,
									        data: [
									        	{ 
									       			name : '10대',
									       			y : JSONData.one
									       		}, 
									       		{
									       			name : '20대',
									       			y : JSONData.two
									       		},
									       		{
									       			name : '30대',
									       			y : JSONData.three
									       		},
									       		{
									       			name : '40대',
									       			y : JSONData.four
									       		},
									       		{
									       			name : '50대 이상',
									       			y : JSONData.overFive 
									       		}
									        ]
									    }]
									});
								}
								var display = "<button type='button' class='btn btn-basic' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-basic' name='maleButton'>성별</button>";
								$('span[name="buttonSpan"]').html(display);

							}
						}
				)
			})
			// 연령대 버튼 클릭 시 ------------------------------------------------------
			
			// 전체 연령대 통계 ajax ---------------------------------------------------
			console.log("-------------bstartDate ? : " + startDate);
			
			for(var i = 0; i < startDate.length; i++) {
				var newData = startDate[i].split('-')[0] + ' 년 ' + startDate[i].split('-')[1] + ' 월';
				console.log('newData ? : ' + newData);
				startDate.splice(i, 1, newData);
			}
			console.log("-------------astartDate ? : " + startDate);
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerStats",
						method : "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : hobbyClassNo 
						}),
						success : function(JSONData, status) {
							
							var oneData = []; 
							var twoData = [];
							var threeData = [];
							var fourData = [];
							var overFiveData = [];
							var maleData = [];
							var femaleData = [];
							var totalData = [];
							console.log('-------------total length ? : ' + JSONData.statsList.length);
							for (var i = 0; i < JSONData.statsList.length; i++) {
								oneData.push(JSONData.statsList[i].data.one);
								twoData.push(JSONData.statsList[i].data.two);
								threeData.push(JSONData.statsList[i].data.three);
								fourData.push(JSONData.statsList[i].data.four);
								overFiveData.push(JSONData.statsList[i].data.overFive);
								maleData.push(JSONData.statsList[i].data.male);
								femaleData.push(JSONData.statsList[i].data.female);
								totalData.push(JSONData.statsList[i].data.total);
							}
						
							console.log(oneData);
							$('#total_chart_div').highcharts({
								chart: {
							        type: 'line'
							    },
							    title: {
							        text: '수강생 전체 통계'
							    },
							    subtitle: {
							        text: '성별 / 연령대'
							    },
							    xAxis: {
							    	categories : startDate 
							    },
							    yAxis: {
							        title: {
							            text: '인원 (명)'
							        }
							    },
							    plotOptions: {
							        line: {
							            enableMouseTracking: true 
							        },
							    	series : {
							    		dataLabels: {
							                enabled: false
							            }
							    	},
							        label: {
							            enabled: false,
							        }
							    },
							    series : [
							    	{
							       		name: '10대',
							       		color : '#8000FF',
							        	data: oneData, 
							        	label: {
								            enabled: false,
								        }
							    	}, 
							    	{
							        	name: '20대',
							        	color : '#0489B1',
							        	data: twoData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '30대',
							        	color : '#298A08',
							        	data: threeData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '40대',
							        	color : '#886A08',
							        	data: fourData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '50대 이상',
							        	color : '#FE9A2E',
							        	data: overFiveData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '남성',
							        	color : '#013ADF',
							        	data: maleData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '여성',
							        	color : '#FF0000', 
							        	data: femaleData,
							        	label: {
								            enabled: false,
								        }
							    	},
							    	{
							        	name: '전체',
							        	color: '#000000', 
							        	data: totalData,
							        	label: {
								            enabled: false,
								        }
							    	}
							    ]
							});

						}
					}
			)
			// 전체 연령대 통계 ajax ---------------------------------------------------
			
			
			// 삭제시도
			$('.highcharts-color-none').find('text').text('');
			console.log( $('.highcharts-color-none').find('text') );
		})
	</script>
	
	<script type="text/javascript">
		$(function(){
			$.ajax(
					{
						url : "/myHobbyClass/json/getHobbyClassBuyerAllAgeStats", 
						method : "post", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						data : JSON.stringify({
							hobbyClassNo : hobbyClassNo, 
							dateTarget : "all" 
						}), 
						success : function(JSONData, status) {
							if ( JSONData.checkValue != 0 ) {
								console.log(JSONData);
								$('#chart_div').highcharts({
									colors: ['#5CB3FF', '#2870E3', '#FBB917', '#00B3A2', '#B5BF07'], 
									chart: {
								        plotBackgroundColor: null,
								        plotBorderWidth: null,
								        plotShadow: false,
								        type: 'pie'
								    },
								    title: {
								        text: '수강생 연령대 통계'
								    },
								    tooltip: {
								        pointFormat: '{series.name}: {point.y} 명 (<b>{point.percentage:.1f}%</b>)'
								    },
								    plotOptions: {
								        pie: {
								            allowPointSelect: true,
								            cursor: 'pointer',
								            dataLabels: {
								                enabled: false
								            },
								            showInLegend: true
								        }
								    },
								    series: [{
								        name: '연령대',
								        colorByPoint: true,
								        data: [
								        	{ 
								       			name : '10대',
								       			y : JSONData.one
								       		}, 
								       		{
								       			name : '20대',
								       			y : JSONData.two
								       		},
								       		{
								       			name : '30대',
								       			y : JSONData.three
								       		},
								       		{
								       			name : '40대',
								       			y : JSONData.four
								       		},
								       		{
								       			name : '50대 이상',
								       			y : JSONData.overFive 
								       		}
								        ]
								    }]
								});
							}
							var display = "<button type='button' class='btn btn-basic' name='ageButton' disabled>연령대</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-basic' name='maleButton'>성별</button>";
							$('span[name="buttonSpan"]').html(display);

						}
					}
			)
			
			// CREATER CENTER Click Event
			$(document).on("click", "span:contains('CREATOR CENTER')", function(){
				self.location = "/hobbyclass/getMyHobbyClassList";	
			});
			
			// 내 클래스 Click Event
			$(document).on("click", ".thisismyclass", function(){
				self.location = "/hobbyclass/getMyHobbyClassList";	
			});
		});
	</script>
	
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
		
		.container {
			margin-top:50px;
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
		
		.class-statement-selected-button {
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
		    cursor : not-allowed !important;
		}
		
		.class-statement-non-selected-button1 {
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
		
		.class-statement-non-selected-button2 {
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
		
		.class-statement-non-selected-disabled {
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
		    cursor : not-allowed !important;
		}
		
		/* 추가된 구간 */
		
		.delete-button {
		color: rgb(243, 51, 64);
		box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px; font-size: 14px;
		font-weight: normal;
		line-height: 20px;
		letter-spacing: -0.2px;
		background-color: white;
		padding: 10px 14px;
		width:84px;
		hegiht:60px;
		border:0; 
		outline:none;
		position: relative;
		top:-65px;
		left: -25px;
		display: none;
	}
	.delete-button:focus {		
		color: rgb(243, 51, 64);
		box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px; font-size: 14px;
		font-weight: normal;
		line-height: 20px;
		letter-spacing: -0.2px;
		background-color: white;
		padding: 10px 14px;
		width:84px;
		hegiht:60px;
		border:0; 
		outline:none;
		position: relative;
		top:-65px;
		left: -25px;
		display: none;

	}
	
	@media (min-width: 992px) {
		body {
			padding-top : 62px;
		}
		
		.main_section {
			max-width: 662px;
			width: 60.18%;
			height: 100%;	
			margin-top: 40px;
			margin-left: 30px;
			padding: 0px 12px;		
		}
		.lmhc-da {
		margin-right: 4px;
		position:relative;
		top: -2px;
		
		}
		.lmhc-alert-div {
			 max-width: 1px; 
			 width: 1px; 
			 height:51px; 
			 z-index:1300; 
			 top: 15px; 
			 position:fixed;
			 text-align: center;
		}
	}

	@media (max-width: 991px) {
		body {
			padding: 24px;
		}
		
		.main_section {
			max-width: 100%;
			width: 100%;
			height: 100%;	
			margin-top: 60px;
		
			padding: 0px;		
		}
		.lmhc-alert-div {
			 max-width: 1px; 
			 width: 1px; 
			 height:51px; 
			 z-index:1300; 
			 top: 15px; 
			 position:fixed;
		}
		
	}

	.flex-column {
		width: 240px;
		height: calc(100vh - 72px);
		overflow-y: scroll;
	}
	
	.section {
		width: 100%;
		height: 100%;
	}
	
	.font {
	    font-size: 9px;
	    letter-spacing: normal;
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    font-weight: bold;
	    line-height: 1;
	    color: rgb(237, 239, 240);
	    margin: 0px;
	}
	
	.bottom_button_parent {
		position: relative;
		width: 100%;
	}
	
	.bottom_button {
		position: absolute;
		bottom: 0px;
	}
	
	.card-body_outdiv {
    height: 178px;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: justify;
    justify-content: space-between;
    flex: 1 1 0%;
	}
	
	.listMyHobbyClass-header {
		display: flex;
		justify-content: space-between;
	}

	 .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	    background-color: rgb(248, 248, 249);
	    border: 0;
	    outline: 0 none;
	    font-weight: bold; 
	} 
	  
	.android-listMyHobbyClass-button {
		border: 0;
		outline: 0 none;
		font-size: 14px;
	}
	.android-listMyHobbyClass-button:focus {
		border: 0;
		outline: 0 none;
		box-shadow: none;
	}
	.list-hobbyState-button:focus {
		background-color: #343a40;
	}
	.list-continue-button:focus {
		background-color: #343a40;
	}
	.listMyHobbyClass-button {
		margin-top: 12px;		
		padding: 6px 12px;
	}
	.list-hobbyclass-side-div {
		padding-left: 12px;
	}
	.listMyHobbyClass-card-div {
		box-shadow: rgba(41, 42, 43, 0.08) 0px 4px 8px, rgba(41, 42, 43, 0.12) 0px 12px 16px;
		margin-top: 16px; 
		width: 100%; 
		border: 0;
		height: 226.5px; 
		padding: 24px;
	}
	.addHobbyClass-button {
		padding: 0px;
		color: rgb(95, 174, 201);
		background-color:white;
		box-shadow: none;
		border: 0;
		outline: 0 none;
		font-size: 14px;
	}
	.addHobbyClass-button:focus {
		background-color:white;
		box-shadow: none;
		border: 0;
		outline: 0 none;
	}
	.listMyHobbyClass-newClass-div {
		padding-top:10px;
	}
	.lmhcMH {
		cursor: pointer;
	}
	.lmhcMH:hover {
		background-color: rgb(248, 248, 249);
		font-weight: bold;
	}
	.lmhc-logo-a {
		width:36px;
		height:36px;
	}
	
	.lmhc-da {
		margin-right: 4px;
		position:relative;
		top: -2px;
	}
	
	.lmhc-da-cs {
		min-width:280px; 
		max-width:612px; 
		font-size:14px; 
		line-height:20px; 
		display: flex;
		-webkit-box-align: center; 
		flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    align-items: center;
		background-color: rgb(0, 183, 157);  
		color:white; 
		position:fixed; 
		z-index:1500; 
		margin-top: auto;  
		margin-right: auto; 
		margin-left: auto; 
		margin-bottom: 0px;
		box-shadow: rgba(41, 42, 43, 0.08) 0px 1px 3px, rgba(0, 0, 0, 0.04) 0px 1px 0px;
		padding: 14px 16px;
		border-radius: 3px;
		left: 50%;
    	transform: translate(-50%, 0);
    	display: none;	 
	}
	.delete-button:hover {
		color: rgb(243, 121, 64);
	}
	.lmhc-cc-text {
		font-weight: bold !important;
    	font-size: 1.1rem;
    	color: rgb(62, 64, 66);
    	cursor: default;
    	top:10px;
    	position:relative;
    	font-family:none !important;
    	font-size:17.6px !important;
	}
		
	</style>
 
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	  <a class="navbar-brand lmhc-logo-a" href="/hobbyclass/getMyHobbyClassList"><img src="/resources/image/logo/logo-favicon.png" width="36px" height="36px"></a>
	  <span class="lmhc-cc-text">CREATOR CENTER</span>
	  	<button class="navbar-toggler android-listMyHobbyClass-button" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	   		<span class="navbar-toggler-icon"></span>
	 	</button>
	  	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	  	<div class="navbar-nav d-block d-lg-none d-none list-hobbyclass-side-div">
			  <a class="nav-link lmhcMH thisismyclass" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
		      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/>
		      		<path d="M12 5.69l5 4.5V18h-2v-6H9v6H7v-7.81l5-4.5M12 3L2 12h3v8h6v-6h2v6h6v-8h3L12 3z"/>
		      	</svg>
					<font size="3px" color="black">내 클래스</font>
		      </a> 

	       </div>
	    </div>
	    
	</nav><hr style="padding:0px; margin:0px; margin-bottom:8px;" />
	
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div id="chart_div"></div>
				<span name="buttonSpan"></span>
				<input type="hidden" name="targetValue" value="all" />
			</div>
			
			<div class="col-lg-4 fixed-right-tool-bar">
				<h3 class="schedule-text-normal-span1 schedule-text-normal-span2">
					<span class="schedule-text-strong-span">
						${ !empty sessionScope.user.nickName ? sessionScope.user.nickName : sessionScope.user.name }
					</span>
					<br/>
					님이 
					<span class="schedule-text-blue-strong-span">
						개설
					</span>
					하신
					<br/>
					클래스의 통계를
					<br/>
					<span class="schedule-text-blue-strong-span">
						확인
					</span>
					할 수 있습니다.
				</h3>
				<br/>
				<h5 class="schedule-text-small-span1 schedule-text-small-span2">
					하단의 버튼으로 
					<span class="schedule-text-strong-span">
						정렬
					</span>
					이 가능합니다. 
				</h5>
				<br/>
				<div class="date-button-for-schedule">
					<button type="button" class="class-statement-selected-button" name="selectDateButton" value="all">전체</button>
		    		<br/>
		    		<button type="button" class="class-statement-non-selected-button1 class-statement-non-selected-button2" name="selectDateButton"></button>
		    		<br/>
		    		<button type="button" class="class-statement-non-selected-button1 class-statement-non-selected-button2" name="selectDateButton"></button>
		    		<br/>
		    		<button type="button" class="class-statement-non-selected-button1 class-statement-non-selected-button2" name="selectDateButton"></button>
		    		<br/>
		    		<button type="button" class="class-statement-non-selected-button1 class-statement-non-selected-button2" name="selectDateButton"></button>
		    		<br/>
				</div>			
			</div>		
		</div>
	</div>
	
	<br/><br/><br/>
	<div class="container total-chart-contaier mt-5">
		<div class="row">
			<div class="col-lg">
				<div id="total_chart_div">
					
				</div>
			</div>
		</div>
	</div>
	
	<br/><br/><br/><br/><br/>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
