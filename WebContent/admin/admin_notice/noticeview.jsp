<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="admin.notice.db.NoticeBean"%>

<%
	String id = (String) session.getAttribute("adminid");
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
<script>
	function clickDel(formName) {
		formName.action = "./AdminNoDeleteAction.adn";
		formName.method = "post";
		formName.submit();
	}
</script>

</head>
<body>
	<jsp:include page="/admin/module/Navbar.jsp" />
	<div class="container">
		<h2 align="left">관리자모드</h2>
	</div>
	<br />

	<div class="container content_div">
		<form name="formName" enctype="multipart/form-date" method="post"
			action="./AdminNoModifyAction.adn">
			<input type="hidden" name="num" value="${board.getNum()}">

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
					<td><a
						href='./AdminNoFileDownloadAction.adn?file=${board.getFile()}'>${board.getFile()}</a>
					</td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5"><a href="./AdminNoList.adn?page=${spager}"
						class="btn btn-default pull-left" role="button">목록</a>
						<button type="button" class="btn btn-default pull-right btn-sm"
							data-toggle="modal" data-target="#exampleModal">삭제</button>&nbsp;&nbsp;
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">게시물을 삭제하시겠습니까</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											onclick="clickDel(formName)">삭제하기</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소하기</button>
									</div>
								</div>
							</div>
						</div>
						<button type="button"
							class="btn btn-default pull-right btn-sm modify_botton"
							onclick="location.href='./AdminNoModifySee.adn?num=${board.getNum()}'"
							style="margin-right: 17px;">수정</button></td>
				</tr>
			</table>
		</form>
	</div>

	<br />

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
</body>
</html>