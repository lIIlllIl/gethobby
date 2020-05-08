<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>    
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 카카오 로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- ////////////////////////해더/////////////////////////////////////// -->
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

	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
	
	<!-- 채널톡 js -->
	<script src="/resources/javascript/min/channelTalk.js"></script>
	<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->
<script type="text/javascript">
function recap(){
	
	$.ajax ({
		url : "/user/json/reCaptcha",
		method : "post",
		dataType : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(JSONData,status){
			$("input[name='key']").val(JSONData.key);
			$("img[name='naverCaptcha']").attr("src","/user/captchaCopy?fileName="+JSONData.image)
		}
	
	})
}

$(function(){
	$("#security").hide();
	var failNo = 0;
	$("input[name='key']").val("${key}");
	$("input[name='captchaImage']").val("${image}");
	//////////////////////////////////////////////////captcha enter 로그인///
	$("#captcha").on("keydown", function(key) {
		if (key.keyCode == 13) {
			var userId = $("#userId").val();
			var password = $("#password").val();
			
			var cap = $("input[name='captcha']").val();
			var capkey = $("input[name='key']").val();
			
			
			if(userId == "" || userId.length <1 ){
				Swal.fire({
					  icon: 'warning',
					  title: '아이디 입력해주세요',
					  showConfirmButton: false,
					  timer: 1000
					})
				$("#userId").focus();			
				return;
			}else if(password == "" || password == null || password.length < 1){
				Swal.fire({
					  icon: 'warning',
					  title: '패스워드를 입력해 주세요',
					  showConfirmButton: false,
					  timer: 1000
					})
				$("#password").focus();
				return;
			}else if( userId.indexOf('@') < 1 || userId.indexOf('.') == -1){
				Swal.fire({
					  icon: 'warning',
					  title: '이메일 형태로 입력 해주세요',
					  showConfirmButton: false,
					  timer: 1000
					})
				$("#userId").focus();			
				return;
			}	
			if(failNo < 3){
				$.ajax ({			
					url : "/user/json/login",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"				
					},
					data : JSON.stringify({
						userId : userId,
						password : password
					}),
					success : function(JSONData,status){
						if(JSONData.result == 'usernull'){
						
							failNo += 1;						
							if(failNo == 3){
								$("#security").show();
							}
							Swal.fire({
								  icon: 'error',
								  title: '아이디 정보가 없습니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									return;
								})
							
						}else if(JSONData.result == 'pwfail'){
							failNo += 1;
							if(failNo == 3){
								$("#security").show();
							}
							Swal.fire({
								  icon: 'error',
								  title: '패스워드 불일치',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									return;
								})
						}else if(JSONData.result == 'stopUser'){
							Swal.fire({
								  icon: 'error',
								  title: '정지 된 회원 입니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})							
						
						}else if(JSONData.result == 'retireUser'){
							Swal.fire({
								  icon: 'error',
								  title: '탈퇴 된 회원 입니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})							
						
						}else if(JSONData.result == 'success'){
							alert('success');
							Swal.fire({
								  icon: 'success',
								  title: '로그인 완료',
								  showConfirmButton: false,
								  timer: 800
								}).then((result) =>{
									alert("${redirectUrl}");
									// self.location = "/user/login"; 기존
									// 인터셉터 수정한부분 -------------------------------
									var redirectUrl = '';
									redirectUrl = "${redirectUrl}";
									alret(redirectUrl);
									if ( redirectUrl != '' ) {
										self.location = redirectUrl;
									}
									else {
										 self.location = "/user/login";
										
										}
									
									// 인터셉터 수정한부분 -------------------------------
								})						
						}else if(JSONData.result == 'manager'){
							Swal.fire({
								  icon: 'success',
								  title: '로그인 완료',
								  showConfirmButton: false,
								  timer: 800
								}).then((result) =>{
									self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
								})			
						}	
					}
				})
			}else{
	 	$.ajax ({
				
				url : "/user/json/naverCaptcha",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-type" : "application/json"
				},
				data : JSON.stringify({
					userId : userId,
					password : password,
					captcha : cap,
					key : capkey
				}),
				success : function(JSONData, status){
					if(JSONData.result == 'usernull'){					
						Swal.fire({
							  icon: 'error',
							  title: '아이디 정보가 없습니다',
							  showConfirmButton: false,
							  timer: 1000
							}).then((result) =>{
								recap();
							})
					}else if(JSONData.result == 'fail'){
						Swal.fire({
							  icon: 'error',
							  title: '보안번호가 틀렸습니다',
							  showConfirmButton: false,
							}).then((result) =>{
								
								recap();
								
							})
					}else if(JSONData.result == 'pwfail'){
						Swal.fire({
							  icon: 'error',
							  title: '패스워드 불일치입니다',
							  showConfirmButton: false,
							  timer: 1000
							}).then((result) =>{
								recap();
							})
					}else if(JSONData.result == 'stopUser'){
						Swal.fire({
							  icon: 'error',
							  title: '정지 된 회원 입니다',
							  showConfirmButton: false,
							  timer: 1000
							}).then((result) =>{
								recap();
							})
					}else if(JSONData.result == 'retireUser'){
						Swal.fire({
							  icon: 'error',
							  title: '탈퇴 된 회원 입니다',
							  showConfirmButton: false,
							  timer: 1000
							}).then((result) =>{
								recap();
							})							
					
					}else if(JSONData.result == 'success'){
						Swal.fire({
							  icon: 'success',
							  title: '로그인 완료',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								// self.location = "http://127.0.0.1:8080/index.jsp"; // 기존
								// 수정한 부분 /////////////////////////////
								var redirectUrl = '';
								redirectUrl = "${redirectUrl}";
								alret(redirectUrl);
								if ( redirectUrl != '' ) {
									self.location = redirectUrl;
								}
								else {
									self.location = "/user/login";
									
								}
								// 수정한 부분 /////////////////////////////
							})
						
					}else if(JSONData.result == 'manager'){
						Swal.fire({
							  icon: 'success',
							  title: '로그인 완료',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								 self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
							
							})
						
					}
				}
				
			}) 
				
							
			}	
		}
	});
	
	
///////////////////////////////////////////////////////////////////// enter 로그인////
	 $("#password").on("keydown", function(key) {
			if (key.keyCode == 13) {
				var userId = $("#userId").val();
				var password = $("#password").val();
				
				var cap = $("input[name='captcha']").val();
				var capkey = $("input[name='key']").val();
				
				
				if(userId == "" || userId.length <1 ){
					Swal.fire({
						  icon: 'warning',
						  title: '아이디 입력해주세요',
						  showConfirmButton: false,
						  timer: 1000
						})
					$("#userId").focus();			
					return;
				}else if(password == "" || password == null || password.length < 1){
					Swal.fire({
						  icon: 'warning',
						  title: '패스워드를 입력해 주세요',
						  showConfirmButton: false,
						  timer: 1000
						})
					$("#password").focus();
					return;
				}else if( userId.indexOf('@') < 1 || userId.indexOf('.') == -1){
					Swal.fire({
						  icon: 'warning',
						  title: '이메일 형태로 입력 해주세요',
						  showConfirmButton: false,
						  timer: 1000
						})
					$("#userId").focus();			
					return;
				}	
				if(failNo < 3){
					$.ajax ({			
						url : "/user/json/login",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"				
						},
						data : JSON.stringify({
							userId : userId,
							password : password
						}),
						success : function(JSONData,status){
							if(JSONData.result == 'usernull'){
							
								failNo += 1;						
								if(failNo == 3){
									$("#security").show();
								}
								Swal.fire({
									  icon: 'error',
									  title: '아이디 정보가 없습니다',
									  showConfirmButton: false,
									  timer: 1000
									}).then((result) =>{
										return;
									})
								
							}else if(JSONData.result == 'pwfail'){
								failNo += 1;
								if(failNo == 3){
									$("#security").show();
								}
								Swal.fire({
									  icon: 'error',
									  title: '패스워드 불일치',
									  showConfirmButton: false,
									  timer: 1000
									}).then((result) =>{
										return;
									})
							}else if(JSONData.result == 'stopUser'){
								Swal.fire({
									  icon: 'error',
									  title: '정지 된 회원 입니다',
									  showConfirmButton: false,
									  timer: 1000
									}).then((result) =>{
										recap();
									})							
							
							}else if(JSONData.result == 'retireUser'){
								Swal.fire({
									  icon: 'error',
									  title: '탈퇴 된 회원 입니다',
									  showConfirmButton: false,
									  timer: 1000
									}).then((result) =>{
										recap();
									})							
							
							}else if(JSONData.result == 'success'){
								Swal.fire({
									  icon: 'success',
									  title: '로그인 완료',
									  showConfirmButton: false,
									  timer: 800
									}).then((result) =>{
										self.location = "/user/login";
									})						
							}else if(JSONData.result == 'manager'){
								Swal.fire({
									  icon: 'success',
									  title: '로그인 완료',
									  showConfirmButton: false,
									  timer: 800
									}).then((result) =>{
										self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
									})			
							}	
						}
					})
				}else{
		 	$.ajax ({
					
					url : "/user/json/naverCaptcha",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"
					},
					data : JSON.stringify({
						userId : userId,
						password : password,
						captcha : cap,
						key : capkey
					}),
					success : function(JSONData, status){
						if(JSONData.result == 'usernull'){					
							Swal.fire({
								  icon: 'error',
								  title: '아이디 정보가 없습니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})
						}else if(JSONData.result == 'fail'){
							Swal.fire({
								  icon: 'error',
								  title: '보안번호가 틀렸습니다',
								  showConfirmButton: false,
								}).then((result) =>{
									
									recap();
									
								})
						}else if(JSONData.result == 'pwfail'){
							Swal.fire({
								  icon: 'error',
								  title: '패스워드 불일치입니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})
						}else if(JSONData.result == 'stopUser'){
							Swal.fire({
								  icon: 'error',
								  title: '정지 된 회원 입니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})
						}else if(JSONData.result == 'retireUser'){
							Swal.fire({
								  icon: 'error',
								  title: '탈퇴 된 회원 입니다',
								  showConfirmButton: false,
								  timer: 1000
								}).then((result) =>{
									recap();
								})							
						
						}else if(JSONData.result == 'success'){
							Swal.fire({
								  icon: 'success',
								  title: '로그인 완료',
								  showConfirmButton: false,
								  timer: 800
								}).then((result) =>{
									// self.location = "http://127.0.0.1:8080/index.jsp"; // 기존
									// 수정한 부분 /////////////////////////////
									var redirectUrl = '';
									redirectUrl = "${redirectUrl}";
									if ( redirectUrl != '' ) {
										self.location = redirectUrl;
									}
									else {
										 self.location = "http://192.168.0.144:8080/index.jsp";
										
									}
									// 수정한 부분 /////////////////////////////
								})
							
						}else if(JSONData.result == 'manager'){
							Swal.fire({
								  icon: 'success',
								  title: '로그인 완료',
								  showConfirmButton: false,
								  timer: 800
								}).then((result) =>{
									 self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
								
								})
							
						}
					}
					
				}) 
					
								
				}	
			}
		}); 
///////////////////////////////////////////////////////////////////// 클릭 로그인////	

	
	$("button.sc-jTzLTM.flMyeK.eYKibL.eLfQiK").on("click",function(){
		
		var userId = $("#userId").val();
		var password = $("#password").val();
		
		var cap = $("input[name='captcha']").val();
		var capkey = $("input[name='key']").val();
		
		
		if(userId == "" || userId.length <1 ){
			Swal.fire({
				  icon: 'warning',
				  title: '아이디 입력해주세요',
				  showConfirmButton: false,
				  timer: 1000
				})
			$("#userId").focus();			
			return;
		}else if(password == "" || password == null || password.length < 1){
			Swal.fire({
				  icon: 'warning',
				  title: '패스워드를 입력해 주세요',
				  showConfirmButton: false,
				  timer: 1000
				})
			$("#password").focus();
			return;
		}else if( userId.indexOf('@') < 1 || userId.indexOf('.') == -1){
			Swal.fire({
				  icon: 'warning',
				  title: '이메일 형태로 입력 해주세요',
				  showConfirmButton: false,
				  timer: 1000
				})
			$("#userId").focus();			
			return;
		}	
		if(failNo < 3){
			$.ajax ({			
				url : "/user/json/login",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-type" : "application/json"				
				},
				data : JSON.stringify({
					userId : userId,
					password : password
				}),
				success : function(JSONData,status){
					if(JSONData.result == 'usernull'){
					
						failNo += 1;						
						if(failNo == 3){
							$("#security").show();
						}
						Swal.fire({
							  icon: 'error',
							  title: '아이디 정보가 없습니다',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								return;
							})
						
					}else if(JSONData.result == 'pwfail'){
						failNo += 1;
						if(failNo == 3){
							$("#security").show();
						}
						Swal.fire({
							  icon: 'error',
							  title: '패스워드 불일치',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								return;
							})
					}else if(JSONData.result == 'stopUser'){
						Swal.fire({
							  icon: 'error',
							  title: '정지 된 회원 입니다',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								recap();
							})							
					
					}else if(JSONData.result == 'retireUser'){
						Swal.fire({
							  icon: 'error',
							  title: '탈퇴 된 회원 입니다',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								recap();
							})							
					
					}else if(JSONData.result == 'success'){
						Swal.fire({
							  icon: 'success',
							  title: '로그인 완료',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								// self.location = "/user/login"; 기존
								// 수정한 부분 /////////////////////////////
								var redirectUrl = '';
								redirectUrl = "${redirectUrl}";
								if ( redirectUrl != '' ) {
									self.location = redirectUrl;
								}
								else {
									 self.location = "http://192.168.0.144:8080/index.jsp";
									
								}
								// 수정한 부분 /////////////////////////////
							})						
					}else if(JSONData.result == 'manager'){
						Swal.fire({
							  icon: 'success',
							  title: '로그인 완료',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) =>{
								self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
							})			
					}	
				}
			})
		}else{
 	$.ajax ({
			
			url : "/user/json/naverCaptcha",
			method : "post",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-type" : "application/json"
			},
			data : JSON.stringify({
				userId : userId,
				password : password,
				captcha : cap,
				key : capkey
			}),
			success : function(JSONData, status){
				if(JSONData.result == 'usernull'){					
					Swal.fire({
						  icon: 'error',
						  title: '아이디 정보가 없습니다',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							recap();
						})
				}else if(JSONData.result == 'fail'){
					Swal.fire({
						  icon: 'error',
						  title: '보안번호가 틀렸습니다',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							
							recap();
							
						})
				}else if(JSONData.result == 'pwfail'){
					Swal.fire({
						  icon: 'error',
						  title: '패스워드 불일치입니다',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							recap();
						})
				}else if(JSONData.result == 'stopUser'){
					Swal.fire({
						  icon: 'error',
						  title: '정지 된 회원 입니다',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							recap();
						})
				}else if(JSONData.result == 'retireUser'){
					Swal.fire({
						  icon: 'error',
						  title: '탈퇴 된 회원 입니다',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							recap();
						})							
				
				}else if(JSONData.result == 'success'){
					Swal.fire({
						  icon: 'success',
						  title: '로그인 완료',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							// self.location = "http://192.168.0.144:8080/index.jsp"; // 기존
							// 수정한 부분 /////////////////////////////
							var redirectUrl = '';
							redirectUrl = "${redirectUrl}";
							if ( redirectUrl != '' ) {
								self.location = redirectUrl;
							}
							else {
								 self.location = "http://192.168.0.144:8080/index.jsp";
								
							}
							// 수정한 부분 /////////////////////////////
						})
					
				}else if(JSONData.result == 'manager'){
					Swal.fire({
						  icon: 'success',
						  title: '로그인 완료',
						  showConfirmButton: false,
						  timer: 800
						}).then((result) =>{
							 self.location = "http://192.168.0.144:8080/admin/user/listUserAdmin";
						
						})
					
				}
			}
			
		}) 
			
						
		}
		
			
	});
/////////////////네이버 로그인/////////////
	$("button.sc-jTzLTM.flMyeK.btEexr.bRQEnB").on("click",function(){
		
		window.open("/user/naverOpenWindow.jsp","popWin",
		"width=537, height=500, left=450, top=90, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
		
	});
/////////////////카카오 로그인/////////////
	$("button.sc-jTzLTM.flMyeK.btEexr.dPbiof").on("click",function(){
		
		window.open("/user/openWindow.jsp","popWin",
					"width=537, height=500, left=550, top=90, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
		
				
	});
	
	
	$("#reflashcap").on("click",function(){
		recap();
	});
///////<h6> 숨기기///////////
	$(document).ready(function(){			
		$("h6").hide();
	}); 
/////////////////validation check/////////////
	$("#userId").on("blur",function(){
		
		if($(this).val() == "" || $(this).val() == null){
			$(this).addClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.check").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.cid").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.noid").show();
		}else if($(this).val().indexOf('@') < 1 || $(this).val().indexOf('.') == -1){
			$(this).addClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.check").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.noid").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.cid").show();
		}else{
			checkUserId = $("#userId").val();			
			$(this).removeClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.noid").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.cid").hide();
		}
	});
/////////////////validation check/////////////	
	$("#password").on("blur",function(){
		
		if($(this).val() == "" || $(this).val() == null){
			$(this).addClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.8ja").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.nopassword").show();
		}else if($(this).val().length < 8){
			$(this).addClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.nopassword").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.8ja").show();
		}else{
			$(this).removeClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.8ja").hide();
			$(this).siblings(".sc-bwCtUz.bNBuwd.nopassword").hide();
		}
	});
	
	$("#captcha").on("blur",function(){
		
		if($(this).val() == "" || $(this).val() == null){
			$(this).addClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.failcaptcha").show();
		}else{
			$(this).removeClass("error");
			$(this).siblings(".sc-bwCtUz.bNBuwd.failcaptcha").hide();
		}
	});
	
	// 추가된 부분 ---------------------------------------------------------
	var checkRedirectUrl = '';
	checkRedirectUrl = '${redirectUrl}';
	
	if ( checkRedirectUrl != '' ) {
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
			title : '로그인이 필요한 기능입니다.'
		});
	}
	// 추가된 부분 ---------------------------------------------------------
});




