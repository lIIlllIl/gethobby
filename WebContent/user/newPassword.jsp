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
<script type="text/javascript">
	
				
		
	
	
	$(function(){
		
		$("#changepw").on("click",function(){
			var password = $("#password").val();
			var repassword = $("#rePassword").val();
			
			if(password == "" || password.length < 1){
				Swal.fire({
					  icon: 'warning',
					  title: '패스워드를 입력해 주세요',
					  showConfirmButton: true,
					  timer : 1200
					}).then((result) =>{
						$("#password").focus();
						return;
					})
				
			}else if(password != repassword){
				Swal.fire({
					  icon: 'warning',
					  title: '비밀번호가 서로 안맞습니다',					  
					  showConfirmButton: true,
					  timer : 1200
				})
			}else if(password == repassword && password != ""){
				Swal.fire({
					  icon: 'success',
					  title: '비밀번호 변경 완료',
					  showConfirmButton: false,
					  timer: 1500
				}).then((result) => {
					$("#sendsend").attr("method","POST").attr("action","/user/updateNewPassword").submit();
				})
			}else{
				return;
			}
			
		});
	});
	$(function(){
	
	///////<h6> 숨기기///////////
		$(document).ready(function(){			
			$("h6").hide();
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
	});
	
		
		
	
</script>
<style>
*, ::before, ::after {
    box-sizing: border-box;
}
.dGxVjn {
    position: relative;
}
article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
    display: block;
}
.fKDyJz {
    background-color: white;
    padding: 64px 0px 128px;
}
.inUTcF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcF {
    max-width: 960px;
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
.bXUojH {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXUojH {
    width: 50%;
    margin-left: 25%;
}
h1 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 40px;
    font-size: 36px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.fKDyJz h1 {
    font-size: 32px;
    line-height: 44px;
    letter-spacing: -0.6px;
    margin: 16px 0px 48px;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.ljnjdo {
    margin: -32px 0px 24px;
}
.gNPcmC {
    display: flex;
    flex-direction: column;
    margin: 0px 0px 16px;
}
.cExydx {
    margin-bottom: 16px;
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
.bdbgMM {
    display: block;
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
.chvMGF {
    width: auto;
    display: inline-flex;
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
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.kPDnkf {
    width: 100%;
    color: rgb(255, 255, 255);
    background: rgb(27, 28, 29);
}
.chvMGF:hover, .chvMGF:active {
    background-color: rgb(221, 221, 225);
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
</style>
</head>
<body>

<div id="wrapper">
	<div class="pages__Body-sc-1xw23vo-0 dGxVjn">
		<main class="pages__Main-sc-1xw23vo-1 gulakV">
			<div class="ResetPasswordPage__Container-sc-5hwzkh-0 fKDyJz">
				<div class="sc-eerKOB inUTcF">
					<div class="sc-eilVRo QtLBl">
						<div class="sc-gHboQg bXUojH">
							<h1>새로운 비밀번호를<br>설정해주세요</h1>
							<form id="sendsend">
								<input type ="hidden" id="userId" name="userId" value='${userId}'>
								<div class="sc-kIPQKe gNPcmC ResetPasswordPage__StyledFormGroup-sc-5hwzkh-1 cExydx">
									<label class="sc-esjQYD cvzQqA">변경 비밀번호</label>
									<div class="sc-iQNlJl bdbgMM">
									<input class="sc-epnACN cNSGNe   " type="password" id="password" name="password" placeholder="내용을 입력해주세요" autocomplete="off" value="">
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
								<div class="sc-kIPQKe gNPcmC ResetPasswordPage__StyledFormGroup-sc-5hwzkh-1 cExydx">
									<label class="sc-esjQYD cvzQqA">변경 비밀번호 확인</label>
									<div class="sc-iQNlJl bdbgMM">
									<input class="sc-epnACN cNSGNe   " type="password" id="rePassword" name="rePassword" placeholder="내용을 입력해주세요" autocomplete="off" value="">
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
									<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF chvMGF ResetPasswordPage__ReserPasswordButton-sc-5hwzkh-2 kPDnkf" id="changepw" color="default" fill="false">
									<span class="sc-fjdhpX kCztpU">비밀번호 변경</span>
									</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>



<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>