package client.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Book;
import client.book.db.MybatisDAO;

public class BookedDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String uid = (String)session.getAttribute("userid");
		String[] values = request.getParameterValues("chk_list");
		int pno;
		Book book = null;
		if(MybatisDAO.cntBookId(uid)!=0&&values!=null) {
			for(String chk_pno : values) {
				pno = Integer.parseInt(chk_pno);
				book = MybatisDAO.bookInfo(pno);
				MybatisDAO.itemCntUp(book);
				MybatisDAO.bookDel(pno);
				System.out.println("삭제한 일련번호 >>"+ pno);
			}
		}
		forward.setRedirect(true);
		forward.setPath("./bookedList.bk");
		return forward;
	}
	
}
