<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String) session.getAttribute("userid");
	QnaBoardBean board = (QnaBoardBean) request.getAttribute("boarddata");
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
	<link href="./client/css/qna_list.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <title>AQUA</title>
  </head>
  <body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
	<form action="./QnABoardModifyAction.adq" method="post" name="modifyform">
		<input type="hidden" name="NUM"	value="<%=board.getNUM()%>"> 
		<input type="hidden" name="ID" value="<%=id%>">
		<input type="hidden" name="page" value="<%=Page%>">
		
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td height="16" style="font-family: 돋음; font-size: 12">
					<div align="center">제 목</div>
				</td>
				<td><input name="SUBJECT" size="50" maxlength="100"
					value="<%=board.getSUBJECT()%>"></td>
			</tr>
			
			<tr>
				<td height="16" style="font-family: 돋음; font-size: 12">
					<label for="select">분류</label>
				</td>
				<td>
					<%if(board.getRE_LEV() == 1){ %>
					<input name="CATEGORY" value="답변" />
					<% } else {%>
					<div>
						<select name="CATEGORY" id="select">
							<option value="예약문의">예약문의</option>
							<option value="취소문의">취소문의</option>
							<option value="상품문의">상품문의</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<%} %>
				</td>
			</tr> 
			
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="CONTENT" cols="67" rows="15"><%=board.getCONTENT()%></textarea>
				</td>
			</tr>


			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><font size=2> 
				<a class="black" href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; 
				<a class="black" href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
		</table>
	</form>
	<script language="javascript">
		function modifyboard() {
			modifyform.submit();
		}

		$(document).ready(function() {

			$("#select option").each(function() {
				if ($(this).val() == "${category}") {
					$(this).attr("selected", "selected");
				}
			});
		});
	</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>