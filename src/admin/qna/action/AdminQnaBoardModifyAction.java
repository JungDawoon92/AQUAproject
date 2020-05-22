package admin.qna.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.Encoding;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class AdminQnaBoardModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();
		List<QnaBoardBean> list = null;
		Encoding encoding = new Encoding();

		int num = Integer.parseInt(request.getParameter("NUM"));
		int page = Integer.parseInt(request.getParameter("page"));
		String category = request.getParameter("CATEGORY");
		String content = encoding.encoding(request.getParameter("CONTENT"));
		String subject = encoding.encoding(request.getParameter("SUBJECT"));
		
		try {
			list = boarddao.getAllList();
			boarddata.setNUM(num);
			boarddata.setSUBJECT(subject);
			boarddata.setCONTENT(content);
			boarddata.setCATEGORY(category);

			boolean result = false;
			result = boarddao.boardModify(boarddata);

			if (result == false) {
				return null;
			}

			request.setAttribute("boarddata", boarddata);
			request.setAttribute("page", page);

			forward.setRedirect(true);
			forward.setPath("./QnABoardDetailAction.adq?num=" + num + "&page=" + page);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return forward;
	}
	
	public static String encodeContent(String content) {
		String ret = content;
		try {
			ret = ret.replace("&", "&amp;");
			ret = ret.replace("<", "&lt;");
			ret = ret.replace(">", "&gt;");
			ret = ret.replace("\r\n", "<br/>");
			ret = ret.replace(" ", "&nbsp");
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return ret;
	}
}