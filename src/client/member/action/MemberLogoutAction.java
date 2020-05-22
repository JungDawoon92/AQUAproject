package client.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberLogoutAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
//		MemberDAO memberdao = new MemberDAO();
//		MemberBean member = new MemberBean();
		
		String id = (String) session.getAttribute("userid");
		
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		session.removeAttribute("userid");
		session.invalidate();
		
		forward.setRedirect(true);
		forward.setPath("./Index.me");
		return forward;
	}
}
