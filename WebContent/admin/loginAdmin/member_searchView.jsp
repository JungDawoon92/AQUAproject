<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.member.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String a = (String)request.getAttribute("search");
	if (a == null){
		a = " ";
	}
	List<MemberBean> list = MemberBiz.search(a); 
	
	
	// list.jsp?pageNoN=1과 같은 형식으로 호출
	String tempNoN = request.getParameter("pageNoN");
	
	int pageNoN = 1;
	try {
		pageNoN = Integer.parseInt(tempNoN);
	} catch (Exception e) {
		// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNoN=1
	}

	final int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
	int totalRows = list.size(); // 전체 게시물 갯수
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);// 전체 페이지 갯수
	final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages / PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNoN / PAGE_PER_PAGE); //요청된 pageNoN의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우

	int prevPage = 0;
	if (currentRange >5 )
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 5;
	
	int nextPage = 0;
	if (currentRange != totalRanges)
		nextPage = currentRange * PAGE_PER_PAGE + 1;
	
	int num = 0;
	int num2 = ROW_PER_PAGE * pageNoN;

	if (list.size()>0 ){
		if (pageNoN > 1) {
			num = (pageNoN - 1) * ROW_PER_PAGE;
			} else { num = 0; }
		if (num2 > totalRows) {	num2 = totalRows; } 
	}else {	beginPage=1; endPage=1; nextPage = 0; }
			
%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<jsp:include page="/admin/module/Navbar.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Search Member</title>
<style>
th { text-align:center; border:1px; }
table {	margin: auto; width: 50%; }
h2 { text-align:center;}
.center { text-align: center; }
.pagination { display: inline-block; }
.pagination a { color: black; float: left; padding: 8px 16px; text-decoration: NoNne; transition: background-color .3s;
 			    border: 1px solid #ddd; margin: 0 4px; }
.pagination a.active { background-color: #4CAF50; color: white; }
.link { pointer-events: NoNne; cursor: default; }
.pagination a:hover:NoNt(.active) {background-color: #ddd;}
</style>
</head><body>
	<div class="container" style="background: whitesmoke;">
		<h2>아이디 "<%=a %>" 의 검색결과 입니다.</h2>
	<table class="table table-condensed">
		<thead>
			<%if (list.size()==0){ %>
			<tr><th><h3>검색결과가 없습니다.</h3></th></tr>
			<%} else {%>
			<tr>
			<th>번호</th><th>아이디</th><th>이름</th><th>가입날짜</th>
			</tr></thead><tr>
				 <%	for (int i = num; i < num2; i++) {
						MemberBean member = (MemberBean) list.get(i);%>
		<tr><th><%=i+1%></th>
			<th><a href="MemberViewAction.ad?id=<%=member.getId()%>&pageNoN=<%=pageNoN%>&uid=<%=a%>">
				<%=member.getId()%></a></th>
			<th><%=member.getName()%></th>
			<th><%=member.getJoindate()%></th></tr>
				<% }%>	<%} %>
	</table>
	</div><div class="center">
			<div id="pager" class="flex-container">
			<ul class="pager pagination">
			<%if (totalPages >2){ %>
					<li class="previous"><a href="Membersearch.ad?pageNoN=1&uid=<%=a %>" >FIRST</a></li>
					<%} %>
			<%if (prevPage != 0) { %>
					<li> <a href="Membersearch.ad?pageNoN=<%=prevPage%>" >Prev</a> </li>
					 <%	}%> 
			<%for (int i = beginPage; i <= endPage; i++) {
 						if(i==pageNoN){%>
 					<li class="active">	<a class="link"><%=i%></a></li> 	
 						<% } else { %> 
 				<li><a href="Membersearch.ad?pageNoN=<%=i%>&uid=<%=a %>"><%=i%></a> </li>
 					<%}	} %> 
				<%if (nextPage != 0) { %> 
 					<li><a href="Membersearch.ad?pageNoN=<%=nextPage%>" >Next</a></li> 
 					<% 	} %>
 				<%if (totalPages > 2){ %>
				<li class="next"><a href="Membersearch.ad?pageNoN=<%=totalPages%>&uid=<%=a %>">END</a></li><%} %>
			</ul>
		</div>
 			<form method="post" action="./Membersearch.ad">
	   		 <input type="text" name="uid" placeholder="User Id"/> ​​​​​​​
			<button type="submit">SEARCH</button>
			</form> </div><br><br><br>
</body>
</html>