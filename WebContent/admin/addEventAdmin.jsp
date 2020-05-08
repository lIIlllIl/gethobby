<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- //2020-02-20 Git Commit --%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="../resources/css/commonAdmin.css">
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

	<style>
		
	</style>
</head>

<body>

    <div class="wrapper">
        
        <!-- Sidebar -->
        <jsp:include page="/admin/sidebarAdmin.jsp" />

        <!-- Page Content  -->
        <div id="content">

			<!-- Toolbar -->
            <jsp:include page="/admin/toolbarAdmin.jsp" />
            
            <!--------------------------------------------------------------------------------------------------------------------------------------------------->
            <!---------------------------------------------------------------------- 관리화면 ---------------------------------------------------------------------->
            
            <!-- 모듈관리명 -->
			<div class="manager-title">
            	<h1>이벤트 관리<span class="manager-title-state">이벤트 개수 : 21개</span></h1>          	
            </div>
            
            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
            
            	<!-- 검색창
	            <div class="manager-title-searchbar">
	            	<input type="text" name="searchbar-text" style="border:0; outline:none;" placeholder="검색">
	            	<svg width="24" height="24" class="SearchBox__SearchIcon-rplyxp-2 beZsar" viewBox="0 0 24 24">
		            	<path fill="#3e4042" fill-rule="evenodd" d="M15.593 14.54L20.5 19 19 20.5l-4.46-4.907a6.5 6.5 0 111.054-1.054zM10.5 15a4.5 4.5 0 100-9 4.5 4.5 0 000 9z" />
	            	</svg>	
	            </div>
	             -->
	            <div class="manager-search-menu-div">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					  <button type="button" class="btn-outline-light manage-sort-button black-hover" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	진행상태
					    	<svg width="20" height="20" viewBox="0 0 24 28">
						    	<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" />
					    	</svg>
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">전체</a>
					    <a class="dropdown-item" href="#">진행중</a>
					    <a class="dropdown-item" href="#">종료</a>
					  </div>
					</div>
					
		            <!-- 수정버튼 -->
		            <div class="update-event-div black-hover">  	
						<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24">
									<path d="M11,8v5l4.25,2.52l0.77-1.28l-3.52-2.09V8H11z M21,10V3l-2.64,2.64C16.74,4.01,14.49,3,12,3c-4.97,0-9,4.03-9,9 s4.03,9,9,9s9-4.03,9-9h-2c0,3.86-3.14,7-7,7s-7-3.14-7-7s3.14-7,7-7c1.93,0,3.68,0.79,4.95,2.05L14,10H21z"/>
						</svg>
						<span>수정</span>
		            </div>
		            
		            <!-- 삭제버튼 -->
		            <div class="delete-event-div black-hover">	
						<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/>
							<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM8 9h8v10H8V9zm7.5-5l-1-1h-5l-1 1H5v2h14V4h-3.5z"/>
						</svg>
						<span class="">삭제</span>
		            </div>
	            </div>
	            
	            <!-- 등록버튼 -->
	            <div class="add-event-div">
	            <svg width="24" height="24" viewBox="0 0 24 24">
		  			<path fill="#5faec9" fill-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6z">
		  			</path>
	  			</svg>
	            <button type="button" class="btn btn-light button" style="border:0; outline:none; padding:0px; color:rgb(95, 174, 201);">새로운 이벤트</button>
	            </div>
	            
            </div>
            
            
            <div class="manager-content">
	            <table class="table">
				  <thead>
				    <tr>
				      <th scope="col" class="select-all-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="all-checked-box" style="display: none"> 
				      </th>
				      <th scope="col">번호</th>
				      <th scope="col">이벤트 이름</th>
				      <th scope="col">이벤트 기간</th>
				    </tr>
				  </thead>
				  <tbody>
				  	
				  	<!-- forEach Start -->
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <!-- forEach End -->
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    <tr>
				      <th scope="row" class="select-box">
				      	<svg width="24" height="24" viewBox="0 0 24 24">
					      	<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z" />
				      	</svg>
				      	<input type="checkbox" name="check-status" style="display:none">
				      </th>
				      <td>10000</td>
				      <td>토끼띠 20% 할인 이벤트</td>
				      <td>2020.01.01 ~ 2020.12.31</td>
				    </tr>
				    
				    
				  </tbody>
				</table>
				
				<!-- Pagination -->
					<jsp:include page="/admin/paginationAdmin.jsp" />
				
			</div>


            
        </div>
    </div>

   

    <script type="text/javascript">
        $(function () {

            // 한개 선택 이벤트
            $(document).on("click", ".select-box", function(){
 
            	if( $(this).find("input").is(":checked") == false ) {            		
	            	$(this).find("svg").children("path").remove();	           	
	            	$(this).find("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');	            	
	            	$(this).find("input").attr("checked", true);
	            	
            	}else if( $(this).find("input").is(":checked") == true ) {
	            	$(this).find("svg").children("path").remove();
	            	$(this).find("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
	            	$(this).find("input").attr("checked", false);
	            	
            	}
            });
            
            // 전체 선택 이벤트
            $(document).on("click", ".select-all-box", function(){
            	
            	if( $(".select-all-box").find("input").is(":checked") == false ) {
            		
            		$("input").prev("svg").children("path").remove();
                	$("input").prev("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
                	$("input").attr("checked", true);
                	
            	}else if( $(".select-all-box").find("input").is(":checked") == true ) {
            		
            		$("input").prev("svg").children("path").remove();
                	$("input").prev("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
                	$("input").attr("checked", false);
            		
            	}
            	
            });
            
         	// 수정 버튼 클릭 이벤트
            $(".update-event-div").on("click", function(){
            	
            	// 체크박스 ( checked == true ) 잡는 이벤트
	            $("input[name='check-status']:checked").each(function(){
	            	// 원하는 로직 작성 하는 곳
	            });
	            
            });

            // 정렬 버튼 이벤트
            $(document).on("click", ".dropdown-item", function(){
            	$(".manage-sort-button").html( $(this).text() + ' <svg width="20" height="20" viewBox="0 0 24 28"><path fill="#ff922b" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z"></path></svg>');
            	$(".manage-sort-button").css("color","rgb(255, 146, 43)");
            });          
            
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