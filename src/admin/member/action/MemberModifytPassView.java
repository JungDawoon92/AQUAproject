package admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;

public class MemberModifytPassView implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AdminCheck AdminCheck = new AdminCheck();
		request.setCharacterEncoding("UTF-8");
		if(AdminCheck.adminCheck(request, forward) == true) {
			String id = request.getParameter("id");
			MemberBean member = MemberBiz.Detail(id);
			String uid = member.getId();
			String ps = member.getPass();
			if (request.getParameter("pageNo") != null) {
				request.setAttribute("pageNo", request.getParameter("pageNo"));
			} else if (request.getParameter("pageNoN") != null) {
				request.setAttribute("pageNoN", request.getParameter("pageNoN"));
			}
			request.setAttribute("id", uid);
			request.setAttribute("pass", ps);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/Member_Modifyps.jsp");
		}
		

		return forward;
	}
}
