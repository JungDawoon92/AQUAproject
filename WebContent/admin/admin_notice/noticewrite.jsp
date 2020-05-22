<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>공지게시판 글쓰기</title>

</head>
<body>
	<jsp:include page="/client/include/nav.jsp"></jsp:include>

	<div class="container content_div">
		<form method="post" action="./AdminNoAddAction.adn" name="boardForm"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${adminid}">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div align="center">제 목</div>
					</td>

					<td><input class="form-control" name="subject" type="text"
						required minlength="2" maxlength="50" size="150"
						placeholder="50자 이내로 입력하세요." autofocus="autofocus"
						style="margin-top: 17px; margin-bottom: 17px;" /></td>
				</tr>

				<tr>
					<td>
						<div align="center">내 용</div>
					</td>
					<td><textarea class="form-control" name="content" rows="35"
							id="comment" placeholder="내용을 입력하세요" required minlength="2"
							maxlength="6000" style="margin-bottom: 17px;"></textarea></td>
				</tr>
				<tr>
					<td>
						<div align="center"
							style="padding-bottom: 20px; padding-right: 20px;">파일 첨부</div>
					</td>
					<td style="padding-bottom: 20px;"><input name="file"
						type="file" /></td>
				</tr>
				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="5"><a href="./AdminNoList.adn"
						class="btn btn-default pull-left" role="button">목록</a>
						<button type="submit" class="btn btn-info pull-right">POST</button></td>
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