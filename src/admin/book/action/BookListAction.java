package admin.book.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.db.BookBIZ;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;
import aqua.module.Paging;


public class BookListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		BookBIZ bookBIZ = BookBIZ.getInstance();
		List<Map<String, Object>> bookList = new ArrayList<Map<String, Object>>();
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
		        int currentPageNo = 1;        
		        System.out.println("deb   " + request.getParameter("pages") );
		        if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
		        
		        Paging paging = new Paging(currentPageNo);
		        
		        //System.out.println("debug >" + paging);
		        int startNo = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
		        
		        bookList = bookBIZ.bookPageList(startNo , paging.getRecordsPerPage());      
		        
		        //System.out.println("debug >" + bookList);
		
		        paging.setNumberOfRecords(bookBIZ.getBookListCount());
		 
		        //System.out.println("debug > " + paging.getNumberOfRecords());
		        
		        paging.makePaging();    
		        
		        
		        if (bookList != null) {
		            request.setAttribute("bookList", bookList);
		            request.setAttribute("paging", paging);
		            request.setAttribute("servletPath", "./BookListAdmin.ady");
		            
		            //System.out.println("debug > " + request.getAttribute("bookList"));
		            //System.out.println("debug > " + request.getAttribute("paging"));
		            //System.out.println("debug > " + request.getAttribute("servletPath"));
		        }
		        else {
		            request.setAttribute("msg", "Error 가 발생했습니다.");   
		 
		            //System.out.println("debug >  msg : "  + request.getAttribute("msg"));
		        }    
			}
			else
				return forward;
			}
		catch (Exception e) { e.printStackTrace(); }
		
		forward.setRedirect(false);
		forward.setPath("./admin/bookAdmin/BookListAdmin.jsp");
        return forward;
	}
}