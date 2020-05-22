package admin.member.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		String pageNo = request.getParameter("pageNo");
		System.out.println(request.getParameter("pageNo"));
		if(id.equals("admin") && !id.equals("null")) {
			List<MemberBean> bean = MemberBiz.list();
			
			request.setAttribute("member", bean);
			request.setAttribute("pageNo", pageNo);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/member_list.jsp");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("./admin/loginAdmin/loginfromM.jsp");
		}
		
		
		return forward;	
	}
}
