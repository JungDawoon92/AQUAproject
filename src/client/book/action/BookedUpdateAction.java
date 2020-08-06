package client.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Book;
import client.book.db.Item;
import client.book.db.MybatisDAO;

public class BookedUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String uid = (String)session.getAttribute("userid");
		if(uid == null) {
			forward.setRedirect(true);
			forward.setPath("./Index.me");
			return forward;
		}
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("수정된 일련번호>>"+pno);
		Book book = MybatisDAO.bookInfo(pno);
		Item item = MybatisDAO.itemInfo(book.getRef_ino());
		int tot = book.getCnt() + item.getCnt();
		int cnt = Integer.parseInt(request.getParameter("getCnt"));
		book.setCnt(cnt);
		MybatisDAO.updateBook(book);
		item.setCnt(tot-cnt);
		MybatisDAO.updateItem(item);
		
		forward.setPath("./bookedDetail.bk?pno="+pno);
		forward.setRedirect(true);
		
		return forward;
	}
}
