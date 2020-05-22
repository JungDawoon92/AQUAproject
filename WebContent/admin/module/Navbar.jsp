<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
				<a class="navbar-brand">관리자</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="member_list.ad">회원 관리</a></li>
					<li><a href="BookListAdmin.ady">예약 관리 </a></li>
					<li><a href="ItemListAdmin.adx">상품 관리</a></li>
					<li><a href="AdminBoardListAction.adr">후기 관리</a></li>
					<li><a href="QnABoardList.adq">QnA 관리</a></li>
					<li><a href="AdminNoList.adn">공지사항 </a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="./Sign_out.ad"><span class="glyphicon glyphicon-user"></span> Sign out</a></li>
				</ul>
			</div>
		</div>
	</nav>