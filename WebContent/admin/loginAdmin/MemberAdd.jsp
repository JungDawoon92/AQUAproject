<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="admin.member.db.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="membermodal.jsp" />
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
p {	text-align: center; }

h2 { text-align: center; }

#center { display: block; margin: 0 auto; }

table { height: 100px; 	margin: auto; text-align: center;	cellspacing: 10px; }
</style>

<script>
var list = new Array();
<c:forEach var="member" items="${ids}">
list.push("${member}");
</c:forEach>	

document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

var rname = false;
var rpass = false;
var emailt = false;
var rename = null;
var repass = null
var repass2 = null;
var today = new Date();

$(document).ready(function() {
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("birthday").setAttribute("max", today);
});

function idCheck(){
	
    var id = userInfo.id.value
    
    if(id.length<=3){
    	document.getElementById('alram').innerHTML="<font color=#f00> 아이디는 4글자 이상입니다.</font>"
    	document.getElementById('uid').focus();  	
    }
    else{
    	
    for (var i = 0; i < list.length; i++) {
        if (id.toLowerCase() == list[i].toLowerCase()) {
            document.getElementById('alram').innerHTML="<font color=#f00> 이미 가입된 아이디입니다.</font>"
            document.getElementById('uid').focus();
           
            return false;
        }}
        
    if (!id) {
    	document.getElementById('alram').innerHTML="<font color=#f00> 아이디를 입력하지 않았습니다..</font>"
    	document.getElementById('uid').focus();
    	
    } 
    else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
        document.getElementById('alram').innerHTML="<font color=#f00>한글 및 특수문자는 아이디로 사용하실 수 없습니다.</font>"
        document.getElementById('uid').focus();
        return false;
    }
    else {
    	 rename = id;
    	 document.getElementById('alram').innerHTML="<font color=#0c0>사용가능한 아이디 입니다.</font>" 
    	 rname = true;
    	 document.getElementById('pass').focus();
    }
    }
}

function passCheckn(){
	var passn = userInfo.pass.value
	
	 if(passn.length<=7){
		 document.getElementById('passaa').innerHTML="<font color=#f00>비밀번호는 8글자 이상 입니다..</font>" 
	 }else{
		 document.getElementById('passaa').innerHTML=""
	 }
}

function passCheck(){
	 var pass = userInfo.pass.value
	 var passcheck = userInfo.passcheck.value
	
	if(pass == passcheck){
		 document.getElementById('passa').innerHTML="<font color=#0c0>비밀번호가 동일합니다.</font>" 
		 repass == passcheck;
		 repass2 == pass;
		 rpass = true;
	 }else if((pass == "")|| (passcheck=="")){
		 document.getElementById('passa').innerHTML="<font color=#0c0> </font>" 
		 rpass = false;
	 }
	 else {
		 document.getElementById('passa').innerHTML="<font color=#f00>비밀번호가 동일하지 않습니다.</font>" 
		 rpass = false;
	 }
}

function emailcheck() {		
	var email = document.getElementById("uemail").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(exptext.test(email)==false){
				 document.getElementById('emails').innerHTML="<font color=#f00>이메일 형식과 맞지 않습니다..</font>" 
		return false;
	}else{
		 document.getElementById('emails').innerHTML=" " 
		 emailt = true;
	}

}
</script>

<title>Insert title here</title>
</head>
<body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
	<div class="container" style="background: whitesmoke;">
		<h2>회원 등록</h2>
	<div>
		<form action="MemberAdd.ad" method="post" name="userInfo" id="userInfo">
		<table class="table">
		<tr><th></th>
			<th>아이디</th>
			<th style="width: 50%;"><input type="text" name="id" id="uid"
				min="4" maxlength="10" placeholder="4글자 이상 입력하세요" required autofocus>
				<button type="button" onclick="idCheck()">중복확인</button><span id="alram"></span></th>
			</tr><tr><th></th>
				<th>비밀번호</th>
				<th><input type="password" id="pass" name="pass" min="8"
					maxlength="20" onkeyup="passCheckn()" placeholder="8글자 이상 입력하세요"
					required><span id="passaa"></span></th>
			</tr><tr><th></th>
				<th>비밀번호 확인</th>
				<th><input type="password" id="passcheck" min="8" maxlength="20" onkeyup="passCheck()" placeholder="8글자 이상 입력하세요"
							required><span id="passa"></span></th>
			</tr><tr><th></th>
				<th>이름</th>
				<th><input type="text" id="uname" name="name" required></th>
			</tr><tr><th></th>
				<th>주소</th>
				<th><input type="text" id="uaddr" name="addr" required></th>
			</tr><tr><th></th>
				<th>휴대폰번호</th>
				<th><input type="tel" id="uphone" name="phone"
					onkeyup="inputPhoneNumber(this)" min="13" maxlength="13" required></th>
			</tr><tr><th></th>
				<th>생일</th>
				<th><input type="date" id="birthday" name="birthday" min="1900-01-01" max="9999-12-31" required></th>
			</tr><tr><th></th>
				<th>이메일</th>
				<th><input type="email" id="uemail" name="email1" onkeyup="emailcheck()" required><span id="emails"></span></th>
			</tr><tr><th></th>
				<th>성별</th>
				<th><label><input type="radio" name="gen" value="남" checked="checked">남 </label>
				    <label><input type="radio" name="gen" value="여">여</label></th>
			</tr></table>
			<p style="text-align: center;">
				<button type="button" value="회원 등록" id="addmember">회원 등록</button>
				<button type="button" id="myBtn">다시쓰기</button>
				<button type="button" id="return">취소</button>
			</p></form></div></div>
