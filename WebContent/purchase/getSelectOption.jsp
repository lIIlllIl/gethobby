<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>GetHobby</title>
<%-- //2020-02-24 Git Commit --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>		
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/purchase.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <!-- sweetalert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
  <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">

    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/commonHeader.css">
    <script src="/resources/javascript/commonHeader.js"></script>
    
  <style>
  .content-wrapper {
  	padding: 0px 24px 24px 24px;
  }
  	@media (max-width: 660px) {
  	
  		.component-option-div {
	  		width: 100%;
	  		height: auto;
	  		padding: 0px;
	  		background-color: rgb(255, 255, 255);
	  		margin: auto;
  		}
  		.gso-hea-nav {
  			position: relative;
  			width: 100%;
  			margin-bottom: 24px;
  		}
		footer {
  			margin-top:20px; 
  			padding:0px;
  			width: 100%;
  		}
  	}

	@media (min-width: 661px) {
	
		.component-option-div {
	  		width: 640px;
	  		height: 708px;
	  		padding: 0px;
	  		background-color: rgb(255, 255, 255);
	  		margin: auto;		
  		}
  		.gso-hea-nav {
  			position: relative;
  			width: 100%;
  			margin-bottom: 24px;
  		}
  		footer {
  			margin-top:20px; 
  			padding:0px;
  		}
  		
	}
  	.free-delivery-info-div {
  		width: 100%;
  		height: 76px;
  		padding: 16px;
  		margin: 0px 0px 16px;
  		background-color: rgb(248, 248, 249);
  	}
  	.set-select-div {
  		width: 100%;
  		padding: 20px;
  	}
  	.single-select-div {
  		width: 100%;
  		padding: 20px;
  	}
  	.set-select-title {
  		font-size: 18px;
  		color: rgb(62, 64, 66);
  		line-height: 24px;
  		letter-spacing: -0.01em;
  		display: flex;
  		font-weight: bold;
    	margin: 0px 0px 12px;
    	padding: 0px;
  	}
  	.all-free-delivery-title {
  		font-size: 14px;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    font-weight: bold;
	    display: inline-flex;
	    -webkit-box-align: center;
	    align-items: center;
	    margin: 0px 0px 8px;
  	}
  	.all-free-delivery-info {
  		font-size: 11px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 16px;
	    letter-spacing: normal;
	    margin: 0px;
  	}
  	.select-page-title {
  		font-size: 24px;
	    font-weight: bold;
	    color: rgb(62, 64, 66);
	    line-height: 32px;
	    letter-spacing: -0.4px;
	    margin: 0px 0px 16px;
	    padding: 0px;
  	}
  	.select-div-up-box {
  		min-width: 20px;
	    height: 20px;
	    display: inline-flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    background-color: rgb(243, 51, 64);
	    box-sizing: border-box;
	    border-radius: 3px;
	    flex: 0 0 auto;
	    padding: 0px 6px;
	    margin-right: 4px;
   		margin-bottom: 8px;
  	}
  	::selection {
	    background-color: rgb(255, 89, 70) !important;
	    color: rgb(255, 255, 255) !important;
	}
	.select-div-up-content {
		font-size: 9px;
	    letter-spacing: normal;
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    font-weight: bold;
	    line-height: 1;
	    color: rgb(255, 255, 255);
	    margin: 0px;
	}
	.thisisgood {
		background-color: rgb(255, 146, 43);
	}
	.box-shadow {
		box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;
	    margin-bottom: 16px;
	    position: relative;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.mini-kit-info-div {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    position: relative;
	    padding-left: 22px;
	    margin: 0px 0px 8px;
	}
	.show-kit-span {
		color: rgb(255, 146, 43);
	    font-size: 11px;
	    font-weight: 500;
	    line-height: 16px;
	    letter-spacing: normal;
	}
	.pretty-blank-box {
		width: initial;
    	margin: 16px -20px 12px;
	}
	.mini-sale-percent-span {
		margin-left: 4px;
	    font-weight: 600;
	    color: rgb(252, 61, 70);
	    margin-right: 4px;
	    font-size: 11px;
	    line-height: 16px;
	    letter-spacing: normal;
	    padding: 0px;
	}
	.mini-price-span {
		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    margin: 2px 0px 0px;
	    padding: 0px;
	}
	.mini-price-info-div {
		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    display: flex;
	    color: rgb(168, 174, 179);
	    margin: 2px 0px 0px;
	}
	.mini-lesson-info-div {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    position: relative;
	    padding-left: 22px;
	    margin: 0px 0px 8px;
	}
	.mini-cute-svg {
		position: absolute;
	    top: 2px;
	    left: 0px;
	    overflow: hidden;
	}
	.select-difficult-price-div {
		display: flex;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    align-items: flex-end;
	}
	.big-sale-percent-div {
	
	}
	.iamstrong {
		font-size: 20px;
	    font-weight: bold;
	    line-height: 28px;
	    letter-spacing: -0.3px;
	    color: rgb(252, 61, 70);
	    margin: 0px;
	}
	.mini-difficult-price-div {
		text-align: right;
    	flex: 1 1 auto;
	}
	.mini-sale-before{
		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    text-decoration-line: line-through;
	    margin: 0px 6px 0px 0px;
	}
	.mini-sale-after{
		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    margin: 0px;
	}
	.ifsplitmoney {
		font-size: 11px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 16px;
	    letter-spacing: normal;
	    margin: 0px 6px 0px 0px;
	}
	.iamstrongfinal {
		font-size: 16px;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    letter-spacing: -0.2px;
	    font-weight: bold;
	    margin: 0px;
	}
	
	
	.payment-top-child-div {
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    padding: 0px;
	    height: 32px;
	}
	.shield-yellow-span {
		font-size: 14px;
	    line-height: 24px;
	    color: rgb(255, 169, 77);
	}
	.shield-yellow-image {
		width: 18px;
	    height: 18px;
	    margin-right: 4px;
	}
	.pament-top-title-content-h3 {
		color: rgb(255, 255, 255);
	    font-weight: 600;
	    margin: 0px 8px 0px 0px;
	    font-size: 24px;
	    font-weight: bold;
	    letter-spacing: -0.4px;
	    padding: 0px;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	.setPayment-div {
		width: 100%;
		padding: 24px;
	}
	.setPayment-section {
		width: 100%;
		position: relative;
	}
	.delivery-info-out-div {
		margin-bottom: 16px;
	    display: inline-flex;
	    flex-direction: column; 
	}
	.delivery-info-in-div {
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
    }
    .info-title-h4 {
    	font-size: 20px;
	    font-weight: bold;
	    color: rgb(62, 64, 66);
	    line-height: 28px;
	    letter-spacing: -0.3px;
	    margin: 0px;
    	padding: 0px;
    	display: block;
	    margin-block-start: 1.33em;
	    margin-block-end: 1.33em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    color: rgb(24, 32, 38);
	    font-weight: 600;
	    line-height: 21px;
	    font-size: 18px;
	    margin: 0px 0px 10px;
    }
    .section-in-box-div {
    	width: 100%;
    	margin-top: 0px;
	    margin-bottom: 16px;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    flex: 1 1 0%;
	    display: flex;
	    flex-direction: column;
	    margin: 0px 0px 16px;
    }
    .section-in-label-div {
    	width: 100%;
    	font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(62, 64, 66);
	    margin: 0px 0px 4px;
	    display: inline-block;
	}
	.section-in-input {
		width: 100%;
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
	    font: 400 13.3333px Arial;
	    outline: 0 none;
	    box-shadow: rgba(41, 42, 43, 0.16) 0px 1px 3px -1px, rgba(0, 0, 0, 0.04) 0px 0px 1px 1px;
	}
	.section-in-input:focus {
		border-color: black;
	}
	.section-in-bixbox-div {
		width: 100%;
		margin-top: 0px;
	    margin-bottom: 16px;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    flex: 1 1 0%;
	    display: flex;
	    flex-direction: column;
	    margin: 0px 0px 16px;
	    font: 400 13.3333px Arial;
	}
	.findpostcode-span {
		display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    flex: 0 0 auto;
	}
	.findpostcode-button {
		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    height: 48px;
	    color: rgb(62, 64, 66);
	    box-sizing: border-box;
	    padding: 0px 16px;
	    margin: 0px;
	    background: rgb(248, 248, 249);
	    border-width: 1px 1px 1px;
	    border-style: solid solid solid none;
	    border-color: rgb(205, 209, 212) rgb(205, 209, 212) rgb(205, 209, 212);
	    border-image: initial;
	    border-left: none;
	    flex: 0 0 auto;
	}
	.findpostcode-over-div {
		border-top-left-radius: 1px;
	    border-bottom-left-radius: 1px;
	    flex: 1 1 auto;
	    box-sizing: border-box;
	    border-radius: 0px;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	}
	.findpostcode-outline-div {
		display: flex;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    flex-direction: row;
	    margin: 0px 0px 10px;
	}
	.payment-method-button {
		position: relative;
	    width: 100%;
	    margin-top: 16px;
	    background-color: rgb(255, 255, 255);
	    text-align: left;
	    border-radius: 1px;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(205, 209, 212);
	    border-image: initial;
	    padding: 12px 16px;
	    outline: 0 none;    
	    font-family: inherit;			
	}
	
	.payment-method-button:focus {
		position: relative;
	    width: 100%;
	    margin-top: 16px;
	    background-color: rgb(255, 255, 255);
	    text-align: left;
	    border-radius: 1px;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(205, 209, 212);
	    border-image: initial;
	    padding: 12px 16px;
	    outline: 0 none;    
	    font-family: inherit;			
	}
	
	.payment-method-on-button {
		position: relative;
	    width: 100%;
	    text-align: left;
	    border-radius: 1px;
	    border-width: 1px;
	    background-color: rgb(255, 255, 255);
	    border-style: solid;
	    margin-top: 16px;
	    border-image: initial;
	    padding: 12px 16px;
	    font-family: inherit;
		outline: none !important;
	    border-color: black;
	    -webkit-box-shadow: none !important;
	    box-shadow: none !important;
	    background: url('/resources/image/gon/paymentflow.png') no-repeat 97% 50%;	
	}
	
	.payment-method-image {
		display: inline-block;
	    vertical-align: middle;
	    width: 20px;
	    height: 20px;
	    margin-right: 5px;
	    border-style: none;
	}
	.payment-method-text {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    display: inline-block;
	    vertical-align: middle;
	    margin: 0px;
	}
	.payment-section-top {
		margin-bottom: 8px;
	    display: inline-flex;
	    flex-direction: column;
	    padding: 0px;
	}
	.payment-section {
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0px;
	}
	.deliveryprice-p {
		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(133, 138, 141);
	    margin: -12px 0px 16px;
	}
	.price-info-in-div {
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
   	}
   	.price-info-out-div {
   		margin-bottom: 6px;
	    display: inline-flex;
	    flex-direction: column;
	    padding: 0px;
   	}
   	.final-price-in-div {
   		display: flex;
	    -webkit-box-align: center;
	    align-items: center;	    
   	}
   	.final-price-out-th {
   		padding-top: 8px;
   	}
   	.final-price-info-table {
   		width: 100%;
	    margin-bottom: 8px;
	    display: table;
	    border-collapse: separate;
	    border-spacing: 2px;
	    border-color: grey;
   	}
   	.final-price-info-section {
   		margin-bottom: 4px;
   	}
   	td {
   		text-align: right;
   		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(133, 138, 141);
	    margin: 0px;
	    padding: 2px 0px;
	    display: table-cell;
    	vertical-align: inherit;
   	}
   	table {
   		border-collapse: collapse;
   		border-spacing: 2px;
   	}
   	th {
   		text-align: left;
		font-weight: normal;
		font-size: 14px;
		font-weight: normal;
		line-height: 20px;
		letter-spacing: -0.2px;
		color: rgb(133, 138, 141);
		margin: 0px;
		padding: 2px 0px;
		display: table-cell;
		vertical-align: inherit;	
   	}
   	.final-price-in-result-div {
   		font-size: 16px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    letter-spacing: -0.2px;
	    margin: 0px;
   	}
   	.final-price-in-result-td {
   		padding-top: 8px;
   	}
   	.final-price-blank-div {
   		content: "";
	    display: block;
	    width: auto;
	    margin: 24px -24px;
	    border-bottom: 1px solid rgb(237, 239, 240);
   	}
   	.payment-button-div {
   		margin-top: 24px;
    	padding: 0px 24px 24px;
   	}
   	.payment-button {
   		box-shadow: rgba(41, 42, 43, 0.16) 0px 1px 3px -1px, rgba(0, 0, 0, 0.04) 0px 0px 1px 1px;
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
   	
   	@media (max-width: 580px) {
   		.payment-form {
	   		display: block;
	    	margin-top: 0em;
	    	width: 100%;
	    	margin: auto;
   		}
   		.payment-top-title-div {
			background-color: rgb(27, 28, 29);
	    	padding: 20px;
	    	width: 100%;
	    	height: 72px;
		}
		.set-payment-div {
			margin: auto;
			width: 100%;
		}
		#wrap {
			width: 100%;
			height: 300px;
			display:none;
			border:1px solid;
			margin-bottom:16px; 
			position:relative; 
			border-color:rgb(221, 224, 226);
		}
   	}
	@media (min-width: 581px) {
		#wrap {
			width: 532px;
			height: 300px;
			display:none;
			border:1px solid;
			margin-bottom:16px; 
			position:relative; 
			border-color:rgb(221, 224, 226);
		}
		.payment-form {
	   		display: block;
	    	margin-top: 0em;
	    	width: 580px;
	    	margin: auto;
   		}
   		.payment-top-title-div {
			background-color: rgb(27, 28, 29);
	    	padding: 20px;
	    	width: 580px;
	    	height: 72px;
		}
		.set-payment-div {
			margin: auto;
			width: 580px;
		}
	}
	.component-option-div { 
		display:block;
	}
	.payment-form {
		display: none;
	}
	.paymethod-phone-on{
		display: none;
	}
	.paymethod-card {
		display: none;
	}
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
.QtLBl {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: flex-start;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}
.QtLBl {
    margin-right: -4px;
    margin-left: -4px;
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
    color: rgb(62, 64, 66);
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
.bXMAOt {
    width: 33.3333%;
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
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
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
    width: 100%;
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
.header-mynemo-logout-span:hover {
	color: rgb(27, 28, 29);
}
  </style>
</head>

	<body>

			<div class="gso-wrapper-div">
			<!------------------------------------------------------ 결제하기 Start ------------------------------------------------------>
			<div class="payment-form">
			<input type="hidden" name="hobbyClassNo" value="${hobbyClass.hobbyClassNo}">
			<div class="set-payment-div">
				<div class="payment-top-title-div">
					<div class="payment-top-child-div">
						<h3 class="pament-top-title-content-h3">결제하기</h3>
						<strong><img class="shield-yellow-image" src="/resources/image/gon/ic-shield-yello.png"><span class="shield-yellow-span">암호화 중</span></strong>
					</div>
				</div>
				
				<div class="setPayment-div">
					<section class="setPayment-section">
						<div class="delivery-info-out-div">
							<div class="delivery-info-in-div">
								<h4 class="info-title-h4">
									<div class="deliveryInfo-title-div">
										배송 정보
									</div>
									<div class="phoneInfo-title-div">
										연락처 정보
									</div>
								</h4>
							</div>
						</div>
						<div class="section-in-box-div">
							<label class="section-in-label-div">
							받으시는 분
							</label>
							<div class="section-in-input-div">
								<input class="section-in-input" type="text" name="receiverName" placeholder="이름" autocomplete="off" value="${purchase.receiverName}">
							</div>
						</div>
						<div class="section-in-box-div">
							<label class="section-in-label-div">
							휴대폰 번호
							</label>
							<div class="section-in-input-div">
								<input class="section-in-input" type="text" name="receiverPhone" placeholder="'-'를 제외하고 입력해주세요." autocomplete="off" value="${purchase.receiverPhone}">
							</div>
						</div>
						
						<div class="deliveryInfo-data-div">
						<div class="section-in-bixbox-div">
							<label class="section-in-label-div">
							배송 주소
							</label>
							<div fill="true" class="findpostcode-outline-div">
								<div class="findpostcode-over-div">
									<input class="section-in-input" type="text" name="dlvyPostcode" placeholder="우편번호" readonly="" autocomplete="off" value="${purchase.dlvyPostcode}">
								</div>
								<button type="button" class="findpostcode-button" color="default" fill="false">
									<span class="findpostcode-span">
									우편번호 찾기
									</span>
								</button>
							</div>
							<div id="wrap">
							</div>
							<div class="section-in-box-div">
								<input class="section-in-input" type="text" name="dlvyAddr" placeholder="주소" readonly="" autocomplete="off" value="${purchase.dlvyAddr}">
							</div>
							<div class="section-in-box-div">
								<input class="section-in-input" type="text" name="dlvyDetailAddr" placeholder="상세 주소" autocomplete="off" value="${purchase.dlvyDetailAddr}">
							</div>
						</div>
						<div class="section-in-box-div">
							<label class="section-in-label-div">
							배송 요청사항
							</label>
							<div class="section-in-box-div">
								<input class="section-in-input" type="text" name="dlvyRequest" placeholder="예) 경비실에 맡겨주세요." autocomplete="off" value="${purchase.dlvyRequest}">
							</div>
						</div>
						</div>
					</section>
					
					<section class="final-price-info-section">
						<div class="price-info-out-div">
							<div class="price-info-in-div">
								<h4 class="info-title-h4">
									결제 금액
								</h4>
							</div>
						</div>
						<p class="deliveryprice-p">
							도서 산간지역은 추가 배송료가 적용될 수 있습니다
						</p>
						<table class="final-price-info-table">
						<tbody>
							<tr>
								<th>
									총 상품 금액
								</th>
								<td class="payment-totalPrice">
									
								</td>
							</tr>
							<tr>
								<th>
									배송비
								</th>
								<td>
									무료
								</td>
							</tr>
							<tr>
								<th>
									상품 할인 금액
								</th>
								<td class="paymentSalePrice">
								
								</td>
							</tr>
							<tr><th></th></tr>
						</tbody>
						<tfoot>
							<tr >
								<th class="final-price-out-th">
								<div class="final-price-in-div">
									<strong>
										최종 가격
									</strong>
								</div>
								</th>
								<td class="final-price-in-result-td">
									<div class="final-price-in-result-div">
										<strong>
											<span class="paymentTotalPrice">
												
											</span>
										</strong>
									</div>
								</td>
							</tr>
						</tfoot>
						</table>
						<div class="final-price-blank-div"></div>
					</section>
					
					<section>
						<div class="payment-section-top">
							<div class="payment-section">
								<h4 class="info-title-h4">
								결제 방식
								</h4>
							</div>
						</div>
						<button data-test-id="payment-method-CARD" type="button" class="payment-method-button paymethod-card">
							<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
								<path d="M0 0h24v24H0z" fill="none"/>
								<path d="M20 4H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4v-6h16v6zm0-10H4V6h16v2z"/>
							</svg>
							<div class="payment-method-text">
							카드 결제
							</div>
						</button>
						<button data-test-id="payment-method-CARD" type="button" class="payment-method-on-button paymethod-card-on">
							<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
								<path d="M0 0h24v24H0z" fill="none"/>
								<path d="M20 4H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4v-6h16v6zm0-10H4V6h16v2z"/>
							</svg>
							<div class="payment-method-text">
							카드 결제
							</div>
						</button>
						<button id="payment-method-PHONE" data-test-id="payment-method-VBANK" type="button" class="payment-method-button paymethod-phone">						
							<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
								<path d="M0 0h24v24H0z" fill="none"/>
								<path d="M17 1.01L7 1c-1.1 0-1.99.9-1.99 2v18c0 1.1.89 2 1.99 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z"/>
							</svg>
							<div class="payment-method-text">
							휴대폰 결제
							</div>
						</button>
						<button id="payment-method-PHONE" data-test-id="payment-method-VBANK" type="button" class="payment-method-on-button paymethod-phone-on">						
							<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
								<path d="M0 0h24v24H0z" fill="none"/>
								<path d="M17 1.01L7 1c-1.1 0-1.99.9-1.99 2v18c0 1.1.89 2 1.99 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z"/>
							</svg>
							<div class="payment-method-text">
							휴대폰 결제
							</div>
						</button>
					</section>
				</div>
			
			</div>
			
			<div class="payment-button-div">
			<button type="submit" class="payment-button" color="orange" fill="true">
				<span class="">
					다음
				</span>
			</button>
			</div>
			
			<!-- footer -->
				<footer>
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
										<div id="modalready" class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm" style="padding-top: 10px;cursor: pointer;">회원탈퇴
										</div>	
									</div>
								</div>
							<div class="sc-gHboQg bXMAOt">
							<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
							<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">크리에이터
							</div>
							<a href="/user/listNotice/1" target="" rel="" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
							<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">공지사항
							</div>
							</a>
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
						<div class="sc-eilVRo QtLBl">		
						<div class="sc-gHboQg gPalxu">
						<div class="sc-fcdeBU hMCBZf">
						<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 iIxncl" style="width: 100%;">(주)GET취미 | 대표 감자면 | 개인정보보호 책임자 감자면 | 서울 강남구 테헤란로5길 11 YBM빌딩 2층 | 사업자등록번호 : 000-55-88771 | (주)GET취미는 상품,거래정보 및 거래에 대하여 책임을 지지 않습니다.
						</div>
						</div>
						</div>
						</div>
						</div>			
						</div>
					</div>
					<!-- Modal -->
				<!-- <div id="modalopen"> -->
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
				<!-- Modal -->	
					
				</footer>
			
			</div>
			<!------------------------------------------------------ 결제하기 End ------------------------------------------------------>
			

			<!------------------------------------------------------ 구성품 선택하기 Start ------------------------------------------------------>
			<div class="component-option-div">


			<!-------------------- Header Start -------------------->
			
	
				<nav class="navbar navbar-expand-lg navbar-light bg-light header-navbar gso-hea-nav">
	               <div class="container-fluid" style="padding:0px 16px; background-color:black; height:100%; width:100%;">
	
	                   <div id="sidebarCollapse" class="test" style="border:0; outline:none; background-color: black; display:flex; justify-content: left;">   
	                   	                    
						<img src="/resources/image/logo/logo-favicon.png">	
						<a href="/index.jsp" style="text-decoration:none; float:left; color:white; font-size:22px; font-weight:bold; line-height:32px; margin-left:12px; etter-spacing: -0.4px;">
	                   	  GetHobby
	                   </a>
	                   </div>
						<div style="display: flex; justify-content: right;">
	
	                   <c:if test="${ ! empty sessionScope.user }">
	                   <div style="margin:0px 24px; padding:0px; color:white; font-size:24px; font-weight:bold; line-height:32px; etter-spacing: -0.4px;">
	                   		
	                   		<!-- 프로필 -->
				            <div class="dropdown d-flex justify-content-end">
				                <div class="dropdown-icon header-mynemo-check-mylist" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
				                	<span class="header-mynemo-first-span">
				                    	<img src="../resources/image/logo/${!empty sessionScope.user.profileImage ? sessionScope.user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
				                    </span>
				                    
				                    <div class="header-mynemo-profile-flow-one fa-angle-down">
										<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
											<path d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z" fill="#ffffff"/>
											<path d="M0 0h24v24H0z" fill="none"/>
										</svg>
									</div>
				                </div>
				
								<!-- 마이페이지 미니메뉴 -->
								<div class="dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
					                <div class="header-mynemo-out-div">
						                <a class="header-mynemo-first-a" href="/user/mypageUser" style="text-decoration:none;">
							                <span class="header-mynemo-first-span">
							                	<img src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
							                </span>
							                <div class="header-mynemo-span-next-first-div">
								                <div class="header-mynemo-span-next-first-div-in-div" >
								                	${sessionScope.user.nickName}
								                </div>
								                <span class="header-mynemo-span-next-first-div-in-span">
									                <div color="#fd7e14" class="header-mynemo-span-next-first-div-in-mypage-text">
									                	마이페이지
									                </div>
									                <svg width="12" height="12" viewBox="0 0 24 24">
									                	<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z" />
									                </svg>
								                </span>
							                </div>
						                </a>
				
				
										<div color="#1b1c1d" class="header-mynemo-div">
					                	<div class="header-mynemo-span" style="text-decoration:none;">
						                	크리에이터 센터
						                </div>
					                </div>
					                <div class="header-mynemo-hr"></div>
					                <div color="#1b1c1d" class="header-mynemo-div">
					                	<div class="header-mynemo-span" style="text-decoration:none;">
						                	구매 내역
						                </div>
					                </div>
					                <div class="header-mynemo-hr"></div>
						                <div><hr class="header-mynemo-logout-hr">
							                <div color="#1b1c1d" class="header-mynemo-logout-div">
								                <a href="/user/logout" class="header-mynemo-logout-span" style="text-decoration:none;">
								                	로그아웃
								                </a>
							                </div>
						                </div>
					                </div>
				                </div>
				                
				            </div>
				       
				        </div>
				        </c:if>
				        
	                   </div>
	               </div>
	           </nav>
		
			<!-------------------- Header End -------------------->
				<div class="content-wrapper">
					<h1 class="select-page-title">
						구성품 선택하기
					</h1>
					
					<!-- 무료배송 정보 -->
					<div class="free-delivery-info-div">
						<div class="all-free-delivery-title">
							<svg width="18" height="18" viewBox="0 0 24 24">
								<path fill="#00b79d" fill-rule="evenodd" d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm-1.666 14.795l7.5-7.5-1.175-1.184-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z">
								</path>
							</svg>
							모두 무료배송이에요!
						</div>
						<div class="all-free-delivery-info">
							수강에 필요한 모든 준비물이 포함된 키트를 무료배송으로 간단하게 받아보세요.
						</div>
					</div>
					
					<div class="set-select-div box-shadow">
						<div class="select-div-up-box">
							<div class="select-div-up-content">
								세트 할인
							</div>
						</div>
						<h4 class="set-select-title">
							<div class="kitNameClass">${hobbyClass.kitName}</div>
							<svg width="24" height="24" viewBox="0 0 24 24">
								<path fill="#cdd1d4" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z">
								</path>
							</svg>
						</h4>
						
						<div class="mini-lesson-info-div">
							<svg width="16" height="16" class="mini-cute-svg" viewBox="0 0 24 24">
								<path fill="#858a8d" fill-rule="evenodd" d="M5.846 6c-.917 0-1.142.043-1.368.164a.727.727 0 00-.314.314c-.12.226-.164.45-.164 1.368v8.308c0 .917.043 1.142.164 1.368.075.14.174.239.314.314.226.12.45.164 1.368.164h12.308c.917 0 1.142-.043 1.368-.164a.727.727 0 00.314-.314c.12-.226.164-.45.164-1.368V7.846c0-.917-.043-1.142-.164-1.368a.727.727 0 00-.314-.314c-.226-.12-.45-.164-1.368-.164H5.846zm0-2h12.308c1.337 0 1.822.14 2.311.4.49.262.873.646 1.134 1.135.262.489.401.974.401 2.31v8.31c0 1.336-.14 1.821-.4 2.31a2.726 2.726 0 01-1.135 1.134c-.489.262-.974.401-2.31.401H5.844c-1.336 0-1.821-.14-2.31-.4A2.726 2.726 0 012.4 18.464c-.262-.489-.401-.974-.401-2.31v-8.31c0-1.336.14-1.821.4-2.31A2.726 2.726 0 013.536 4.4C4.024 4.139 4.509 4 5.845 4zM11 13.765l2.798-1.763L11 10.238v3.527zM9 9.75c0-1.352 1.457-2.219 2.615-1.489l3.571 2.25c1.085.684 1.085 2.295 0 2.979l-3.571 2.25c-1.158.73-2.615-.137-2.615-1.49v-4.5z">
								</path>
							</svg>
							15주 수강권
							<div class="mini-price-info-div">
								<span class="mini-sale-percent-span hobbyClassSalePercent"></span>
								<span class="mini-sale-after hobbyClassPrice"></span>
							</div>
						</div>
						
						<div class="mini-lesson-info-div">
							<svg width="16" height="16" class="mini-cute-svg" viewBox="0 0 24 24">
								<path fill="#858a8d" fill-rule="evenodd" d="M11 10H4v2h7v-2zm2 0v2h7v-2h-7zm-2 4H5v6h6v-6zm2 0v6h6v-6h-6zM5.535 8A4 4 0 0112 3.354 4 4 0 0118.465 8H20c1.219 0 2 .781 2 2v2c0 .843-.374 1.477-1.008 1.788.005.069.008.14.008.212v6c0 1.219-.781 2-2 2H5c-1.219 0-2-.781-2-2v-6c0-.072.003-.143.008-.212C2.374 13.478 2 12.843 2 12v-2c0-1.219.781-2 2-2h1.535zM15 8a2 2 0 10-2-2v2h2zm-4-2a2 2 0 10-2 2h2V6z">
								</path>
							</svg>
							${hobbyClass.kitName}
							<div class="mini-price-info-div">
								<span class="mini-price-span kitPrice"></span>
							</div>
						</div>
							
						<div class="mini-kit-info-div">
							<span class="show-kit-span">
							구성품 보기						
							</span>
						</div>
						<div class="pretty-blank-box"></div>
						<div class="select-difficult-price-div">
							<div class="big-sale-percent-div">
								<strong class="iamstrong setTotalSalePercent"></strong>
							</div>
							<div class="mini-difficult-price-div">
								<div>
									<span class="mini-sale-before setTotalPrice"></span>
									<span class="mini-sale-after setSalePrice"></span>
								</div>
								<div>
									<!-- <span class="ifsplitmoney"></span> -->
									<strong class="iamstrongfinal setSalePrice"></strong>
								</div>
							</div>
						
						</div>
						
					</div>
					
					<div class="single-select-div box-shadow">
						<div class="select-div-up-box thisisgood">
							<div class="select-div-up-content">
								추천
							</div>
						</div>
						<h4 class="set-select-title">
							수강권 Only
							<svg width="24" height="24" viewBox="0 0 24 24">
								<path fill="#cdd1d4" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z">
								</path>
							</svg>
						</h4>
						
						<div class="mini-lesson-info-div">
							<svg width="16" height="16" class="mini-cute-svg" viewBox="0 0 24 24">
								<path fill="#858a8d" fill-rule="evenodd" d="M5.846 6c-.917 0-1.142.043-1.368.164a.727.727 0 00-.314.314c-.12.226-.164.45-.164 1.368v8.308c0 .917.043 1.142.164 1.368.075.14.174.239.314.314.226.12.45.164 1.368.164h12.308c.917 0 1.142-.043 1.368-.164a.727.727 0 00.314-.314c.12-.226.164-.45.164-1.368V7.846c0-.917-.043-1.142-.164-1.368a.727.727 0 00-.314-.314c-.226-.12-.45-.164-1.368-.164H5.846zm0-2h12.308c1.337 0 1.822.14 2.311.4.49.262.873.646 1.134 1.135.262.489.401.974.401 2.31v8.31c0 1.336-.14 1.821-.4 2.31a2.726 2.726 0 01-1.135 1.134c-.489.262-.974.401-2.31.401H5.844c-1.336 0-1.821-.14-2.31-.4A2.726 2.726 0 012.4 18.464c-.262-.489-.401-.974-.401-2.31v-8.31c0-1.336.14-1.821.4-2.31A2.726 2.726 0 013.536 4.4C4.024 4.139 4.509 4 5.845 4zM11 13.765l2.798-1.763L11 10.238v3.527zM9 9.75c0-1.352 1.457-2.219 2.615-1.489l3.571 2.25c1.085.684 1.085 2.295 0 2.979l-3.571 2.25c-1.158.73-2.615-.137-2.615-1.49v-4.5z">
								</path>
							</svg>
							15주 수강권
							<div class="mini-price-info-div">
								<span class="mini-sale-percent-span hobbyClassSalePercent"></span>
								<span class="mini-sale-after hobbyClassPrice"></span>
							</div>
						</div>
							
						<div class="pretty-blank-box"></div>
						<div class="select-difficult-price-div">
							<div class="big-sale-percent-div">
								<strong class="iamstrong hobbyClassSalePercent"></strong>
							</div>
							<div class="mini-difficult-price-div">
								<div>
									<span class="mini-sale-before singleTotalPrice"></span>
									<span class="mini-sale-after singleSalePrice"></span>
								</div>
								<div>
									<!-- <span class="ifsplitmoney"></span> -->
									<strong class="iamstrongfinal singleSalePrice"></strong>
								</div>
							</div>
						
						</div>
						
					</div>
				</div>
				
				<!-- footer -->
				<footer style="margin-top:20px;">
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
										<div id="modalready" class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm" style="padding-top: 10px;cursor: pointer;">회원탈퇴
										</div>	
									</div>
								</div>
							<div class="sc-gHboQg bXMAOt">
							<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
							<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">크리에이터
							</div>
							<a href="/user/listNotice/1" target="" rel="" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
							<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">공지사항
							</div>
							</a>
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
						<div class="sc-eilVRo QtLBl">		
						<div class="sc-gHboQg gPalxu">
						<div class="sc-fcdeBU hMCBZf">
						<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 iIxncl" style="width: 100%;">(주)GET취미 | 대표 감자면 | 개인정보보호 책임자 감자면 | 서울 강남구 테헤란로5길 11 YBM빌딩 2층 | 사업자등록번호 : 000-55-88771 | (주)GET취미는 상품,거래정보 및 거래에 대하여 책임을 지지 않습니다.
						</div>
						</div>
						</div>
						</div>
						</div>			
						</div>
					</div>
					<!-- Modal -->
				<!-- <div id="modalopen"> -->
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
				<!-- Modal -->	
					
				</footer>
				
			</div>
			<!------------------------------------------------------ 구성품 선택하기 End ------------------------------------------------------>
			
			<jsp:include page="/purchase/getKitViewModal.jsp"/>
			
		
		</div>
		<!-- 세트 구매 -->
	<script type="text/javascript">
		
			function numberFormat(inputNumber) {
				   inputNumber = Math.floor(inputNumber);
				   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
		$(function(){
			
			// 크리에이터 센터 이동
			$(document).on("click", ".header-mynemo-span:contains('크리에이터 센터')", function(){
        		self.location = "/hobbyclass/getMyHobbyClassList";
        	});
        	
        	// 구매 내역 이동
        	$(document).on("click", ".header-mynemo-span:contains('구매 내역')", function(){
        		self.location = "/purchase/getPaymentHistoryList";
        	});
			
			$(document).on("click", ".show-kit-span", function(){
				$("#kitViewModalButton").click();
			});
			
			$(".paymethod-card").on("click", function(){
				$(".paymethod-card").css("outline", "");
				$(".paymethod-card").css("border-color", "");
				$(".paymethod-card").css("-webkit-box-shadow", "");
				$(".paymethod-card").css("box-shadow", "");
				$(".paymethod-card").css("background", "");			
			});
			
			
			
			setTimeout(function() { $(".paymethod-card").focus() }, 500);
			////////////////////////////// 가격정보 //////////////////////////////
			var hobbyClassPrice = ${hobbyClass.hobbyClassPrice};
			var kitPrice = ${hobbyClass.kitPrice};
			var setTotalPrice = hobbyClassPrice + kitPrice;
			var salePercent = ${discountPrice};// 이벤트 모듈과 연동 필요!
			var paymentSingleFinalPrice;
			var paymentSetFinalPrice;
			var iamportSetTotalPrice;
			var iamportSingleTotalPrice;

			if( salePercent != null ){
				var getSalePercent = 1 - (salePercent/100); 
				var saleHobbyClassPrice = hobbyClassPrice * getSalePercent;
				var setSalePrice = saleHobbyClassPrice + kitPrice;
				var setTotalSalePercent = Math.floor( (setTotalPrice - setSalePrice) / setTotalPrice * 100 );
				
				$(".hobbyClassSalePercent").text( salePercent+"%" );
				$(".setTotalSalePercent").text(setTotalSalePercent+"%");
				$(".hobbyClassPrice").text( numberFormat(saleHobbyClassPrice) +"원" );
				$(".singleSalePrice").text( numberFormat(saleHobbyClassPrice) +"원" );
				$(".setSalePrice").text( numberFormat(setSalePrice)+"원" );
				
				$(".paymentSalePrice").text( "- "+ numberFormat(setTotalPrice - setSalePrice) +"원" );
				paymentSetFinalPrice = numberFormat(setSalePrice) +"원";
				iamportSingleTotalPrice = saleHobbyClassPrice;
				iamportSetTotalPrice = setSalePrice;
				paymentSingleFinalPrice = numberFormat(saleHobbyClassPrice) +"원";
				
			}else {
				
				$(".hobbyClassPrice").text( numberFormat(hobbyClassPrice) +"원" );
				$(".singleSalePrice").text( numberFormat(hobbyClassPrice) +"원" );
				$(".setSalePrice").text( numberFormat(hobbyClassPrice + kitPrice)+"원" );
				
				$(".paymentSalePrice").text( "- 0원" );
				paymentSetFinalPrice = numberFormat(hobbyClassPrice + kitPrice) +"원";
				iamportSingleTotalPrice = hobbyClassPrice;
				iamportSetTotalPrice = hobbyClassPrice + kitPrice;
				paymentSingleFinalPrice = numberFormat(hobbyClassPrice) +"원";

			}
			$(".singleTotalPrice").text( numberFormat(hobbyClassPrice)+"원" );
			$(".setTotalPrice").text( numberFormat(setTotalPrice)+"원" );
			$(".kitPrice").text( numberFormat(kitPrice)+"원" );
			
			var componentOption;
			
			
			//////////////////////////////가격정보 //////////////////////////////

			
			// componentOption에 따라 바뀜
			//////////////////////////////////////////////////////////////////////
			
			
			// 카드에서 구성품 보기 영역을 제외한 나머지 영역을 클릭할 경우
			$(document).on("click",".set-select-div", function(e){
					
				if( !$(e.target).hasClass("show-kit-span") ){
					$(".component-option-div").css("display", "none");
					$(".payment-form").css("display", "block");
					$(".deliveryInfo-title-div").css("display", "block");
					$(".deliveryInfo-data-div").css("display", "block");
					$(".phoneInfo-title-div").css("display", "none");
					$(".payment-totalPrice").text( numberFormat(setTotalPrice) );
					$(".paymentTotalPrice").text( paymentSetFinalPrice );
					componentOption = 1;
				}
			});
			
			$(".single-select-div").on("click", function(){
				$(".component-option-div").css("display", "none");
				$(".payment-form").css("display", "block");
				$(".deliveryInfo-title-div").css("display", "none");
				$(".deliveryInfo-data-div").css("display", "none");
				$(".phoneInfo-title-div").css("display", "block");
				$(".payment-totalPrice").text( numberFormat(hobbyClassPrice) );
				$(".paymentTotalPrice").text( paymentSingleFinalPrice );
				componentOption = 0;
				
			});
			//////////////////////////////////////////////////////////////////////
	
			$(".show-kit-span").on("mouseenter", function(){
				$(this).css("text-decoration","underline");
			});
			
			$(".show-kit-span").on("mouseleave", function(){		
				$(this).css("text-decoration","none");
			});	
			
			$(".findpostcode-button").on("mouseover", function(){
				$(this).css("background-color", "rgb(221, 224, 226)");
			});
			
			$(".findpostcode-button").on("mouseleave", function(){
				$(this).css("background-color", "rgb(248, 248, 249)");
			});
			
			$(".payment-button").on("click", function(){
				iamport();
			});
			
			
			
			// 다음주소 API
			// 우편번호 찾기 찾기 화면을 넣을 element
		    var element_wrap = document.getElementById('wrap');
		
		    function foldDaumPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_wrap.style.display = 'none';
		    }
		
		    $(".findpostcode-button").on("click", function(){
		    	//daumPostcode();
		    });
		    
		    $(".findpostcode-button").on("click", function(){
		    	if( $("#wrap").css("display") == 'none' ){
		    		daumPostcode();
		    	}else if( $("#wrap").css("display") == 'block' ){
		    		$("#wrap").css("display","none");
		    	} // display가 block이면 우편번호 찾기 클릭했을 때 none으로 변경하기
		    	////////////////////////////////////////////////////////////////////
		    });
		    
		    function daumPostcode() {
		        // 현재 scroll 위치를 저장해놓는다.
		        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
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
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $("input[name='dlvyPostcode']").val(data.zonecode);
		                //document.getElementById('sample3_postcode').value = data.zonecode;
		                
		                $("input[name='dlvyAddr']").val(addr);
		                //document.getElementById("sample3_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                
		                $("input[name='dlvyDetailAddr']").focus();
		                //document.getElementById("sample3_detailAddress").focus();
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_wrap.style.display = 'none';
		
		                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
		                document.body.scrollTop = currentScroll;
		            },
		            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		            onresize : function(size) {
		                element_wrap.style.height = size.height+'px';
		            },
		            width : '100%',
		            height : '100%'
		        }).embed(element_wrap);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_wrap.style.display = 'block';
		        element_wrap.style.height = 'block';
		        
		    }
		    
		    // IamPort API
		    IMP.init('imp74448656'); // API Key
		    function iamport() {
		    	
		    	
		    	 var iamportAmount;
				    var payMethod = 'card';
				    if( $(".paymethod-phone-on").css("display") == 'block' ){
				    	payMethod = 'phone';
				    }
				   
				    var name = '15주 수강권';
				    if( componentOption == '1' ){
				    	name = $(".kitNameClass").text().trim();
				    }
				    var buyerTel = $("input[name='receiverPhone']").val();
				    if( componentOption == '1' ){
				    	iamportAmount = iamportSetTotalPrice;
				    }else if( componentOption == '0' ){
				    	iamportAmount = iamportSingleTotalPrice;
				    }
				    var buyerEmail = '${sessionScope.user.userId}';
				
		    	IMP.request_pay({
				    pg : 'inicis',
				    pay_method : payMethod,
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : name, 
				    amount :  10,
				    buyer_email : buyerEmail,
				    buyer_tel : buyerTel,
				    m_redirect_url : "http://192.168.0.144:8080/purchase/mobileComplete?hobbyClassNo="+$("input[name='hobbyClassNo']").val()
				    		
				    		+"&receiverName="+$("input[name='receiverName']").val()
				    		+"&receiverPhone="+$("input[name='receiverPhone']").val()
				    		+"&dlvyAddr="+$("input[name='dlvyAddr']").val()
				    		+"&dlvyDetailAddr="+$("input[name='dlvyDetailAddr']").val()
				    		
				    		+"&dlvyPostcode="+$("input[name='dlvyPostcode']").val()
				    		+"&dlvyRequest="+$("input[name='dlvyRequest']").val()
				    		+"&payMethod="+payMethod
				    		+"&purchasePrice="+iamportAmount
				    		+"&componentOption="+componentOption
				}, function(rsp) {
				    if ( rsp.success ) {
				    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				    	jQuery.ajax({
				    		url: "/purchase/json/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				    		type: 'POST',
				    		headers : {
								"Accept" : "application/json" ,
								"Content-Type" : "application/json"
							},
				    		dataType: 'json',
				    		data: JSON.stringify({
				    			purchaseId : rsp.imp_uid,
				    			hobbyClass : {hobbyClassNo : $("input[name='hobbyClassNo']").val() },
				    			receiverName : $("input[name='receiverName']").val(),
				    			receiverPhone: $("input[name='receiverPhone']").val(),
				    			dlvyAddr: $("input[name='dlvyAddr']").val(),
				    			dlvyDetailAddr: $("input[name='dlvyDetailAddr']").val(),
				    			dlvyPostcode: $("input[name='dlvyPostcode']").val(),
				    			dlvyRequest: $("input[name='dlvyRequest']").val(),
				    			payMethod: payMethod,
				    			purchasePrice: iamportAmount,
				    			componentOption: componentOption
				    			
				    		})
				    	}).done(function(everythings_fine) {
				    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				    		if ( everythings_fine ) {
				    			
				    			var msg = '결제가 완료되었습니다.';
				    			msg += '\n고유ID : ' + rsp.imp_uid;
				    			msg += '\결제 금액 : ' + rsp.paid_amount;
				    			msg += '카드 승인번호 : ' + rsp.apply_num;
				
				    			alert(msg);
				    			
				    			self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo="+$("input[name='hobbyClassNo']").val();
				    		} else {
				    			//[3] 아직 제대로 결제가 되지 않았습니다.
				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				    		}
				    	});
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				
				        alert(msg);
				    }
				});
		    }
		    
		    // payMethod 변경 이벤트
		    $(".paymethod-phone").on("click", function(){
		    	
		    	$(".paymethod-card").css("display","block");
		    	$(".paymethod-card-on").css("display","none");
		    	$(".paymethod-phone").css("display","none");
		    	$(".paymethod-phone-on").css("display","block");
		    	
		    });
		    
		    $(".paymethod-card").on("click", function(){
		    	$(".paymethod-card").css("display","none");
		    	$(".paymethod-card-on").css("display","block");
		    	$(".paymethod-phone").css("display","block");
		    	$(".paymethod-phone-on").css("display","none");
		    });
		    
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
	
	
</body>
</html>