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
		<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>


<script type="text/javascript">
	
			
	
	$(function(){
////////////////////모달/////////////////////////////
		
		
		
		////////////////////인증번호 입력창////////////////////////
		$("#resultData").on("blur",function(){
			if($(this).val() == "" || $(this).val() == null){
				$(this).addClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noconfirm").show();
				$(this).siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.errorconfirm").hide();
			}else{
				$(this).removeClass("error");
				$(this).siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();
				$(this).siblings(".sc-bwCtUz.bNBuwd.errorconfirm").hide();
			}
		});
		///////////////////////인증번호 닫기//////////////////////////////
		$("#closebtnnn").on("click",function(){	
			var resultData = $("#resultData").val();
			var ranData = $("#random").val(); 
			
			if(resultData == null || resultData ==""){
				$("#resultData").addClass("error");
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.noconfirm").show();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.errorconfirm").hide();
			}else if(ranData == "" || ranData == null ){
				$("#resultData").addClass("error");
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.errorconfirm").show();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.failconfirm").hide();		
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
			}else if(ranData != resultData){
				$("#resultData").addClass("error");
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.noconfirm").hide();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.failconfirm").show();
				$("#resultData").siblings(".sc-bwCtUz.bNBuwd.errorconfirm").hide();
			}else{
					Swal.fire({
						  icon: 'success',
						  title: '인증완료',
						  showConfirmButton: false,
						  timer: 800
						})
				$("#resultconfirm").val("success");
				$(".Dialog__Overlay-r2swbb-0.hupVkE.abc").attr("style","display : none");
			}
			
			
		});
			
	/////////////////////////인증번호 전송/////////////////////////////////////
	
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
		
		
	///////////////////////모달창 실행//////////////////////////////////////	
		 $("#phoneconfirm").on("click",function(){	
			
			var phoneNb = $("#phone").val();
			if(phoneNb == null || phoneNb ==""){
				Swal.fire({
					  icon: 'error',
					  title: '휴대폰번호를 입력 해주세요',
					  showConfirmButton: false,
					  timer: 800
					})
			}else{							
				$.ajax ({
					
					url : "/user/json/reSendSMS",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						receivePhone : phoneNb
					}),
					success : function(JSONData,status){
						Swal.fire({
							  icon: 'success',
							  title: '인증번호 발송',
							  showConfirmButton: false,
							  timer: 800
							})
						$(".Dialog__Overlay-r2swbb-0.hupVkE.abc").attr("style","block");
						$(".Dialog__DialogContainer-r2swbb-1.jOWGnl.abc").attr("style","block");
						$("#random").val(JSONData.ran);
					}				
				})
			}
		});
	
		 $("#exit").on("click",function(){	
			 $(".Dialog__Overlay-r2swbb-0.hupVkE.abc").attr("style","display : none");
			});
	
	
	
	//////////////////////////////////////////
		/* $(".sc-jTzLTM.flMyeK.sc-kEYyzF.cLtGPj.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").on("click",function(){
			window.open('/user/changeUserCreator', '_self', '');
			window.close();
		});	 */
		 
		$("#sendcreator").on("click",function(){
			$("#aaabbb").removeAttr("name");
			$("#aaabbb").attr("name","");
					if($("#resultconfirm").val() == 'success'){
						Swal.fire({
							  icon: 'success',
							  title: '크리에이터 지원 완료',
							  showConfirmButton: false,
							  timer: 800
							}).then((result) => {
								$("#aaabbb").removeAttr("name").attr("method","post").attr("action","/user/changeUserCreator").submit();
							})
												
					}else{
							Swal.fire({
								  icon: 'warning',
								  title: '휴대폰 인증을 진행해주세요',
								  showConfirmButton: true,
								  timer: 1200
								})
					}
					
		});		
		
		$(document).ready(function(){			
			$("h6").hide();
			
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
		
	});
	
	
	
</script>
</head>
<style>
.dGxVjn {
    position: relative;
}
article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
    display: block;
}

