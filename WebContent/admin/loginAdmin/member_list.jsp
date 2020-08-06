<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="admin.member.db.*"%>
<%
	List<MemberBean> list = (List)request.getAttribute("member");
	// list.jsp?pageNo=1과 같은 형식으로 호출
	String tempNo = request.getParameter("pageNo");
	int pageNo = 1;
	try { pageNo = Integer.parseInt(tempNo);
	 if(pageNo<0){ pageNo = 1; }} 
	catch (Exception e) {	} 	// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1

	final int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
	int totalRows = list.size(); // 전체 게시물 갯수
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);// 전체 페이지 갯수
	if(pageNo>totalPages){	pageNo=totalPages;}
	int begin = (pageNo - 1) * ROW_PER_PAGE;
	int end = pageNo * ROW_PER_PAGE -1;
	if (end >= totalRows){	end = totalRows-1;	}
	int Rend = (int) Math.ceil((double) totalRows / 10);
	final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages / PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE); //요청된 pageNo의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우
	int prevPage = 0;
	if (currentRange != 1)
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 5;
	int nextPage = 0;
	if (currentRange != totalRanges)
		nextPage = currentRange * PAGE_PER_PAGE + 1;
	int prevback = pageNo * 5;
	if(pageNo > totalPages){ pageNo = totalPages;}
%>

<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>memberlist</title>
<style>
table {	margin: auto; width: 50%; text-align:center; }
th { text-align:center;}
h2 {text-align:center;}
.center { text-align: center; }
.pagination {  display: inline-block; } 
.pagination a { color: black;  float: left;  padding: 8px 16px;  text-decoration: none;  transition: background-color .3s;
  				border: 1px solid #ddd;  margin: 0 4px; }
.pagination a.active {  background-color: #4CAF50;  color: white;  border: 1px solid #4CAF50; }
.link { pointer-events: none; cursor: default; }
.pagination a:hover:not(.active) {background-color: #ddd;}
#clear {clear:both;}
</style>
</head><body><jsp:include page="/admin/module/Navbar.jsp" /><section class="wrap">
	<div class="container" style=" background: whitesmoke;">
	<br><br><br><h2>회원 목록</h2>
		<table class="table table-condensed">
			<thead><tr>
					<th>회원 번호</th><th>아이디</th><th>이름</th>
					<th>이메일</th><th>휴대폰 번호</th>
				</tr></thead>
			<c:forEach var="member" items="${member}"  begin="<%=begin%>" end="<%=end %>" >
			<tr><th>${member.num }</th>
				<th><a href="MemberViewAction.ad?id=${member.id}&pageNo=<%=pageNo%>">
					${member.id}</a></th>
				<th>${member.name }</th>
				<th>${member.email }</th>
				<th>${member.phone }</th></tr>
		</c:forEach>
			<tr><th></th><th></th><th></th><th></th>
			<th><button type="button" class="btn btn-default"  onclick="location.href='MemberAddView.ad?pageNo=<%=pageNo%>'">회원추가</button>
			</th></tr></table></div>
			<div class="center">
			<div id="pager" class="flex-container">
			<ul class="pager pagination">
					<li class="previous"><a href="member_list.ad?pageNo=1" >&lt;&lt;</a></li>
			<%if (prevPage != 0) { %>
					<li> <a href="member_list.ad?pageNo=<%=prevPage%>" >&lt;</a> </li>
					 <%	}%> 
			<%for (int i = beginPage; i <= endPage; i++) {
 						if(i==pageNo){%>
 					<li class="active">	<a href="member_list.ad?pageNo=<%=i%>" class="link"><%=i%></a></li> 	
 						<% } else { %> 
 				<li><a href="member_list.ad?pageNo=<%=i%>" class="btn btn-primary text-wrap"><%=i%></a> </li>
 					<%}	} %> 
				<%if (nextPage != 0) { %> 
 					<li><a href="member_list.ad?pageNo=<%=nextPage%>" class="btn btn-primary text-wrap" >&gt;</a></li> 
 					<% 	} %>
				<li class="next"><a href="member_list.ad?pageNo=<%=totalPages%>">&gt;&gt;</a></li>
			</ul>
		</div>
 		<form method="post" action="./Membersearch.ad">
	    <input type="text" name="uid" placeholder="Search Id"/> ​​​​​​​
		<button type="submit">SEARCH</button>
		</form>
		</div>
		<br><br><br>
		<script>
		if(self.name != 'reload'){
			self.name = 'reload';
			self.location.reload(true);
		}
		else self.name = "";
		</script>
</section><jsp:include page="/copyright.html"/>
</body></html>