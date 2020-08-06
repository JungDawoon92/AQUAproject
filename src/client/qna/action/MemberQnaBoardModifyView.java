package client.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.QDecoding;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class MemberQnaBoardModifyView implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userid");

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			int page = Integer.parseInt(request.getParameter("page"));
			boarddata = boarddao.getDetail(num);

			if (boarddata == null || !boarddata.getID().equals(id) || boarddata.getDEL().equals("Y")) {
				forward.setRedirect(false);
				forward.setPath("/client/qna/nopage.jsp");
				return forward;

			}

			QDecoding decoding = new QDecoding();
			String subject = boarddata.getSUBJECT();
			String content = boarddata.getCONTENT();
			subject = decoding.decoding(subject);
			content = decoding.decoding(content);

			boarddata.setSUBJECT(subject);
			boarddata.setCONTENT(content);

			request.setAttribute("boarddata", boarddata);
			request.setAttribute("page", page);

			forward.setRedirect(false);
			forward.setPath("/client/qna/qna_board_modify.jsp");
			return forward;

		} catch (Exception e) {
			System.out.println(e);
			forward.setRedirect(true);
			forward.setPath("./QnABoardList.qa");
			return forward;
		}

	}
}