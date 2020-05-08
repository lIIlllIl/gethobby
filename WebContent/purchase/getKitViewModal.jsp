<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- //2020-02-24 Git Commit --%>
  <style>
  	.pgkvm-h4{
  		font-size: 18px;
	    font-weight: 800;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    letter-spacing: -0.01em;
	    margin: 0px;
	    padding: 0px;
	    margin-bottom: 16px;
	    display: inline-flex;
	    flex-direction: column;
  	}
  	.pgkvm-img {
  		border-radius: 3px;
  		top: 0px;
	    left: 0px;
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	    position: absolute;
	    opacity: 1;
	    transition: opacity 0.1s linear 0s;
	    vertical-align: middle;
	    border-style: none;
  	}
  	.pgkvm-img-div {
  		width: 112px;
	    flex-shrink: 0;
	    margin-right: 16px;
	    height: 100%;
  	}
  	.pgkvm-img-span {
  		display: block;
	    position: relative;
	    font-size: 0px; 
	    overflow: hidden;
	    height:100%;
  	}
  	.pgkvm-img-out-div {
  		height:100%;
  		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    align-content: flex-start;
	    margin-bottom: 16px;  
  	}
  	.kitvm-kitname {
  		margin-bottom: 4px;
    	display: flex;
  	}
  	.kitvm-kitname-span {
  		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(62, 64, 66);
	    margin: 0px 8px 0px 0px;
  	}
  	.kitvm-kitintro {
  		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    white-space: pre-line;
	    margin: 0px 0px 8px;
	    padding:0px;
  	}
  	.shc-htm-cb:focus {
  		border: 0;
  		outline: 0 none;
  	}
  	@media (min-width: 992px){
  		.modal-content {
  			width: 460px;
  		}
  		.modal-header {
  			width:432px;
  		}
  		.pgkvm-img-out-div {
  			height:112px;
  		}
  	}
  	@media (max-width: 991px){
  		.modal-content {
  			width: 100%;
  		}
  		.modal-header {
  			width:100%;
  		}
  		.pgkvm-img-out-div {
  			height:auto;
  		}
  	}
  </style>
</head>
<body>
<%-- //2020-02-20 Git Commit --%>
<!-- Button trigger modal -->
<button type="button" style="display:none" id="kitViewModalButton" class="btn btn-primary" data-toggle="modal" data-target="#kitViewModal" data-category="">
  Launch
</button>

<!-- Modal -->
<div class="modal fade" id="kitViewModal" tabindex="-1" role="dialog" aria-labelledby="kitViewModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" role="document">
    <div class="modal-content" style="padding:16px 12px; margin-top:64px;">
      <div class="modal-header" style="border:0; outline:0; ">
        <h5 class="modal-title" id="kitViewModalLabel" style="font-size: 24px; font-weight: bold; color: rgb(62, 64, 66); line-height: 32px; letter-spacing: -0.4px;">
        	준비물키트
        </h5>
        <button type="button" class="close shc-htm-cb" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
	          <svg width="24" height="24" viewBox="0 0 24 24">
		          <path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z">
		          </path>
	          </svg>
          </span>
        </button>
      </div>
      
      <section style="padding:0px 16px 0px 16px;">
	      <div class="">
		      <div class="">
			      <h4 font-weight="800" class="pgkvm-h4">
			      	기본 패키지
			      </h4>
		      </div>
	      </div>
	      <div class="pgkvm-img-out-div">
		      <div class="pgkvm-img-div">
			      <span class="pgkvm-img-span">
			      	<img src="/images/hobbyclass/${hobbyClass.kitImage}" alt="소가죽 펜슬 홀더  (2월 말 순차출고 될 예정입니다)" ratio="1" style="width:100%; height:100%;">
			      </span>
		      </div>
		      <div class="">
			      <div class="kitvm-kitname">
				      <span class="kitvm-kitname-span">
				      	${hobbyClass.kitName}
				      </span>
			      </div>			      
			      <div class="kitvm-kitintro">
			       	✔${hobbyClass.kitIntro}
			      </div>
			      <div class="">
			      </div>
		      </div>
	      </div>
      </section>
      
    </div>
  </div>
</div>

