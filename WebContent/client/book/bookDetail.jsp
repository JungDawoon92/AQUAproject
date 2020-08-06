<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="client.book.db.*" %>
<%
	Item it = (Item)request.getAttribute("itemInfo");
%>
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
<script type="text/javascript">
$(document).ready(function(){
    $("#counter").keyup(function(){
    	if($("#counter").val() < 1 || $("#counter").val() > <%=it.getCnt()%>){
    		$("#counter").val("");
    	}
    });
});
</script>


	<jsp:include page="/client/include/nav.jsp"></jsp:include>
<section class="wrap">
    <article class="container item-box">
	    <div class="row">
		    <div class="col-lg-7" >
		    	<img class="img-responsive" title="상품이미지" alt="상품이미지" src="./img/<%=it.getImg()%>">
		    </div>
			<div class="col-lg-5">
				<div class="col-lg-1"></div>
				<div class="col-lg-11">
					<h2><%=it.getI_name() %></h2><br>
		    		<ul>
			    		<li>비용 : <%=it.getPrice() %> 원</li><br>
			    		<li>분류 : <%=it.getCateg() %></li><br>
			    		<li>상세 내용 : <%=it.getContent() %></li><br>
			    		<li>여행 기간 : <%=it.getSt_date() %> ~ <%=it.getEd_date() %></li><br>
			    		<li>남은 자리 : <%=it.getCnt() %>/<%=it.getTot() %></li><br>
		    		</ul>
		    		<form method="post" name="form" onsubmit="return false">
		    			<input type="hidden" name="item_no" value="<%=it.getNo()%>"/>
		    			<% if(session.getAttribute("userid")!=null && it.getCnt()!=0 && it.getTot()!=0) {%>
							<ul><li>인원 선택 : <input id="counter" type="number" name="getCnt" value="1" min="1" max="<%=it.getCnt()%>"></li></ul><br>
			    			<br><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">예약</button>
								  <!-- Modal -->
								  <div class="modal fade" id="myModal" role="dialog">
								    <div class="modal-dialog">
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">정말로 예약하시겠습니까?</h4>
								        </div>
								        <div class="modal-body">
								          <p>예약을 원하시면 예약확인 버튼을,<br>원치 않으시면 취소 버튼을 눌러주세요.</p>
								        </div>
								        <div class="modal-footer">
								          <button title="예약버튼" type="button" class="btn btn-primary" 
											    					onclick="javascript:form.action='bookedAddAction.bk';form.submit()">예약확인</button>
								          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								        </div>
								      </div>
								    </div>
								  </div>
		    			<% } else if (it.getTot()==0){ %>
							<span class="pull-right"><h4><strong>해당 상품은 등록대기중 입니다.</strong></h4></span><br><br>		    				
		    			<% } else if (it.getCnt()==0){ %>
		    				<span class="pull-right"><h4><strong>품절된 상품입니다.</strong></h4></span><br><br>
		    			<% } else if (it.getTot()!=0 && session.getAttribute("userid")==null) {%>
							<span class="pull-right"><h4><strong>예약을 원하시면 로그인 해주세요.</strong></h4></span><br><br>		    				
		    			<% } %>
		    			<button type="button" class="btn btn-default pull-right" onclick='location.href="bookList.bk?<%=request.getAttribute("prev")%>"'>돌아가기</button>		    			
					</form>
	    		</div>			
			</div>
		</div>
    </article>
</section>
<jsp:include page="/copyright.html"/>
</body>
</html>