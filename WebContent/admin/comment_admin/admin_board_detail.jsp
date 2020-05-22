<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="client.comment.board.db.*"%>
<%@ page import="client.comment.comment.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="client.comment.board.db.BoardBean"%>
<%@ page import="client.comment.board.action.encodeContent" %>
<%
	encodeContent encode = new encodeContent();
	BoardBean board = (BoardBean) request.getAttribute("boarddata");
%>
<%
	String admin_id = (String) session.getAttribute("adminid");
%>
<%
	List commentlist = (List) request.getAttribute("commentlist");
	int commentlistcount = ((Integer) request.getAttribute("commentlistcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
	
	String content = "";
	String subject = "";
	content =encode.encoding(board.getBOARD_CONTENT());
	subject =encode.encoding(board.getBOARD_SUBJECT());
	int pager = ((Integer) request.getAttribute("pager")).intValue();
%>
<!DOCTYPE html>
<html><head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet" />
	<title>관리자모드 세부보기</title>
<script type="text/javascript">
	function Replyform(i) {
		document.forms[i].submit();
	}
	
	$(document).ready(function(){
		$(function () {
		$('#homeup').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 300);
			return false;
		});
	var scrollHeight = $(document).height();
		$('#homedown').click(function () {
			$('body,html').animate({
				scrollTop: scrollHeight
			}, 300);
			return false;
		});
		});
	});
</script>
<style>
	.affix {
    top: 20px;
    z-index: 9999 !important; }
</style>
</head>
<body>

<jsp:include page="/admin/module/Navbar.jsp" />

	<div class="container">
      <h2 align="left">관리자모드</h2>
    </div>
    <br />
    
    <nav class="col-xs-1 content_div pull-right">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
        <li><a href="#homeup" id="homeup"><span class="glyphicon glyphicon-triangle-top"></span></a></li>
        <li><a href="#homedown" id="homedown"><span class="glyphicon glyphicon-triangle-bottom"></span></a></li>
      </ul>
    </nav>


	<div class="container content_div"> <!-- content_div class 추가로줌. 하얀색->검은색  -->
	<table class="table" style='cellpadding:"0" cellspacing:"0"'>

		<tr>
			<td width="80">
				<div>제 목&nbsp; &nbsp;:</div>
			</td>
			<td align="left"><%=subject%>
			</td>
		</tr>

		<tr>
			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr>
			<td>
				<div align="left">내 용&nbsp; &nbsp;:</div>
			</td>
			<td>
				<table style="table-layout: fixed">
					<tr>
						<%
							if (!(board.getBOARD_FILE() == null)) {
						%> <img src="./boardupload/<%=board.getBOARD_FILE()%>" class="img-thumbnail"></span> <%
 						}
 						%> 
						<td valign=top style="height: 600px ;  overflow: auto;">
							<pre style="border: none; background-color: #FFFFFF; white-space: pre-wrap; padding-left: 0px;padding-top: 5px;"><%=content%></pre>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<div align="left">첨부파일</div>
			</td>
			<td>
				<%
					if (!(board.getBOARD_FILE() == null)) {
				%> <a
				href="./boardupload/<%=board.getBOARD_FILE()%>"> <%=board.getBOARD_FILE()%>
			</a> <%
 	}
 %>
			</td>
		</tr>
		
		<tr align="right" valign="middle">
			<td colspan="5">
		<%if (admin_id.equals("admin")) {%>
		<a href="./AdminBoardDeleteAction.adr?num=<%=board.getBOARD_NUM()%>" class="btn btn-default pull-right btn-sm"> 삭제 </a>&nbsp;&nbsp;
 		<%} %>			
			</td>
		</tr>
		
	</table>
	</div>
	
	<div class="container content_div">
		<p>댓글 : ${commentlistcount}</p>
		<hr>
		<%
			for (int i = 0; i < commentlist.size(); i++) {
				CommentBean bl = (CommentBean) commentlist.get(i);
				String commentcontent = "";
				commentcontent =encode.encoding(bl.getCOMMENT_CONTENT());
		%>
		<div class="media">
			<div class="media-left">
			<%   if (bl.getCOMMENT_RE_LEV() != 0) {
					%>
					<img src="./admin/comment_admin/img/img_comment1.png" class="media-object" style="width:100px">
					<%
						} else {
					%>
					<img src="./admin/comment_admin/img/master.jpg" class="media-object" style="width:80px">
					<%
						}
					%>
			</div>
			<div class="media-body">
			<h4 class="media-heading"><%if(bl.getCOMMENT_RE_LEV()!=0){%><font color="#31B0D5">┗</font><%=bl.getCOMMENT_ID()%><%}else{%><%=bl.getCOMMENT_ID()%><%}%><small><i>&nbsp;<%=bl.getCOMMENT_DATE()%></i></small>
			&nbsp; &nbsp;<%if (admin_id.equals("admin")) {%><small><a href="./AdminCommentDeleteAction.adr?num=<%=bl.getCOMMENT_NUM()%>&numB=<%=board.getBOARD_NUM()%>&numC=<%=bl.getCOMMENT_RE_LEV()%>&numD=<%=bl.getCOMMENT_RE_REF()%>" class="btn pull-right">삭제</a></small>
 		<%}%><a href="#commentreview<%=i%>" class="btn" data-toggle="collapse">답글</a></h4>
					&nbsp; &nbsp;<pre style="border: none; background-color: #FFFFFF; white-space: pre-wrap; padding-top: 0px;"><%=commentcontent%></pre>
					<!--내가 스타일을 위해 <pre>에 감싸진 <p>태그를 삭제함.(기본속성의 마진이 맘에안듬) bootstrap mediaobject의 규칙성에 어긋남. 나중에 스타일깨지면 <p>태그로 감싸주자   -->
			</div>
			<hr style="margin-bottom: 0px; margin-top: 10px;">
		</div>
		<div class="container content_div">
			<div id="commentreview<%=i%>" class="collapse">
				<form action="./AdminCommentReplyAction.adr" method="post" name="Replyform"<%=i%>>
  					<input type="hidden" name="COMMENT_RE_REF" value="<%=bl.getCOMMENT_RE_REF()%>">
  					<input type="hidden" name="COMMENT_BOARD_NO" value="<%=board.getBOARD_NUM()%>">
  					<input type="hidden" name="COMMENT_ID" value="<%=admin_id%>">
    				<div class="form-group">
      					<label for="comment">Comment:</label>
      					<textarea class="form-control" name="COMMENT_CONTENT" rows="5"></textarea>
    				</div>
    				<a href="javascript:Replyform(<%=i%>)" class="btn btn-info pull-right" role="button">Reply</a>
  				</form>
  			</div>
  		</div>	
		<%
			}
		%>
	</div>
	
