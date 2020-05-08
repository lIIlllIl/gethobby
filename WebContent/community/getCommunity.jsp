<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>GetHobby</title>
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

	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- Header -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css">
	<link rel="stylesheet" href="/resources/css/kyung/listCommunity.css">
	<link rel="stylesheet" href="/resources/css/min/getCommunity.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<script type="text/javascript">
		$(function(){
			// 클래스 소개 > 커뮤니티 이거 클릭 시 
			$('.community-select-top-span-tag').on('click', function(){
				var checkNavigation = $(this).find('.community-top-hidden-value').val();
				var hobbyClassNo = $('.hidden-hobby-class-number').val();
				console.log(checkNavigation);
				console.log(hobbyClassNo);
				if( checkNavigation == '0' ) {
					// 클래스 소개로 navigation
					self.location = "/searchHobbyClass/getSearchHobbyClassIntro?hobbyClassNo=" + hobbyClassNo;
				}
				else if ( checkNavigation == '1' ) {
					self.location = "/community/listCommunity?hobbyClassNo=" + hobbyClassNo;
				}
			})
			
			/* $(document).on('click', '.report-update-and-so-on-inner-span', function(){
				var checkNavigation = $(this).find('.right-report-update-delete-hidden-input-tag').val();
				var articleNo = $('.hidden-article-number').val();
				var hobbyClassNo = $('.hidden-hobby-class-number').val();
				
				console.log(checkNavigation);
				
				if ( checkNavigation == '0' ) {
					self.location = "/community/getCommunityArticleUpdateView?articleNo="+articleNo;
				}
				else if ( checkNavigation == '1' ) {
					// 해당 글 삭제 
					self.location = "/community/getCommunityArticleUpdateView?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;
				}
			}) */
			
			$(document).on('click', '.button-reply', function(){
			var checkNavigation = $(this).find('.right-report-update-delete-hidden-input-tag').val();
			var articleNo = $('.hidden-article-number').val();
			var hobbyClassNo = $('.hidden-hobby-class-number').val();
			//alert('checkNavigation-'+checkNavigation);
			
			console.log(checkNavigation);
			
			if ( checkNavigation == '0' ) {
				self.location = "/community/getCommunityArticleUpdateView?articleNo="+articleNo;
			}
			else if ( checkNavigation == '1' ) {
				//alert('삭제');
				// 해당 글 삭제 
				swal.fire({
      			  title: '삭제완료!',
      			  text: 'Get취미IfYouCAN',
      			  imageUrl: '/resources/image/logo/logo-favicon.png'
      			});
				self.location = "/community/deleteCommunityArticle?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;
			}
		})
			
	})//function
	</script>
	
	</head>
	<!-- ////////////////////////////////////////////////////////========HEAD 끝==========/////////////////////////////////////////////////////////// -->
	<body class="listcommunity-body-class">
	
		<!-- toolbar -->
		<jsp:include page="/common/header.jsp"/>
			
	
			<!-- ////// INPUT HIDDEN /////////// -->	
			<input type="hidden" class="hidden-hobby-class-number"  value="${article.hobbyClass.hobbyClassNo}">	
			<input type="hidden" class="hidden-article-number" value="${article.articleNo }" />
				
	<div class="container mt-5">
		<div class="community-select-top-inner-div mb-5">
			<span class="community-select-top-span-tag">
				클래스 소개 
				<input type="hidden" class="community-top-hidden-value" value="0" />
			</span>
			<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
		</div>
		<div class="community-select-top-inner-div mb-5">
			<span class="community-select-top-span-tag">
				커뮤니티
				<input type="hidden" class="community-top-hidden-value" value="1" />
			</span>
			<img src="/resources/image/min/small-right-arrow.jpg" class="a-tag-right-arrow-img">
		</div>
		<div class="community-select-top-inner-div mb-5">
			<span class="community-select-top-span-last-tag">
				${ !empty article.user.nickName ? article.user.nickName : article.user.name } 님의 글
			</span>
		</div>
		
		
			<div class="outer_div">
				<div class="article_div">
				
					<div class="lcmnt-winf">
					
						<span class="lcmnt-fpiod">
							<c:if test="${article.user.profileImage == null }">
								<img src="/resources/image/logo/unnamed.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
							<c:if test="${atricle.user.profileImage != null }">
								<img src="/resources/image/logo/${article.user.profileImage}" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
						</span>
						
						<div class="lcmnet-ah34-od">
							<!-- default가 닉네임 => 없으면 이름으로 표시 -->
							<h3 class="lcmnt-ah3">
							<c:if test="${article.user.nickName == null}">
								${article.user.name}
							</c:if>
							<c:if test="${article.user.nickName != null}">
								${article.user.nickName}
							</c:if>
							</h3>
							
							<h4 class="articleRegDate lcmnt-ah4">${article.regDate}</h4>
						</div>
						
						
							<c:if test="${sessionScope.user.userId == article.user.userId &&purchaseCheck == '1'}">
							<div class="button-reply-wrapper"> <!-- 사망각 -->
								<button class="replyUpdate_Button btn btn-basic m-1  button-reply ">수정
									<input type="hidden" class="right-report-update-delete-hidden-input-tag" value="0" />
								</button>
								<button class="replyDelete_Button btn btn-outline-basic m-1  button-reply">삭제
									<input type="hidden" class="right-report-update-delete-hidden-input-tag" value="1" />
								</button>	
							</div> <!-- 사망각 -->
							</c:if>
					</div>	
					
						<div class="article_Content lcmnt-span">${article.articleContent}</div>

							<br/><hr/>
						<!--  <div class="report-update-and-so-on">    lcmnt-ah4--> 
							
