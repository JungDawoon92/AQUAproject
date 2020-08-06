package client.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.db.MemberBean;
import client.member.db.MemberDAO;

public class MemberViewAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		String id = (String) session.getAttribute("userid");
		System.out.println(id+"내정보");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		member = MemberDAO.getDetailMember(id);

		if (member == null) {
			return null;
		}

		request.setAttribute("member", member);

		forward.setRedirect(false);
		forward.setPath("./client/member/member_info.jsp");
		return forward;
	}
}