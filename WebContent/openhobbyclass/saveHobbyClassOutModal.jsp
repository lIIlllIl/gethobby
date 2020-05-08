<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- //2020-02-24 Git Commit --%>
  <style>
  
  	.shc-saom-mc{
  		display: flex;
	    flex-direction: column;
	    width: 480px;
	    min-height: 345px;
	    max-height: 800px;
	    box-sizing: border-box;
	    box-shadow: rgba(41, 42, 43, 0.24) 0px 24px 32px;
	    padding: 0px 32px 32px 32px;
	    border-radius: 8px;
	    background: rgb(255, 255, 255);
  	}
  	.shc-saom-mh {
  		display: flex;
	    flex-direction: row;
	    margin-bottom: 16px;
	    flex: 0 0 auto;
	    padding: 0px;
	    justify-content: left;
	    border: 0;
	    outline: 0 none;
	    
  	}
  	.shc-saom-h3 {
  		white-space: pre-line;
	    word-break: break-all;
	    flex: 1 1 auto;
	    font-size: 24px;
	    font-weight: bold;
	    color: rgb(62, 64, 66);
	    line-height: 32px;
	    letter-spacing: -0.4px;
	    margin: 0px;
	    padding: 0px;
	    
  	}
  	.shc-saom-id {
  		font-size: 16px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 24px;
	    letter-spacing: -0.2px;
	    margin: 0px;
  	}
  	.shc-saom-oai-div {
  		display: flex;
	    flex-direction: row;
	    flex: 0 0 auto;
	    margin: 0px -8px;
	    padding: 0px;
	    border: 0;
	    outline: 0 none;
  	}
  	.shc-saom-ob {
  		flex: 1 0 auto;
	    margin: 16px 8px 0px;
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
    
  	}
  	.shc-saom-ob:focus{
  		outline: 0 none;
  		border: 0;
  		box-shadow: none;
  	}
  	.shc-saom-ob:hover{
  		background-color: rgb(221, 224, 226);
  	}
  	
  	.shc-saom-ib {
  		flex: 1 0 auto;
	    margin: 16px 8px 0px;
	    width: auto;
	    display: inline-flex;
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
  	}
  	.shc-saom-ib:hover {
  		background-color: rgb(253, 126, 20);
  		color: white;
  	}
  	.shc-saom-ib:focus {
  		outline: 0 none;
  		border: 0;
  		box-shadow: none;
  		
  	}
  	
  	.shc-saom-cb {
  		display: inline-flex;
	    vertical-align: middle;
	    color: rgb(62, 64, 66);
	    background-color: transparent;
	    width: 32px;
	    height: 32px;
	    flex: 0 0 auto;
	    padding: 0px;
	    border-radius: 3px;
	    transition: background-color 0.1s ease 0s;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    outline: none;
	    margin: 0px;
	    position: relative;
	    top: 32px;
	    right: 16px;
	    
  	}
  	.shc-saom-cb-is {
  		display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    flex: 0 0 auto;
	    color: rgb(62, 64, 66);
  	}
  	.shc-saom-cb:focus {
  		border: 0;
  		outline: 0 none;
  		
  	}
  	
  </style>
</head>
<body>

<!-- Button trigger modal -->
<button type="button" style="display: none" id="saveAndOutModalButton" class="btn btn-primary" data-toggle="modal" data-target="#saveAndOutModal" data-category="">
  Launch
</button>

<!-- Modal -->
<div class="modal fade" id="saveAndOutModal" tabindex="-1" role="dialog" aria-labelledby="saveAndOutModalLabel" aria-hidden="false">
  <div class="modal-dialog  modal-dialog-centered" role="document">
    <div class="modal-content shc-saom-mc">
      <div class="modal-header shc-saom-mh">
        <h3 class="shc-saom-h3" id="exampleModalLabel">
	        크리에이터 ${hobbyClass.user.nickName}님 
	  	 정말 나가실 거예요?
        </h3>
        <button type="button" class="close shc-saom-cb" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="shc-saom-cb-is">
	          <svg width="24" height="24" viewBox="0 0 24 24">
		          <defs>
			          <path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z">
			          </path>
		          </defs>
		          <use fill="black" fill-rule="evenodd" xlink:href="#close_svg__a">
		          </use>
	          </svg>
          </span>
        </button>
      </div>
      
      
      <div style="padding:0px; width:auto; height:auto;">
      	<div class="shc-saom-id">
      		다른 크리에이터 분들은 평균적으로 2시간 52분 안에 수요조사 페이지 작성을 끝내고 있어요.
      	</div>
      	<br/>
      	<div class="shc-saom-id">
      		크레에이터 넥네임님도 오늘, 마음먹은 김에 페이지 작성 완료하고 검토요청 해 버리자구요! 조금만 더 힘 내봐요 우리 🙆‍♀️
      	</div>
      </div>

     
      
      <div class="modal-footer shc-saom-oai-div">
        <button type="button" class="shc-saom-ob">
        	<span class="shc-saom-span">나갈래요</span>
        </button>
        <button type="button" class="shc-saom-ib" data-dismiss="modal" >
        <span class="shc-saom-span">계속 작성할래요</span>
        </button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

