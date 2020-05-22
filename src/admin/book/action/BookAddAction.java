package admin.book.action;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.db.BookBIZ;
import admin.book.db.BookVO;
import admin.item.db.ItemBIZ;
import admin.item.db.ItemVO;
import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;

public class BookAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		BookBIZ bookbiz = BookBIZ.getInstance();
		BookVO book = new BookVO();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		ItemVO item = new ItemVO();
		MemberBean member = new MemberBean();
		
		boolean result = false;
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				int currentPageNo = 1;
				if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", currentPageNo);
				
				
				if(request.getParameter("id") != null) {
					member = MemberBiz.Detail(request.getParameter("id"));
					if(member != null)
						book.setRef_id(request.getParameter("id"));
					else {
						String selectError = "trueError";
						request.setAttribute("selectError", selectError);
						
						forward.setRedirect(false);
						forward.setPath("./admin/bookAdmin/BookAddAdmin.jsp");
						return forward;
					}
				}
				else
					System.out.println("error >> BookAddAction");
					
				
				if(request.getParameter("no") != null) {
					item = itembiz.itemInfo(Integer.parseInt(request.getParameter("no")));
					if(item == null) {
						String selectError = "trueError";
						request.setAttribute("selectError", selectError);
						
						forward.setRedirect(false);
						forward.setPath("./admin/bookAdmin/BookAddAdmin.jsp");
						return forward;
					}
					else
						book.setRef_ino(Integer.parseInt(request.getParameter("no")));
				}
				
				book.setCnt(Integer.parseInt(request.getParameter("cnt")));
				book.setUp_date(Date.valueOf(LocalDate.now()));
				result = bookbiz.bookInsert(book);	
				
				if(result == false) {
					String dataInsertError = "trueError";
					request.setAttribute("dataInsertError", dataInsertError);
					
					forward.setRedirect(false);
					forward.setPath("./admin/bookAdmin/BookAddAdmin.jsp");
					return forward;
				}
				
				request.setAttribute("book", book);		
			}
			else
				return forward;
		}
		catch(Exception e){ e.printStackTrace(); }
		
		//booklist = bookbiz.bookList();
		
		forward.setRedirect(true);
		forward.setPath("./BookListAdmin.ady");
		return forward;
	}
}