<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.notice.db.NoticeBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>게시판</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/client/include/nav.jsp"></jsp:include>
	<div class="container content_div">
		<form action="./AdminNoModifyAction.adn" method="post"
			name="modifyform" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=board.getNum()%>">
			<table cellpadding="0" cellspacing="0">
				<tr align="center" valign="middle">
					<td colspan="5">MVC 게시판</td>
				</tr>
				<tr>
					<td>
						<div align="center">제 목</div>
					</td>
					<td><input class="form-control" name="subject" type="text"
						required minlength="2" maxlength="50" size="150"
						value="<%=board.getSubject()%>"
						style="margin-bottom: margin-top: 17px; margin-bottom: 17px;"></td>
				</tr>
				<tr>
					<td>
						<div align="center">내 용</div>
					</td>
					<td><textarea class="form-control content" name="content"
							rows="35" required minlength="2" maxlength="6000"
							style="margin-bottom: 17px;"><%=board.getContent()%></textarea></td>
				</tr>

				<tr>
					<td>
						<div align="center"
							style="padding-bottom: 20px; padding-right: 20px;">파일</div>
					</td>
					<td><input name="file" type="file" /></td>
				</tr>


				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="5"><a href="javascript:history.go(-1)"
						class="btn btn-default pull-right btn-sm">취소</a>&nbsp;&nbsp; <a
						href="javascript:modifyboard()"
						class="btn btn-default pull-right btn-sm"
						style="margin-right: 11px;">완료</a>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</form>
</body>
</html>