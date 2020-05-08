<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>GetHobby</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
			
	$(function(){
		/* var random = "${map.ran}"; */
		
		$(document).ready(function(){
			$("h6").hide();
		});
		$("#resultData").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noconfirm").show();
				$(this).siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();
			}
		});
		
		
		$("#confirm").on("click",function(){
			var receivePhone = "${receivePhone}";
			$.ajax ({
				
				url : "/user/json/reSendSMS",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					receivePhone : receivePhone
				}),
				success : function(JSONData,status){
					$("#random").val(JSONData.ran);
				}				
			})
		});
		
		$("#closebtn").on("click",function(){
			
			var resultData = $("#resultData").val();
			var ran = "${ran}";
			var ranData = $("#random").val(); 

			if(ran == resultData || ranData == resultData){	
				if(ran == resultData && resultData != ""){
					if(opener){
					opener.$("#result").val("success");
					}
							window.close();
					
				}else if(ranData == resultData && resultData != ""){
	
					if(opener){
					opener.$("#result").val("success");
					}
							window.close();
				}else{
					$("#resultData").addClass("error");
					$("#resultData").siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
					$("#resultData").siblings(".sc-bwCtUz.bNBuwd.failconfirm").show();
				}
			}else{
				$("#resultData").addClass("error");
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.failconfirm").show();
			}
		});
		
		
	});
	
	
</script>
<style>
div {
    display: block;
}
.hbnXrv {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.hbnXrv {
    width: 50%;
}
*, ::before, ::after {
    box-sizing: border-box;
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
.gNPcmC {
    display: flex;
    flex-direction: column;
    margin: 0px 0px 16px;
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
    padding-top: 0px;
    padding-right: 16px;
    padding-bottom: 0px;
    padding-left: 16px;
    border-radius: 3px;
}
.cNSGNe:disabled {
    background-color: rgb(248, 248, 249);
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
}bgbHMA
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
.bsyJGp {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bsyJGp {
    width: 50%;
    margin-left: 50%;
}
.jjHero {
    width: 100%;
    margin-top: 32px;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
button, select {
    text-transform: none;
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
.fIJpfC {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(255, 255, 255);
    background-color: rgb(255, 146, 43);
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 40px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
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
/* .btn-info:not(:disabled):not(.disabled).active, .btn-info:not(:disabled):not(.disabled):active, .show>.btn-info.dropdown-toggle {
    color: #fff;
    background-color: rgba(205, 146, 43, 1);
    border-color: rgba(205, 146, 43, 1);
} */
.ccc{
color: #fff;
background-color: sandybrown;
}
.ccc:hover {
    color: #fff;
    background-color: rgba(255, 146, 43, 1);
    border-color: rgba(255, 146, 43, 1);
}
</style>
</head>

<body>
	
	
<div class="sc-gHboQg hbnXrv" style=" padding-right: 0px;height: 72px;width: 212px;padding-left: 35px;">
	<form>
		<input type="hidden" name="result" id="result" value="success">
		<input type="hidden" name="userId" id="userId" value="${userId}">
		<input type="hidden" name="phone"  id="phone"  value="${phone}">
		<input type="hidden" name="random" id="random" value="">			
		<div class="sc-kIPQKe gNPcmC">
			<div class="sc-iQNlJl bdbgMM" style="width: 300px;padding-right: 10px;border-right-width: 10px;margin-right: 0px;padding-top: 30px;">
			<input class="sc-epnACN cNSGNe   " type="text" id="resultData" name="resultData"  placeholder="인증번호를 적어주세요" autocomplete="off" style="float: left;width: 60%;padding-top: 0px;" ><span class="cvzQqA" style="float: left;padding-top: 10px;padding-left: 5px;"><strong id="confirm">재전송</strong></span>
				<br><br>
				<h6 class="sc-bwCtUz bNBuwd noconfirm">
				<svg width="16" height="16" viewBox="0 0 24 24">
				<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z">
				</path>
				</svg>
					<span class="sc-hrWEMg bgbHMA">인증번호 입력해주세요</span>
				</h6>
				<h6 class="sc-bwCtUz bNBuwd failconfirm">
				<svg width="16" height="16" viewBox="0 0 24 24">
				<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z">
				</path>
				</svg>
					<span class="sc-hrWEMg bgbHMA">본인인증 실패</span>
				</h6>
			</div>
		</div>
	</form>
</div>
<div class="sc-gHboQg bsyJGp CreatorProfileForm__ButtonWrapper-sc-1ldhjv-0 jjHero" style="margin-left: 80px;">
	<button type="button"  class="btn ccc" id="closebtn"  fill="true" >
	<span class="sc-fjdhpX kCztpU" >닫 기</span>
	</button>
</div>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>