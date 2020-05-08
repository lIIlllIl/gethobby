<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
<script type="text/javascript">
	$(function(){
		
	////////////////////모달///////
		
		$("#closebtn").on("click",function(){	
			window.open('/', '_self', '');
			window.close();
		});
		 $("#modalready").on("click",function(){			
			$(".Dialog__Overlay-r2swbb-0.hupVkE").attr("style","block");
			$(".Dialog__DialogContainer-r2swbb-1.jOWGnl").attr("style","block");
		}); 
		$(".sc-jTzLTM.flMyeK.sc-kEYyzF.cLtGPj.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").on("click",function(){
			window.open('/', '_self', '');
			window.close();
		});	
		
		
		 $(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").on("click",function(){
			
					
					Swal.fire({
						  title: '정말 탈퇴 하시겠습니까?',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '네, 탈퇴 하겠습니다',
						  cancelButtonText: '아니요'
						}).then((result) => {
						  if (result.value) {
						    Swal.fire({
					    	  icon: 'success',
							  title: '회원 탈퇴 완료',
							  showConfirmButton: false,
							  timer : 800
						    }).then((result) => {
								$("#deleteusersend").attr("method","post").attr("action","/user/deleteUser").submit();
								
							})
						  }
						})
		  	
			
		});
		 
		 $(document).ready(function(){
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").attr("disabled",true);
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").addClass("nono"); 
		 });
		 $("#reasonCode").on("change",function(){			
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").attr("disabled",false);
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").removeClass("nono"); 			 
			 
		 });
	});
