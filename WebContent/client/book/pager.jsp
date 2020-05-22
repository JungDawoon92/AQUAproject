<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article class="container">
		<div id="pager" class="flex-container">
			<c:set var="pg" value="${(param.page == null) ? 1 : param.page}"/>
			<c:set var="ftr" value="${(param.ft == null)? all : param.ft }"/>
			<c:set var="stNum" value="${pg-(pg-1)%5}"/>
			<ul class="pager pagination">
				<li class="previous ${(pg<6)?'d-none':''}"><a href="?page=1&ft=${ftr}">&lt;&lt;</a></li>
				<li class="${(pg<6)?'d-none':''}"><a href="?page=${stNum==1? 1 :stNum-1}&ft=${ftr}">&lt;</a></li>
			<c:forEach var="i" begin="0" end="4">			
				<c:if test="${(stNum+i)<=endPage}">
					<li class="${(pg==stNum+i)?'active':''}"><a href="?page=${stNum+i}&ft=${ftr}">${stNum+i}</a></li>
				</c:if>
			</c:forEach>
				<li class="${(pg>=(endPage-(endPage-1)%5))?'d-none':''}"><a href="?page=${(endPage<stNum+5)?endPage:stNum+5}&ft=${ftr}">&gt;</a></li>
				<li class="next ${(pg>=(endPage-(endPage-1)%5))?'d-none':''}"><a href="?page=${endPage}&ft=${ftr}">&gt;&gt;</a></li>
			</ul>
		</div>
	</article>
</body>
</html>