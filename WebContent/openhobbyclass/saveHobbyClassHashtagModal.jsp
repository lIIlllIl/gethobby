<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- //2020-02-24 Git Commit --%>
<!-- Button trigger modal -->
<button type="button" style="display:none" id="hashtagModalButton" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-category="">
  Launch
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" role="document">
    <div class="modal-content shchtm-con">
      <div class="modal-header shchtm-hea">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 24px; font-weight: bold; color: rgb(62, 64, 66); line-height: 32px; letter-spacing: -0.4px;">해쉬태그</h5>
        <button type="button" class="close shc-htm-cb" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
	          <svg width="24" height="24" viewBox="0 0 24 24">
		          <path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z">
		          </path>
	          </svg>
          </span>
        </button>
      </div>
      
      <form id="hashtagModalForm">
      <input type="hidden" name="catchCategory" value="">
      
      
      <div class="Crafts" style="display:none">
      <!-- 공예 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX H00 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">플라워/꽃꽃이</span></label>
		        <label class="sc-eTuwsz fpmSZX H01 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">뜨개질/위빙</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX H02 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">가구/목공예</span></label>
		        <label class="sc-eTuwsz fpmSZX H03 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">가죽공예</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX H04 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">천연비누/화장품</span></label>
		        <label class="sc-eTuwsz fpmSZX H05 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">디퓨저/향수</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX H06 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">캔들/석고공예</span></label>
		        <label class="sc-eTuwsz fpmSZX H07 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">도자공예</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX H08 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">금속/악세사리공예</span></label>
		        <label class="sc-eTuwsz fpmSZX H09 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">바느질/재봉틀</span></label>
	        </div>
	      </div>
      </div>
      
      
      <div class="Cooking" style="display:none">
      <!-- 요리 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX C00 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">한식</span></label>
		        <label class="sc-eTuwsz fpmSZX C01 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">양식</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX C02 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">중식</span></label>
		        <label class="sc-eTuwsz fpmSZX C03 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">일식</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX C04 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">분식</span></label>
		        <label class="sc-eTuwsz fpmSZX C05 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">베이킹</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX C06 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">커피</span></label>
		        <label class="sc-eTuwsz fpmSZX C07 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">와인</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX C08 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">칵테일</span></label>
		        <label class="sc-eTuwsz fpmSZX C09 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">디저트</span></label>
	        </div>
	      </div>
      </div>
      
      
      <div class="Art" style="display:none">
      <!-- 미술 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX A00 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">디지털 드로잉</span></label>
		        <label class="sc-eTuwsz fpmSZX A01 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">아동미술</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX A02 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">미술 회화</span></label>
		        <label class="sc-eTuwsz fpmSZX A03 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ" ><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">소묘/드로잉</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX A04 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">만화/웹툰</span></label>
		        <label class="sc-eTuwsz fpmSZX A05 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">애니</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX A06 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">동양화</span></label>
		        <label class="sc-eTuwsz fpmSZX A07 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">팝아트</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX A08 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">조소</span></label>
		        <label class="sc-eTuwsz fpmSZX A09 shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">캘리그라피</span></label>
	        </div>
	      </div>
      </div>
      
      
      <div class="Music" style="display:none">
      <!-- 음악 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">보컬</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">랩</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">디제잉</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">미디/컴퓨터작곡</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">시창청음/화성학</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">피아노/키보드</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">기타</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">베이스기타</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">드럼</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">바이올린</span></label>
	        </div>
	      </div>
      </div>
      
      
      <div class="Exercise" style="display:none">
      <!-- 운동 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">퍼스널트레이닝(PT)</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">크로스핏</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">필라테스</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">요가</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">스키</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">태권도</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">복싱</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">체조</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">파쿠르</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">스케이트보드</span></label>
	        </div>
	      </div>
	  </div>
	  
      
      <div class="Lifestyle" style="display:none">
      <!-- 라이프 스타일 -->
	      <div class="modal-body shchtm-oudi">
	      	<div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">컴퓨터 활용</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">외국어</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">수학</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">과학</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">국어</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">사회</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">논술</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">연기</span></label>
	        </div>
	        <div class="shchtm-wrdi">
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">뮤지컬</span></label>
		        <label class="sc-eTuwsz fpmSZX shchtm-lab"><svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path></svg><input name="5c5d5bfc74eabcfdafc3a2e7" style="opacity: 0;" type="checkbox" class="sc-gwVKww cLJEQJ"><span class="sc-hXRMBi bAxrEv" style="font-size: 14px; font-weight: normal; color: rgb(62, 64, 66); line-height: 20px; letter-spacing: -0.2px; margin: 0px;">마술</span></label>
	        </div>
	      </div>
      </div>
      </form>
     
      
      <div class="modal-footer shchtm-foo">
        <button type="button" class="btn btn-secondary shc-htm-rb" style="float:left; background-color:rgb(255, 255, 255); border:0; outline:0; padding: 0px 16px; margin:0px 8px 0px 0px; width:56px; height:40px;">
        	<svg width="24" height="24" viewBox="0 0 24 24"><path fill="#3E4042" fill-rule="evenodd" d="M17.02 5L12 10V6c-3.84.021-6.979 3.16-7 7-.014 3.847 3.153 7.014 7 7 3.847-.014 7.006-3.153 7.02-7H21c-.021 4.943-4.057 8.979-9 9-4.929.021-9.028-4.064-9-9 .028-4.936 4.064-8.972 9-9V0l5.02 5z"></path></svg>
        </button>
        <button type="button" class="btn btn-primary shc-htm-ab" data-dismiss="modal">적용하기</button>
        <button type="button" class="btn btn-primary shc-htm-xab">적용하기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

