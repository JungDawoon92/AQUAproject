package admin.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.db.BookBIZ;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;


public class BookDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		BookBIZ bookbiz = BookBIZ.getInstance();
		int pages = 1;
		
		boolean result = false;
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				result = bookbiz.bookDelete(Integer.parseInt(request.getParameter("pno")));
				if (result == false) {
					String dataDeleteError = "trueError";
					request.setAttribute("dataDeleteError", dataDeleteError);
				}
				
				pages = bookbiz.getBookListCount();
				pages = (int)Math.ceil((double)pages / 10);
				if(Integer.parseInt(request.getParameter("pages")) <= pages)
					pages = Integer.parseInt(request.getParameter("pages"));
			}
			else
				return forward;
		}
		catch(Exception e) { e.printStackTrace(); }
		
		forward.setRedirect(false);
		forward.setPath("/BookListAdmin.ady?pages="+ pages);
		return forward;
	}
}