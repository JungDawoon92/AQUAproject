<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.member.db.*" %>
<%
	String id = (String) request.getAttribute("id");
	String pass = (String) request.getAttribute("pass");
	String pageNo = null;
	String pageNoN = null;
	if (request.getAttribute("pageNo") != null) {
		pageNo = (String) request.getAttribute("pageNo");
	}
	if (request.getAttribute("pageNoN") != null) {
		pageNoN = (String) request.getAttribute("pageNoN");
	}
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin/module/Navbar.jsp" />
 <jsp:include page="membermodal.jsp" />
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container"
		style="background: whitesmoke; margin-top: 40px;">
		<h2><%=id%>
			님 비밀번호 수정
		</h2>
		<form action="memberpassmodi.ad" method="post" name="userpass">
			현재 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" id="Rpass" name="Rpass" onkeyup="passCheck()">
			<span id="psad"></span><br> 
			변경 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password"	id="modipass"><br> 
			변경 비밀번호 확인 <input type="password" name="pass" id="modipass2" onkeyup="passModi()">
			 <span id="pamo"></span><br> 
			 <input type="hidden" name="id"	value="<%=id%>" />
			  <input type="hidden" name="pageNo" value="<%=pageNo%>" />
			   <input type="hidden" name="pageNoN" value="<%=pageNoN%>" />
		</form>
		<button id="check">확인</button>
		<button type="button" id="cansel">취소</button>
	</div>
</body>


<script>
var repass = userpass.modipass.value
var pass = userpass.pass.value

	$(document).ready(function() {
		$("#check").click(function() {
			if(rpass != true){
				$("#check001").modal(); 
			}else if (repass == pase){
				$("#check002").modal(); 
			}else if(repass != pass){
				$("#check003").modal(); 
			}else{
				$("#check004").modal(); 
			}
			});
		$("#check01").click(function() {
			 $('#Rpass').focus();
		});
		$("#check02").click(function(){
			 $('#modipass').focus();
		})
		$("#check03").click(function() {
			document.userpass.submit();
		});
	});
	
	var rpass = false;
	var repass = null;
	var pase = "${pass}";

	function passCheck() {
		var pass3 = userpass.Rpass.value
		if (pass3 == pase) {
			document.getElementById('psad').innerHTML = "<font color=#0c0>비밀번호가 동일합니다.</font>"
			rpass = true;
		} else {
			document.getElementById('psad').innerHTML = "<font color=#f00>비밀번호가 동일하지 않습니다.</font>"
		}
	}
	function passModi() {
		var pass = userpass.modipass.value
		var passcheck = userpass.modipass2.value

		if (pass == passcheck) {
			document.getElementById('pamo').innerHTML = "<font color=#0c0>비밀번호가 동일합니다.</font>"
			rpass = true;
			repass = pass;
		} else if (passcheck == pase) {
			document.getElementById('pamo').innerHTML = "<font color=#f00>현재비밀번호와 동일한 비밀번호 입니다..</font>"
		} else {
			document.getElementById('pamo').innerHTML = "<font color=#f00>비밀번호가 동일하지 않습니다.</font>"
		}
	}

	$(document).ready(function() {
		$("#cansel").click(function() {
			$("#cansel01").modal();
		});
		$("#check01").click(function() {
			window.history.back();
		});
	});
</script>
</html>