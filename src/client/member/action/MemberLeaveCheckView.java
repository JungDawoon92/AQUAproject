package client.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.db.MemberBean;
import client.member.db.MemberDAO;



public class MemberLeaveCheckView implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		String id = (String) session.getAttribute("userid");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		forward.setRedirect(true);
		forward.setPath("./MemberCheck.me");
		return forward;
	}
}
