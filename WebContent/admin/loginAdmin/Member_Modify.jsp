<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.member.db.*" %>
<% MemberBean member = (MemberBean)request.getAttribute("member"); 
   String pageNo = (String)request.getAttribute("pageNo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/admin/module/Navbar.jsp" />
  <jsp:include page="membermodal.jsp" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원 정보 수정</title>
<style>
tr {text-align:center;}
h2 {text-align:center;}
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



function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

</script>

<body>
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
        <td>주소</td><td><input type="text" id="addr"name="addr" required ></td>
        </tr><tr>
        <td>생일</td><td><input type="date" id="datefield" name="birthday" required></td>
        </tr><tr>
 		 <td>성별</td><td>
 		 <% if(member.getGen().equals("남")){ %>
 		 <input type="radio" name="gen" value="남" checked="checked">남
		<input type="radio" name="gen" value="여">여 
		<%} else {%>	
		<input type="radio" name="gen" value="남" >남
		<input type="radio" name="gen" value="여" checked="checked">여 			  
		<%} %></td>  
        </tr><tr>
        <td>이메일 주소</td><td><input type="email" id="uemail" name="email" required></td>
        </tr><tr>
        <td>휴대폰 번호</td><td><input type="text" id="uphone" name="phone" onKeyup="inputPhoneNumber(this);" required min="13" maxlength="13"></td>
        <input type="hidden" id="pageNo" name="pageNo">
        </tr><tr><td>  
 		 <button type="button" id="moreturn" >리스트로 돌아가기</button></td>
		<td><button type="button" id="sendmodi">회원 수정</button></td>
 		 </tbody></table></form></div></body>
 		 
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
 		 </script>
 		  
 	
 		 </html>