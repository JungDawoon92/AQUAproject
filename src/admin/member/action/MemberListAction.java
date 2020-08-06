package admin.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;



public class MemberListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String pageNo = request.getParameter("pageNo");
		AdminCheck result = new AdminCheck();
		if(result.adminCheck(request, forward)==true) {
			List<MemberBean> bean = MemberBiz.list();
			request.setAttribute("member", bean);
			request.setAttribute("pageNo", pageNo);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/member_list.jsp");
		}
			
		return forward;
	}
}
