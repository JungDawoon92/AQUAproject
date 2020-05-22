package admin.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		String pageNo = request.getParameter("pageNo");
		System.out.println(id);
		int result = MemberBiz.delete(id);
		
		if(result == 0) {
			System.out.println("삭제 실패");
			return null;
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			forward.setPath("member_list.ad");
		}		
		forward.setRedirect(false);
		request.setAttribute("pageNo", pageNo);
		return forward;	
	}
}