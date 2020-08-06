<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	#book-div { cursor:pointer; }
  	.modalbtn { display: none; }
  	.txt_line { width:275px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
  	th { text-align:center; }
  </style>
</head>
<body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
  
  
<div class="container">
	<h2>예약 리스트</h2>
    <div class="col-xs-12">
		<button type="button" id="add-btn" class="btn btn-default pull-right">예약 등록</button>
	</div>
	
	    <div class="container content_div">
	    	<div class="row">
	   	 	<div class="col-sm-12">
		        <table class="table table-striped table-bordered table-hover">
		        <caption><span class="blind">예약 목록</span></caption>
				<thead>
		            <tr>
		              <th>번호</th>
		              <th>ID</th>
		              <th>상품 번호</th>
		              <th>상품 이름</th>
		              <th>가격</th>
		              <th>수량</th>
		              <th>출발 날짜</th>
		              <th>도착 날짜</th>
		              <th>등록 날짜</th> 
		            </tr>
		         </thead>
				<tbody>
	         	 <c:forEach var="list" items="${bookList}" begin="0" end="${bookList.size()}" step="1" >
					<tr>
		         		<td>${list.pno }</td>
						<td>${list.ref_id}</td>			
						<td>${list.ref_ino }</td>
						<td><a href="./BookDetailAdmin.ady?pno=${list.pno }&pages=${paging.currentPageNo}">${list.i_name }</a></td>
						<td>${list.price }</td>
						<td>${list.cnt }</td>
						<td>${list.st_date }</td>
						<td>${list.ed_date }</td>
						<td>${list.up_date }</td>
			        	<td><a class="" role="button" onclick='location.href="./BookModifyAdmin.ady?pno=${list.pno}&pages=${paging.currentPageNo}"'>수정</a></td>
		         		<td><a class="deleteBtn" role="button" data-pnum="${list.pno }">삭제</a></td>
		         	</tr>
		         </c:forEach>
				</tbody>
				</table>
			</div>
			</div>	
       </div>

	
	<button type="button" class="modalbtn" id="modal-btn" onclick="document.getElementById('modal-div').style.display='block'"></button>
	<div id="modal-div" class="modal">
	  <div class="container modal-content">
	    <h1 id="msg">정말 삭제하시겠습니까?</h1>
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
	location.href="./BookAddAdmin.ady?pages=${paging.currentPageNo}";
}

document.getElementById("cancel-btn").onclick = function () {
	var modal = document.getElementById('modal-div');
	modal.style.display='none';
}

$(".deleteBtn").click(function() {
	document.getElementById('modal-div').style.display='block';
	$("#deleteTRUE-btn").attr("onclick", "location.href='./BookDeleteAction.ady?pno=" + $(this).data("pnum") + "&pages=${paging.currentPageNo}'");
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
		$("#deleteTRUE-btn").prop("disabled");
		$("#msg").text("삭제 에러.");
		$("#modal-btn").trigger("click");
	</c:if>
	<c:if test="${selectError eq 'trueError'}">
		$("#msg").text("찾으려는 데이터가 없습니다.");
		$("#modal-btn").trigger("click");
	</c:if>
})

function goPage(url, pages) {
    url += '?' + "pages=" + pages;
    location.href = url;    
}
</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>