</script>
<style>
.eHZNoL {
    position: relative;
    margin: 0px 32px;
}
.eHZNoL {
    padding-bottom: 72px;
    margin: 0px;
    overflow: hidden;
}
.eHZNoL::before {
    position: absolute;
    content: "";
    display: block;
    background-color: rgb(27, 28, 29);
    width: calc(100% + 64px);
    height: 100%;
    top: 0px;
    left: -32px;
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
.cPBtQc {
    padding: 8px 0px 32px;
}


.bXMAOt {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXMAOt {
    width: 100%;
    padding-right: 4px;
    padding-left: 4px;
}
.bXMAOt {
    width: 100%;
}
.ekuQEe {
    margin-top: 24px;
}
.fORXCH {
    font-size: 14px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
a {
    color: inherit;
    text-decoration: none;
}
.hGKcXL {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(133, 138, 141);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.liAQRm {
    color: rgb(133, 138, 141);
    flex: 1 1 0%;
}
.etHvQm {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.bXMAOt {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}

.fORXCH {
    font-size: 14px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.hGKcXL {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.hGKcXL:hover {
    text-decoration: none;
}
.liAQRm {
    color: rgb(133, 138, 141);
    flex: 1 1 0%;
}
.etHvQm {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.htmEMd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 8px;
}
.dVjooD {
    font-size: 11px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.enPSFa {
    color: rgb(133, 138, 141);
    margin-left: 8px;
}
.fsfjPC {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 0px;
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
.gQbfLi {
    width: auto;
    display: inline-flex;
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
.glrvQb {
    background-color: transparent !important;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(97, 101, 104);
    border-image: initial;
    flex: 1 1 0%;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.jIpzzf {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 0px;
    width: 18px;
    height: 18px;
    margin-right: 4px;
    flex: 0 0 auto;
}
svg[Attributes Style] {
    width: 18;
    height: 18;
}
path[Attributes Style] {
    fill: rgb(62, 64, 66);
    fill-rule: evenodd;
    d: path("M 12 4 c -4.97 0 -9 3.185 -9 7.115 c 0 2.557 1.707 4.8 4.27 6.054 c -0.188 0.702 -0.682 2.545 -0.78 2.94 c -0.123 0.49 0.178 0.483 0.376 0.351 c 0.155 -0.103 2.466 -1.675 3.464 -2.353 c 0.541 0.08 1.1 0.123 1.67 0.123 c 4.97 0 9 -3.186 9 -7.115 C 21 7.185 16.97 4 12 4");
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.itsnFS {
    font-size: 14px;
    font-weight: normal;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.glrvQb .Footer__Title-lv6cz2-4 {
    display: inline-block;
}
.jmEzjg {
    margin-top: 32px;
}
.foMYrC {
    font-size: 11px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.cMfRMs {
    margin-bottom: 4px;
}
.cLkRRa {
    overflow: hidden;
}
.bsSxNz {
    margin-left: -24px;
}
.gPalxu {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.gPalxu {
    width: 66.6667%;
}
.hMCBZf {
    margin-top: 24px;
}
.dVjooD {
    font-size: 11px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.iIxncl {
    color: rgb(133, 138, 141);
    margin-left: 0px;
}

/* /* /* /* /* /* /* /* /* /* /* /* /* /* /* modal */ 
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
.jOWGnl {
    position: fixed;
    overflow-y: auto;
    z-index: 3001;
    box-shadow: rgba(0, 0, 0, 0.08) 0px 3px 6px 0px, rgba(0, 0, 0, 0.12) 0px 8px 16px 0px;
    padding: 24px;
    background: rgb(255, 255, 255);
}
.jOWGnl {
    top: 50%;
    left: 50%;
    width: 480px;
    transform: translate(-50%, -50.1%);
    max-height: 95%;
    animation: 0.25s ease 0s 1 normal none running openModal;
    padding: 32px 24px;
}
h1.Dialog__DialogTitle-r2swbb-3.bfIgvr {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h1.Dialog__DialogTitle-r2swbb-3.bfIgvr {
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
h4.sc-bdVaJa.cZzCCw {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h4.sc-bdVaJa.cZzCCw {
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

.swal2-container {
   z-index : 10000;
}
.fIJpfD {
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
.fIJpfC:hover {
	filter: hue-rotate(-12deg) brightness(97%);
}
.cNzNJq:hover {
	filter: hue-rotate(-12deg) brightness(97%);
}
.nono{
	background-color: #f3b368;
}
@media (max-width:992px){
	.QtLBl {
		display: block;
	    flex-wrap: wrap;
	    -webkit-box-pack: start;
	    justify-content: flex-start;
	    align-content: stretch;
	    margin-left: auto;
	    margin-right: auto;
	    padding: 0px 0px;
	    max-width: 1040px;
	}
	.bXMAOt {
	    width: 100%;
	}
}
@media (min-width:991px){
	.QtLBl {
	    display: flex;
	    flex-wrap: wrap;
	    -webkit-box-pack: start;
	    justify-content: flex-start;
	    align-content: stretch;
	    margin-left: auto;
	    margin-right: auto;
	    padding: 0px 42px;
	    max-width: 1040px;
	}
	.bXMAOt {
	    width: 33.3%;
	}
}


</style>
<script type="text/javascript">
</script>
</head>
<body>
<!--로그인 후-->
<footer>
	<input type="hidden" name="role" value="${sessionScope.user.role}">
	<div class="sc-eerKOB zImje Footer__FooterContainer-lv6cz2-3 eHZNoL">
		<div class="sc-eerKOB inUTcF Footer__StyledGrid-lv6cz2-2 cPBtQc">
			<div class="sc-eilVRo QtLBl">
				<div class="sc-gHboQg bXMAOt">
					<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
					<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">(주)GET취미
					</div>						
						<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/index.jsp">
					<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">홈</div>
					</a>
					<a href="https://101.gg/recruit-07" target="_blank" rel="noopener noreferrer" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
						<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">채용
						</div>
					</a>
						<c:if test="${!empty sessionScope.user.role && sessionScope.user.role != '2'}">
						<div id="modalready" class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm" style="padding-top: 10px;cursor: pointer;">회원탈퇴
						</div>	
						</c:if>
					</div>
				</div>
			<c:if test="${sessionScope.user.role eq 0 || sessionScope.user.role eq 1 || sessionScope.user.role eq 2 }">
			<div class="sc-gHboQg bXMAOt">
			<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
			<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">크리에이터
			</div>
			<c:if test="${sessionScope.user.role == '1' || sessionScope.user.role == '2' }">
			<a href="/user/listNotice" target="" rel="" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">공지사항
			</div>
			</a>
			</c:if>
			<c:if test="${sessionScope.user.role == '0'}">
			<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/user/changeUserCreator">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">지원하기
			</div>
			</a>
			</c:if>
			<c:if test="${sessionScope.user.role == '1'}">
			<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/creators">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">크리에이터 센터
			</div>
			</a>
			</c:if>					
			</div>
			</div>
			</c:if>
			<div class="sc-gHboQg bXMAOt" style="margin-top: 23px;">
			<div class="Footer__FlexContainer-lv6cz2-0 htmEMd">
				<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">고객센터
				</div>
			</div>
				<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 enPSFa">오전 9시 30분 ~ 오후 6시 (주말, 공휴일 제외)
				</div>
				
			</div>
						
			</div>
		<div class="Footer__InfoContainer-lv6cz2-10 jmEzjg">
		<div class="sc-eilVRo QtLBl" style="width: 100%;">		
		<div class="sc-gHboQg gPalxu" style="width: 100%;">
		<div class="sc-fcdeBU hMCBZf" style="width: 100%;">
		<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 iIxncl" style="width: 100%;">(주)GET취미 | 대표 감자면 | 개인정보보호 책임자 감자면 | 서울 강남구 테헤란로5길 11 YBM빌딩 2층 | 사업자등록번호 : 000-55-88771 | <br/>(주)GET취미는 상품,거래정보 및 거래에 대하여 책임을 지지 않습니다.
		</div>
		</div>
		</div>
		</div>
		</div>			
		</div>
	</div>
	<!-- Modal -->
<div class="Dialog__Overlay-r2swbb-0 hupVkE" style="display : none;">
	<div class="Dialog__DialogContainer-r2swbb-1 jOWGnl" style="display : none;">
	
	<h1 class="Dialog__DialogTitle-r2swbb-3 bfIgvr">
	<div class="Dialog__Title-r2swbb-4 buRgcP">정말 GET취미를 떠나실 건가요?
	</div>
	<div id="closebtn" class="Dialog__CloseButton-r2swbb-2 hwZSXH">
		<svg  width="24" height="24" viewBox="0 0 24 24">
		<defs>
		<path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"></path>
		</defs>
		<use fill="#a8aeb3" fill-rule="evenodd" xlink:href="#close_svg__a">
		</use>
		</svg>
	</div>
	</h1>
		<form id="deleteusersend" name="deleteusersend" >
			<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
			<div color="#616568" class="sc-bdVaJa bgUEhx">계정을 삭제하시면 기존 수강권, 클래스 기록 등
			</div>
			<div color="#616568" class="sc-bdVaJa bgUEhx">모든 정보가 삭제됩니다.
			</div>
			<div class="SignOutForm__SignOutBodyContainer-sc-1c94aj0-1 bhsFBo">
				<h4 class="sc-bdVaJa cZzCCw">떠나시기 전에</h4>
				<div class="SignOutForm__ReasonText-sc-1c94aj0-3 icaGGS">탈퇴사유를 선택해 주세요
				</div>
				<div class="form-group cvzQqA">
					<select id="reasonCode" class="form-control cvzQqA" name="reasonCode">
						<option  selected disabled>탈퇴 사유</option>
						<option  value="0">더 이상 사용하지 않음</option>
						<option  value="1">아이디 변경 , 재가입 하기 위함</option>
						<option  value="2">유용한 정보가 없음</option>
						<option value="3">개인정보 유출 우려</option>
					</select>
				</div>			
			</div>
			<div class="SignOutForm__SignOutFooterContainer-sc-1c94aj0-2 ldmqLR">
				<div font-weight="bold" color="#3e4042" class="sc-bdVaJa kghFfp">계정을 삭제하시겠어요?
				</div>
				<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF cLtGPj SignOutForm__StyledButton-sc-1c94aj0-6 gAbriU" color="default" fill="true">
				<span class="sc-fjdhpX kCztpU">GET취미 계속 사용하기
				</span>
				</button>
				<button type="button"  class="sc-jTzLTM flMyeK sc-kEYyzF fIJpfD SignOutForm__StyledButton-sc-1c94aj0-6 gAbriU" color="orange" fill="true">
				<span class="sc-fjdhpX kCztpU">계정 삭제하기
				</span>
				</button>
			</div>
		</form>
	</div>
</div>
	
</footer>

</body>
</html>
