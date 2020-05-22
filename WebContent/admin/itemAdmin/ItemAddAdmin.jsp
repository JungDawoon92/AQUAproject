<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  	#cnt-div {  display:none; }
  </style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

<%@ include file="/admin/module/ItemForm.jsp" %>

<script type="text/javascript">
$("#h2-form").text("상품 등록 FORM");
$("#no-div").css("display", "none");
$("#up-date-div").css("display", "none");

document.getElementById("list-btn").onclick = function () {
	location.href="./ItemListAdmin.adx?pages=${param.pages}";
}
</script>
</body>
</html>