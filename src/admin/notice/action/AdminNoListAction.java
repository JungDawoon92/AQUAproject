package admin.notice.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class AdminNoListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		NoticeBiz boarddao = new NoticeBiz();
		List boardlist = new ArrayList();

		String id = (String) session.getAttribute("adminid");

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = boarddao.NoticelistCount();
		boardlist = boarddao.list(page);
		
		int maxpage = (int) Math.ceil((double) listcount/ 10);
		int currentRange = (int) Math.ceil((double) page / limit);
		int totalRanges = (int) Math.ceil((double) maxpage / limit);
		int startpage = (currentRange - 1) * limit + 1;
		
		int endpage =currentRange * limit;
		if (currentRange == totalRanges)
			endpage = maxpage;
		int prevpage = 0;
		if (currentRange != 1)
			prevpage = (currentRange - 2) * limit + 1;
		int nextpage = 0;
		if (currentRange != (int)Math.ceil((double) maxpage / limit))
			nextpage = currentRange * limit + 1;

		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("prevpage", prevpage);
		request.setAttribute("nextpage", nextpage);
		request.setAttribute("boardlist", boardlist);
		session.removeAttribute("spager");
		
		
		forward.setRedirect(false);
		forward.setPath("./admin/admin_notice/noticelist.jsp");
		return forward;
	}
}