<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>GetHobby</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>    
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

	<!-- 채널톡 js -->
	<script src="/resources/javascript/min/channelTalk.js"></script>
	
	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
	<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->
	<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>
<script type="text/javascript">
var hash = [];
var inputCheck = 0;	
	//////////////////////주소찾기 //////////////////////////////
	function postcode() {
		var width = 500; 
		var height = 500;
		        new daum.Postcode({
		         	width: width, 
	        	    height: height,
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }		                
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postCode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open({
		        	left: (window.screen.width / 2) - (width / 2),
	        	    top: (window.screen.height / 2) - (height / 2)
		        });
		    }
	
	//////해쉬태그 5개 선택///////////
	var maxCheck = 5;
	var totalChecked = 0;
	
	function CountChecked(field){			
		
		if(field.checked){
			totalChecked += 1;
			if(totalChecked > maxCheck){
				Swal.fire({
					  icon: 'warning',
					  title: '5개 까지 선택 가능합니다',
					  showConfirmButton: false,
					  timer: 800
					})
				field.checked = false;
				totalChecked -= 1;
			}
		}else{
			totalChecked -= 1;
		
		}
	}
	
///////////회원가입 하기/////////////
	function fncAddUser(){
		var password =$("input[name='password']").val();
		var birth = $("input[name='birth']").val();
		
		if(password == "" || password.length < 8 ){
			Swal.fire({
					  icon: 'warning',
					  title: '비밀번호 8자리 이상 반드시 입력하세요',
					  showConfirmButton: false,
					  timer: 800
					}).then((result) => {
						$("#name").focus();
							return;						
						
					})
		}else if(birth == "" || birth.length <8 ){
			Swal.fire({
					  icon: 'warning',
					  title: '생년월일 8자리 반드시 입력하세요',
					  showConfirmButton: false,
					  timer: 800
					}).then((result) => {
						$("#birth").focus();
						return;	
					})
			
		}else{			 
		 
		////////////해쉬태그 배열에 담기///////////////
		/*  var hash = [];
			$("input[type='checkbox']:checked").each(function(){
				
				hash.push($(this).val());	
								
			});  */
		$("#hashtag").val(hash);
		//////////////////////////////////////////
		Swal.fire({
				  icon: 'success',
				  title: '회원 가입 완료   로그인 해주세요',
				  showConfirmButton: false,
				  timer: 800
				}).then((result) => {
					$("form#plusAddUser").attr("method","POST").attr("action","/user/addUser").submit();
				})
		
		}
	}
	
/////////////전송////////////////
	$(function(){
		$("#addsubmit").on("click",function(){
			fncAddUser();	
		});		
	});
	

/////////////////validation check/////////////
	$(function(){		
		
		///////<h6> 숨기기///////////
		$(document).ready(function(){			
			$("h6").hide();
		}); 
		
		$("#name").on("blur",function(){
			
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noname").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noname").hide();
			}
			
		});
		
	/////////////////아이디 중복체크 및 validation check/////////////	
		var checkUserId = null; 
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
				
				$.ajax({				
					url : "/user/json/checkDuplication",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						checkUserId : checkUserId
					}),
					headers :{
						"Accept" : "application/json",
						"content-type" : "application/json"
					},	
					success : function(result){
						if(result == true){
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.cid").hide();
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.check").hide();
						}else{
							$("#userId").addClass("error");
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.cid").hide();
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.check").show();							
						}
					}
				})
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
		
/////////////////validation check/////////////
		$("#rePassword").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.faultPassword").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.norePassword").show();
			}else if($(this).val() != $("#password").val()){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.norePassword").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.faultPassword").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.faultPassword").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.norePassword").hide();
			}
		});	
		
		$("#birth").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").show();
			}else if($(this).val().length < 8){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nobirth").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.8jabirth").hide();
			}			
		});	
		
		$("#phone").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").show();
			}else if($(this).val().indexOf('-') > 1){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nophone").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nohyphen").hide();
			}			
		});
		$("#nickName").on("blur",function(){
			
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nonickname").show();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nonickname").hide();
			}
			
		});
		
		$("button.sc-jTzLTM.flMyeK.btEexr.bRQEnB").on("click",function(){
			
			$.ajax({
				
				url:"/user/json/naverLogin",
				method :"get",
				dataType:"json",
				headers : { 
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				
				success : function(JSONData,status){
					self.location = JSONData.loginURL;
				}			
			})		
		});
		
		$("button.sc-jTzLTM.flMyeK.btEexr.dPbiof").on("click",function(){
			
			$.ajax ({
				url:"/user/json/kakaoLogin",
				method:"get",
				dataType : "json",
				header : {
					"Accept" :  "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData,status){
					self.location = JSONData.kakaoURL;
				}
			})
			
		});
		
		$("#hashtagselect").on("click",function(){
			
			$("#hashtagModalButton").click();
		});
		
	 }); 
