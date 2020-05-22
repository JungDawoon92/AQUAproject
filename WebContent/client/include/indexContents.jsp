<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="client.qna.db.*"%>
<%@ page import="client.qna.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	QnaBoardDAO boarddao = new QnaBoardSql();
	List<QnaBoardBean> list = boarddao.getQnaAllBoardList();
	String id = "null";
	if (session.getAttribute("userid") != null) {
		id = (String) session.getAttribute("userid");
	}
%>
<c:set var="list" value="<%=list%>" />
<c:set var="id" value="<%=id%>" />
<c:set var="check" value="0" />
<c:set var="doneLoop" value="false" />

  	 <link href="./css/qna_list.css" rel="stylesheet"/>
	<div>
		<h2>Q&A<a href="./QnABoardList.qa" class="btn pull-right black" role="button">전체보기</a></h2>
		<div class="list-group">
		<c:forEach var="qnalist" items="${list}">
		<c:if test="${not doneLoop}">
		<c:if test="${qnalist.RE_LEV == 0}">
			<c:if test="${check == 4}">
				<c:set var="doneLoop" value="true"/>
			</c:if>
			<c:if test="${qnalist.DEL == 'N'}">
				<c:choose>
        			<c:when test="${fn:length(qnalist.SUBJECT) gt 15}">
        				 <a class="list-group-item black" href="#" onclick="javascript:check(${qnalist.NUM},'${qnalist.ID}','${qnalist.RE_ID}')">
							<h5 class="list-group-item-heading">&nbsp;${fn:substring(qnalist.SUBJECT, 0, 15)}...<font class="pull-right">${qnalist.DATE}</font></h5>
						 </a>
       	
       				</c:when>
        			<c:otherwise>
        				<a class="list-group-item black" href="#" onclick="javascript:check(${qnalist.NUM},'${qnalist.ID}','${qnalist.RE_ID}')">
							<h5 class="list-group-item-heading">&nbsp;${qnalist.SUBJECT}<font class="pull-right">${qnalist.DATE}</font></h5>
						</a>
        			</c:otherwise>
				</c:choose>
				<c:set var="check" value="${check+1}" />
			</c:if>
		</c:if>
		</c:if>
		</c:forEach>
	
		</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Alert</h4>
				</div>
				<div class="modal-body">
					<p>접근대상이 아닙니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<script>
	function check(num,checkid,checkreid){
			if('${id}' == checkid || '${id}' == checkreid){
				location.href = "./QnABoardDetailAction.qa?num=" + num + "&page=1";			
			} else{
				$('#myModal').modal('show');
			}
	}
	</script>