f<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- //2020-02-24 Git Commit --%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="/resources/css/commonAdmin.css">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- HighCharts CDN -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	
	<style>

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
    clear: left;
}

.navbar {
	position: fixed;
	left:0px;
	top: 0px;
	z-index: 1000;
	width:100%;
	
    padding: 14px 16px;
    height: 57px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
}

#sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 999;
    background: white;
    color: rgb(97, 101, 104);
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: white;
    font-size: 14px;
}

#sidebar ul.components {
    padding: 20px 0;
    font-size: 14px;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    color: rgb(97, 101, 104);
    background: #fff;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: rgb(27, 28, 29);
    font-weight: bold;
    background: white;
    position: relative;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: calc(100% - 250px);
    padding: 81px 24px 57px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0px;
    right: 0px;
}

#content.active {
    width: 100%;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #content {
        width: 100%;
    }
    #content.active {
        width: calc(100% - 250px);
    }
    #sidebarCollapse span {
        display: block;
    }
}

/* Css Custom */

.adminAction-button {
	background-color:#4267b2; 
	border:0; 
	outline: none; 
	width:40px; 
	height:24px; 
	padding: 0px;
}
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
			
}
.sidebar-text:hover{
	font-weight: 700;
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 23px 0px 15px 32px;
}
.manager-content {
	margin: 0px;
}
.manager-title-searchbar {
	width: 360px;
    height: 100%;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    box-shadow: rgba(0, 0, 0, 0.04) 0px 0px 1px 0px, rgba(41, 42, 43, 0.16) 0px 1px 3px 0px;
    padding: 10px 16px;
    border-radius: 3px;
    
}
.manager-title-search-input-box {
	border:0; 
	outline:none;
	width:360px;
	
}
.manager-no {
	width: 20px;
}
.delete-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.add-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    cursor: pointer;
    
}
.add-event-div:hover {
 	text-decoration: underline;
 	text-decoration-color:rgb(95, 174, 201);
}
.update-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.black-hover:hover {
	font-weight: 700;
}

.manage-menu-div {
	width: 100%;
	display: flex;
	justify-content: space-between;	
}
.manage-search-menu-div-left-sort {
	width: 100%;
	display: flex;
	justify-content: left;
	
}
.manager-search-menu-div {
	display: flex;
	justify-content: left;
}
.manage-sort-button-div {	
	height: 44px;			
}

.manage-sort-button {
	border: 0;
	outline: none;
	width:120px;	
	color:rgb(62, 64, 66);
	background-color: white;
}
.manage-sort-button:focus {
	border: 0;
	outline: none;
}
::selection { 
	background-color: rgb(255, 89, 70) !important;
 		color: rgb(255, 255, 255) !important;
}
.dropdown-item:focus {
	background-color: white;
	color: rgb(255, 146, 43);
}
.dropdown-menu {
	border: 0;
	box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;
	outline: 0 none;
	
}
.button:hover {
	border: 0;
	outline: 0 none;
	background-color: white;
}

.button,textarea:focus {
	border: 0 !important;
	outline: 0 none !important;
	background-color: white;	
}

.button:not(:hover) {
	border: 0;
	outline: 0 none;
	background-color: white;
}
.manager-title-state {
	font-size: 14px;
	margin-left: 8px;
}
.page-item a {
	color: rgb(62, 64, 66);
	border: 0;
	outline: 0 none;
}
.page-item:focus {
	border: 0;
	outline: 0 none;
}
.page-item a:hover {
	color: rgb(62, 64, 66);
	font-weight: 700;
	border: 0;
	outline: 0 none;
}
.flow-button {
	border: 0;
	outline: 0 none;
	background-color: white;
	width:32px;
	height:32px;
	padding:0px;
}
.flow-button:hover {
	border: 0;
	outline: 0 none;
	font-weight: 500;
	
}
.flow-button:focus {
	border: 0;
	outline: 0 none;			
}
.page-link:focus {
	border: 0;
	box-shadow: none;
	outline: 0 none;
 }
 .page-link {
 	border: 0;
	box-shadow: none;
	outline: 0 none;
 }
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
	
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 16px 0px 32px 32px;
}
.manager-content {
	margin: 0px;
}
.manage-no-page-span {
	color: rgb(220, 220, 220);	
	cursor: not-allowed;
	border: 0;
	outline 0 none;
}
#lineContainer {
    min-width: 310px;
    max-width: 800px;
    height: 400px;
    position:relative;
}
.gmaa-cs {
	font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    min-width: 310px;
    max-width: 800px;
    height: 48px;
    position: relative;
    
    -webkit-appearance: none;
    background-image: url("/resources/image/gon/flow.jpg");
    background-size: 18px;
    color: rgb(62, 64, 66);
    margin: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(221, 224, 226);
    border-image: initial;
    border-radius: 1px;
    flex: 1 1 auto;
    padding: 12px 48px 12px 16px;
    background-repeat: no-repeat;
    background-position: right 16px center;
}
.gmaa-cs:focus {
	border-color: black;
	outline: 0 none;
}			
.gmaa-cs-lc-d {
	padding: 0px;
	height: 448px;
	min-width: 310px;
    max-width: 800px;
    margin: auto;
    top: 100px;
    position: relative;
}
	</style>
