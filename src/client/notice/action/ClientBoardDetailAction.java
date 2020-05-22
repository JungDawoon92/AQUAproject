package client.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.db.NoticeBean;
import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class ClientBoardDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		NoticeBiz boarddao = new NoticeBiz();
		NoticeBean board = new NoticeBean();
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		int pager = 1;
		if (request.getParameter("pager") != null) {
			pager = Integer.parseInt(request.getParameter("pager"));
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Object spager = session.getAttribute("spager"); 
		
		if (spager != null) {
			pager = ((Integer)(session.getAttribute("spager"))).intValue();
		}
		session.setAttribute("spager", pager);

		
		try {
			int add = Integer.parseInt(request.getParameter("add"));
			System.out.println("add" + add);
			if (add == 1) {
				boarddao.Noticereadcount(num);
			}
		} catch (Exception ex) {
		}
		
		board = boarddao.detail(num);

		if (board == null) {
			return null;
		}
		
		request.setAttribute("board", board);
		forward.setRedirect(false);
		forward.setPath("./client/client_notice/noticeview.jsp");

		return forward;
	}

}