*, ::before, ::after {
    box-sizing: border-box;
}
.gOdssr {
    background-color: rgb(255, 255, 255);
    min-height: calc(100vh);
}
.inUTcFFF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcFFF {
    max-width: 960px;
}
.jjHero {
	width: 100%;
}
@media (min-width: 992px){
	.hFRTPZ {
	    height: 100%;
	}
	.bsyJGp {
		margin-left: 50%;
	}
	.jjHero {
	    margin-top: 32px;   
	}
	.fIJpfC {
    	width: 100%;
    }
	.lagYPo {
	    min-height: calc(100vh);
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    padding: 32px 0px;
	}
	.hbnXrv {
	    width: 50%;
	}
}
@media (max-width: 991px){
	.hFRTPZ {
	    min-height: calc(100vh - 112px);
	    display: flex;
    	flex-direction: column;
	}
	.bsyJGp {
		margin-left: 0%;
	}
	.jjHero {
	    margin-top: auto;   
	}
	.fIJpfC {
    	width: 100%;
    }
	.hbnXrv {
	    width: 100%;
	}
	.lagYPo {
	    min-height: calc(100vh - 112px);
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: auto;
	    padding: 72px 0px 32px 0px;
	    
	}
}

.temscy {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: flex-start;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}

.gNXHJx {
    position: relative;
    height: 20px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.gNXHJx {
    width: 100%;
}
.diAPvf {
    font-size: 14px;
    font-weight: bold;
    color: rgb(253, 126, 20);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h2 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 32px;
    font-size: 28px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.dudrbp {
    font-size: 32px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 40px;
    letter-spacing: -0.6px;
    margin: 0px;
}
.cdaVie {
    margin-bottom: 8px;
}
.ixTQrp {
    font-size: 16px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 24px;
    letter-spacing: -0.2px;
    margin: 0px 0px 24px 0px;
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
.flMyeK.disabled {
    cursor: not-allowed;
}
.fIJpfC.disabled {
    color: rgb(255, 255, 255);
    background-color: rgb(255, 232, 204);
}
 .kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
} 
*, ::before, ::after {
    box-sizing: border-box;
}
.hupVkE {
    background-color: rgba(0, 0, 0, 0.8);
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    bottom: 0px;
    display: block;
    z-index: 3000;
    opacity: 1.1;
    animation: 0.25s ease 0s 1 normal none running openOverlay;
}
.jOWGnlll {
    position: fixed;
    overflow-y: auto;
    z-index: 3001;
    box-shadow: rgba(0, 0, 0, 0.08) 0px 3px 6px 0px, rgba(0, 0, 0, 0.12) 0px 8px 16px 0px;
    padding: 24px;
    background: rgb(255, 255, 255);
}
.jOWGnlll {
    top: 50%;
    left: 50%;
    width: 310px;
    transform: translate(-50%, -50%);
    max-height: 95%;
    animation: 0.25s ease 0s 1 normal none running openModal;
    padding: 25px 20px 20px;
    padding-left: 25px;
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
.bfIgvr {
    font-size: 24px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 32px;
    letter-spacing: -0.4px;
    display: flex;
    margin: 0px 0px 8px;
}
.buRgcP {
    -webkit-box-flex: 1;
    flex-grow: 1;
}
.hwZSXH {
    width: 24px;
    height: 24px;
    cursor: pointer;
    flex: 0 0 auto;
}
svg[Attributes Style] {
    width: 24;
    height: 24;
}
/* :not(svg) {
    transform-origin: 0px 0px;
} */
path[Attributes Style] {
    d: path("M 17.59 5 L 12 10.59 L 6.41 5 L 5 6.41 L 10.59 12 L 5 17.59 L 6.41 19 L 12 13.41 L 17.59 19 L 19 17.59 L 13.41 12 L 19 6.41 Z");
}
use[Attributes Style] {
    fill: rgb(168, 174, 179);
    fill-rule: evenodd;
}
path[Attributes Style] {
    d: path("M 17.59 5 L 12 10.59 L 6.41 5 L 5 6.41 L 10.59 12 L 5 17.59 L 6.41 19 L 12 13.41 L 17.59 19 L 19 17.59 L 13.41 12 L 19 6.41 Z");
}
.bgUEhx {
    font-size: 14px;
    font-weight: normal;
    color: rgb(97, 101, 104);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.bhsFBo {
    margin-top: 40px;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h4 {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 21px;
    font-size: 18px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.cZzCCw {
    font-size: 20px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 28px;
    letter-spacing: -0.3px;
    margin: 0px;
}
.icaGGS {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    margin: 8px 0px 4px;
}
.gSDjRJ {
    display: block;
}
textarea {
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
    -webkit-appearance: textarea;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
    padding: 2px;
}
textarea {
    resize: vertical;
    overflow: auto;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.jvXgFF {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    background-color: white;
    width: 100%;
    height: 104px;
    box-sizing: border-box;
    margin: 0px;
    border-radius: 1px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(205, 209, 212);
    border-image: initial;
    padding: 12px 16px;
}
.bqVawJ {
    display: flex;
    flex-direction: row;
    margin-top: 16px;
    flex: 1 1 0%;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.kdHuLt {
    display: flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    margin-left: 8px;
}
.jGfUCZ {
    font-size: 14px;
    font-weight: normal;
    color: rgb(253, 126, 20);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
path[Attributes Style] {
    fill: rgb(253, 126, 20);
    fill-rule: evenodd;
    d: path("M 8.5 18.5 l 6 -6.5 l -6 -6.5 L 10 4 l 7.5 8 l -7.5 8 Z");
}
.ldmqLR {
    margin-top: 63px;
}
.kghFfp {
    font-size: 16px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 24px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.cLtGPj {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(62, 64, 66);
    background-color: rgb(248, 248, 249);
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 40px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
.gAbriU {
    margin-top: 8px;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.nono{
	background-color: #f3b368;
}
.swal2-container {
   z-index : 10000;
}

/* /* /* /* /* 새로운 모달~ */ 

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
<body>
 <jsp:include page="/common/header.jsp"/>
<input type="hidden" id="role" value="${sessionScope.user.role}"/>
<div id="root">
	<div id="wrapper">
		<div class="pages_Body-sc-1xw23vo-0 dGxVjn">
		
			<main class="pages__Main-sc-1xw23vo-1 gulakV">
				<div class="CreatorProfilePage__Container-sc-174yg5t-0 gOdssr">
					<div class="sc-eerKOB inUTcFFF CreatorProfilePage__StyledGrid-sc-174yg5t-1 lagYPo">
						<div class="sc-eilVRo CreatorProfilePage__StyledRow-sc-174yg5t-2 hFRTPZ temscy" style="padding: 0px 24px; margin-top:24px;">
							<div class="sc-gHboQg gNXHJx">
								<div color="#fd7e14" font-weight="bold" class="sc-bdVaJa diAPvf">Welcome
								</div>
							</div>
							<div class="sc-gHboQg hbnXrv">
								<h2 color="#3e4042" font-weight="bold" class="sc-bdVaJa dudrbp CreatorProfilePage__Title-sc-174yg5t-3 cdaVie">크리에이터님,<br>반갑습니다 :)
								</h2>
								<div color="#3e4042" class="sc-bdVaJa ixTQrp CreatorProfilePage__Content-sc-174yg5t-4 hJTWRq">클래스 수요 조사 페이지를 작성하기 전,<br>크리에이터님의 기본적인 정보를 알려주세요.
								</div>
							</div>
							<div class="sc-gHboQg hbnXrv">
								<form id="aaabbb" name="">
								<input type="hidden" name="result" id="result" value="">
									<div class="sc-kIPQKe gNPcmC">
										<label class="sc-esjQYD cvzQqA">이메일주소
										</label>
										<div class="sc-iQNlJl bdbgMM">
										<input class="sc-epnACN cNSGNe   " type="text" id="userId" name="userId"  readonly="readonly" placeholder="example@example.net" autocomplete="off" value="${user.userId}" >
										</div>
									</div>
									<div class="sc-kIPQKe gNPcmC">
										<label class="sc-esjQYD cvzQqA" style="float: left">휴대폰번호<span style="float:  right;"><strong style="color: red;cursor:pointer;" id="phoneconfirm">번호인증</strong></span>
										</label>																			
										<div class="sc-iQNlJl bdbgMM">
										<input class="sc-epnACN cNSGNe " type="text" id="phone" name="phone" placeholder="-를 제외한 휴대폰 번호를 입력해주세요" autocomplete="off" value="">
										<h6 class="sc-bwCtUz bNBuwd nophone">
										<svg width="16" height="16" viewBox="0 0 24 24">
										<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z">
										</path>
										</svg>
											<span class="sc-hrWEMg bgbHMA">필수 입력입니다.</span>
										</h6>
										<h6  class="sc-bwCtUz bNBuwd nohyphen"> 
													<svg width="16" height="16" viewBox="0 0 24 24">
														<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"></path>
													</svg>
													<span class="sc-hrWEMg bgbHMA">-를 제외 입력해주세요</span>
												</h6>
									</div>
									</div>
								</form>
							</div>
							<div class="sc-gHboQg bsyJGp CreatorProfileForm__ButtonWrapper-sc-1ldhjv-0 jjHero">
							<button  type="button"  class="sc-jTzLTM flMyeK sc-kEYyzF fIJpfC " id="sendcreator" color="orange" fill="true">
							<span class="sc-fjdhpX kCztpU">크리에이터로 시작하기</span>							
							</button>
							</div>
						</div>
					</div>
					
							<!-- Modal -->
<!-- <div id="modalopen"> -->
 <div class="Dialog__Overlay-r2swbb-0 hupVkE abc" style="display : none;">
<div class="Dialog__DialogContainer-r2swbb-1 jOWGnlll abc" style="block;padding-right: 50px;padding-left: 40px;" >


<form>
<input type="hidden" name="resultconfirm" id="resultconfirm" value="">
		<input type="hidden" name="userId" id="userId" value="${userId}">
		<input type="hidden" name="phone"  id="phone"  value="${phone}">
		<input type="hidden" name="random" id="random" value="">			
		<div class="sc-kIPQKe gNPcmC" >
			<div class="sc-iQNlJl bdbgMM" >
			<div id="exit" class="Dialog__CloseButton-r2swbb-2 hwZSXH" style="margin-right: 0px;margin-left: 180px;">
			<svg  width="24" height="24" viewBox="0 5 15 24">
			<defs>
			<path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"></path>
			</defs>
			<use fill="#a8aeb3" fill-rule="evenodd" xlink:href="#close_svg__a">
			</use>
			</svg>
		</div>
		<div style="width:100%; display:flex;">
			<input class="sc-epnACN cNSGNe   " type="text" id="resultData" name="resultData"  placeholder="인증번호를 적어주세요" autocomplete="off" style="float: left;width: 168px;padding-top: 0px;padding-right: 0px;" >
			
			<span class="cvzQqA" style="float:right; padding-top: 10px;padding-left: 5px;"><strong id="confirm" style="cursor: pointer;">재전송</strong></span>
			</div>
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
				<h6 class="sc-bwCtUz bNBuwd errorconfirm">
				<svg width="16" height="16" viewBox="0 0 24 24">
				<path fill="#3E4042" fill-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z">
				</path>
				</svg>
					<span class="sc-hrWEMg bgbHMA">인증번호를 요청하세요</span>
				</h6>
			</div>
		</div>
</form>
<div class="sc-gHboQg bsyJGp CreatorProfileForm__ButtonWrapper-sc-1ldhjv-0 jjHero" style="margin-left: 80px;padding-right: 0px;padding-left: 0px;">
	<button type="button"  class="btn ccc" id="closebtnnn"  fill="true" >
	<span class="sc-fjdhpX kCztpU" >닫 기</span>
	</button>
	</div>
</div>
</div>
<!-- Modal -->
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