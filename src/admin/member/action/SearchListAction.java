package admin.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;

public class SearchListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AdminCheck AdminCheck = new AdminCheck();
		if(AdminCheck.adminCheck(request, forward) == true) {
			request.setCharacterEncoding("utf-8");
			
			String viewId = request.getParameter("uid");
			System.out.println(viewId);
			if (viewId.equals("")) {
				viewId = null;
			}
			System.out.println(viewId);
			request.setAttribute("search", viewId);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/member_searchView.jsp");
		}
	
	
		return forward;
	}
}
