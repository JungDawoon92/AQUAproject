<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.member.db.*" %>
<% MemberBean member = (MemberBean)request.getAttribute("member"); 
   String pageNo = (String)request.getAttribute("pageNo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <jsp:include page="membermodal.jsp" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원 정보 수정</title>
<style>
tr {text-align:center;}
h2 {text-align:center;}
.inb { width:40%; text-align:center;}
</style>
</head>
<script>
$(document).ready(function() {
    $('#addr').val('<%=member.getAddr()%>');
    $('#datefield').val('<%=member.getBirthday()%>');
    $('#uemail').val('<%=member.getEmail()%>');
    $('#uphone').val('<%=member.getPhone()%>');
    $('#pageNo').val('<%=pageNo%>');
});
</script>

<script>
var today = new Date();
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
document.getElementById("datefield").setAttribute("max", today);

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

<body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
<div class="container" style="background: whitesmoke; margin-top: 40px;" >       
  <form action="memberModify.ad" method="post" name="userInfo">
  <table class="table">
    <thead> <h2> <%=member.getName() %> 님의 회원 수정 </h2> 
    </thead>
    <tbody><tr>
        <td>이름</td><td><%=member.getName() %></td>
         </tr><tr>
        <td>아이디</td><td><%=member.getId() %><input type="hidden" name="id" value="<%=member.getId()%>"></td>
         </tr><tr>
        <td>주소</td><td><input type="text" id="addr" name="addr" class="inb"required ></td>
        </tr><tr>
        <td>생일</td><td><input type="date" id="datefield" name="birthday" required></td>
        </tr><tr>
 		 <td>성별</td><td>
 		 <% if(member.getGen().equals("남")){ %>
 		<label><input type="radio" name="gen" value="남" checked="checked">남</label> 
		<label><input type="radio" name="gen" value="여">여 </label> 
		<%} else {%>	
		<label>	<input type="radio" name="gen" value="남" style="width:0" >남</label> 
		<label><input type="radio" name="gen" value="여" style="width:0;" checked="checked">여 	</label> 		  
		<%} %></td>  
        </tr><tr>
        <td>이메일 주소</td><td><input type="email" id="uemail" name="email" class="inb" onkeyup="emailcheck()" required></td>
        </tr><tr>
        <td>휴대폰 번호</td><td><input type="text" id="uphone" name="phone" class="inb"  required min="13" maxlength="13"></td>
        </tr><tr><td>  
 		 <button type="button" id="moreturn" >리스트로 돌아가기</button></td>
		<td><button type="button" id="sendmodi">회원 수정</button></td>
 		 </tbody></table></form></div>
</section><jsp:include page="/copyright.html"/>		 
</body>
 		 
 		 <script>
 		$(document).ready(function() {
 			$("#sendmodi").click(function() {
 				if(userInfo.addr.value == ""){
 					$("#sendaddr").modal(); 
 				}else if(userInfo.phone.value == ""){
 					$("#sendphone").modal(); 
 				}else if(userInfo.birthday.value > today ){
 					$("#sendoverbirthday").modal(); 
 				}else if(userInfo.birthday.value == null){
 					$("#sendoverbirthday").modal(); 
 				}else if(userInfo.email.value == "" ){
 					$("#sendemail").modal(); 
 				}
 				else{
 					$("#sendmodi2").modal(); 
 				}
 				});
 			$("#sendaddr").click(function(){
 				 $( "#addr" ).focus();
 			})
 			$("#sendphone").click(function(){
 				 $( "#uphone" ).focus();
 			})
 			$("#sendoverbirthday").click(function(){
 				 $( "#datefield" ).focus();
 			})
 			$("#sendemail").click(function(){
 				 $( "#uemail" ).focus();
 			})
 			$("#subsend_1").click(function() {
 				document.userInfo.submit();
 			});

 		});
 		
 		$("#uphone").keyup(function(event){
			var inputVal=$(this).val();
			$(this).val(inputVal.replace(/[^0-9]/g, "")
					.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3")
					.replace("--", "-")); });
		
		
		$("#addr").bind("keyup",function(){
			 re = /[~!@\#$%^&*\()\-=+_']/gi; 
			 var temp=$("#addr").val();
			 if(re.test(temp)){ 
			 $("#addr").val(temp.replace(re,"")); } });
		
		$("#uemail").bind("keyup",function(){
			 var a = $('#uemail').val().replace(/ /gi, '');
		        $('#uemail').val(a);
		});
		
 		 </script>
 		  
 	
 		 </html>