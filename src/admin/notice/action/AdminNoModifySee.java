package admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.db.NoticeBean;
import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;



public class AdminNoModifySee implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		NoticeBiz boarddao = new NoticeBiz();
		NoticeBean board = new NoticeBean();
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		board = boarddao.detail(num);

		if (board == null) {
			return null;
		}

		request.setAttribute("board", board);
		forward.setRedirect(false);
		forward.setPath("/admin/admin_notice/noticemodify.jsp");
		return forward;
	}
}