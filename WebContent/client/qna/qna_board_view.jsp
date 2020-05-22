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
  	 <link href="./client/css/qna_view.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="main.js" defer></script>
    <title>AQUA</title>
  </head>
  <body>

	<jsp:include page="/client/include/nav.jsp" />
	<div class="container">
		<h1>Q&A게시판</h1>
	</div>
	<div class="container content_div">
	<form name="deleteform">
		<input type="hidden" name="NUM" value="<%=board.getNUM()%>">
		<input type="hidden" name="page" value="<%=Page%>">
	</form>
	<table class="table table-striped table-bordered">
		<tr>
			<td class="col-xs-3 col-sm-1">
				<div>제 목&nbsp;&nbsp;</div>
			</td>
			<td>
				<%=board.getSUBJECT()%>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>분류&nbsp;&nbsp;</div>
			</td>
			<td><%=board.getCATEGORY()%>
			</td>
		</tr>

		<tr class="line">
			<td colspan="2"></td>
		</tr>
		
		<tr>
			<td>
				<div>내 용</div>
			</td>
			<td class="content-td">
				<div class="content"><p><%=board.getCONTENT()%></p></div>	
			</td>
		</tr>
		
		<tr class="line">
			<td colspan="2"></td>
		</tr>
		
		<tr class="menu">
			<td colspan="5">
				<%if(id.equals(board.getID())) {%>
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='./QnABoardModify.qa?num=<%=board.getNUM()%>&page=<%=Page%>'">수정</button>&nbsp;&nbsp;
				<% } else {}%>	
				<%if(board.getRE_LEV() == 0){ %>
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='./QnABoardWrite.qa'">글쓰기</button>&nbsp;&nbsp;
				<%} else{} %>
				<button type="button" class="btn btn-default btn-sm pull-right" onclick="location.href='./QnABoardList.qa?page=<%=Page%>'">목록</button>&nbsp;&nbsp;
				<%if (board.getRE_LEV() == 0) {%>
				<button type="button" class="btn btn-info btn-sm " data-toggle="modal" data-target="#myModal">삭제</button> <%	} else {} %>
			</td>
		</tr>
		
	</table>
	</div>
	
	
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
					<button type="button" class="btn btn-primary" onclick="clickDel(deleteform)">네</button>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function clickDel(formName) {
		formName.action = "./QnABoardDeleteAction.qa";
		formName.method = "post";
		formName.submit();
	}
</script>
</body>
</html>