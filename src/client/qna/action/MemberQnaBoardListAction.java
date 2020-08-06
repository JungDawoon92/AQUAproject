package client.qna.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.QnABoardPaging;
import client.qna.db.QnaBoardBean;
import client.qna.db.QnaBoardDAO;
import client.qna.db.QnaBoardSql;


public class MemberQnaBoardListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		QnaBoardDAO boarddao = new QnaBoardSql();
		List qboardlist = new ArrayList();
		List rboardlist = new ArrayList();

		int page = 1;
//		int limit = 10;

		if (request.getParameter("page") != null) {
			try {
				page = Integer.parseInt(request.getParameter("page"));
				if(page < 1) {
					page = 1;
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}	
		}

		int listcount = boarddao.getListCount();
		 
		QnABoardPaging paging = new QnABoardPaging(page,listcount);
		int endpage = paging.endPage();
		int beginpage = paging.beginPage();
		int prevpage = paging.prevPage();
		int nextpage = paging.nextPage();
		int maxpage = paging.totalPage();

		if(page > maxpage) {
			page = maxpage;
		}
		
		qboardlist = boarddao.getQBoardList(page);
		QnaBoardBean q1 = (QnaBoardBean) qboardlist.get(0);
		QnaBoardBean q2 = (QnaBoardBean) qboardlist.get(qboardlist.size()-1);
		rboardlist = boarddao.getRBoardList(q1.getNUM(),q2.getNUM());
		
		request.setAttribute("listcount", listcount);
		request.setAttribute("page", page);
		request.setAttribute("beginpage", beginpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("prevpage", prevpage);
		request.setAttribute("nextpage", nextpage);	
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("qboardlist", qboardlist);
		request.setAttribute("rboardlist", rboardlist);
		
		forward.setRedirect(false);

		forward.setPath("/client/qna/qna_board_list_user.jsp");		
		return forward;
	}
}
