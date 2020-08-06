package admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;

public class MemberModifyViewAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		AdminCheck AdminCheck = new AdminCheck();
		if(AdminCheck.adminCheck(request, forward)==true) {
			String viewId = request.getParameter("id");
			String pageNo = request.getParameter("pageNo");
			MemberBean bean = MemberBiz.Detail(viewId);

			if (bean == null) {	return null; }

			System.out.println(viewId);
			request.setAttribute("member", bean);
			request.setAttribute("pageNo", pageNo);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/Member_Modify.jsp");
		}
	

		return forward;
	}
}