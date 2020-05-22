 package admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberViewAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String pageNo = request.getParameter("pageNo");
		String viewId = request.getParameter("id");
		String pageNoN = request.getParameter("pageNoN");
		System.out.println(pageNoN);
		String uid = request.getParameter("uid");
		MemberBean bean = MemberBiz.Detail(viewId);
		System.out.println(request.getParameter("id"));
		if (bean == null) {
			return null;
		}

		request.setAttribute("uid", uid);
		request.setAttribute("pageNoN", pageNoN);
		request.setAttribute("member", bean);
		request.setAttribute("pageNo", pageNo);
		forward.setRedirect(false);
		forward.setPath("./admin/loginAdmin/member_info.jsp");
		return forward;
	}
}