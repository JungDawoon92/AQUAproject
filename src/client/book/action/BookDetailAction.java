package client.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Item;
import client.book.db.MybatisDAO;

public class BookDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		String itemNo = request.getParameter("ino");
		String page = request.getParameter("page");
		String ft = request.getParameter("ft");
		String prev = "page="+page+"&ft="+ft;
		if(itemNo==null) {
			forward.setRedirect(true);
			forward.setPath("/bookList.bk");
			return forward;
		}
		
		int ino = Integer.parseInt(itemNo);
		Item itemInfo = MybatisDAO.itemInfo(ino);
		
		request.setAttribute("prev", prev);
		request.setAttribute("itemInfo", itemInfo);
		forward.setRedirect(false);
		forward.setPath("./client/book/bookDetail.jsp");
		return forward;
	}
	
}
