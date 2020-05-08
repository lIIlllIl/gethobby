<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetHobby</title>
</head>
<body>
	<h2>Hello World!!</h2><br>
	
	<jsp:forward page="/main.jsp"/>
	
	
	<a href="/openhobbyclass/getPreview.jsp">클래스 개설 / 구매</a><br>
	<!-- <a href="/openhobbyclass/saveHobbyClassHashtagModal.jsp">해쉬태그 모달</a><br>
	<a href="/openhobbyclass/saveHobbyClassLessonModal.jsp">강의정보 모달</a><br> -->
	<a href="/user/addUser.jsp">회원가입</a><br>
	<a href="/user/captcha">로그인</a><br>
	<a href="/delivery/getDeliveryPurchase">배송정보</a><br>
	<a href="/delivery/addDeliveryInfo">배송정보입력</a><br>
	<a href="/user/changeUserCreator">크리에이터 전환</a><br>
	<a href="/user/listNotice/1">공지사항</a><br/>
	<a href="/searchhobbyclass/test.jsp">클래스 검색하기</a><br/>
	<a href="/searchhobbyclass/includeTest.jsp">클래스 Carousel</a><br/>
	<!-- <a href="/community/listCommunity">클래스 커뮤니티</a><br/> -->
	<a href="/user/getUser/">회원 정보조회</a>
</body>
</html>