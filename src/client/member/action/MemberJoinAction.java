package client.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.db.MemberBean;
import client.member.db.MemberDAO;

public class MemberJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		boolean result = false;
		System.out.println("회원가입");

		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setAddr(request.getParameter("addr"));
		member.setBirthday(request.getParameter("birthday"));
		member.setGen(request.getParameter("gen"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		
		if(member != null) {
			result = true;	
			MemberDAO.joinMember(member);
		}

		if (result == false) {
			return null;
		}

		forward.setRedirect(true);
		forward.setPath("./MemberLogin.me");
		return forward;
	}
}