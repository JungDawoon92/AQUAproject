package admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;



public class MemberViewAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AdminCheck AdminCheck = new AdminCheck();
		if(AdminCheck.adminCheck(request, forward)==true) {
			String pageNo = request.getParameter("pageNo");
			String viewId = request.getParameter("id");
			String pageNoN = request.getParameter("pageNoN");

			MemberBean bean = MemberBiz.Detail(viewId);
			if (bean == null) {	return null;}

			request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageNoN", pageNoN);
			request.setAttribute("uid", request.getParameter("uid"));
			request.setAttribute("member", bean);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/member_info.jsp");
		}
		
		return forward;
	}
}