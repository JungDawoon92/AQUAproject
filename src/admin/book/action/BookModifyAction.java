package admin.book.action;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.db.BookBIZ;
import admin.book.db.BookVO;
import admin.item.db.ItemBIZ;
import admin.item.db.ItemVO;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;

public class BookModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		ItemVO item = new ItemVO();
		BookBIZ bookbiz = BookBIZ.getInstance();
		BookVO book = new BookVO();
		Map<String, Object> bookMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = false;
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				int currentPageNo = 1;
				if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", currentPageNo);
				
				book.setPno(Integer.parseInt(request.getParameter("pno")));

				item = itembiz.itemInfo(Integer.parseInt(request.getParameter("no")));
				if(item == null) {
					String selectError = "trueError";
					request.setAttribute("selectError", selectError);
					
					forward.setRedirect(false);
					forward.setPath("/BookModifyAdmin.ady?pno=" + request.getParameter("pno"));
					return forward;
				}
				else
					book.setRef_ino(Integer.parseInt(request.getParameter("no")));
				
				map.put("ref_ino", Integer.parseInt(request.getParameter("no")));
				map.put("cnt", Integer.parseInt(request.getParameter("cnt")));
				map.put("up_date", Date.valueOf(LocalDate.now()));
				map.put("pno", Integer.parseInt(request.getParameter("pno")));		

				result = bookbiz.bookUpdate(map);
				if(result == false) {
					String dataUpdateError = "trueError";
					request.setAttribute("dataUpdateError", dataUpdateError);
					
					forward.setRedirect(false);
					forward.setPath("./admin/bookAdmin/BookListAdmin.jsp");
					return forward;
				}
				else {
					bookMap = bookbiz.bookInfo(Integer.parseInt(request.getParameter("pno")));
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