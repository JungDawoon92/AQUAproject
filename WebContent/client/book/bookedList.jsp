<%@page import="aqua.module.ActionForward"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="client.book.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./client/css/bookedList.css" />
<title>AQUA</title>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${userid eq null}">
		<jsp:forward page="Index.me"/>	
	</c:if>
	<jsp:include page="/client/include/nav.jsp"/>
<section class="wrap">
<div class="row">
<article class="container marg-bott">
	<section class="row">
		<div class="col-xs-12">
			<h2 class="pull-right">예약된 목록</h2>
		</div>
		<div class="col-xs-12">
			<ul class="nav nav-tabs">
			  <li><a href="MemberViewAction.me">내 정보</a></li>
			  <li class="active"><a href="#">예약된 목록</a></li>
			  <li><a href="lastBookedList.bk">종료된 목록</a></li>
			</ul>
			<br>
		</div>
	</section>
</article>
</div>	
<article id="bookedlist" class="container">
	<form name="form1" method="post" onsubmit="return false">
	<div class="row">
		<div class="row non-pad-item">
			<div class="visible-xs panel panel-default"><label class="pull-left"><input title="전체선택박스" type="checkbox" id="checkall1"/> 전체선택</label></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><label class="center-block"><input title="전체선택박스" type="checkbox" id="checkall2"/> No</label></div>
			<div class="hidden-xs col-sm-2 panel panel-default"><span class="center-block">이름</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-block">그림</span></div>
			<div class="hidden-xs col-sm-3 panel panel-default"><span class="center-block">설명</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-block">기간</span></div>
			<div class="hidden-xs col-sm-2 panel panel-default"><span class="center-block">가격</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-block">신청일</span></div>
			<div class="hidden-xs col-sm-1 panel panel-default"><span class="center-block">비고</span></div>
		</div>
	<c:set var="bkdList" value="${bListForPage}"/>
	<c:if test="${bkdList.size()==0 }">
		<div class="noItem"><h3>리스트가 없습니다.</h3></div>
	</c:if>
	<c:forEach var="bk" items="${bkdList}" varStatus="status">
	<c:set var="cost" value="${bk.price*bk.cnt}"/>
		<div class="itemBox row panel panel-default">
			<div class="col-xs-12 col-sm-3">
				<div class="no_pad col-xs-2 col-sm-4"><label><input type="checkbox" title="체크박스" name="chk_list" value="${bk.pno}"/> ${bk.pno}</label></div>
				<div id="iName" class="col-xs-10 col-sm-8"><strong>${bk.i_name}</strong></div>
			</div>
			<div class="col-xs-6 col-sm-1">
				<img class="thumbnail" title="상품이미지" alt="상품이미지" src="./img/${bk.img}">
			</div>
				<div id="content" class="content col-xs-6 col-sm-3">${bk.content}</div>
				<div class="visible-xs col-xs-6"></div><div class="col-xs-6 col-sm-1">		
				<strong>${bk.st_date }<br>~<br>${bk.ed_date }</strong><br>
				</div>
				<div class="visible-xs col-xs-6"></div><div class="col-xs-6 col-sm-2">
				${bk.price }원(x ${bk.cnt }명)<br>
				<span class="badge">합 ${cost }원</span>
				</div>
				<div class="visible-xs col-xs-6"></div>
				<div class="col-xs-6 col-sm-1">
					<span class="visible-xs">신청일 :</span><strong>${bk.up_date }</strong>
				</div>
				<div class="col-xs-12 col-sm-1">
					<input type="hidden" name="page" value="${(param.page eq null)?1:param.page}" />
					<button class="btn btn-warning pull-right" onclick='javascript:form1.action="bookedModify.bk?pno=${bk.pno}";form1.submit()'>수정</button>
					<button class="btn btn-info pull-right" onclick='javascript:form1.action="bookedDetail.bk?pno=${bk.pno}";form1.submit()'>상세</button>
				</div>
		</div>
	</c:forEach>
	<script type="text/javascript">
	    $(document).ready(function(){
	        $("#checkall1").click(function(){
	            if($("#checkall1").prop("checked")){
	            	$("#checkall2").prop("checked",true);
	                $("input[name=chk_list]").prop("checked",true);
	            }else{
	            	$("#checkall2").prop("checked",false);
	                $("input[name=chk_list]").prop("checked",false);
	            }
	        });
	        $("#checkall2").click(function(){
	            if($("#checkall2").prop("checked")){
	            	$("#checkall1").prop("checked",true);
	                $("input[name=chk_list]").prop("checked",true);
	            }else{
	            	$("#checkall1").prop("checked",false);
	                $("input[name=chk_list]").prop("checked",false);
	            }
	        });
	        $("input[type=checkbox]").click(function(){
	        	var chk = false;
	            $("input[name=chk_list]").each(function(){
	    			if(this.checked){
	    				chk = !chk;
	    				return false;
	    			} 		
	            });
	            if(!chk){
	            	$("#cbtn").prop("disabled", true);
	            } else {
	            	$("#cbtn").prop("disabled", false);
	            }
	        });
	    });
    </script>
		<div class="row">
			<div class="col-xs-12">
				<h2 class="pull-lift"></h2>
			</div>
			<div class="col-xs-12">
				<c:set var="pr" value="${prev}"/>
				<button type="button" class="btn btn-primary btn-lg pull-left" onclick='location.href="bookList.bk?page=1&ft=all"'>예약페이지</button>
				<c:if test="${userid ne null}">
					<button id="cbtn" disabled="disabled" type="button" class="btn btn-danger btn-lg pull-right" title="한 개 이상 선택 시 취소버튼이 활성화됩니다." data-toggle="modal" data-target="#bookCanc">예약취소</button>
					  <!-- Modal -->
					  <div class="modal fade" id="bookCanc" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title pull-left">선택항목을 정말로 예약취소 하시겠습니까?</h4>
					        </div>
					        <div class="modal-body">
					          <p>예약취소를 하시게 되면 되돌릴 수 없습니다. 그래도 하시겠습니까?</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" title="예약취소버튼" class="btn btn-danger pull-left" onclick='javascript:form1.action="bookedDelAction.bk";form1.submit()'>예약취소</button>
					          <button type="button" class="btn btn-default pull-right" data-dismiss="modal">뒤로</button>
					        </div>
					      </div>
					    </div>
					  </div>
				</c:if>
			</div>
		<c:if test="${userid eq null}">
			<div class="pull-right"><h4>수정을 원하시면 로그인 해주시기 바랍니다.</h4></div>
		</c:if>
		</div>
	</div>
	</form>
</article>
  <jsp:include page="pager.jsp"/>
</section>
<jsp:include page="/copyright.html"/>
</body>
</html>