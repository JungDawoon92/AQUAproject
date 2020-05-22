<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.member.db.*" %>
<% MemberBean member = (MemberBean)request.getAttribute("member"); 
   String pageNo = (String)request.getAttribute("pageNo");
   String pageNoN = (String)request.getAttribute("pageNoN");
   String uid = (String)request.getAttribute("uid");
   %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin/module/Navbar.jsp" />
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원정보</title>
<style>
tr {text-align:center;}
h2 {text-align:center;}
</style>
<script>
function myFunction() {
	  var x = document.getElementById("viewpass");
	  if (x.innerHTML === "") {
	    x.innerHTML = "<%=member.getPass()%>";
	  } else {
	    x.innerHTML = "";
	  }
	}
</script>
</head>
<body>
<div class="container" style="background: whitesmoke; margin-top: 40px;" >       
  <table class="table">
    <thead> <h2><%=member.getName() %> 님의 회원 정보</h2> 
    </thead><tbody><tr>
        <td>회원 번호</td><td><%=member.getNum() %></td>
        </tr><tr>
        <td>이름</td><td><%=member.getName() %></td>
         </tr><tr>
        <td>아이디</td><td><%=member.getId() %></td>
         </tr><tr>
         <td>비밀번호</td><td><button type="button" onclick="myFunction()">비밀번호 보기</button>
         			<%if (pageNo != null){ %>
         			 <button type="button" onclick="location.href='PassModify.ad?id=<%=member.getId()%>&pageNo=<%=pageNo%>'">비밀변호 변경</button><br/>
         			 <%}else if(pageNoN != null){%>
         			<button type="button" onclick="location.href='PassModify.ad?id=<%=member.getId()%>&pageNoN=<%=pageNoN%>'">비밀변호 변경</button><br/>
         			<%}else{ %>
         			<button type="button" onclick="location.href='PassModify.ad?id=<%=member.getId()%>&pageNoN=<%=pageNoN%>'">비밀변호 변경</button><br/>
         			<%} %><span id="viewpass"></span></td>		 
         					  
         </tr><tr>
        <td>주소</td><td><%=member.getAddr() %>
        </tr><tr>
        <td>생일</td><td><%=member.getBirthday() %></td>
        </tr><tr>
 		 <td>성별</td><td><%=member.getGen() %></td>  
        </tr><tr>
        <td>이메일 주소</td><td><%=member.getEmail() %></td>
        </tr><tr>
        <td>휴대폰 번호</td><td><%=member.getPhone() %></td>
        </tr><tr>
        <td>가입일</td><td><%=member.getJoindate() %></td>
        </tr>
    </tbody>
  </table>
</div><div style="text-align:center; font-size:18px;">
<%if(pageNo !=null){%>
	<button type="button" onclick="location.href='member_list.ad?pageNo=<%=pageNo%>'">리스트로 돌아가기</button>
<% } else {%>
<button type="button" onclick="location.href='Membersearch.ad?pageNoN=<%=pageNoN%>&uid=<%=uid%>'">리스트로 돌아가기</button>
<%} %>
<button type="button" onclick="location.href='MemberModifyView.ad?id=<%=member.getId() %>'">회원 수정</button>
<button type="button" id="delete"> 회원 삭제</button>
	
	<!-- modal -->
	 <div class="modal fade" id="mydelete" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">알 림</h4>
					</div>
					<div class="modal-body">
						<p><%=member.getName() %> 님을 탈퇴시키시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="listreturn">탈퇴</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div></div></div></div>
					<script>
					$(document).ready(function(){
						$("#delete").click(function(){
							 $("#mydelete").modal();
			 			 });  
						 $( "#listreturn").click(function () {
							 location.href="Memberdelete.ad?id=<%=member.getId()%>&pageNo=<%=pageNo%>"
				  		});
					});
					</script></div></body></html>