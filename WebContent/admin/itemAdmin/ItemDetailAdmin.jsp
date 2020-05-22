<%@page import="admin.item.db.ItemVO"%>
<%@page import="admin.item.db.ItemBIZ"%>
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
	.modalbtn { display:none; }
</style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

<jsp:include page="/admin/module/ItemForm.jsp" />

<script type="text/javascript">

$("#h2-form").text("상품 상세보기 FORM");
$("form[name=item_form]").append('<img src="./img/${item.getImg()}" class="itemimg" title="item image" >')

$("div#no-div div").html("${item.getNo()}");
$("div#i_name-div div").html("${item.getI_name()}");
$("div#content-div div").html("${item.getContent()}");
$("div#cnt-div div").html("${item.getCnt()}");
$("div#tot-div div").html("${item.getTot()}");
$("div#price-div div").html("${item.getPrice()}");
$("div#categ-div div").html("${item.getCateg()}");
$("div#st-date-div div").html("${item.getSt_date()}");
$("div#ed-date-div div").html("${item.getEd_date()}");
$("div#up-date-div div").html("${item.getUp_date()}");
$("div#img-div div").html("${item.getImg()}");

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
	location.href="./ItemListAdmin.adx?pages=${pages}";
}

document.getElementById("modify-btn").onclick = function () {
	location.href="./ItemModifyAdmin.adx?no=${item.getNo()}&pages=${pages}";
}

document.getElementById("deleteTRUE-btn").onclick = function () {
	location.replace("./ItemDeleteAction.adx?no=${item.getNo()}&pages=${pages}");
}

</script>
</body>
</html>