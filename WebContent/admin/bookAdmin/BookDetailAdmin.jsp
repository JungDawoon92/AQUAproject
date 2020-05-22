<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.modalbtn { display:none; }
</style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

<jsp:include page="/admin/module/BookForm.jsp" />

<script type="text/javascript">
$("#h2-form").text("예약 상세보기 FORM");

$("div#pno-div div").html("${bookMap.pno}");
$("div#id-div div").html("${bookMap.id}");
$("div#no-div div").html("${bookMap.ref_ino}");
$("div#categ-div div").html("${bookMap.categ}");
$("div#i_name-div div").html("${bookMap.i_name}");
$("div#cnt-div div").html("${bookMap.cnt}");
$("div#price-div div").html("${bookMap.price}");
$("div#st-date-div div").html("${bookMap.st_date}");
$("div#ed-date-div div").html("${bookMap.ed_date}");
$("div#up-date-div div").html("${bookMap.up_date}");
$("div#member-name-div div").html("${bookMap.name}");
$("div#birthday-div div").html("${bookMap.birthday}");
$("div#gender-div div").html("${bookMap.gen}");
$("div#email-div div").html("${bookMap.email}");
$("div#phone-div div").html("${bookMap.phone}");


$("#add-btn").attr("id","modify-btn");
$("#modify-btn").text("수정");
$("#modify-btn").attr("type", "button");


$("#reset-btn").attr("id","delete-btn");
$("#delete-btn").text("삭제");
$("#delete-btn").attr("type", "button");
$("#delete-btn").click(function () {
	$("#modal-div").css("display", "block");
})

$("#msg").text("정말 삭제하시겠습니까?");
$("#msg").after('<button type="button" class="btn btn-secondary" id="deleteTRUE-btn">확인</button>');

document.getElementById("list-btn").onclick = function () {
	location.href="./BookListAdmin.ady?pages=${pages}";
}

document.getElementById("modify-btn").onclick = function () {
	location.href="./BookModifyAdmin.ady?pno=${bookMap.pno}&pages=${pages}";
}

document.getElementById("deleteTRUE-btn").onclick = function () {
	location.replace("./BookDeleteAction.ady?pno=${bookMap.pno}&pages=${pages}");
}
</script>
</body>
</html>