</section><jsp:include page="/copyright.html"/>
</body>
		<script>
		$(document).ready(function() {
		 	$("#addmember").click(function() {
		 		if(!userInfo.id.value){
		 	 		$("#memberid").modal();
		 		}else if(rename != userInfo.id.value){
					$("#memberid2").modal();
				}else if(rname == false){
		 			$("#memberid2").modal();
		 		}else if(rpass != true){
		 			$("#memberpass").modal();
		 		}else if(repass != repass2){
		 			$("#memberpass").modal();
		 		}else if(userInfo.name.value == ""){
		 			$("#membername").modal();
		 		}else if(userInfo.addr.value == ""){
		 			$("#memberaddr").modal();
		 		}else if(userInfo.phone.value == ""){
		 			$("#sendphone").modal();
		 		}else if(userInfo.birthday.value > today){
		 			$("#memberbirth").modal();
		 		}else if(userInfo.birthday.value == ""){
		 			$("#memberbirth").modal();
		 		}else if(emailt != true){
		 			$("#memberemail").modal();
		 		}else{
		 			$("#sendmember").modal();
		 		}});
		 		$("#memberid").click(function(){
		 			$( "#uid" ).focus();
				});
		 			$("#memberid2").click(function(){
		 				$( "#uid" ).focus();
				});
		 			$("#memberpass").click(function(){
		 				$( "#passcheck" ).focus();
				});
		 			$("#membername").click(function(){
		 				$( "#uname" ).focus();
				});
		 			$("#memberaddr").click(function(){
		 				$( "#uaddr" ).focus();
				});
		 			$("#memberbirth").click(function(){
		 				$( "#datefield" ).focus();
				});
		 			$("#sendphone").click(function(){
		 				$( "#phone" ).focus();
				});
		 			$("#memberemail").click(function(){
		 				$( "#uemail" ).focus();
				});
		 			$("#sendmembersub").click(function(){
		 				document.userInfo.submit();
				});		
		 			$("#sendercan").click(function(){
		 				
		 			});		
				});

				$("#uphone").keyup(function(event){
					var inputVal=$(this).val();
					$(this).val(inputVal.replace(/[^0-9]/g, "")
							.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3")
							.replace("--", "-")); });
				
				$("#uname").bind("keyup",function(){
					 re = /[0-9]|[~!@\#$%^&*\()\-=+_']/gi; 
					 var temp=$("#uname").val();
					 if(re.test(temp)){ 
					 $("#uname").val(temp.replace(re,"")); } });
				
				$("#uname").bind("keyup",function(){
					 var a = $('#uname').val().replace(/ /gi, '');
				        $('#uname').val(a);
				});
				
				$("#uaddr").bind("keyup",function(){
					 re = /[~!@\#$%^&*\()\-=+_']/gi; 
					 var temp=$("#uaddr").val();
					 if(re.test(temp)){ 
					 $("#uaddr").val(temp.replace(re,"")); } });
			
				$("#uid").bind("keyup",function(){
					 var a = $('#uid').val().replace(/ /gi, '');
				        $('#uid').val(a);
				});
				
				$("#pass").bind("keyup",function(){
					 var a = $('#pass').val().replace(/ /gi, '');
				        $('#pass').val(a);
				});
				$("#passcheck").bind("keyup",function(){
					 var a = $('#passcheck').val().replace(/ /gi, '');
				        $('#passcheck').val(a);
				});
				$("#uemail").bind("keyup",function(){
					 var a = $('#uemail').val().replace(/ /gi, '');
				        $('#uemail').val(a);
				});
				
				if(self.name != 'reload'){
					self.name = 'reload';
					self.location.reload(true);
				}
				else self.name = "";
				
				</script></html>