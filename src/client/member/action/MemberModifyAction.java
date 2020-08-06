package client.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.db.MemberBean;
import client.member.db.MemberDAO;

public class MemberModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		boolean result = false;
		member.setId((String)session.getAttribute("userid"));
		
		if((request.getParameter("pass") == null) || (request.getParameter("pass").trim().isEmpty())){
			return null;
		} else if ((request.getParameter("name") == null) || (request.getParameter("name").trim().isEmpty())){
			return null;
		} else if ((request.getParameter("addr") == null) || (request.getParameter("addr").trim().isEmpty())){
			return null;
		} else if ((request.getParameter("birthday") == null) || (request.getParameter("birthday").trim().isEmpty())){
			return null;
		} else if ((request.getParameter("email") == null) || (request.getParameter("email").trim().isEmpty())){
			return null;
		} else if ((request.getParameter("phone") == null) || (request.getParameter("phone").trim().isEmpty())){
			return null;
		} 
		
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setGen(request.getParameter("gen"));
		member.setAddr(request.getParameter("addr"));
		member.setBirthday(request.getParameter("birthday"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		
		if(member != null) {
			result = true;	
			MemberDAO.updateMember(member);
		}

		if (result == false) {
			return null;
		}
		System.out.println(member.getPass() + "내정보 변경");
		
		forward.setRedirect(true);
		forward.setPath("./MemberViewAction.me");
		return forward;
	}
}
