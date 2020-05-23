<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="client.book.db.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="./client/css/bookDetail.css" />
	<title>AQUA</title>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/client/include/nav.jsp"></jsp:include>
    <article class="container item-box">
	    <div class="row">
		    <c:set var="iinf" value="${iInfo}" />
		    <c:set var="pinf" value="${pInfo}" />
		    <div class="col-sm-7" >
		    	<img class="img-responsive" title="상품이미지" alt="상품이미지" src="./img/${iinf.img}">
		    </div>
			<div class="col-sm-5">
				<div class="col-sm-1"></div>
				<div class="col-sm-11">
					<h2>${iinf.i_name}</h2><br>
		    		<ul>
			    		<li>비용 : ${iinf.price}</li><br>
			    		<li>분류 : ${iinf.categ}</li><br>
			    		<li>상세 내용 : ${iinf.content}</li><br>
			    		<li>여행 기간 : ${iinf.st_date} ~ ${iinf.ed_date}</li><br>
			    		<li>남은 수량 : ${iinf.cnt}/${iinf.tot}</li><br>
		    		</ul>
		    		<form method="post" name="form" onsubmit="return false">
		    			<c:set var="pg" value="${page}"/>
		    			<input type="hidden" name="page" value="${pg}"/>
		    			<c:choose>
		    				<c:when test="${(userid ne null)&&(iinf.tot ne 0)}">
							<ul><li>기존 인원 : <input type="number" name="getCnt" value="${pinf.cnt}" min="1" max="${pinf.cnt + iinf.cnt}" disabled></li></ul><br>
			    			<br><br><button type="button" class="btn btn-warning" onclick='javascript:form.action="bookedModify.bk?pno=${pinf.pno}";form.submit()'>수정</button>
							</c:when>
		    				<c:when test="${(iinf.tot ne 0)&&(userid eq null)}">
							<span class="pull-right"><h4><strong>수정을 원하시면 로그인 해주세요.</strong></h4></span><br><br>		    				
		    				</c:when>
		    			</c:choose>
		    			<button type="button" class="btn btn-default pull-right" onclick='location.href="bookedList.bk?page=${(pg eq null)?1:pg}"'>목록</button>		    			
					</form>
	    		</div>			
			</div>
		</div>
    </article>
    <footer class="container-fluid text-center">
    </footer>
</body>
</html>