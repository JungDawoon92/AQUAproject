package client.book.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Book;
import client.book.db.Item;
import client.book.db.MybatisDAO;

public class BookedAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		String uid = (String)session.getAttribute("userid");
		int ino = Integer.parseInt(request.getParameter("item_no"));
		int cnt = Integer.parseInt(request.getParameter("getCnt"));
		System.out.println("예약한 상품 번호 >>"+ino);
		if(uid==null) {
			response.sendRedirect("javascript:history.go(-2)");
		} else {
			Book book = new Book(uid, ino, null, cnt, 0);
			Item item = MybatisDAO.itemInfo(ino);
			
			if(item.getCnt()!=0 && item.getCnt() >= cnt) {
				for(int i = 0; i < cnt; i++) {
					MybatisDAO.itemCntDown(ino);
				}
				MybatisDAO.bookIns(book);
			}
		}
		forward.setPath("./bookedList.bk");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