</script>
<style>
.jtKWHE {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    margin-bottom: 16px;
}
h2 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 32px;
    font-size: 28px;
    margin: 0px 0px 10px;
    padding: 0px;
}
*, ::before, ::after {
    box-sizing: border-box;
}

h2 {
    display: block;
    font-size: 1.8em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
html {
    color: -internal-root-color;
}

.gNPcmC {
    display: flex;
    flex-direction: column;
    margin: 0px 0px 8px;
}
.QtLBl {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: flex-start;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}
.cNSGNe {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    height: 48px;
    width: 100%;
    color: rgb(62, 64, 66);
    box-sizing: border-box;
    margin: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(221, 224, 226);
    border-image: initial;
    flex: 1 1 auto;
    padding: 0px 16px;
    border-radius: 3px;
    
}
.cNSGNe.error {
    border-width: 1px;
    border-style: solid;
    border-color: rgb(255, 82, 82);
    border-image: initial;
}
h6 {
    display: block;
    font-size: 0.67em;
    margin-block-start: 2.33em;
    margin-block-end: 2.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h6 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 16px;
    font-size: 14px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.cN {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    height: 48px;
    width: 45%;
    color: rgb(62, 64, 66);
    box-sizing: border-box;
    margin: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(221, 224, 226);
    border-image: initial;
    flex: 1 1 auto;
    padding: 0px 16px;
    border-radius: 3px;
    
}
.cNN {    
    height: 47px;
    width: 53%;    
}
.cN.error {
    border-width: 1px;
    border-style: solid;
    border-color: rgb(255, 82, 82);
    border-image: initial;
}
.cNSGNe:hover {
    border-width: auto;
    border-style: solid;
    border-color: rgb(189, 194, 198);
    border-image: initial;
}
.cvzQqA {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    margin: 0px 0px 4px;
}
.kfHOmn {
    background-color: rgb(255, 255, 255);
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    min-height: calc(100vh - 72px);
    padding: 64px 0px 128px;
    margin: 0px auto;
}
.dGxVjn {
    position: relative;
}
.dMwZff {
    max-width: 408px;
    width: 100%;
    padding: 0px 16px;
}
.fnZqte {
    margin-bottom: 36px;
}
.cgoDOaaa {
    font-size: 11px;
    font-weight: normal;
    line-height: 16px;
    letter-spacing: normal;
    display: block;
    float: left;
    color: rgb(168, 174, 179);
    margin: 0px;
    text-decoration: underline;
}
.keyGVDDD {
    font-size: 11px;
    font-weight: normal;
    line-height: 16px;
    letter-spacing: normal;
    display: block;
    text-align: right;
    color: rgb(168, 174, 179);
    margin: 0px;
    text-decoration: underline;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.flMyeK {
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
.eYKibL {
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
.eLfQiK {
    margin: 16px 0px;
}
.eYKibL:hover, .eYKibL:active {
    background-color: rgb(247, 120, 0);
}
.eLfQiK {
    margin: 16px 0px;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.dPbiof {
    margin-bottom: 16px;
    color: rgb(62, 64, 66);
    background-color: rgb(255, 232, 18) !important;
    border-radius: 2px;
    transition: filter 0.1s ease 0s;
}
.dPbiof:hover {
    filter: hue-rotate(-12deg) brightness(97%);
}
.btEexr {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(62, 64, 66);
    background-color: rgb(248, 248, 249);
    font-weight: 700;
    font-size: 16px;
    letter-spacing: -0.2px;
    height: 48px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 20px;
    transition: background-color 0.1s ease 0s;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.bRQEnB {
    margin-bottom: 16px;
    color: rgb(255, 255, 255);
    background-color: rgb(0, 199, 60) !important;
    border-radius: 2px;
    transition: filter 0.1s ease 0s;
}
.bRQEnB:hover {
    filter: hue-rotate(-12deg) brightness(97%);
}
.bRQEnB:hover, .bRQEnB:active {
    background-color: rgb(0, 160, 20);
}
.bRQEnB img {
    width: 24px;
    height: 24px;
    margin-right: 4px;
}
img {
    vertical-align: middle;
    border-style: none;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
body {
    text-align: left;
    text-transform: none;
    line-height: 1.5;
    letter-spacing: 0px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    position: relative;
    background: rgb(248, 248, 249);
    margin: 0px;
}
.bdbgMM {
    display: block;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: buttonface;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}
.jwdpRj {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 0px;
    width: 24px;
    height: 24px;
    margin-right: 4px;
    flex: 0 0 auto;
}
.bNBuwd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(255, 82, 82);
    margin: 2px 0px;
}
.bNBuwd path {
    fill: rgb(255, 82, 82);
}
.bgbHMA {
    font-size: 11px;
    line-height: 16px;
    font-weight: normal;
    display: flex;
}
* + .bgbHMA {
    margin-left: 2px;
}
</style>
</head>
<body>
<!-- 추가된 부분 -->
<input type="hidden" class="login-redirect-url" id="login-redirect-url" value="${redirectUrl}" />
<!-- 추가된 부분 -->

 <jsp:include page="/common/header.jsp"/> 
	<div class="dGxVjn">
		<main class="gulakV">
			<div class="kfHOmn">
				<div class="dMwZff" style="margin-top: 60px;">
					<h2 class="jtKWHE">로그인</h2>
					<div class="fnZqte">
					<form>
						
						<div class="gNPcmC">		
							<div class="sc-kIPQKe gNPcmC">
								<label class="sc-esjQYD cvzQqA">아이디</label>
								<div class="sc-iQNlJl bdbgMM">
									<input class="sc-epnACN cNSGNe" type="email" id="userId" name="userId" placeholder="example@naver.com" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd noid"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">아이디를 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd cid"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">아이디를 이메일 형식으로 작성바랍니다</span>
												</h6>
								</div>									
							</div>
						</div>
						
						<div class="gNPcmC">		
							<div class="sc-kIPQKe gNPcmC">
								<label class="sc-esjQYD cvzQqA">비밀번호</label>
								<div class="sc-iQNlJl bdbgMM">
									<input class="sc-epnACN cNSGNe" type="password" id="password" name="password" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd nopassword"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">패스워드를 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd 8ja"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">최소 8자 입니다</span>
												</h6>
								</div>									
							</div>							
						</div>
						<hr>
						<div class="gNPcmC" id="security">
							<div class="sc-kIPQKe gNPcmC">
								<input type="hidden" name="key" value="" />
								<input type="hidden" name="captchaImage" value="" />
								<div >
									<label class="sc-esjQYD cvzQqA">아래의 보안 번호를 입력해 주세요</label>
									<!-- 외부 경로에 있는 이미지를 읽어오기 위해 /user/getNaverCaptcha Method로 외부 경로의 네이버 캡차 이미지를 복사해서 browser에 출력   -->
									<img class = "cNN" name="naverCaptcha" src="/user/captchaCopy?fileName=${image}" />
									<i class="fas fa-redo" id="reflashcap" style="cursor: pointer;"></i>
									<input class = "cN" type="text" name="captcha" id="captcha" autocomplete="off" style="padding-left: 10px;padding-right: 10px;width: 142px;"/>
												 <h6  class="sc-bwCtUz bNBuwd failcaptcha"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">보안 번호를 입력해 주세요</span>
												</h6>
								</div>
							</div>
						</div>
						<hr>	
						<div> 
						<a class="LoginPage__ResetPasswordButton-co2bls-4 cgoDOaaa" href="/user/getPassword.jsp" style="clear: none;">비밀번호를 잊으셨나요?</a>
						<a class="LoginPage__SignUpButton-co2bls-3 keyGVDDD" href="/user/addUser" style="clear: none;margin-bottom: 10px;">회원가입 하기</a>
						</div>
						
						<button type="button" class="sc-jTzLTM flMyeK eYKibL eLfQiK" color="orange" fill="true">
						<span class="sc-fjdhpX kCztpU">로그인</span>
						</button>
						
						<hr>
						
						<button type="button" class="sc-jTzLTM flMyeK btEexr dPbiof" color="default" fill="true" style="margin-bottom: 10px;">
							<div class="sc-VigVT jwdpRj">
								<svg width="24" height="24" viewBox="0 0 24 24">
								<path fill="#3e4042" fill-rule="evenodd" d="M12 4c-4.97 0-9 3.185-9 7.115 0 2.557 1.707 4.8 4.27 6.054-.188.702-.682 2.545-.78 2.94-.123.49.178.483.376.351.155-.103 2.466-1.675 3.464-2.353.541.08 1.1.123 1.67.123 4.97 0 9-3.186 9-7.115C21 7.185 16.97 4 12 4">
								</path>
								</svg>
							</div>
							<span class="sc-fjdhpX kCztpU">카카오로 시작하기</span>
						</button>
						
						<button type="button" class="sc-jTzLTM flMyeK btEexr bRQEnB" color="default" fill="true">
							<span class="sc-fjdhpX kCztpU">
								<span>네이버로 시작하기</span>
							</span>
						</button>							
										
								
						
					</form>	
					<hr>
					</div>
				</div>
			</div>
		</main>
	</div>
<jsp:include page="/common/footer.jsp"/>










<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>