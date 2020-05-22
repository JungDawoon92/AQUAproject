<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.item.db.ItemBIZ, admin.item.db.ItemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.setHeader("Cache-Control", "No-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./admin/css/adminStyle.css" />
  <style type="text/css">
  	img.itemimg { width:150px; height:150px; max-width:100%; }
  	.modalbtn { display: none; }
  	.txt_line { width:70px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }

  </style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

<div class="container">
  <h2>상품 리스트</h2>
    <div class="col-xs-12">
		<button type="button" id="add-btn" class="btn btn-default pull-right">상품 등록</button>
	</div>
	<div id="list-view" class="borderCK col-xs-9">
		<div class="row">
			<div class="borderCK col-xs-1">${"번호"}</div>
			<div class="borderCK col-xs-2">${"카테고리"}</div>
			<div class="borderCK col-xs-1">${"제목"}</div>
			<div class="borderCK col-xs-1">${"수량"}</div>
			<div class="borderCK col-xs-1">${"가격"}</div>
			<div class="borderCK col-xs-2">${"출발 날짜"}</div>
			<div class="borderCK col-xs-2">${"도착 날짜"}</div>
			<div class="borderCK col-xs-2">${"등록 날짜"}</div>
		</div>
	</div>
		
	<div class="container">
		<div class="row">
		<c:forEach var="i" items="${itemlist}" begin="0" end="${itemlist.size()}" step="1" >
			<fmt:parseDate var="strPlanDate" value="${i.getSt_date() }" pattern="yyyy-MM-dd" />
			<fmt:parseNumber var="strDate" value="${strPlanDate.time / (1000*60*60*24) }" integerOnly="true" />
			<fmt:parseDate var="endPlanDate" value="${i.getEd_date() }" pattern="yyyy-MM-dd" />
			<fmt:parseNumber var="endDate" value="${endPlanDate.time / (1000*60*60*24) }" integerOnly="true" />
			<div id="item-div" class="borderCK col-xs-9" onclick='location.href="./ItemDetailAdmin.adx?no=${i.getNo() }&pages=${paging.currentPageNo}"' >
				<div class="row">
					<div class="col-xs-1">${i.getNo()}</div>
					<div class="col-xs-1">${i.getCateg()}</div>
					<div class="col-xs-1 txt_line">${i.getI_name()}</div>			
					<div class="col-xs-1">${i.getTot() }</div>
					<div class="col-xs-1">${i.getPrice() }</div>
					<div class="col-xs-2">${ i.getSt_date() }</div>
					<div class="col-xs-2">${ i.getEd_date() }</div>
					<div class="col-xs-2">${ i.getUp_date() }</div>
				</div>
			</div>
			<div class="borderCK col-xs-3">
			<button class="btn btn-default" onclick='location.href="./ItemModifyAdmin.adx?no=${i.getNo()}&&pages=${paging.currentPageNo}"'>수정</button>
			<button class="btn btn-default deleteBtn" data-pnum="${i.getNo() }">삭제</button>
			</div>
		</c:forEach>
		</div>
	</div>

	<button type="button" class="modalbtn" id="modal-btn" onclick="document.getElementById('modal-div').style.display='block'"></button>
	<div id="modal-div" class="modal">
	  <div class="container modal-content">
	    <h2>정말 삭제하시겠습니까?</h2>
	    <button type="button" class="btn" id="deleteTRUE-btn">확인</button>
	    <button type="button" class="cancelbtn" id="cancel-btn">취소</button>
	  </div>
	</div>
	
	
	<jsp:include page="/admin/module/PagingModule.jsp" flush="true">
		<jsp:param name="servletPath" value="${servletPath}" />
		<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
		<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>
	
</div>
<script type="text/javascript">
document.getElementById("add-btn").onclick = function () {
	location.href="./ItemAddAdmin.adx?pages=${paging.currentPageNo}";
}

document.getElementById("cancel-btn").onclick = function () {
	var modal = document.getElementById('modal-div');
	modal.style.display='none';
}

$(".deleteBtn").click(function() {
	document.getElementById('modal-div').style.display='block';
	$("#deleteTRUE-btn").attr("onclick", "location.href='./ItemDeleteAction.adx?no=" + $(this).data("pnum") + "&pages=${paging.currentPageNo}'");
});

window.onclick = function(event) {
	var modal = document.getElementById('modal-div');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

$(window).ready(function () {
	<c:if test="${notAdminError eq 'trueError' }" >
		$("#msg").text("관리자 권한이 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dateInputError eq 'trueError' }" >
		$("#msg").text("날짜 등록 에러(출발 날짜가 도착날짜가 큽니다.)");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dataInsertError eq 'trueError' }" >
		$("#msg").text("데이터 등록 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${dataUpdateError eq 'trueError'}">
		$("#msg").text("데이터 수정 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${deleteError eq 'trueError'}">
		$("#msg").text("삭제 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${selectError eq 'trueError'}">
		$("#msg").text("찾으려는 데이터가 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
});

function goPage(url, pages) {
    url += '?' + "pages=" + pages;
    location.href = url;    
}
</script>
</body>
</html>