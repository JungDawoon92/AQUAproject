<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	QnaBoardBean board = (QnaBoardBean) request.getAttribute("boarddata");
	String id = (String) session.getAttribute("userid");
	int Page = (Integer) request.getAttribute("page");
%>
	
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	 <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <link href="./client/css/qna_list.css" rel="stylesheet"/>
    <title>AQUA</title>
  </head>
  <body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
	<form name="deleteform">
		<input type="hidden" name="NUM" value="<%=board.getNUM()%>">
		<input type="hidden" name="page" value="<%=Page%>">
	</form>
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">MVC 게시판</td>
		</tr>

		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>
			<td style="font-family: 돋음; font-size: 12"><%=board.getSUBJECT()%>
			</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">분류&nbsp;&nbsp;</div>
			</td>
			<td style="font-family: 돋음; font-size: 12"><%=board.getCATEGORY()%>
			</td>
		</tr>


		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<table border=0 width=490 height=250 style="table-layout: fixed">
					<tr>
						<td valign=top style="font-family: 돋음; font-size: 12"><%=board.getCONTENT()%></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5">
				<font size=2> 
					<% if(board.getRE_LEV() == 0) { %>
					<button type="button" onclick="location.href='./QnABoardReplyView.adq?num=<%=board.getNUM()%>&page=<%=Page%>'">답변</button>&nbsp;&nbsp;
					<% } else {}%>
					<button type="button" onclick="location.href='./QnABoardModify.adq?num=<%=board.getNUM()%>&page=<%=Page%>'">수정</button>&nbsp;&nbsp;
					
					<button type="button" onclick="location.href='./QnABoardList.adq?page=<%=Page%>'">목록</button>&nbsp;&nbsp;
				
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">삭제</button> 
					
					<% if(board.getRE_LEV() == 0) { %>
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">데이터 자체 삭제</button> 
					<% } else{} %>
					
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">게시글 삭제</h4>
								</div>
								<div class="modal-body">
									<p>정말로 삭제 하시겠습니까?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										onclick="clickDel(deleteform)">네</button>

									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">아니요</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal fade" id="myModal2" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">게시글 삭제</h4>
								</div>
								<div class="modal-body">
									<p>정말로 삭제 하시겠습니까?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										onclick="clickDel2(deleteform)">네</button>

									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">아니요</button>
								</div>
							</div>
						</div>
					</div>
					
			</font></td>
		</tr>
	</table>
	
	<br/>
	<br/>
	
	
	<%if (board.getRE_CHE() == 1) { %>
	<jsp:include page="qna_board_reply_view_admin.jsp">
		<jsp:param name="num" value="<%=board.getNUM()%>"/>
		<jsp:param name="page" value="<%=Page%>"/>
	</jsp:include>
	<%} %>
	
	
	<script>
	function clickDel(formName) {
		formName.action = "./QnABoardDeleteAction.adq";
		formName.method = "post";
		formName.submit();
	}
	
	function clickDel2(formName) {
		formName.action = "./QnABoardDeleteAction.adq?delete=all";
		formName.method = "post";
		formName.submit();
	}
</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>