</head>

<body>

    <div class="wrapper">
        
        <!-- Sidebar
        <jsp:include page="sidebarAdmin.jsp" /> -->
		<jsp:include page="/admin/sidebarAdmin.jsp" />
        <!-- Page Content  -->
        <div id="content">

			<!-- Toolbar
            <jsp:include page="toolbarAdmin.jsp" /> -->
            <jsp:include page="/admin/toolbarAdmin.jsp" />
            <!--------------------------------------------------------------------------------------------------------------------------------------------------->
            <!---------------------------------------------------------------------- 차트화면 ---------------------------------------------------------------------->
            <div class="gmaa-cs-lc-d">
	            <select color="#3e4042" name="monthId" class="gmaa-cs">
		            <option value="jan">1월</option>
		            <option value="feb">2월</option>
		            <option value="mar">3월</option>
		            <option value="apr">4월</option>
		            <option value="may">5월</option>
		            <option value="jun">6월</option>
		            <option value="jul">7월</option>
		            <option value="aug">8월</option>
		            <option value="sep">9월</option>
		            <option value="oct">10월</option>
		            <option value="nov">11월</option>
		            <option value="dec">12월</option>
	            </select>
	            <div id="lineContainer"></div>
			</div>
        </div>
    </div>


    <script type="text/javascript">

        $(function () {
        	
			// 변수선언 : Month, lastMonth, Day -> 2월은 윤달이 있을 경우 29일로 통일
			var jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec;
			var lastJan, lastFeb, lastMar, lastApr, lastMay, lastJun, lastJul, lastAug, lastSep, lastOct, lastNov, lastDec;
			var lastDayDate = new Array();
			var year, lastYear;
			
			// 통계 데이터 가져오기
			getData();
			
			// 최초 실행시 1월 실행 ( 월, 마지막 일, 해당년도, 작년도 )
			getLineHighCharts( 'jan', '31', getOneYearTitle(year), getOneYearTitle(year)-1 );
			
			$(document).on("change", "select[name='monthId']", function(){
				
				// 해당 월의 마지막 일 가져오기
				lastDayDate = getLastDayDate($(this).val(),lastDayDate);
				
				// 1년 비교 차트 참고정보 가져오기
				year = getOneYearTitle(year);
				lastYear = getOneYearTitle(year)-1;
				
				// 하이차트 실행
				getLineHighCharts($(this).val(), lastDayDate, year, lastYear);

			});
			
			
			// 하이차트 실행
			function getLineHighCharts(month, lastDayDate, year, lastYear){
				if( month == 'jan' ){
					startLineHighChats(jan, lastJan, lastDayDate, 'January', year, lastYear );
				}else if( month == 'feb' ){
					startLineHighChats(feb, lastFeb, lastDayDate, 'February', year, lastYear );
				}else if( month == 'mar' ){
					startLineHighChats(mar, lastMar, lastDayDate, 'March', year, lastYear );
				}else if( month == 'apr' ){
					startLineHighChats(apr, lastApr, lastDayDate, 'April', year, lastYear );
				}else if( month == 'may' ){
					startLineHighChats(may, lastMay, lastDayDate, 'May', year, lastYear );
				}else if( month == 'jun' ){
					startLineHighChats(jun, lastJun, lastDayDate, 'June', year, lastYear );
				}else if( month == 'jul' ){
					startLineHighChats(jul, lastJul, lastDayDate, 'July', year, lastYear );
				}else if( month == 'aug' ){
					startLineHighChats(aug, lastAug, lastDayDate, 'August', year, lastYear );
				}else if( month == 'sep' ){
					startLineHighChats(sep, lastSep, lastDayDate, 'September', year, lastYear );
				}else if( month == 'oct' ){
					startLineHighChats(oct, lastOct, lastDayDate, 'October', year, lastYear );
				}else if( month == 'nov' ){
					startLineHighChats(nov, lastNov, lastDayDate, 'November', year, lastYear );
				}else if( month == 'dec' ){
					startLineHighChats(dec, lastDec, lastDayDate, 'December', year, lastYear );
				}
			}//end of getLineHighCharts

			// 1년 비교 차트 참고정보
			function getOneYearTitle(year){
				var date = new Date();
				var year = date.getFullYear();
				return year;
			}
			
			// x축 Data : 해당 월의 일 수
			function getLastDayDate(month, lastDayDate) {
				lastDayDate.pop();	//lastDayDate 초기화
				if( month == 'jan' || month == 'mar' || month == 'may' || month == 'jul' || month == 'aug'
						|| month == 'oct' || month == 'dec'){ // 1월, 3월, 5월, 8월, 10월, 12월일 경우
					for(var day=1; day<=31; day++ ){
						lastDayDate[day-1] = day;
					}
					return lastDayDate;
					
				}else if( month == 'feb' ){ // 2월일 경우
					var date = new Date();
					var year = date.getFullYear();
					// 이번년도 또는 작년 중 윤달이 있을 경우
					if( (year%4 == 0 && year%100 != 0) || (year%400 == 0)	
							|| ( (year-1)%4 == 0 && (year-1)%100 != 0 ) || ( (year-1)%400 == 0 ) ){  
						for(var day=1; day<=29; day++ ){
							lastDayDate[day-1] = day;
						}
						return lastDayDate;
						
					}else{ // 윤달이 없을 경우
						for(var day=1; day<=28; day++ ){
							lastDayDate[day-1] = day;
						}
						return lastDayDate;
						
					}//end of feb
					
				}else{ // 4월, 6월, 7월, 9월, 11월일 경우
					for(var day=1; day<=30; day++ ){
						lastDayDate[day-1] = day;
					}
					return lastDayDate;
				}//end of if
			}//end of getLastDayDate
			
			// 이번년도, 작년도 데이터
			function getData(){
				jan = ${analysis.yearMap.month1}; // 1
				feb = ${analysis.yearMap.month2}; // 2
				mar = ${analysis.yearMap.month3}; // 3
				apr = ${analysis.yearMap.month4}; // 4
				may = ${analysis.yearMap.month5}; // 5
				jun = ${analysis.yearMap.month6}; // 6
				jul = ${analysis.yearMap.month7}; // 7
				aug = ${analysis.yearMap.month8}; // 8
				sep = ${analysis.yearMap.month9}; // 9
				oct = ${analysis.yearMap.month10}; // 10
				nov = ${analysis.yearMap.month11}; // 11
				dec = ${analysis.yearMap.month12}; // 12
				lastJan = ${analysis.lastYearMap.month1}; // 1
				lastFeb = ${analysis.lastYearMap.month2}; // 2
				lastMar = ${analysis.lastYearMap.month3}; // 3
				lastApr = ${analysis.lastYearMap.month4}; // 4
				lastMay = ${analysis.lastYearMap.month5}; // 5
				lastJun = ${analysis.lastYearMap.month6}; // 6
				lastJul = ${analysis.lastYearMap.month7}; // 7
				lastAug = ${analysis.lastYearMap.month8}; // 8
				lastSep = ${analysis.lastYearMap.month9}; // 9
				lastOct = ${analysis.lastYearMap.month10}; // 10
				lastNov = ${analysis.lastYearMap.month11}; // 11
				lastDec = ${analysis.lastYearMap.month12}; // 12
			}//end of getData
			
			// HighCharts(Line) Start Function
        	function startLineHighChats(yearData, lastYearData, lastDayDate, month, year, lastYear){
				
	        	Highcharts.chart('lineContainer', {
	        	    chart: {
	        	        type: 'line'
	        	    },
	        	    title: {
	        	        text: 'Money Analysis Between '+year+' and '+lastYear+' in '+month
	        	    },
	        	    xAxis: {
	        	        categories: lastDayDate
	        	    },
	        	    yAxis: {
	        	        title: {
	        	            text: 'Money'
	        	        },
	        	        
	        	    },
	        	    plotOptions: {
	        	        line: {
	        	            dataLabels: {
	        	                enabled: false
	        	            },
	        	            enableMouseTracking: true
	        	        }
	        	    },
	        	    series: [{
	        	        name: lastYear,
	        	        data: lastYearData
	        	    }, {
	        	        name: year,
	        	        data: yearData
	        	    }]
	        	});
        	}
            
            ////////////////////////////////////////////////////////////
            //////////////////// sidebar event /////////////////////////
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
			////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////
    
        });
    </script>
</body>

</html>