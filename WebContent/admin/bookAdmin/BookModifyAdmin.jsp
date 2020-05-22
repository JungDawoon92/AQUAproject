<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="/admin/module/BookForm.jsp" %>

<script type="text/javascript">

$("#h2-form").text("예약 수정 FORM");
$("form[name=book_form]").attr("action", "./BookModifyAction.ady?pno=${bookMap.pno}&pages=${pages}")

$("input[type=number][name=no]").val("${bookMap.ref_ino}");
$("input[type=number][name=cnt]").val("${bookMap.cnt}");

$("div#pno-div div").html("${bookMap.pno}");
$("div#id-div div").html("${bookMap.id}");
$("div#categ-div div").html("${bookMap.categ}");
$("div#i_name-div div").html("${bookMap.i_name}");
$("div#price-div div").html("${bookMap.price}");
$("div#st-date-div div").html("${bookMap.st_date}");
$("div#ed-date-div div").html("${bookMap.ed_date}");
$("div#up-date-div div").html("${bookMap.up_date}");
$("div#member-name-div div").html("${bookMap.name}");
$("div#birthday-div div").html("${bookMap.birthday}");
$("div#gender-div div").html("${bookMap.gen}");
$("div#email-div div").html("${bookMap.email}");
$("div#phone-div div").html("${bookMap.phone}");


document.getElementById("list-btn").onclick = function () {
	location.href="./BookListAdmin.ady?pages=${pages}";
}

document.getElementById("deleteTRUE-btn").onclick = function () {
	location.replace("./BookDeleteAction.ady?pno=${bookMap.pno}&pages=${pages}");
}
</script>
</body>
</html>