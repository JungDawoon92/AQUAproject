package client.comment.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.comment.board.db.BoardBean;
import client.comment.board.db.BoardDAO;
import client.comment.comment.db.CommentBean;
import client.comment.comment.db.CommentDAO;
import client.comment.like.db.BoardLikeDAO;

public class BoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		CommentDAO commentdao = new CommentDAO(); // 댓글 리스트 가져오기 위해서
		CommentBean commentdata = new CommentBean();
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		session.setAttribute("likenum", num);
		
		int pager=1;
		if (request.getParameter("pager") != null) {
			pager = Integer.parseInt(request.getParameter("pager"));
		}
		
////////////////////////////////////////////////////////////////////////////////////////////
		String id = null; 
		if (session.getAttribute("userid") != null) {
			id = (String) session.getAttribute("userid");
			BoardLikeDAO likedao = new BoardLikeDAO();
			int likecheck = 0; // 그 사람이 눌렀냐 안눌렀냐 확인 
			likecheck=likedao.isLikeCheck(num, id);
			request.setAttribute("likecheck", likecheck);
		}
/////////////////////////////////////////////////////////////////////////////////////////////		
		
		Object spager = session.getAttribute("spager"); 
		
		if (spager != null) {
			pager = ((Integer)(session.getAttribute("spager"))).intValue();
		}
		
		session.setAttribute("spager", pager);
		
///////////////////////////////////////////////////////////////////////////////////////////////
		
		request.setAttribute("pager", pager);
		
		
		try {
			int add = Integer.parseInt(request.getParameter("add")); //글을 클릭했을때만 조회수 올라가기 위한 장치// 다른곳에서 여기방문했을때 add값이없어 오류 try catch 
			if(add == 1) {
				boarddao.setReadCountUpdate(num);
			}
		} catch(Exception ex) {
		}
		
		
		boarddata = boarddao.getDetail(num);

		if (boarddata == null) {
			return null;
		}
		
		request.setAttribute("boarddata", boarddata);
		
		
		/////////////////////////댓글리스트 보여주는 로직///////////////////////////////////////////////
		
		List commentlist = new ArrayList();

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int commentlistcount = commentdao.commentListCount(num);
		
		
		commentlist = commentdao.getCommentList(page,num);

		int maxpage = (int) ((double) commentlistcount / limit + 0.95);

		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("commentlistcount", commentlistcount);
		request.setAttribute("commentlist", commentlist);
		
		////////////////////////////////////////////////////////////////////////
		forward.setRedirect(false);
		forward.setPath("./client/comment_client/board/review_board_view.jsp");
		return forward;

	}
}