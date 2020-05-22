<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = null;
	if (session.getAttribute("userid") != null) {
		id = (String) session.getAttribute("userid");
	}
	
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	List boardList = (List) request.getAttribute("boardlist");
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	int beginpage = ((Integer) request.getAttribute("beginpage")).intValue();
	int prevpage = ((Integer) request.getAttribute("prevpage")).intValue();
	int nextpage = ((Integer) request.getAttribute("nextpage")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	
%>
<c:set var="boardList" value="<%=boardList%>" />
<c:set var="nowpage" value="<%=nowpage%>" />
<c:set var="endpage" value="<%=endpage%>" />
<c:set var="beginpage" value="<%=beginpage%>" />
<c:set var="prevpage" value="<%=prevpage%>" />
<c:set var="nextpage" value="<%=nextpage%>" />
<c:set var="id" value="<%=id%>" />
<c:set var="maxpage" value="<%=maxpage%>" />

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
    <link href="./client/css/qna_list.css" rel="stylesheet"/>
    <script src="main.js" defer></script>
    <title>AQUA</title>
  </head>
  <body>
	<jsp:include page="/admin/module/Navbar.jsp" />
	<div class="container">
		<h1>관리자 Q&A게시판</h1>
		<font size=2>글 개수 : ${listcount}</font>
	</div>	
	<br />
	<div class="container content_list">
		<div class="row">
			<div class="col-sm-12">
			<form action="./QnABoardMultiDelete.adq?page=${nowpage}" method="post" name="frm">
				<table class="table table-hover">
					<thead>
					<tr>
					<th class="col-sm-1">선택<input id="allCheck" type="checkbox" /></th>
					<th class="col-sm-1">번호</th>
					<th class="col-sm-1">분류</th>
					<th class="col-sm-5">제목</th>
					<th class="col-sm-1">작성자</th>
					<th class="col-sm-1">날짜</th>
					<th class="col-sm-2">답변상태</th>
					</tr>
					</thead>
					
					
					<c:forEach var="list" items="${boardList}">
						<tr class="qnalist" >
							<td>
								<input class="RowCheck" name="RowCheck" type="checkbox" value="${list.NUM}" />
							</td>
							<td>${list.NUM}</td>
							<td>${list.CATEGORY}</td>
							<td>
								<div>
									<c:if test="${list.DEL == 'Y'}">
										<a class="black" href="./QnABoardDetailAction.adq?num=${list.NUM}&page=${nowpage}">[해당 게시글은 삭제되었습니다.]</a>
									</c:if>
									<c:if test="${list.DEL == 'N'}">
										<a class="black" href="./QnABoardDetailAction.adq?num=${list.NUM}&page=${nowpage}">${list.SUBJECT}</a>
									</c:if>
								</div>
							</td>
							<td>
								<div>${list.ID}</div>
							</td>
							<td class="hidden-xs">
								<div>${list.DATE}</div>
							</td>
							<td>
								<c:if test="${list.RE_LEV == 0 }">
									<c:if test="${list.RE_CHE == 1}">
										<button type="button" class="btn">답변완료</button>
									</c:if>
									<c:if test="${list.RE_CHE == 0}">
										<button type="button" class="btn btn-default">답변대기</button>
									</c:if>	
								</c:if>		
							</td>
						</tr>
					</c:forEach>
					
					<tr class="page">
						<td colspan="8">
							<div id="pager" class="flex-container" >
								<ul class="pager pagination">
									<c:if test="${nowpage > 1}">
										<li class="previous"><a href="./QnABoardList.adqpage=1">FIRST</a></li>
									</c:if>
									<c:if test="${prevpage != 0}">
										<li><a href="./QnABoardList.adq?page=${prevpage}">Prev</a></li>
									</c:if>
									<c:forEach var="i" begin="${beginpage}" end="${endpage}" step="1">
										<c:choose>
											<c:when test="${nowpage == i}">
												<li class="active"><a href="javascript:void(0)">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="./QnABoardList.adq?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${nextpage != 0}">
										<li><a href="./QnABoardList.adq?page=${nextpage}">Next</a></li>
									</c:if>
									<c:if test="${nowpage != maxpage}">
										<li><a href="./QnABoardList.adq?page=${maxpage}">END</a></li>
									</c:if>
								</ul>
							</div>				
						</td>
					</tr>
					<tr id="write">
						<td colspan="8">
							<input type="button" id="delete" class="btn btn-default pull-right" value="선택 삭제">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	<br />

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	
	<script>
	$(document).ready(function(){
	    //체크박스 전체 선탣&해제
	    $('#allCheck').click(function(){
	         if($("#allCheck").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
	    });
	    
	    $('#delete').click(function(){
	    	if(confirm("삭제하시겠습니까?")){
	    		var chk_obj = document.getElementsByName("RowCheck");
	    		var chk_leng = chk_obj.length;
	    		var checked = 0; 
	    		
	    		for(i=0;i<chk_leng;i++){
	    			if(chk_obj[i].checked==true){
	    				checked +=1;
	    			}

	    		}
	    		if(checked==0){
	    			
	    			alert("선택한정보가 없습니다.");
	    			return false;
	    		}else{
	    			
	    			frm.submit();

	    		}

	        }else{
	            return false;
	        }
	    });
	 
	});﻿
	</script>
	
</body>
</html>