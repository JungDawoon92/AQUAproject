package client.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Book;
import client.book.db.Item;
import client.book.db.MybatisDAO;

public class BookedDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		String pNum = request.getParameter("pno");
		String page = request.getParameter("page");
		if(page==null||page.equals("")) {
			page = "1";
		}
		if(pNum==null) {
			forward.setRedirect(true);
			forward.setPath("/bookedList.bk");
			return forward;
		}
		
		int pno = Integer.parseInt(pNum);
		Book pInfo = MybatisDAO.bookInfo(pno);
		Item iInfo = MybatisDAO.itemInfo(pInfo.getRef_ino());
		
		request.setAttribute("page", page);
		request.setAttribute("pInfo", pInfo);
		request.setAttribute("iInfo", iInfo);
		forward.setRedirect(false);
		forward.setPath("./client/book/bookedDetail.jsp");
		return forward;
	}
	
}
