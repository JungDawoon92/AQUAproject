<%@page import="admin.item.db.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  	img.itemimg { width:auto; height:auto; }
  	.modalbtn { display:none; }
  </style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

<%@ include file="/admin/module/ItemForm.jsp" %>

<script type="text/javascript">
$(window).ready(function () {
	$("#ed-date").removeAttr("disabled");
});

$("#h2-form").text("상품 수정 FORM");
$("form[name=item_form]").attr("action", "./ItemModifyAction.adx?no=${item.getNo()}&pages=${pages}")
$("form[name=item_form]").append('<img src="./img/${item.getImg()}" class="itemimg" title="item image" >')

$("input[type=text][name=no]").val("${item.getNo()}");
$("input[type=text][name=i_name]").val("${item.getI_name()}");
$("textarea[name=content]").val("${item.getContent()}");
$("input[type=number][name=cnt]").val("${item.getCnt()}");
$("input[type=number][name=tot]").val("${item.getTot()}");
$("input[type=number][name=price]").val("${item.getPrice()}");
$("select[name=categ]").val("${item.getCateg()}");
$("input[type=date][name=st_date]").val("${item.getSt_date()}");
$("input[type=date][name=ed_date]").val("${item.getEd_date()}");
$("div#up-date-div div").html("${item.getUp_date()}");

document.getElementById("list-btn").onclick = function () {
	location.href="./ItemListAdmin.adx?pages=${pages}";
}

document.getElementById("deleteTRUE-btn").onclick = function () {
	location.replace("./ItemDeleteAction.adx?no=${item.getNo()}&pages=${pages}");
}
</script>
</body>
</html>