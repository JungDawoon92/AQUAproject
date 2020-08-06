<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="client.qna.db.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int Page = Integer.parseInt(request.getParameter("page"));
	QnaBoardDAO boarddao = new QnaBoardSql();
	QnaBoardBean board = (QnaBoardBean) boarddao.getReplyDetail(num);
%>

<form name="deleteform1">
	<input type="hidden" name="NUM" value="<%=board.getNUM()%>"> 
	<input type="hidden" name="page" value="<%=Page%>">
</form>
<table cellpadding="0" cellspacing="0">
	<tr>
		<td style="font-family: 돋음; font-size: 12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		<td style="font-family: 돋음; font-size: 12"><%=board.getSUBJECT()%>
		</td>
	</tr>

	<tr>
		<td style="font-family: 돋음; font-size: 12" height="16">
			<div align="center">분류&nbsp;&nbsp;</div>
		</td>
		<td style="font-family: 돋음; font-size: 12"><%=board.getCATEGORY()%>
		</td>
	</tr>


	<tr>
		<td style="font-family: 돋음; font-size: 12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family: 돋음; font-size: 12">
			<table border=0 width=490 height=250 style="table-layout: fixed">
				<tr>
					<td valign=top style="font-family: 돋음; font-size: 12"><%=board.getCONTENT()%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5"><font size=2> 
				<button type="button"
					onclick="location.href='./QnABoardModify.adq?num=<%=board.getNUM()%>&page=<%=Page%>'">수정</button>&nbsp;&nbsp;

				<button type="button"
					onclick="location.href='./QnABoardList.adq?page=<%=Page%>'">목록</button>&nbsp;&nbsp;

				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal1">삭제</button>

				<div class="modal fade" id="myModal1" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">게시글 삭제</h4>
							</div>
							<div class="modal-body">
								<p>정말로 삭제 하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="clickDel(deleteform1)">네</button>

								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">아니요</button>
							</div>
						</div>
					</div>
				</div>
		</font></td>
	</tr>
</table>