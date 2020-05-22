package admin.book.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.db.BookBIZ;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;


public class BookDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		BookBIZ bookBIZ = BookBIZ.getInstance();
		Map<String, Object> bookMap = new HashMap<String, Object>();

		try {
		AdminCheck admin = new AdminCheck();
		if(admin.adminCheck(request, forward) == true) {
			int currentPageNo = 1;
			if (request.getParameter("pages") != null)
	            currentPageNo = Integer.parseInt(request.getParameter("pages"));
			request.setAttribute("pages", currentPageNo);
			
			if(request.getParameter("pno") == null) {
				String dateInputError = "trueError";
				request.setAttribute("dateInputError", dateInputError);
				
				forward.setRedirect(false);
				forward.setPath("./admin/bookAdmin/BookListAdmin.jsp");
				return forward;
			}
			else {
				bookMap = bookBIZ.bookInfo(Integer.parseInt(request.getParameter("pno")));
				//System.out.println("debug >" + bookMap);
				if(bookMap == null) {
					String selectError = "trueError";
					request.setAttribute("selectError", selectError);
					
					forward.setRedirect(false);
					forward.setPath("./admin/bookAdmin/BookListAdmin.jsp");
					return forward;
				}
				
				request.setAttribute("bookMap", bookMap);
				//System.out.println("debug" + bookMap);
			}   
		}
		else
			return forward;
		}
		catch (Exception e) { e.printStackTrace(); }
		
		forward.setRedirect(false);
		forward.setPath("./admin/bookAdmin/BookDetailAdmin.jsp");
        return forward;
	}
}