$(function(){

	$(document).on("focus", ".shc-htm-cb", function(){
		$(".shc-htm-cb").css("border","0");
		$(".shc-htm-cb").css("outline","0 none");
	});
	
	$(document).on("focusout", ".shc-htm-cb", function(){
			
	});

	
	// 닫기 버튼
	$(document).on("click", ".shc-htm-cb", function(){
		$("label svg path").remove();
		$("label input[name='5c5d5bfc74eabcfdafc3a2e7']").attr("checked", false);
		$("label svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
	});
	
	// 초기화 버튼
	$(document).on("click", ".shc-htm-rb", function(){
		$("label svg path").remove();
		$("label input[name='5c5d5bfc74eabcfdafc3a2e7']").attr("checked", false);
		$("label svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
		$(".shc-htm-xab").css("display","block");
		$(".shc-htm-ab").css("display","none");
	});
	
	// 체크버튼
	$(document).on("click",".sc-eTuwsz", function(){	
		
		if( $(this).children("input").is(":checked") == false ){
		
			$(this).children("svg").children("path").remove();
			$(this).children("input").attr("checked",true);
			$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zm-8.666 13.684l7.5-7.5L16.659 8l-6.325 6.326-2.992-2.984-1.175 1.175 4.167 4.167z"></path>');
													
		}else if( $(this).children("input").is(":checked") == true ){
			
			$(this).children("svg").children("path").remove();
			$(this).children("input").attr("checked",false);
			$(this).children("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
			
		}
		
		var inputCheck = 0;
		$("input[name='5c5d5bfc74eabcfdafc3a2e7']:checked").each(function() {
			inputCheck ++;
			
		});
		if( inputCheck == 3 ){
			$(".shc-htm-xab").css("display","none");
			$(".shc-htm-ab").css("display","block");
		}else {
			$(".shc-htm-xab").css("display","block");
			$(".shc-htm-ab").css("display","none");
		}
		inputCheck = 0;
		
		
		return false;
	});

	
	// 모달창 버튼에 카테고리 입력 - 모달창으로 데이터 전달 역할
	$(document).on("change","select[name='hobbyClassCategory']", function(){
		$("#hashtagModalButton").attr("data-category",  $(this).children(":selected").val());
		$("input[name='hobbyClassHashtag']").val("");
	});
	
	// 모달창 오픈이벤트 : 카테고리 별 해쉬태그 출력
	$(document).on('show.bs.modal','.modal', function(event) {
				
	    var category = $(event.relatedTarget).data('category');
	    
	    $("input[name='catchCategory']").val( $("select[name='hobbyClassCategory']").val() );
 		
	    if( $("input[name='catchCategory']").val() == '공예' ){
	    	
	    	$(".Crafts").css("display","block");
	    	
	    }else if( $("input[name='catchCategory']").val() == '요리' ){
	    	
	    	$(".Cooking").css("display","block");
	    	
	    }else if( $("input[name='catchCategory']").val() == '미술' ){
	    	
	    	$(".Art	").css("display","block");
	    	
	    }else if( $("input[name='catchCategory']").val() == '음악' ){
	    	
	    	$(".Music").css("display","block");
	    	
	    }else if( $("input[name='catchCategory']").val() == '운동' ){
	    	
	    	$(".Exercise").css("display","block");
	    	
	    }else if( $("input[name='catchCategory']").val() == '라이프 스타일' ){
	    	
	    	$(".Lifestyle").css("display","block");
	    	
	    } 
	});
	
	// 모달창 클로즈이벤트 : 부모창에 해쉬태그 전달
	$(document).on('hidden.bs.modal','.modal', function (e) {

		var hashtag = "";
		$("input[name='5c5d5bfc74eabcfdafc3a2e7']:checked").each(function() {
			  hashtag += $(this).next("span").text().trim()+", ";	  
			  //var test = $(this).val(); 
			  //alert("벨류값확인 : " + test);
			  $(this).attr('checked',false);
			  $(this).prev("svg").children("path").remove();
			  $(this).prev("svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
		});
		$("input[name='hobbyClassHashtag']").val( hashtag.substring(0,hashtag.length-2) );
		if( hashtag == "" || hashtag == null){
			$("input[name='hobbyClassHashtag']").val("");
		}
		
		$("label svg path").remove();
		$("label input[name='5c5d5bfc74eabcfdafc3a2e7']").attr("checked", false);
		$("label svg").append().html('<path fill="#3E4042" fill-rule="evenodd" d="M19 19H5V5h14v14zM5 3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2H5z"></path>');
		
		$(".Crafts").css("display","none");
		$(".Cooking").css("display","none");
		$(".Art	").css("display","none");
		$(".Music").css("display","none");
		$(".Exercise").css("display","none");
		$(".Lifestyle").css("display","none");
	});
	
	
});
</script>