$(function(){

	$(document).on("click", ".shc-saom-ob", function(){
		var hashtag = $("input[name='hobbyClassHashtag']").val().split(',');    		
		var hashtagList = [];
		for(var i=0; i<hashtag.length; i++){
			hashtagList.push(hashtag[i].trim());
		}
		var markupStr1 = $('#summernote1').summernote('code');
		var markupStr2 = $('#summernote2').summernote('code');
		var resultList = changeHashtagCode(hashtagList); 

		// 기본정보 저장
		$.ajax(
				{
					url: "/hobbyclass/json/saveHobbyClassInfo",
					method: "POST",
					data: JSON.stringify({
							hobbyClassNo: $("input[name='hobbyClassNo']").val(),
    						hobbyClassName: $("input[name='hobbyClassName']").val(),
    						hobbyClassImage: $("input[name='hobbyClassImage']").val(),
    						category: $("select[name='hobbyClassCategory']").val(),
    						hobbyClassPrice: $("input[name='hobbyClassPrice']").val(),
    						hobbyClassIntro : $('#summernote1').summernote('code'),
    						hashtag: resultList
					}),
					dataType : "text" ,
					headers : {
						"Accept" : "application/json" ,
						"Content-Type" : "application/json"
					} ,
					success : function(JSONData, status) {
						// 강의정보 저장
						$.ajax(
					    				{
					    					url: "/hobbyclass/json/saveLesson",
					    					method: "POST",
					    					data: JSON.stringify({
					    							lessonNo: $("input[name='lessonNo']").val(),
					    							hobbyClass: {hobbyClassNo : $("input[name='hobbyClassNo']").val()},
					    							lessonVideo: $("input[name='lessonVideo']").val(),
					    							lessonTitle: $("input[name='lessonTitle']").val(),
					    							lessonProject: $("input[name='lessonProject']").val(),
					    							lessonIntro: $("input[name='lessonIntro']").val(),
					    							lessonImage: $("input[name='lessonImage']").val(),
					    							lessonContent: $('#summernote2').summernote('code')
					    					}),
					    					dataType : "text" ,
				        					headers : {
				        						"Accept" : "application/json" ,
				        						"Content-Type" : "application/json"
				        					} ,
					    					success : function(JSONData, status) {
					    						// 준비물 저장
					    						$.ajax(
					    					    				{
					    					    					url: "/hobbyclass/json/saveKit",
					    					    					method: "POST",
					    					    					data: JSON.stringify({
					    					    							hobbyClassNo: $("input[name='hobbyClassNo']").val(),
					    					    							kitName : $("input[name='kitName']").val(),
					    					    							kitIntro : $("input[name='kitIntro']").val(),
					    					    							kitPrice : $("input[name='kitPrice']").val(),
					    					    							kitImage : $("input[name='kitImage']").val()
					    					    							
					    					    						}),
					    					    					dataType : "json" ,
					    				        					headers : {
					    				        						"Accept" : "application/json" ,
					    				        						"Content-Type" : "application/json"
					    				        					} ,
					    					    					success : function(JSONData, status) {
					    					    						self.location = "/hobbyclass/getMyHobbyClassList";
					    					    					}//end of Call Back Function
					    						});//end of ajax
					    					}
						});//end of ajax
					}
		});//end of ajax
		
		
	});
	
	function changeHashtagCode(hashtagList){
		var resultList = [];
		for(var i=0; i<3; i++){
			
			if(hashtagList[i] == '플라워/꽃꽃이'){
				resultList.push("H00");
			}else if(hashtagList[i] == '뜨개질/위빙'){
				resultList.push("H01");
			}else if(hashtagList[i] == '가구/목공예'){
				resultList.push("H02");
			}else if(hashtagList[i] == '가죽공예'){
				resultList.push("H03");
			}else if(hashtagList[i] == '천연비누/화장품'){
				resultList.push("H04");
			}else if(hashtagList[i] == '디퓨저/향수'){
				resultList.push("H05");
			}else if(hashtagList[i] == '캔들/석고공예'){
				resultList.push("H06");
			}else if(hashtagList[i] == '도자공예'){
				resultList.push("H07");
			}else if(hashtagList[i] == '금속/악세사리공예'){
				resultList.push("H08");
			}else if(hashtagList[i] == '바느질/재봉틀'){
				resultList.push("H09");
			}else if(hashtagList[i] == '한식'){
				resultList.push("C00");
			}else if(hashtagList[i] == '양식'){
				resultList.push("C01");
			}else if(hashtagList[i] == '중식'){
				resultList.push("C02");
			}else if(hashtagList[i] == '일식'){
				resultList.push("C03");
			}else if(hashtagList[i] == '분식'){
				resultList.push("C04");
			}else if(hashtagList[i] == '베이킹'){
				resultList.push("C05");
			}else if(hashtagList[i] == '커피'){
				resultList.push("C06");
			}else if(hashtagList[i] == '와인'){
				resultList.push("C07");
			}else if(hashtagList[i] == '칵테일'){
				resultList.push("C08");
			}else if(hashtagList[i] == '디저트'){
				resultList.push("C09");
			}else if(hashtagList[i] == '디지털드로잉'){
				resultList.push("A00");
			}else if(hashtagList[i] == '아동미술'){
				resultList.push("A01");
			}else if(hashtagList[i] == '미술 회화'){
				resultList.push("A02");
			}else if(hashtagList[i] == '소묘/드로잉'){
				resultList.push("A03");
			}else if(hashtagList[i] == '만화/웹툰'){
				resultList.push("A04");
			}else if(hashtagList[i] == '애니'){
				resultList.push("A05");
			}else if(hashtagList[i] == '동양화'){
				resultList.push("A06");
			}else if(hashtagList[i] == '팝아트'){
				resultList.push("A07");
			}else if(hashtagList[i] == '조소'){
				resultList.push("A08");
			}else if(hashtagList[i] == '캘리그라피'){
				resultList.push("A09");
			}else if(hashtagList[i] == '보컬'){
				resultList.push("M00");
			}else if(hashtagList[i] == '랩'){
				resultList.push("M01");
			}else if(hashtagList[i] == '디제잉'){
				resultList.push("M02");
			}else if(hashtagList[i] == '미디/컴퓨터작곡'){
				resultList.push("M03");
			}else if(hashtagList[i] == '시창청음/화성악'){
				resultList.push("M04");
			}else if(hashtagList[i] == '피아노/키보드'){
				resultList.push("M05");
			}else if(hashtagList[i] == '기타'){
				resultList.push("M06");
			}else if(hashtagList[i] == '베이스기타'){
				resultList.push("M07");
			}else if(hashtagList[i] == '드럼'){
				resultList.push("M08");
			}else if(hashtagList[i] == '바이올린'){
				resultList.push("M09");
			}else if(hashtagList[i] == '퍼스널트레이닝(PT)'){
				resultList.push("E00");
			}else if(hashtagList[i] == '크로스핏'){
				resultList.push("E01");
			}else if(hashtagList[i] == '팔레티스'){
				resultList.push("E02");
			}else if(hashtagList[i] == '요가'){
				resultList.push("E03");
			}else if(hashtagList[i] == '스키'){
				resultList.push("E04");
			}else if(hashtagList[i] == '태권도'){
				resultList.push("E05");
			}else if(hashtagList[i] == '복싱'){
				resultList.push("E06");
			}else if(hashtagList[i] == '체조'){
				resultList.push("E07");
			}else if(hashtagList[i] == '파쿠르'){
				resultList.push("E08");
			}else if(hashtagList[i] == '스케이트보드'){
				resultList.push("E09");
			}else if(hashtagList[i] == '컴퓨터활용'){
				resultList.push("L00");
			}else if(hashtagList[i] == '외국어'){
				resultList.push("L01");
			}else if(hashtagList[i] == '수학'){
				resultList.push("L02");
			}else if(hashtagList[i] == '과학'){
				resultList.push("L03");
			}else if(hashtagList[i] == '국어'){
				resultList.push("L04");
			}else if(hashtagList[i] == '사회'){
				resultList.push("L05");
			}else if(hashtagList[i] == '논술'){
				resultList.push("L06");
			}else if(hashtagList[i] == '연기'){
				resultList.push("L07");
			}else if(hashtagList[i] == '뮤지컬'){
				resultList.push("L08");
			}else if(hashtagList[i] == '마술'){
				resultList.push("L09");
			}	
		}
		return resultList;
	}
	
	
	
});
</script>
