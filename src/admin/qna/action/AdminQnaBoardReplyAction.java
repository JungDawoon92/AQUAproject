package admin.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.Encoding;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class AdminQnaBoardReplyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		Encoding encoding = new Encoding();
		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();
		
		int result = 0;
		int page = Integer.parseInt(request.getParameter("page"));

		String subject = request.getParameter("SUBJECT");
		String content = request.getParameter("CONTENT");
		
		content = encoding.encoding(content);
		subject = encoding.encoding(subject);
		
		boarddata.setNUM(Integer.parseInt(request.getParameter("NUM")));
		boarddata.setID(request.getParameter("ID"));
		boarddata.setSUBJECT(subject);
		boarddata.setCONTENT(content);
		boarddata.setRE_REF(Integer.parseInt(request.getParameter("RE_REF")));
		boarddata.setRE_LEV(Integer.parseInt(request.getParameter("RE_LEV")));
		boarddata.setRE_ID(request.getParameter("RE_ID"));

		result = boarddao.boardReply(boarddata);
		if (result == 0) {
			return null;
		}

		forward.setRedirect(true);
		forward.setPath("./QnABoardDetailAction.adq?num=" + result + "&page=" + page);
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