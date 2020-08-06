<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = (String) session.getAttribute("userid");
	QnaBoardBean board = (QnaBoardBean) request.getAttribute("boarddata");
	int Page = (Integer) request.getAttribute("page");
%>
<c:set var="category" value="<%=board.getCATEGORY()%>" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	 <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="main.js" defer></script>
    <link href="./client/css/qna_modify.css" rel="stylesheet"/>
    <title>AQUA</title>
  </head>
  <body><jsp:include page="/client/include/nav.jsp"/><section class="wrap">
	<div class="container">
		<h1>Q&A게시판</h1>
	</div>
	<div class="container content_div">
		<h3>수정</h3>
		<form class="form-horizontal" action="./QnABoardModifyAction.qa" method="post" name="modifyform" id="frm">
			<input type="hidden" name="NUM" value="<%=board.getNUM()%>"> 
			<input type="hidden" name="ID" value="<%=id%>"> 
			<input type="hidden" name="page" value="<%=Page%>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="subject">제목</label>
				<div class="col-sm-10">
					<input class="form-control check_null" name="SUBJECT" type="text"
					 maxlength="40" id="subject" value="<%=board.getSUBJECT()%>"/>
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-2" for="sel1">분류</label>
				<div class="col-sm-4">
					<select id="select" name="CATEGORY" class="form-control" id="sel1">
        				<option>예약문의</option>
        				<option>취소문의</option>
        				<option>상품문의</option>
        				<option>기타</option>
      				</select>	
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control check_null content" name="CONTENT"
							rows="10" cols="67" maxlength="1050" placeholder="1000자 이내"><%=board.getCONTENT()%></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-8">
					<input type="button" id="btn" class="btn btn-info pull-right" value="수정">
					<input type="button" id="back" class="btn btn-default pull-right" value="이전">
				</div>
			</div>
		</form>
	</div>
	<br />
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	
	<script language="javascript">
	$(document).ready(function() {
		
		$("#select option").each(function(){
    		if($(this).val()=="${category}"){
      			$(this).attr("selected","selected"); 
 			}
  		});
		
		
		$("#btn").click(function() {
			var result = checkFields() == true ? true : false;
			if (result) {
				addboard();
			}
		});

		$("#back").click(function() {
			location.href = "javascript:history.go(-1)";
		});

	});

	function checkFields() {

		var result = true;
		var frm = $(".check_null");
		console.log(frm);
		
		frm.each(function(idx, ele) {
			if (ele.value.replace(/\s|　/gi, '') == '') {
				alert("값을 입력하세요");
				$(ele).focus();
				result = false;
				return false;
			}
			;
		});

		return result;

	}

	function addboard() {
		modifyform.submit();

	}
</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>