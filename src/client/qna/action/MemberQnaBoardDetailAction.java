package client.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class MemberQnaBoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();

		int num = Integer.parseInt(request.getParameter("num"));
		int page = Integer.parseInt(request.getParameter("page"));
		boarddata = boarddao.getDetail(num);
		if (boarddata == null) {
			return null;
		}
		
		request.setAttribute("boarddata", boarddata);
		request.setAttribute("page", page);

		forward.setRedirect(false);
		forward.setPath("/client/qna/qna_board_view.jsp");

		return forward;

	}
	

	
}