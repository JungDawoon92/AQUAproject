<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="client.book.db.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="./client/css/bookList.css" />
    <title>AQUA</title>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/client/include/nav.jsp"/>
	
<section class="wrap">
   	<article class="container">
<script type="text/javascript">
$(document).ready(function(){
    $("#toggle").click(function(){
    	if($(window).width() < 815){
	    	if($("#filter-list").css("display")=="none"){
	        	$("#filter-list").css("display", "block");
	        }else{
	        	$("#filter-list").css("display", "none");
	        }
        }    	
    });
    $(window).resize(function(){
    	if($(window).width() < 815){
    		$("#filter-list").css("display", "none");
    	} else {
    		$("#filter-list").css("display", "block");
    	}
    });
});
</script>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
    <div class="row">
      <div class="col-lg-3">
		<div id="toggle" class="my-4">
        	<span class="filter-head">FILTER </span><span class="filter-btn">&#x25BC;</span>
        </div>
        <div id="filter-list" class="list-group">
	        <div class="filter">
	          <c:set var="pg" value="${(param.page eq null)? 1 : param.page}"/>
	          <c:set var="ftr" value="${(param.ft eq null)? 'all' : param.ft}"/>
	          <a href="?page=1&ft=all" title="ALL" class="${(param.ft eq 'all')?'active':''} list-group-item">전체보기</a>
	          <a href="?page=1&ft=spring" title="Spring" class="${(param.ft eq 'spring')?'active':''} list-group-item">봄테마</a>
	          <a href="?page=1&ft=summer" title="Summer" class="${(param.ft eq 'summer')?'active':''} list-group-item">여름테마</a>
	          <a href="?page=1&ft=autumn" title="Autumn" class="${(param.ft eq 'autumn')?'active':''} list-group-item">가을테마</a>
	          <a href="?page=1&ft=winter" title="Winter" class="${(param.ft eq 'winter')?'active':''} list-group-item">겨울테마</a>
	        </div>
			<div class="filter panel panel-default text-center">
			<form>
				  <small>모아보기</small>
		    	  <select class="form-control">
		    	  	<option value="3">3개씩 모아보기</option>
		    	  	<option selected="selected" value="6">6개씩 모아보기</option>
		    	  	<option value="12">12개씩 모아보기</option>
		    	  	<option value="24">24개씩 모아보기</option>
		    	  	<option value="36">36개씩 모아보기</option>
		    	  	<option value="48">48개씩 모아보기</option>
		    	  </select>
		    	  
		    	  
		    	  <small>출발일 필터</small>
		    	  <input type="date" class="form-control" min="${today}"/>
		    	  <small>복귀일 필터</small>
		    	  <input type="date" class="form-control" />
		          <button class="btn btn-primary">적용</button><button class="btn btn-default">해제</button>
		    </form>
	        </div>       
        </div>
      </div>
      <!-- /.col-lg-3 -->
      <div class="col-lg-9">

        <div class="row">
		<div class="col-sm-12"><h2 class="pull-right marg-bott">예약페이지</h2></div>
		<c:set var="iList" value="${iListForPage}"/>
		<c:forEach var="item" items="${iList}" varStatus="status">
		
          <div class="col-lg-4 col-md-6 mb-4">
            <div id="itemList" class="card" onclick='location.href="bookDetail.bk?ino=${item.no}&ft=${param.ft}&page=${param.page}";'>
              <img class="card-img-top" src="./img/${item.img}" title="상품이미지" alt="상품이미지">
              <div class="card-body">
                <h4 class="card-title">
                	<strong id="bookName">${item.i_name}</strong>
                </h4>
				
				<c:choose>
					<c:when test="${item.tot eq 0 }">
						<h5 class="cart-text"><strong>준비중인 상품입니다.</strong></h5>
					</c:when>
					<c:when test="${item.cnt eq 0 }">
						<h5 class="cart-text"><strong>품절된 상품입니다.</strong></h5>
					</c:when>
					<c:otherwise>
						<h5 class="cart-text">수량 : ${item.cnt}/${item.tot}</h5>
					</c:otherwise>
				</c:choose>
                <h5 class="card-text">가격 : ${item.price} 원</h5>
                <p class="card-text"> 여행기간 : ${item.st_date}~${item.ed_date}</p>
              </div>
            </div>
          </div>
  
		</c:forEach>
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
  </article>
  <jsp:include page="pager.jsp"/>
</section>
	<!-- Footer -->
  <footer class="container-fluid text-center bg-dark">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    <!-- /.container -->
  </footer>



</body>
</html>