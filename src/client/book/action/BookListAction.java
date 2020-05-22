package client.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Filter;
import client.book.db.Item;
import client.book.db.MybatisDAO;

public class BookListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String pg = request.getParameter("page");
		String categ_ft = request.getParameter("ft");
		
		int iListCut = 6;
		if(iListCut<1) {
			iListCut = 6;
		}
		int page = Integer.parseInt(pg);
		if(categ_ft==null||pg==null||categ_ft.equals("")||pg.equals("")) {
			forward.setRedirect(true);
			forward.setPath("/aqua/bookList.bk?page=1&ft=all");
			return forward;
		}
		
		Filter filter = new Filter();
		filter.setCateg(categ_ft);
		filter.setLimit(iListCut);
		filter.setOffset(page);
		
		
		List<Item> itemList = (List<Item>) MybatisDAO.itemList(filter);
		
		int endPage = MybatisDAO.cntItem()/iListCut;
		if(itemList.size()%iListCut!=0) {
			endPage+=1;
		}
		
		
		request.setAttribute("iListForPage", itemList);
		request.setAttribute("endPage", endPage);
		forward.setRedirect(false);
		forward.setPath("./client/book/bookList.jsp");
		return forward;
	}
}
