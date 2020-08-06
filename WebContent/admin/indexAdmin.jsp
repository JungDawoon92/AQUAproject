<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <style type="text/css">
  .modalbtn { display:none; }
  </style>
</head>
<body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
  
<div class="container">
  <h3>관리자 home</h3>
  <p>관리자 home</p>
</div>
	<button type="button" class="modalbtn" id="modal-btn" onclick="document.getElementById('modal-div').style.display='block'"></button>
	<div id="modal-div" class="modal">
	   <div class="container modal-content">
	   <h1 id="msg"></h1>
	   <button type="button" class="btn btn-danger" id="cancel-btn">Cancel</button>
	   </div>
	</div>
<script type="text/javascript">
document.getElementById("cancel-btn").onclick = function () {
	var modal = document.getElementById('modal-div');
	modal.style.display='none';
}

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
})
</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>
