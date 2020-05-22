package admin.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class AdminQnaBoardMultiDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		QnaBoardDAO boarddao = new QnaBoardSql();
		
		int page = Integer.parseInt(request.getParameter("page"));
		int number = 0;
		String[] num = request.getParameterValues("RowCheck");
		for(int i = 0; i < num.length; i++) {
			number = Integer.valueOf(num[i]);
			boarddao.boardDelete(number);	
		}

		forward.setRedirect(true);
		forward.setPath("./QnABoardList.adq?page="+page);
		return forward;
	}

}
