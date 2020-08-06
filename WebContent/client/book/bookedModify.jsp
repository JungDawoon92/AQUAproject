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
<c:set var="iinf" value="${iInfo}" />
<c:set var="pinf" value="${pInfo}" />
<script type="text/javascript">
$(document).ready(function(){
    $("#counter").keyup(function(){
    	if($("#counter").val() < 1 || $("#counter").val() > ${pinf.cnt + iinf.cnt}){
    		$("#counter").val("${pinf.cnt}");
    	}
    });
});
</script>
	<jsp:include page="/client/include/nav.jsp"/>
<section class="wrap">
    <article class="container item-box">
	    <div class="row">
		    
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
			    		<li>남은 자리 : ${iinf.cnt}/${iinf.tot}</li><br>
		    		</ul>
		    		<form method="post" name="form" onsubmit="return false">
						<c:set var="pg" value="${page}"/>
		    			<input type="hidden" name="pno" value="${pinf.pno}"/>
		    			<input type="hidden" name="page" value="${pg}"/>
		    			<c:choose>
		    				<c:when test="${(userid ne null)&&(iinf.tot ne 0)}">
							<ul><li>인원 수정 : <input id="counter" type="number" name="getCnt" value="${pinf.cnt}" min="1" max="${pinf.cnt + iinf.cnt}"><br><small>(기존 예약하신 좌석 + 남은 좌석 수 까지 추가 수정 가능합니다.)</small></li>
							</ul><br>
			    			<br><br><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">수정</button>
								  <!-- Modal -->
								  <div class="modal fade" id="myModal" role="dialog">
								    <div class="modal-dialog">
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">정말로 수정하시겠습니까?</h4>
								        </div>
								        <div class="modal-body">
								          <p>수정을 원하시면 수정 버튼을,<br>원치 않으시면 취소 버튼을 눌러주세요.</p>
								        </div>
								        <div class="modal-footer">
								          <input type="hidden" name="pno" value="${pinf.pno}" />
								          <button title="예약버튼" type="button" class="btn btn-warning" 
											    					onclick="javascript:form.action='bookedUpdate.bk';form.submit()">수정</button>
								          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								        </div>
								      </div>
								    </div>
								  </div>
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
</section>    
<jsp:include page="/copyright.html"/>
</body>
</html>