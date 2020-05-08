$(document).ready(function () {
        	
        	// 프로필 화살표 애니메이션
        	$(".dropdown-icon").on("click", function() {
                $(".fa-angle-down").toggleClass("flip");
                $(".fa-angle-down").css("transition", "all ease .5s");
            });
        	
        	$(".dropdown-icon-comunity").on("click", function(){
        		$(".fa-angle-downa").toggleClass("flip");
                $(".fa-angle-downa").css("transition", "all ease .5s");
        	});
        	  	
        	// 마이페이지 이동
        	$(document).on("click", ".header-mynemo-span-next-first-div-in-mypage-text", function(){
        		self.location = "/user/mypageUser";
        	});
        	
        	// 회원가입 이동
        	$(document).on("click", ".header-title-box-single:contains('회원가입')", function(){
        		self.location = "/user/addUser";
        	});
        	
        	// 로그인 이동
        	$(document).on("click", ".header-title-box-single:contains('로그인')", function(){
        		self.location = "/user/captcha";
        	});
        	
        	// 크리에이터 지원 이동
        	$(document).on("click", ".header-title-box-single:contains('크리에이터 지원')", function(){
        		self.location = "/user/changeUserCreator";
        	});
        	
        	$(document).on("click", ".header-mynemo-span:contains('크리에이터 지원')", function(){
        		self.location = "/user/changeUserCreator";
        	});
        	
        	// 크리에이터 센터 이동
        	$(document).on("click", ".header-title-box-single:contains('크리에이터 센터')", function(){
        		self.location = "/hobbyclass/getMyHobbyClassList";
        	});
        	
        	$(document).on("click", ".header-mynemo-span:contains('크리에이터 센터')", function(){
        		self.location = "/hobbyclass/getMyHobbyClassList";
        	});
        	
        	// 구매 내역 이동
        	$(document).on("click", ".header-mynemo-span:contains('구매 내역')", function(){
        		self.location = "/purchase/getPaymentHistoryList";
        	});
        	
        	// 이벤트 이동
        	$(document).on("click", ".header-title-box-single:contains('이벤트')", function(){
        		self.location = "/event/eventList";
        	});
        	$(document).on("click", ".side-title-box-single:contains('이벤트')", function(){
        		self.location = "/event/eventList";
        	});

        	// 클래스 이동
        	$(document).on("click", ".header-title-box-single:contains('클래스')", function(){
        		self.location = "/searchhobbyclass/getSearchHobbyClassList.jsp";
        	});
        	$(document).on("click", ".side-title-box-single:contains('클래스')", function(){
        		self.location = "/searchhobbyclass/getSearchHobbyClassList.jsp";
        	});

        	// 메인 이동
        	$(document).on("click", ".getMainClass", function(){
        		self.location = "/index.jsp";
        	});
        	$(document).on("click", ".getMainClass-side", function(){
        		self.location = "/index.jsp";
        	});

        	// 로그아웃 이동
        	$(document).on("click", ".header-mynemo-logout-span:contains('로그아웃')", function(){
        		self.location = "/user/logout";
        	});
        	
        	// 자유게시판 이동
        	$(document).on("click", ".jauNaviClass", function(){
        		self.location = "/article/getBoardArticleList?boardCode=0";
        	});
        	$(document).on("click", ".side-title-box-single:contains('아무말대잔치')", function(){
        		self.location = "/article/getBoardArticleList?boardCode=0";
        	});
        	
        	// 사진게시판 이동
        	$(document).on("click", ".sajinNaviClass", function(){
        		self.location = "/article/getBoardArticleList?boardCode=1";
        	});
        	$(document).on("click", ".side-title-box-single:contains('하루 한 장')", function(){
        		self.location = "/article/getBoardArticleList?boardCode=1";
        	});
        	
        	
        	
        	
			// sideBar
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
           
            });
    
            
            $('.side-img-header').on('click', function () {
            	$('#sidebarCollapse').click();
            });
        });