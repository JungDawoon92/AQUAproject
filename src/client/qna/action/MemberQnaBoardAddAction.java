package client.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.QEncoding;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class MemberQnaBoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		QnaBoardDAO boarddao = new QnaBoardSql();
		QnaBoardBean boarddata = new QnaBoardBean();
		ActionForward forward = new ActionForward();
		QEncoding encoding = new QEncoding();
		
		try {
			
			String id = request.getParameter("ID");
			String subject = request.getParameter("SUBJECT");
			String content = request.getParameter("CONTENT");
			String category = request.getParameter("CATEGORY");
			
			content = encoding.encoding(content);
			subject = encoding.encoding(subject);
			
			boarddata.setID(id);
			boarddata.setSUBJECT(subject);
			boarddata.setCONTENT(content);
			boarddata.setCATEGORY(category);
			
			int result = boarddao.boardInsert(boarddata);

		if (result > 0) {
				forward.setRedirect(true);
				forward.setPath("./QnABoardDetailAction.qa?num=" + result + "&page=1");
			} else {
				forward.setRedirect(true);
				forward.setPath("./login.me");
				return forward;
			}

			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
			forward.setRedirect(true);
			forward.setPath("./QnABoardList.qa");
			
		}
		return forward;
	}
	
	public static String encodeContent(String content) {
		String ret = content;
		try {
			ret = ret.replace("&", "&amp;");
			ret = ret.replace("<", "&lt;");
			ret = ret.replace(">", "&gt;");
			ret = ret.replace("\r\n","<br>");
			ret = ret.replace(" ", "&nbsp");
		} catch (NullPointerException e) {
		e.printStackTrace();
		}
		return ret;
	}
	
}
