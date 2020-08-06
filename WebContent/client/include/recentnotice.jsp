<%@page import="client.notice.action.IndexEncode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.notice.db.*"%>
<%	
	IndexEncode content = new IndexEncode();
	NoticeBiz biz = new NoticeBiz();
	List boardlist = new ArrayList();
	boardlist = biz.recentnotice();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h3 class="brd-name">
			&nbsp;공지게시판<a href="./ClientBoardList.no" class="btn pull-right"
				role="button">전체보기</a>
		</h3>
		<div class="list-group">
			<%
			for (int i = 0; i < boardlist.size(); i++) {
				NoticeBean bean = (NoticeBean) boardlist.get(i);
				String subject = "";
				subject = content.encoding(bean.getSubject());
				
				if(subject.length() >= 10) { 
					subject=subject.substring(0,10)+"…";
				}
		  %>
			<a href="./ClientBoardDetail.no?num=<%=bean.getNum()%>"
				class="list-group-item">
				<h5 class="list-group-item-heading">
					&nbsp;<%=subject%><font class="pull-right"><%=bean.getDate()%></font>
				</h5>
			</a>
			<%} %>
		</div>
	</div>

</body>
</html>