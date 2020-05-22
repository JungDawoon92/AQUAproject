package client.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.db.MemberBean;
import client.member.db.MemberDAO;

public class MemberJoinView implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		List<MemberBean> member = MemberDAO.idMember();
		ArrayList<String> id = new ArrayList<>();
		
		for(int i = 0; i < member.size(); i++){
			MemberBean mem = (MemberBean) member.get(i);
			id.add(mem.getId());
		}
		
		request.setAttribute("id", id);
		System.out.println("회원가입 화면");
		forward.setRedirect(false);
		forward.setPath("./client/member/joinForm.jsp");
		return forward;
	}
}
