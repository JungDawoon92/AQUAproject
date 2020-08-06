package client.book.action;

import java.sql.Date;
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
		String pg = (request.getParameter("page")==null)?"1":request.getParameter("page"); // 페이지 String으로 변환
		String categ_ft; // 원래 없던 필터가 생겨 이름이 혼동(추후 수정예정)
		if(request.getParameter("ft")!=null) {categ_ft = request.getParameter("ft");} else {categ_ft = "all";} //카테고리 String으로 전환
		boolean ft_exist = false; //카테고리 존재하는지
		ft_exist = categ_ft.equals("all")||categ_ft.equals("spring")||categ_ft.equals("summer")||categ_ft.equals("autumn")||categ_ft.equals("winter");
		
		String[] req_param = {"limiter","orderBy","st_date","ed_date","period_option"};
		
		for(String param : req_param) {	//request 영역에 필터 값이 왔을 경우 session에 세팅
			if(request.getParameter(param)!=null) {
				session.setAttribute(param, request.getParameter(param));
			}
		}
				
		boolean dateSel_option = false;
		int limit = 6;
		String orderBy = "descNo";
		if(session.getAttribute("orderBy")!=null) {
			orderBy = (String) session.getAttribute("orderBy");
		}
		if(session.getAttribute("limiter")!=null) {
			limit = Integer.parseInt((String)session.getAttribute("limiter"));
		}
		if(limit<1) {
			limit = 6;
		}
		int page = Integer.parseInt(pg);
		if(categ_ft==null||pg==null||categ_ft.equals("")||pg.equals("")||!ft_exist) {
			forward.setRedirect(true);
			forward.setPath("/bookList.bk?page=1&ft=all");
			return forward;
		}
		int offset = (page-1)*limit;
		Filter filter = new Filter();
		filter.setCateg(categ_ft);
		filter.setLimit(limit);
		filter.setOffset(offset);
		switch (orderBy) {
		case "ascNo":
			filter.setOrderByPrice(false);
			filter.setAscNo(true);
			break;
		case "descNo":
			filter.setOrderByPrice(false);
			filter.setAscNo(false);
			break;
		case "ascPrice":
			filter.setOrderByPrice(true);
			filter.setAscPrice(true);
			break;
		case "descPrice":
			filter.setOrderByPrice(true);
			filter.setAscPrice(false);
			break;
		default:
			filter.setOrderByPrice(false);
			filter.setAscNo(false);
			break;
		}
		if(session.getAttribute("st_date")!=null && !session.getAttribute("st_date").equals("")) {
			filter.setSt_date(Date.valueOf((String)session.getAttribute("st_date")));
		}
		if(session.getAttribute("ed_date")!=null && !session.getAttribute("ed_date").equals("")) {
			filter.setEd_date(Date.valueOf((String)session.getAttribute("ed_date")));
		}
		if(session.getAttribute("period_option")!=null) {
			dateSel_option = session.getAttribute("period_option").equals("or");
		}
		filter.setDateSel_option(dateSel_option);
		
		List<Item> itemList = (List<Item>) MybatisDAO.itemList(filter);
		int endPage = MybatisDAO.cntItem(filter)/limit;
		if(itemList.isEmpty()||MybatisDAO.cntItem(filter)%limit!=0) {
			endPage+=1;
		}
		if(page > endPage) {
			forward.setRedirect(true);
			forward.setPath("bookList.bk?page="+endPage+"&ft=all");
			return forward;
		}
		request.setAttribute("iListForPage", itemList);
		request.setAttribute("endPage", endPage);
		forward.setRedirect(false);
		forward.setPath("./client/book/bookList.jsp");
		return forward;
	}
}
