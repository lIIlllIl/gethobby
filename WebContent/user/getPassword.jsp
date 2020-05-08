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
<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
<!-- header CSS -->
<link rel="stylesheet" href="/resources/css/commonHeader.css" />
<!-- header js -->
<script src="/resources/javascript/commonHeader.js"></script>
<script type="text/javascript">
	
			
	
		
	/////////////////////// 전송 ////////////
	
	$(function(){
		
		$("button[name='sendbutton']").on("click",function(){
			
			if($("#end").val() == "fail"){
				Swal.fire({
					  icon: 'error',
					  title: '해당 아이디가 없습니다',
					  showConfirmButton: 'ture',
					  timer: 1300
					})
				$("#userId").focus();
				return
			}else if($("#end").val() == "success"){		
			
			var receiveMail = $("#userId").val();
			
			$.ajax ({
				
				url : "/user/json/mailSend",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					receiveMail : receiveMail
				}),
				success : function(JSONData,status){
					Swal.fire({
						  icon: 'success',
						  title: '메일 전송하였습니다',
						  showConfirmButton: 'ture',
						  timer: 1300
						})
				}			
			 })
			}
		});	
		
	///////<h6> 숨기기///////////
		$(document).ready(function(){			
			$("h6").hide();
		}); 
/////////////////validation check/////////////	
		var checkUserId = null; 
		$("#userId").on("blur",function(){
			
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.check").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.cid").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nomail").show();
			}else if($(this).val().indexOf('@') < 1 || $(this).val().indexOf('.') == -1){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.check").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.nomail").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.cid").show();
			}else{
				checkUserId = $("#userId").val();
				
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.nomail").hide();
				
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
							$("#userId").addClass("error");
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.cid").hide();
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.check").show();
							$("#end").val("fail");
						}else{
							$("#userId").removeClass("error");
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.cid").hide();
							$("#userId").siblings(".sc-bwCtUz.bNBuwd.check").hide();
							$("#end").val("success");
						}
					}
				})
			}
		});
	});
	
	
	
	
	
	
</script>
<style >
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
body {
    display: block;
    margin: 8px;
}
html {
    line-height: 1.15;
    text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
.fKDyJz {
    background-color: white;
    padding: 64px 0px 128px;
}
/* *, ::before, ::after {
    box-sizing: border-box;
} */
::selection {
    background-color: rgb(255, 89, 70) !important;
    color: rgb(255, 255, 255) !important;
}
@media (min-width: 1024px)
.inUTcF {
    max-width: 960px;
}
.inUTcF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcF {
    margin-left: 24px;
    margin-right: 24px;
}


.QtLBl {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: center; //
    align-content: stretch;
    margin-right: -12px;
}




div {
    display: block;
}
.bXUojH {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXUojH {
    padding-right: 4px;
    padding-left: 4px;
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

svg[Attributes Style] {
    width: 16;
    height: 16;
}
svg:not(:root) {
    overflow: hidden;
}
/* :not(svg) {
    transform-origin: 0px 0px;
} */
path[Attributes Style] {
    fill: rgb(62, 64, 66);
    fill-rule: evenodd;
    d: path("M 21.872 19.51 A 1 1 0 0 1 21 21 H 3 a 1 1 0 0 1 -0.872 -1.49 l 9 -16 a 1 1 0 0 1 1.744 0 l 9 16 Z M 13 15 V 9 h -2 v 6 h 2 Z m 0 3 v -2 h -2 v 2 h 2 Z");
}
.bNBuwd path {
    fill: rgb(255, 82, 82);
}
.bNBuwd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(255, 82, 82);
    margin: 2px 0px;
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
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
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
button {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: center;
    cursor: default;
    font: 400 13.3333px Arial;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.chvMGF:hover, .chvMGF:active {
    background-color: rgb(221, 221, 225);
}
@media (min-width: 992px){
	.QtLBl {
	    margin-right: -4px;
	    margin-left: 800px;   
	    width: 1200px;
	}
	.bXUojH {
	    width: 35%;
	}
}
@media (max-width: 991px){
	.QtLBl {
	    margin-right: -4px;
	    margin-left: auto;   
	    width: auto;
	}
	.bXUojH {
	    width: 100%;
	}
}
</style>
</head>
<body>	
	 <jsp:include page="/common/header.jsp"/>
	<main class="pages__Main-sc-1xw23vo-1 gulakV">
		<div class="ResetPasswordPage__Container-sc-5hwzkh-0 fKDyJz">
			<div class="sc-eerKOB inUTcF">
				<div class="sc-eilVRo QtLBl" style="margin-top: 60px;">
					<div class="sc-gHboQg bXUojH" style="margin:auto;">
						<h1 style="margin-bottom: 10px;">새로운 비밀번호를<br>설정해주세요</h1>
							<div class="sc-bdVaJa hBKkTB ResetPasswordPage__ResetPasswordMessage-sc-5hwzkh-3 ljnjdo">아이디(이메일)를 입력하면 암호를 재설정할 수 있는 링크를 아이디(이메일)로 보내드릴게요.
							</div>
							<form>
								<input type="hidden" id="end" name="end">
								<div class="sc-kIPQKe gNPcmC ResetPasswordPage__StyledFormGroup-sc-5hwzkh-1 cExydx">
								<label class="sc-esjQYD cvzQqA" style="margin-top: 25px;">이메일</label>
									<div class="sc-iQNlJl bdbgMM">
										<input class="sc-epnACN cNSGNe   " type="email" name="userId" id="userId" placeholder="example@naver.com" autocomplete="off" value="">
											<h6 class="sc-bwCtUz bNBuwd nomail">
											<svg width="16" height="16" viewBox="0 0 24 24">
												<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
											</svg>
											<span class="sc-hrWEMg bgbHMA">필수 입력입니다.</span>
											</h6>
											<h6  class="sc-bwCtUz bNBuwd cid"> 
												<svg width="16" height="16" viewBox="0 0 24 24">
													<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
												</svg>
												<span class="sc-hrWEMg bgbHMA">이메일 형식으로 작성바랍니다</span>
											</h6>
											<h6  class="sc-bwCtUz bNBuwd check"> 
												<svg width="16" height="16" viewBox="0 0 24 24">
													<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
												</svg>
												<span class="sc-hrWEMg bgbHMA">해당 아이디가 없습니다</span>
											</h6>
									</div>
								</div>
								<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF chvMGF ResetPasswordPage__ReserPasswordButton-sc-5hwzkh-2 kPDnkf" name="sendbutton" color="default" fill="false">
								<span class="sc-fjdhpX kCztpU">인증 메일 전송하기</span>
								</button>
							</form>
					</div>
				</div>
			</div>
		</div>
	</main>
<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>