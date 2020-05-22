package admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;



public class AdminNoDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");

		int num = Integer.parseInt(request.getParameter("num"));
		NoticeBiz boarddao = new NoticeBiz();
		boarddao.delete(num);
		forward.setRedirect(true);
		forward.setPath("./AdminNoList.adn");
		return forward;
	}
}