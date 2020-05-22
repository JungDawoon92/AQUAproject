<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="client.comment.board.db.BoardBean"%>
<%@ page import="client.comment.board.action.encodeContent" %>
<%
	encodeContent encode = new encodeContent();
	String admin_id = null;
	if (session.getAttribute("admin_id") != null) {
		admin_id = (String) session.getAttribute("admin_id");
	}
	List boardList = (List) request.getAttribute("boardlist");
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
	
	//확넘기는거
	int prevpage = ((Integer) request.getAttribute("prevpage"))
			.intValue();
	int nextpage = ((Integer) request.getAttribute("nextpage"))
			.intValue();
	
	HashMap<Integer, Integer> boardcommentcount = (HashMap) request.getAttribute("boardcommentcount");
%>


<!DOCTYPE html>
<html><head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
	<title>관리자모드 게시판</title>
	
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

	<div class="container">
      <h1>관리자모드</h1>
    </div>
    <br />
    <div class="container" align="right">글 개수 : ${listcount}</div>


    <div class="container content_div"> <!-- content_div class 추가로줌. 하얀색->검은색  -->
        <form action="./AdminCheckDeleteAction.adr" method="post">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>체크</th>
              <th>번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>날짜</th>
              <th>조회수</th>
            </tr>
          </thead>
          
          <%
			for (int i = 0; i < boardList.size(); i++) {
				BoardBean bl = (BoardBean) boardList.get(i);
				String subject = "";
				subject =encode.encoding(bl.getBOARD_SUBJECT());
		  %>
		  
		<tr>
			<td>
			<input type="checkbox" name="boarddelete" value=<%=bl.getBOARD_NUM()%>>
			</td>
			<td><%=bl.getBOARD_NUM()%>
			</td>
		
			<td>
				<div>
					<a href="./AdminBoardViewAction.adr?num=<%=bl.getBOARD_NUM()%>&add=1&pager=<%=nowpage%>"> <%=subject%>
						<%
							if (!(bl.getBOARD_FILE() == null)) {
						%>&nbsp; <span class="glyphicon glyphicon-picture"></span> <%
 	}
 %>
 						<%
 						try{ 
 							if (boardcommentcount.get(bl.getBOARD_NUM()) != 0) {%>
 						<font color="#FF2F74">[<%=boardcommentcount.get(bl.getBOARD_NUM()) %>]</font> <%}
 						} catch (Exception ex) {
 						}%>
 						
					</a>
				</div>
			</td>

			<td>
				<div><%=bl.getBOARD_ID()%></div>
			</td>
			<td>
				<div><%=bl.getBOARD_DATE()%></div>
			</td>
			<td>
				<div><%=bl.getBOARD_READCOUNT()%></div>
			</td>
		</tr>
		<%
			}
		%>
		
		</table>
		<button type="submit" class="btn btn-info pull-left">체크박스삭제</button>
		</form>
			
		
	
		
		<div class="container content_div" align=center>	
			<ul class="pager pagination">
				<%
					if (prevpage != 0) {
				%> <li class="previous"><a href="./AdminBoardListAction.adr?page=<%=prevpage%>">&lt;&lt;</a></li> <%
 					}
 				%>
 <%
					if (nowpage <= 1) {
				%> <li class="disabled"><a href="#">&lt;</a></li> <%
 	} else {
 %> <li><a href="./AdminBoardListAction.adr?page=<%=nowpage - 1%>">&lt;</a></li> <%
 	}
 %>
 
 
  <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> <li class="active"><a href="#"><%=a%></a></li> <%
 	} else {
 %> <li><a href="./AdminBoardListAction.adr?page=<%=a%>"><%=a%>
			</a></li><%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> <li class="disabled"><a href="#">&gt;</a></li> <%
 	} else {
 %> <li><a href="./AdminBoardListAction.adr?page=<%=nowpage + 1%>">&gt;</a></li> <%
 	}
 %>
 
 <%
					if (nextpage != 0) {
				%> <li class="next"><a href="./AdminBoardListAction.adr?page=<%=nextpage%>">&gt;&gt;</a></li> <%
 					}
 				%>
 
			</ul>
		</div>
    </div>
    

    <br />
</body>

</html>