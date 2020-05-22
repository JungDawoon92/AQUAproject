package client.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Booked;
import client.book.db.MybatisDAO;

public class BookedListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String uid = (String)session.getAttribute("userid");
		int page = request.getParameter("page")!=null?Integer.parseInt(request.getParameter("page")):1;
		List<Booked> bookedList = (List<Booked>) MybatisDAO.bookedList(uid);
		if(uid==null) {
			forward.setRedirect(true);
			forward.setPath("/aqua/index.bk");
			return forward;
		}
		
		int bListCut = 6;
		if(bListCut<1) {
			bListCut = 6;
		}
		List<Booked> bListForPage = new ArrayList<Booked>();
		
		int begin = (page - 1) * bListCut;
		int end = page * bListCut;
		
		int endPage = bookedList.size()/bListCut;
		
		if(bookedList.size()%bListCut!=0) {
			endPage+=1;
		}
		try {
		
			for(int i = begin; i < end; i++) {
				if(i==bookedList.size()) {
					break;
				}
				bListForPage.add(bookedList.get(i));
			}
			
		} catch (Exception e) {
		
			forward.setRedirect(true);
			forward.setPath("/aqua/bookedList.bk?page=1");
			return forward;
			
		}
		request.setAttribute("bListForPage", bListForPage);
		request.setAttribute("endPage", endPage);
		forward.setRedirect(false);
		forward.setPath("./client/book/bookedList.jsp");
		return forward;
	}
	
}