<div class="container content_div" align=center>	
<ul class="pagination pagination-sm">
				<%
					if (nowpage <= 1) {
				%> <li><a href="#">&#60;</a></li> <%
 	} else {
 %> <li><a href="./AdminBoardViewAction.adr?page=<%=nowpage - 1%>&num=<%=board.getBOARD_NUM()%>">&#60;</a></li><%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> <li><a href="#"><%=a%></a></li> <%
 	} else {
 %> <li><a href="./AdminBoardViewAction.adr?page=<%=a%>&num=<%=board.getBOARD_NUM()%>"><%=a%>
			</a></li><%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> <li><a href="#">&#62;</a></li> <%
 	} else {
 %> <li><a href="./AdminBoardViewAction.adr?page=<%=nowpage + 1%>&num=<%=board.getBOARD_NUM()%>">&#62;</a></li> <%
 	}
 %>
</ul>
</div>
	
	
	
	<div class="container content_div">
  		<form action="./AdminCommentAddAction.adr" method="post">
  		<input type="hidden" name="COMMENT_BOARD_NO" value="<%=board.getBOARD_NUM()%>">
  		<input type="hidden" name="COMMENT_ID" value="<%=admin_id%>">
    		<div class="form-group">
      			<label for="comment">Comment:</label>
      			<textarea class="form-control" name="COMMENT_CONTENT" rows="5" required="required" minlength="1" maxlength="1500" style="margin-bottom: 17px;"></textarea>
      			<div></div>
      			<a href="./AdminBoardListAction.adr?page=<%=pager%>" class="btn btn-default pull-left" role="button">목록</a>
      			<button type="submit" class="btn btn-info pull-right">Reply</button>
    		</div>
  		</form>
	</div>
	
	
	<br />
</body>
</html>