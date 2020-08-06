<%@page import="aqua.module.ActionForward"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="client.book.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./client/css/bookedList.css" />
<title>AQUA</title>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${userid eq null}">
		<jsp:forward page="Index.me"/>	
	</c:if>
	<jsp:include page="/client/include/nav.jsp"></jsp:include>
<section class="wrap">
<div class="row">
<article class="container marg-bott">
	<section class="row">
		<div class="col-xs-12">
			<h2 class="pull-right">종료된 목록</h2>
		</div>
		<div class="col-xs-12">
			<ul class="nav nav-tabs">
			  <li><a href="MemberViewAction.me">내 정보</a></li>
			  <li><a href="bookedList.bk">예약된 목록</a></li>
			  <li class="active"><a href="#">종료된 목록</a></li>
			</ul>
			<br>
		</div>
	</section>
</article>
</div>	
<article id="bookedlist" class="container">
	<form name="form1" method="post">
	<div class="row">
		<div class="row non-pad-item">
			<div class="col-xs-12 col-sm-1 panel panel-default"><label class="pull-left"> No.</label></div>
			<div class="hidden-xs col-sm-2 panel panel-default"><span class="center-block">이름</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-block">그림</span></div>
			<div class="hidden-xs col-sm-3 panel panel-default"><span class="center-block">설명</span></div>
			<div class="hidden-xs col-sm-2 panel panel-default"><span class="center-block">기간</span></div>
			<div class="hidden-xs col-sm-2 panel panel-default"><span class="center-block">가격</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-blcok">신청일</span></div>
		</div>
	<c:set var="bkdList" value="${last_bListForPage}"/>
	<c:if test="${bkdList.size()==0 }">
		<div class="noItem"><h3>리스트가 없습니다.</h3></div>
	</c:if>
	<c:forEach var="bk" items="${bkdList}" varStatus="status">
	<c:set var="cost" value="${bk.price*bk.cnt}"/>
		<div class="itemBox row panel panel-default">
			<div class="col-xs-12 col-sm-3">
				<div class="no_pad col-xs-2 col-sm-4"><label> ${bk.pno}</label></div>
				<div id="iName" class="col-xs-10 col-sm-8"><strong>${bk.i_name}</strong></div>
			</div>
			<div class="col-xs-6 col-sm-1">
				<img class="thumbnail" alt="상품이미지" src="./img/${bk.img}">
			</div>
				<div id="content" class="col-xs-6 col-sm-3">${bk.content}</div>
				<div class="visible-xs col-xs-6"></div><div class="col-xs-6 col-sm-2">		
				<strong>${bk.st_date } ~<br>${bk.ed_date } (${1 }일)</strong><br>
				</div>
				<div class="visible-xs col-xs-6"></div><div class="col-xs-6 col-sm-2">
				${bk.price }원(x ${bk.cnt }명)<br>
				<span class="badge">합 ${cost }원</span>
				</div>
				<div class="visible-xs col-xs-6"></div>
				<div class="col-xs-6 col-sm-1">
					<strong>${bk.up_date }</strong>
				</div>
		</div>
	</c:forEach>
		<div class="row">
			<div class="col-xs-12">
				<br>
				<button type="button" class="btn btn-primary btn-lg pull-left" onclick='location.href="bookList.bk?page=1&ft=all"'>예약페이지</button>
			</div>
		</div>
	</div>
	</form>
</article>
<article class="container">
		<jsp:include page="pager.jsp"/>
</article>
</section>
<jsp:include page="/copyright.html"/>
</body>
</html>