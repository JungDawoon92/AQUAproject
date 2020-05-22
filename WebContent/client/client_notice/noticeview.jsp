<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="admin.notice.db.NoticeBean"%>

<%
	String id = (String) session.getAttribute("userid");
NoticeBean board = (NoticeBean) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>공지게시판글보기</title>
<style>
	.content_div a  {
  	text-decoration: none;
  	color: black;
	}
</style>


</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	<div class="container">
		<h2 align="left">Notice</h2>
	</div>
	<br />

	<div class="container content_div">
		<form name="formName" enctype="multipart/form-date" method="post">
			<input type="hidden" name="num" value="<%=board.getNum()%>">

			<table class="table" cellpadding="0" cellspacing="0">
				<tr>
					<td width="80">
						<div>제 목&nbsp; &nbsp;:</div>
					</td>
					<td align="left">${board.getSubject()}</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr>
					<td>
						<div align="left">내 용&nbsp; &nbsp;:</div>
					</td>
					<td>
						<table style="table-layout: fixed">
							<tr>
								<td valign=top style="height: 600px; overflow: auto;"><pre
										style="border: none; background-color: #FFFFFF; white-space: pre-wrap; padding-left: 0px; padding-top: 5px;">${board.getContent()}</pre>
								</td>
							</tr>
						</table>
					</td>
				</tr>



				<tr>
					<td>
						<div align="left">첨부파일</div>
					</td>
					<td><a href='./BoardFileDownload.no?file=${board.getFile()}'>${board.getFile()}</a>
					</td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5"><a href="./ClientBoardList.no?page=${spager}"
						class="btn btn-default pull-left" role="button">목록</a></td>
				</tr>
			</table>
		</form>
		<br />
		<footer class="container-fluid text-center">
			<p>Footer Text</p>
		</footer>
	</div>
</body>
</html>