package admin.qna.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.QnABoardPaging;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;

public class AdminQnaBoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		QnaBoardDAO boarddao = new QnaBoardSql();
		List boardlist = new ArrayList();	

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			if(page < 1) {
				page = 1;
			}
		}

		int listcount = boarddao.getAllListCount();
		
		boardlist = boarddao.getBoardList(page);
		
		QnABoardPaging paging = new QnABoardPaging(page,listcount); 
		
		int endpage = paging.endPage();
		int beginpage = paging.beginPage();
		int prevpage = paging.prevPage();
		int nextpage = paging.nextPage();
		int maxpage = paging.totalPage();
		
		if(page > maxpage) {
			page = maxpage;
		}
		
		request.setAttribute("listcount", listcount);
		request.setAttribute("page", page);
		request.setAttribute("beginpage", beginpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("prevpage", prevpage);
		request.setAttribute("nextpage", nextpage);	
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardlist", boardlist);
		
		forward.setRedirect(false);

		forward.setPath("/admin/qna/qna_board_list_admin.jsp");		
		return forward;
		
	}
	

}
