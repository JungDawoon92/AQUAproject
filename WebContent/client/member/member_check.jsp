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
<title>회원확인</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
function captureReturnKey(e) { 
	if(e.keyCode==13 && e.srcElement.type != 'textarea') 
		return false; 
}

function check_onclick() {
	theForm = document.checkform
	if(theForm.id.value==""){
		alert("아이디가 비어있습니다. 확인해주세요.");
		theForm.id.focus();
		return false;
	}else if(theForm.pass.value==""){
		alert("비밀번호가 비어있습니다. 확인해주세요.");
		theForm.pass.focus();
		return false;
	}
	theForm.submit();
}
</script>
</head>
<body>
	<jsp:include page="/client/include/nav.jsp"></jsp:include>
    <div class="container">
    <div class="row">
    	<div class="col-sm-12"><img class="img-responsive center-block" title="로그인로고" src="./img/aqua.png"></div>
    	<div class="col-sm-12"><h2 title="로그인" alt="로그인 페이지" >로그인</h2></div>
<form role="form" class="form-horizontal" name="checkform" action="./MemberLeaveView.me" method="post" onsubmit="return check_onclick()" onkeydown="return captureReturnKey(event)">
	<div class="form-group">
		<label class="control-label col-sm-2" for="id" title="아이디" alt="아이디 표시" >아이디:</label>
	<div class="col-sm-10">
		<input class="form-control keyStop" type="text" name="id" value="<%= id %>" placeholder="아이디" title="아이디" alt="<%= id %> 아이디 입력란" />
	</div></div>
	<div class="form-group">
			<label class="control-label col-sm-2" for="pass" title="비밀번호" alt="비밀번호 표시" >비밀번호:</label>
	<div class="col-sm-10">
			<input class="form-control keySet" type="password" name="pass" placeholder="비밀번호" title="비밀번호" alt="비밀번호 입력란" />
	</div></div>
	<br/><br/>
	<div class="form-group">
		<div class="col-sm-12">
			<input type="submit" id="submit" name="submit" class="submit" value="확인" title="확인" alt="확인 버튼"/>
	</div></div>
	<div class="form-group">
		<div class="col-sm-12">
			<input type="button" class="join" onclick="location.href='MemberViewAction.me'" value="취소" title="취소" alt="취소 버튼"/>
	</div></div>
</form>
</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>