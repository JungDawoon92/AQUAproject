package client.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.Decoding;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class MemberQnaBoardModifyView implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();

		int num = Integer.parseInt(request.getParameter("num"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		boarddata = boarddao.getDetail(num);

		if (boarddata == null) {
			return null;
		}
		
		Decoding decoding = new Decoding();
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
	}
}