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

public class LastBookedListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String uid = (String)session.getAttribute("userid");
		int page = request.getParameter("page")!=null?Integer.parseInt(request.getParameter("page")):1;
		List<Booked> lastBookedList = (List<Booked>) MybatisDAO.lastBookedList(uid);
		if(uid==null) {
			forward.setRedirect(true);
			forward.setPath("./Index.me");
			return forward;
		}
		int bListCut = 6;
		if(bListCut<1) {
			bListCut = 6;
		}
		List<Booked> last_bListForPage = new ArrayList<Booked>();
		
		int begin = (page - 1) * bListCut;
		int end = page * bListCut;
		
		int endPage = lastBookedList.size()/bListCut;
		if(lastBookedList.size()%bListCut!=0) {
			endPage+=1;
		}
		try {
			for(int i = begin; i < end; i++) {
				if(i==lastBookedList.size()) {
					break;
				}
				last_bListForPage.add(lastBookedList.get(i));
			}
		} catch (Exception e) {
			forward.setRedirect(true);
			forward.setPath("/lastBookedList.bk?page=1");
			return forward;
		}
		
		
		request.setAttribute("last_bListForPage", last_bListForPage);
		request.setAttribute("endPage", endPage);
		forward.setRedirect(false);
		forward.setPath("./client/book/lastBookedList.jsp");
		return forward;
	}
	
}