/////////////////////////이미지 미리보기////////////////////
	function preview(input, target){
		if(input.files && input.files[0]){
			var fileName = input.files[0].name;
			var ext = fileName.substr(fileName.length-3,fileName.length);
			var isCheck=false;
			if(ext.toLowerCase() =='jpg' || ext.toLowerCase() =='gif'|| ext.toLowerCase() =='png' ){
				isCheck=true;
			}
			
			if(isCheck=false){
				Swal.fire({
					  icon: 'error',
					  title: '이미지 파일을 올려주세요',
					  showConfirmButton: false,
					  timer: 800
					}).then((result)=>{
						$("input[type='file']").val("");
						return;
					})
				
			
			}
			
			var reader = new FileReader();
			reader.readAsDataURL(input.files[0]);
			reader.onload = function(e){
				$(".RatioImage__Img-wwqqoo-1.gRslZu").attr('src', e.target.result);
			}
			
			
		}
	}
	
	
	
	
</script>
<style>
div {
    display: block;
}
*, ::before, ::after {
    box-sizing: border-box;
}
.dGxVjn {
    position: relative;
}
.hPYuYW {
    background-color: white;
    min-height: 1px;
    box-shadow: rgb(248, 248, 249) 0px -1px inset;
}
.hPYuYW {
    position: sticky;
    top: 0px;
    z-index: 3000;
    box-shadow: rgb(237, 239, 240) 0px -1px inset;
}
article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
    display: block;
}
.iexDaY {
    background-color: white;
    padding: 64px 0px 128px;
}
.inUTcFFF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcFFF {
    margin-left: 24px;
    margin-right: 24px;
}
.QtLBlll {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: center;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}
.QtLBlll {
    margin-right: -4px;
    margin-left: -4px;
}
.bXUojH {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
@media (max-width: 991px){
	.bXUojH {
	    width: 100%;
	    padding-right: 4px;
	    padding-left: 4px;
	}
}
@media (min-width: 992px){
	.bXUojH {
	    width: 35%;
	}
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h1 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 40px;
    font-size: 36px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.iexDaY h1 {
    font-size: 32px;
    line-height: 44px;
    letter-spacing: -0.6px;
    margin: 16px 0px 48px;
}
form {
    display: block;
    margin-top: 0em;
}
.gNPcmC {
    display: flex;
    flex-direction: column;
    margin: 0px 0px 16px;
}
.hGLglh {
    margin-bottom: 16px;
}
label {
    cursor: default;
}
label {
    display: inline-block;
}
.cvzQqA {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    margin: 0px 0px 4px;
}
.inUTcF {
	margin-left: 12px !important;
    margin-right: 12px !important;
}
.bdbgMM {
    display: block;
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
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
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
.bNBuwd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(255, 82, 82);
    margin: 2px 0px;
}
svg[Attributes Style] {
    width: 16;
    height: 16;
}
svg:not(:root) {
    overflow: hidden;
}

path[Attributes Style] {
    fill: rgb(62, 64, 66);
    fill-rule: evenodd;
    d: path("M 21.872 19.51 A 1 1 0 0 1 21 21 H 3 a 1 1 0 0 1 -0.872 -1.49 l 9 -16 a 1 1 0 0 1 1.744 0 l 9 16 Z M 13 15 V 9 h -2 v 6 h 2 Z m 0 3 v -2 h -2 v 2 h 2 Z");
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
button, input {
    overflow: visible;
}
button, select {
    text-transform: none;
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
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.kVAMqa {
    margin-top: 14px;
}
.eYKibL:hover, .eYKibL:active {
    background-color: rgb(247, 120, 0);
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.iexDaY button > span {
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
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
svg[Attributes Style] {
    width: 24;
    height: 24;
}
svg:not(:root) {
    overflow: hidden;
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
img {
    vertical-align: middle;
    border-style: none;
}
.bRQEnB img {
    width: 24px;
    height: 24px;
    margin-right: 4px;
}
.aDress {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    background-color: white;
    height: 48px;
    width: 50%;
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
.form-control {
    display: block;
    width: 40%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 0.8rem;
    font-weight: 400;
    text-align: left;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
input[type=checkbox], input[type=radio] {
    box-sizing: border-box;
    padding: 0;
    cursor: default;
}
.form-check-inline {
    display: -ms-inline-flexbox;
    display: inline-flex;
    -ms-flex-align: center;
    align-items: center;
    padding-left: 0;
    margin-right: .75rem;
    cursor: default;
}


.carousel-control-next-icon {
  height: 100px;
  width: 100px;
  outline: black;
  background-size: 100%, 100%;
  border-radius: 50%;
  background-image: none;
}
.carousel-control-prev-icon {
  height: 100px;
  width: 100px;
  outline: black;
  background-size: 100%, 100%;
  border-radius: 50%;
  background-image: none;
}

.carousel-control-next-icon:after
{
  content: '>';
  font-size: 50px;
  color: black;
}

.carousel-control-prev-icon:after {
  content: '<';
  font-size: 50px;
  color: black;
}
.cRNLYZ {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    margin: 24px 0px;
}
.logKjs {
    display: inline-block;
    cursor: pointer;
}
.jLGbZG {
    position: relative;
    width: 88px;
    height: 88px;
}
.kgaAUr {
    position: relative;
    width: 110px;
    height: 110px;
    background-color: rgb(255, 255, 255);
    border-radius: 50%;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(237, 239, 240);
    border-image: initial;
}
.eAfAEc {
    display: block;
    position: relative;
    font-size: 0px;
    overflow: hidden;
}
.bKTweb {
    width: 100%;
    height: 100%;
    line-height: 0;
    border-radius: 50%;
}
.gRslZu {
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: relative;
    opacity: 1;
    transition: opacity 0.1s linear 0s;
}
img {
    vertical-align: middle;
    border-style: none;
}
.eYYvSv {
    position: absolute;
    right: 0px;
    bottom: 0px;
    width: 28px;
    height: 28px;
    background-color: rgb(27, 28, 29);
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 4px;
    border-radius: 14px;
}
path[Attributes Style] {
    fill: rgb(255, 255, 255);
    fill-rule: evenodd;
    d: path("M 4 21 a 1 1 0 0 1 -1 -1 v -4 a 1 1 0 0 1 0.293 -0.707 l 11 -11 a 3.828 3.828 0 0 1 5.414 5.414 l -11 11 A 1 1 0 0 1 8 21 H 4 Z m 1 -2 h 2.586 l 0.707 -0.707 l -2.586 -2.586 l -0.707 0.707 V 19 Z");
}
.logKjs input[type="file"] {
    display: none;
}
</style>
</head>
<body>
<jsp:include page="/common/header.jsp"/>
<div id="root">
	<div id="wrapper">
		<div class="pages__Body-sc-1xw23vo-0 dGxVjn">
		<div class="MainHeader__CategoryNavigationWrapper-sc-4sw7cl-1 hPYuYW">
		</div>
			<main class="pages__Main-sc-1xw23vo-1 gulakV">
				<div class="RegisterPage__Container-sc-1vwt6wy-0 iexDaY">
					<div class="sc-eerKOB inUTcFFF">
						<div class="sc-eilVRo QtLBlll">
							<div class="sc-gHboQg bXUojH" style="margin-top: 60px;">
								<h1>회원가입</h1>
								<form id="plusAddUser" enctype="multipart/form-data">
								<div class="Profile__EditProfileImageWrapper-sc-1sl3brv-1 cRNLYZ">
										  <label class="S3UploadButton__Container-a68j44-0 logKjs">
											  <input type="file" id="file" name="file" onchange="preview(this,$('#image_section'));">
											  <div size="88" class="ProfileImageUploadHandler__Container-sc-1advxtt-0 jLGbZG">
												  <div size="88" class="ProfileImage__Container-sc-1h9kedz-0 kgaAUr">
													  <span class="RatioImage__Container-wwqqoo-0 eAfAEc ProfileImage__UserProfileImage-sc-1h9kedz-1 bKTweb">
													 	 <img  src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" alt="" class="RatioImage__Img-wwqqoo-1 gRslZu" id="image_section">
													  </span>
												  </div>
												  <div class="ProfileImageUploadHandler__EditIconWrapper-sc-1advxtt-1 eYYvSv" style="top: 80px;left: 80px;">
													  <svg width="24" height="24" viewBox="0 0 24 24">
														  <path fill="#FFF" fill-rule="evenodd" d="M4 21a1 1 0 01-1-1v-4a1 1 0 01.293-.707l11-11a3.828 3.828 0 015.414 5.414l-11 11A1 1 0 018 21H4zm1-2h2.586l.707-.707-2.586-2.586-.707.707V19z">
														  </path>
													  </svg>
												  </div>
											  </div>
										  </label>
									  </div> 
								<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">아이디
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="userId" id="userId" placeholder="example@example.com" autocomplete="off" value="">
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
												<h6  class="sc-bwCtUz bNBuwd check"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">아이디가 중복되었습니다</span>
												</h6>
											</div>
									</div>
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">비밀번호 (8자 이상)
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="password" id="password" name="password" placeholder="********" autocomplete="off" value="">
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
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">비밀번호 확인
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="password" id="rePassword" name="rePassword" placeholder="********" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd norePassword"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">패스워드 확인을 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd faultPassword"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">패스워드가 일치하지 않습니다</span>
												</h6>
											</div>
									</div>
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">이름
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe" type="text" name="name" id="name" placeholder="홍길동" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd noname"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">이름을 입력해주세요</span>
												</h6>
											</div>
									</div>
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">생년월일 (8자리)
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="birth" id="birth" placeholder="생년월일" autocomplete="off" value="" maxlength="8">
												<h6  class="sc-bwCtUz bNBuwd nobirth"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">생년월일을 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd 8jabirth"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">8자로 입력해 주세요</span>
												</h6>
											</div>
									</div>									
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">휴대전화 번호
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="phone" id="phone" placeholder="-를 제외한 휴대폰 번호를 입력해주세요" autocomplete="off" value="">
												<h6  class="sc-bwCtUz bNBuwd nophone"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">번호를 입력해주세요</span>
												</h6>
												<h6  class="sc-bwCtUz bNBuwd nohyphen"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">-를 제외 입력해주세요</span>
												</h6>
											</div>
									</div>									
									
									<div class="sc-kIPQKe gNPcmC RegisterPage__StyledFormGroup-sc-1vwt6wy-2 hGLglh">
										<label class="sc-esjQYD cvzQqA">닉네임
										</label>
											<div class="sc-iQNlJl bdbgMM">
											<input class="sc-epnACN cNSGNe   " type="text" name="nickName" id="nickName" placeholder="홍길동" autocomplete="off" value="">
											<h6  class="sc-bwCtUz bNBuwd nonickname"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">닉네임을 입력해주세요</span>
												</h6>
											</div>
									</div>									
									<div class="form-gorup" style="margin-bottom: 10px;">
										<label class="sc-esjQYD cvzQqA"> 성 별 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  			<input class="form-check-input" type="radio" name="sex" id="male" value='M' checked>
							  			<label class="form-check-label" for="male"> 남 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  			<input class="form-check-input" type="radio" name="sex" id="female" value='F'>
							  			<label class="form-check-label" for="female"> 여</label>
									</div>
									<div>		
									<jsp:include page="/user/hashtagModal.jsp" />								
										<div  class="cvzQqA" style="width: 100%;height: 30px;margin-right: 0px;">					
										<span id = "hashtagselect" class="aaa flMyeK eYKibL kVAMqa"  style="cursor : pointer;width:50%;float:right;height: 30px;float: left;heightmargin-top:0px;">관심분야 선택</span>
										</div>
										<input type="hidden" id="hashtag" name="hashtag" />
									</div>
									 <div class="form-group" style="margin-top: 10px;">
									   	 <label for="ssn" class="cvzQqA">주소</label>
									   	 								   
										    <div >
										      <input type="text" class="aDress" id="postCode" name="postCode" style="float:left" placeholder="우편번호" autocomplete="off">
											    <button type="button" class="flMyeK eYKibL kVAMqa" onclick="postcode()" style="width:50%;float:right;margin-top:0px;" color="orange" >
											    <span class="">우편번호 찾기</span>
											    </button>
										    										      	      
										      <input type="text" class="cNSGNe" id="address" name="address" placeholder="주소" autocomplete="off" ><br>
										      <input type="text" class="cNSGNe" id="detailAddress" name="detailAddress" placeholder="상세주소"  autocomplete="off">
										     </div>										      
										    
									     		    
									  </div>
																
									<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF eYKibL RegisterPage__SignUpButton-sc-1vwt6wy-3 kVAMqa" id="addsubmit" color="orange" fill="true">
										<span class="sc-fjdhpX kCztpU">회원가입 하기</span>
									</button>
								</form>
							<hr>
							<p>
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
							</p>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</div>


 <jsp:include page="/common/footer.jsp"></jsp:include>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>