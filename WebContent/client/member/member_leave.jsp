<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./client/css/member.css" />
<title>마이 페이지</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
</head>
<body>
<jsp:include page="/client/include/nav.jsp"></jsp:include>
	<div role="article" class="container">
    <h2 title="마이페이지" alt="마이페이지 보기" class="maintitle">마이 페이지</h2>
    <h3 title="회원 탈퇴" alt="회원 탈퇴 페이지">회원 탈퇴</h3>
    <div class="container" title="탈퇴 여부 확인"
     alt="안녕하세요 <%=id %> 회원님. 정말로 탈퇴하시겠습니까? 탈퇴를 원하지 않는 경우 취소를 눌러주세요. 감사합니다.">
		<h3>안녕하세요 <%=id %> 회원님</h3><br/><h4>정말로 탈퇴하시겠습니까?</h4>
		탈퇴를 원하지 않는 경우 취소를 눌러주세요.<br/>
		감사합니다.<br/><br/>
	</div>
		<input class="submit" type="button" name="back" value=" 취 소 " 
		onclick="location.href='./MemberViewAction.me';" title="취소" alt="탈퇴 취소 버튼" />
		<input class="retry" type="button" name="success" value="탈퇴하기" 
		onclick="location.href='./MemberLeaveAction.me';" title="탈퇴하기" alt="탈퇴하기 버튼" />
	</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>