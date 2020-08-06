<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = "비회원";
	if (session.getAttribute("userid") != null) {
		id = (String) session.getAttribute("userid");
	}
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	List qboardList = (List) request.getAttribute("qboardlist");
	List rboardList = (List) request.getAttribute("rboardlist");
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	int beginpage = ((Integer) request.getAttribute("beginpage")).intValue();
	int prevpage = ((Integer) request.getAttribute("prevpage")).intValue();
	int nextpage = ((Integer) request.getAttribute("nextpage")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
%>

<c:set var="qboardList" value="<%=qboardList%>" />
<c:set var="rlist" value="<%=rboardList%>" />
<c:set var="nowpage" value="<%=nowpage%>" />
<c:set var="endpage" value="<%=endpage%>" />
<c:set var="beginpage" value="<%=beginpage%>" />
<c:set var="prevpage" value="<%=prevpage%>" />
<c:set var="nextpage" value="<%=nextpage%>" />
<c:set var="id" value="<%=id%>" />
<c:set var="number" value="0" />
<c:set var="maxpage" value="<%=maxpage%>" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	 <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
  	 <link href="./client/css/qna_list.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="main.js" defer></script>
    <title>AQUA</title>
  </head>
  <body><jsp:include page="/client/include/nav.jsp" />
	<div class="container">
		<h2 class="pull-right">Q&A게시판</h2>
	</div>
	<br />
	<div class="container content_list">
		<div class="row">
		<div class="col-sm-12">
		<table class="table">
			<thead>
				<tr>
					<th class="col-sm-1 hidden-xs">번호</th>
					<th class="col-sm-1 hidden-xs">분류</th>
					<th class="col-xs-7 col-sm-7 ">제목</th>
					<th class="col-xs-2 col-sm-1 ">작성자</th>
					<th class="col-sm-1 hidden-xs">날짜</th>
					<th class="col-xs-3 col-sm-1 ">답변상태</th>
				</tr>
			</thead>
			
			<c:forEach var="list" items="${qboardList}"  varStatus="status">		
				<tr class="qnalist" >
					<td class="hidden-xs">${list.NUM}</td>
					<td class="hidden-xs">${list.CATEGORY}</td>
					<td>
						<div>
							<c:if test="${list.DEL == 'Y'}">
								[해당 게시글은 삭제되었습니다.]
							</c:if>
							<c:if test="${list.DEL == 'N'}">
								<div class="panel-group" id="accordion">
    								<div class="panel panel-default">
      									<button data-toggle="collapse" data-parent="#accordion" data-target="#${list.NUM}" class="panel-heading">
        									<h4 class="panel-title">
          											<svg class="bi bi-lock-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  														<rect width="11" height="9" x="2.5" y="7" rx="2" />
  														<path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd" />
													</svg>
												${list.SUBJECT}
        									</h4>
      									</button>
      									<div id="${list.NUM}" class="panel-collapse collapse">
        									<div class="panel-body panel__content">
        										<c:choose>
        											<c:when test="${list.ID == id}">
        												<div class="black content"  style="cursor:pointer" onclick="content(${list.NUM},${nowpage})">${list.CONTENT}</div>
        											</c:when>
        											<c:when test="${list.RE_ID == id}">
        												<div class="black content" onclick="content(${list.NUM},${nowpage})">${list.CONTENT}</div>
        											</c:when>
        											<c:otherwise>
        												<h4 class="no-access">접근권한이 없습니다.</h4>
        											</c:otherwise>
        										</c:choose>        										
        									</div>
      									</div>
    								</div>
  								</div> 
							</c:if>						
						</div>
					</td>
					<td>
						<div>${list.ID}</div>
					</td>
					<td class="hidden-xs">
						<div>${list.DATE}</div>
					</td>
					<td>
						<c:if test="${list.RE_CHE == 1}">
							<button class="btn non-effect">답변완료</button>
						</c:if>
						<c:if test="${list.RE_CHE == 0}">
							<button class="btn btn-default non-effect">답변대기</button>
						</c:if>			
					</td>
				</tr>
				<c:if test="${list.NUM == rlist[number].RE_REF}">
					<tr class="replylist">
						<td class="hidden-xs"><svg class="bi bi-arrow-return-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  														<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 01.708 0l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708-.708L12.793 9l-2.647-2.646a.5.5 0 010-.708z"
															clip-rule="evenodd" />
  														<path fill-rule="evenodd" d="M3 2.5a.5.5 0 00-.5.5v4A2.5 2.5 0 005 9.5h8.5a.5.5 0 000-1H5A1.5 1.5 0 013.5 7V3a.5.5 0 00-.5-.5z"
															clip-rule="evenodd" />
													</svg></td>
						<td class="hidden-xs">답변</td>
						<td>
							<div>
								<div class="panel-group" id="accordion2">
    								<div class="panel panel-default">
    									<button data-toggle="collapse" data-parent="#accordion2" data-target="#${rlist[number].NUM}" class="panel-heading">
        									<h4 class="panel-title">  										
												${rlist[number].SUBJECT}						
        									</h4>
      									</button>
      									<div id="${rlist[number].NUM}" class="panel-collapse collapse">
        									<div class="panel-body">
        										<c:choose>
        											<c:when test="${rlist[number].ID == id}">
        												${rlist[number].CONTENT}
        											</c:when>
        											<c:when test="${rlist[number].RE_ID == id}">
        												${rlist[number].CONTENT}
        											</c:when>
        											<c:otherwise>
        												<h4 class="no-access">접근권한이 없습니다.</h4>
        											</c:otherwise>
        										</c:choose>        										
        									</div>
      									</div>
    								</div>
  								</div>
							</div>
						</td>
						<td>
							<div>관리자</div>
						</td>
						<td class="hidden-xs">
						<div>${rlist[number].DATE}</div>
						</td>
						<td>
						</td>
					</tr>
				<c:set var="number" value="${number+1}" />
				</c:if>
			</c:forEach>
			<tr class="page">
				<td colspan="8">
					<div id="pager" class="flex-container" >
						<ul class="pager pagination">
						<c:if test="${nowpage > 1}">
							<li class="previous"><a href="./QnABoardList.qa?page=1">&lt;&lt;</a></li>
						</c:if>
						<c:if test="${prevpage != 0}">
							<li><a href="./QnABoardList.qa?page=${prevpage}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${beginpage}" end="${endpage}" step="1">
							<c:choose>
							<c:when test="${nowpage == i}">
								<li class="active"><a href="javascript:void(0)">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="./QnABoardList.qa?page=${i}">${i}</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${nextpage != 0}">
							<li><a href="./QnABoardList.qa?page=${nextpage}">&gt;</a></li>
						</c:if>
						<c:if test="${nowpage != maxpage}">
							<li><a href="./QnABoardList.qa?page=${maxpage}">&gt;&gt;</a></li>
						</c:if>
						</ul>
					</div>				
				</td>
			</tr>
	
			<tr id="write">
						<td colspan="8">
							<c:choose>
								<c:when test="${id == '비회원'}">
									<button type="button"
										class="btn btn-default pull-right margintop20"
										data-toggle="modal" data-target="#myModal">글쓰기</button>
								</c:when>
								<c:otherwise>
								<button class="btn btn-default pull-right"
									onclick="location.href='./QnABoardWrite.qa'">글쓰기</button>
								</c:otherwise>
							</c:choose></td>
					</tr>
		</table>
		</div>
		</div>
	</div>
	<br />

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Alert</h4>
				</div>
				<div class="modal-body">
					<p>로그인이 필요한 서비스입니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function content(num,nowpage){
			location.href="./QnABoardDetailAction.qa?num="+num+"&page="+nowpage;
		}
		
	</script>
</section><jsp:include page="/copyright.html"/>
</body>
</html>
