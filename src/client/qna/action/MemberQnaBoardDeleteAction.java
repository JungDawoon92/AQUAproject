package client.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class MemberQnaBoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		try {
			
			int num = Integer.parseInt(request.getParameter("NUM"));
			int page = Integer.parseInt(request.getParameter("page"));
			QnaBoardDAO boarddao = new QnaBoardSql();
			boarddao.boardDelete(num);		
			forward.setRedirect(true);
			forward.setPath("./QnABoardList.qa?page="+page);
			
		} catch (Exception e) {
			e.printStackTrace();
			forward.setRedirect(true);
			forward.setPath("./QnABoardList.qa");
		}
		
		return forward;

	}
}