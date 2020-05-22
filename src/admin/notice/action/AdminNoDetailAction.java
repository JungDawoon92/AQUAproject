package admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.db.NoticeBean;
import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class AdminNoDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		NoticeBiz boarddao = new NoticeBiz();
		NoticeBean board = null;

		int pager = 1;
		if (request.getParameter("pager") != null) {
			pager = Integer.parseInt(request.getParameter("pager"));
		}
		Object spager = session.getAttribute("spager");

		if (spager != null) {
			pager = ((Integer) (session.getAttribute("spager"))).intValue();
		}
		session.setAttribute("spager", pager);

		int num = Integer.parseInt(request.getParameter("num"));
		board = boarddao.detail(num);

		if (board == null) {
			return null;
		}

		request.setAttribute("board", board);

		forward.setRedirect(false);
		forward.setPath("/admin/admin_notice/noticeview.jsp");

		return forward;
	}

}
