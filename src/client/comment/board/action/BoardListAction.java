package client.comment.board.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.comment.board.db.BoardDAO;

public class BoardListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		BoardDAO boarddao = new BoardDAO();
		List boardlist = new ArrayList();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = boarddao.getListCount();
		
		boardlist = boarddao.getBoardList(page);
		
		int maxpage = (int) Math.ceil((double) listcount/ 10);
		
		int currentRange = (int) Math.ceil((double) page / limit);
		int totalRanges = (int) Math.ceil((double) maxpage / limit);
		int startpage = (currentRange - 1) * limit + 1;
		
		///////////////////////페이징 prev,next처리//////////////////////////////////////
		
		int endpage =currentRange * limit;
		if (currentRange == totalRanges)
			endpage = maxpage;
		
		int prevpage = 0;
		
		if (currentRange != 1)
			prevpage = (currentRange - 2) * limit + 1;
		
		int nextpage = 0;
		
		if (currentRange != (int)Math.ceil((double) maxpage / limit))
			nextpage = currentRange * limit + 1;
		
		////////////////////////댓글 총 숫자 가져오기 ///////////////////////////////////

		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		map = boarddao.countcomment();
		request.setAttribute("boardcommentcount", map);
		
		////////////////////////////////////////////////////////////////////////
		
		

		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		////
		request.setAttribute("prevpage", prevpage);
		request.setAttribute("nextpage", nextpage);
		////
		session.removeAttribute("spager");
		
		
		///////////////////////////////////////////////////////
		Object sortrecent = session.getAttribute("sortrecent");
			int sort= 0;
			if (sortrecent != null) {
				sort = 0;
			}
			session.setAttribute("sortrecent", sort);
		///////////////////////////////////////////////////////
		
		

		forward.setRedirect(false);
		forward.setPath("./client/comment_client/board/review_board_list.jsp");
		return forward;
	}
}