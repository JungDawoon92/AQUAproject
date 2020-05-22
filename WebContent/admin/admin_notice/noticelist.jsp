<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="admin.notice.db.NoticeBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
	<title>관리자모드 게시판</title>

</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

	<div class="container">
      <h1>관리자모드</h1>
    </div>
    <div class="container content_div">
    
		<table class="table table-striped table-hover">
		   <thead>
			 <tr>
              <th>글번호</th>
              <th>제목</th>
              <th>작성일</th>
            </tr>
           </thead>

			<c:forEach items="${boardlist}" var="board">
				<tr>
					<td><c:out value="${board.getNum()}" /></td>
					<td><a href="./AdminNoDetailAction.adn?num=${board.getNum()}&pager=${page}">
						<c:out value="${board.getSubject()}" />
					</a></td>
					<td><c:out value="${board.getDate()}" /></td>
				</tr>
			</c:forEach>
		</table>

	<button class="btn btn-default pull-right" onclick="location.href='./AdminNoWriteAction.adn'">글쓰기</button>
	<br>
	
	<div class="container content_div" align=center>	
			<ul class="pager pagination">
			<c:if test="${prevpage != 0}">
				<li class="previous"><a href="./AdminNoList.adn?page=${prevpage}">&lt;&lt;</a></li>
			</c:if>
			<c:choose>
				<c:when test="${page <= 1}">
					<li class="disabled"><a href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					 <li><a href="./AdminNoList.adn?page=${page - 1}">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:choose>
				<c:when test="${a == page}">
					<li class="active"><a href="#">${a}</a></li>
				</c:when>
				<c:otherwise>
					 <li><a href="./AdminNoList.adn?page=${a}">${a}</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${page >= maxpage}">
					<li class="disabled"><a href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					 <li><a href="./AdminNoList.adn?page=${page + 1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${nextpage ne 0}">
				<li class="next"><a href="./AdminNoList.adn?page=${nextpage}">&gt;&gt;</a></li>
			</c:if>
			</ul>
		</div>
	</div>
</body>
</html>