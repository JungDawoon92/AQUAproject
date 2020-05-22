<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="client.member.db.*"%>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");
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
    <link rel="stylesheet" href="./client/css/bookedList.css" />
	<title>마이 페이지</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
</head>
<body>
<jsp:include page="/client/include/nav.jsp"></jsp:include>
    <article role="article" class="container no-color">
    <div class="row">
    <article class="container marg-bt-14">
		<ul class="nav nav-tabs pull-left">
		  <li class="active"><a href="#">내 정보</a></li>
		  <li><a href="bookedList.bk">예약된 목록</a></li>
		  <li><a href="lastBookedList.bk">종료된 목록</a></li>
		</ul>
		<h2 class="no-margin pull-right">내 정보</h2>
		<br><hr>
	</article>
	
	<section class="container">
				<div class="row">
				<div class="col-sm-2">아이디 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getId() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">이름 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getName() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">성별 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getGen() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">이메일 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getEmail() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">생년월일 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getBirthday() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">전화번호 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getPhone() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/><div class="row"><div class="col-sm-2 subject">주소 : </div><div class="col-sm-9"><input class="form-control" type="text" value="<%=member.getAddr() %>" disabled /></div><div class="col-sm-1"></div></div>
				<br/>
		<div class="row">
				<div class="col-sm-6" >
					<input type="submit" class="modify" value="내 정보 수정" onclick="location.href='MemberModifyView.me';" title="내 정보 수정하기" alt="내 정보 수정 버튼">
				</div>
				<div class="col-sm-6" >
					<input type="button" class="leave" value="탈퇴하기" onclick="location.href='MemberCheckView.me';" title="탈퇴하기" alt="탈퇴하기 버튼">
				</div>
		</div>
	</section>
</div>
</article>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>