<!-- 							<span class="report-update-and-so-on-inner-span mr-2">
									수정
									<input type="hidden" class="right-report-update-delete-hidden-input-tag" value="0" />
								</span>
								<span class="report-update-and-so-on-inner-span mr-2">
									삭제
									<input type="hidden" class="right-report-update-delete-hidden-input-tag" value="1" />
								</span> -->
							
							<!-- 
							<c:if test="${sessionScope.user.userId != article.user.userId }">
								<span class="report-update-and-so-on-inner-span mr-2">
									신고
								</span>
							</c:if>
							-->
						<!--  </div>-->
						
					</div>	
				</div>
					
					
					<h1 class="reply-count-h1-tag mb-2">
						댓글
						<small class="reply-count-real-text-small-tag">
							<!-- 실제 reply totalCount로 변경할 것 -->
							${totalCountCommunityReply}개
						</small>
					</h1>
					
					<div class="outer_reply_div" >
					<div class="reply_div" >

					<c:forEach var="reply" items="${replyList }">
					<!-- 작성 정보 -->
					<div class="lcmnt-winf mt-3">	
						<!-- 프로필 사진 -->
						<span class="lcmnt-fpiod">
						<c:if test="${reply.user.profileImage == null }">
							<img src="/resources/image/logo/unnamed.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 40px; width: 40px;">
						</c:if>
						<c:if test="${reply.user.profileImage != null }">
							
							<img src="/resources/image/logo/${reply.user.profileImage }" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 40px; width: 40px;">
						</c:if>
						</span>
						
						<!-- default가 닉네임 => 없으면 이름으로 표시 -->
						<div class="lcmnet-ah34-od">	
							<h6 class="replyUserName lcmnt-ah3">
							<c:if test="${reply.user.nickName == null}">
							${reply.user.name }
							</c:if>
							<c:if test="${reply.user.nickName != null}">
							${reply.user.nickName }
							</c:if>
							</h6>
							
							<h6 class="replyRegDate lcmnt-ah4  mb-1">${reply.regDate}</h6>						
						</div>
					</div>
						<span class="reply_Content lcmnt-span">${reply.replyContent}</span>
						<hr/>
					</c:forEach>	

						
					</div><!-- reply_div 끝 -->

				</div><!-- article_div -->
				
			</div><!-- outer_div 끝 -->
			</div>
	</div> 
	<br/><br/><br/>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>