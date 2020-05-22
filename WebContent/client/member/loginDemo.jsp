<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if (session.getAttribute("userid") != null){
		session.invalidate();
	} else {
		session.setAttribute("userid", "testId");
	}
	String uri = request.getHeader("referer");
	response.sendRedirect(uri);
%>
</body>
</html>