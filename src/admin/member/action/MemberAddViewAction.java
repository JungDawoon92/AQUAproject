package admin.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBean;
import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;



public class MemberAddViewAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		AdminCheck result = new AdminCheck();
		if(result.adminCheck(request, forward) == true) {
			List<MemberBean> bean = MemberBiz.list();
			ArrayList<String> ids = new ArrayList<>();
			for (int i = 0; i < bean.size(); i++) {
				MemberBean member = (MemberBean) bean.get(i);
				ids.add(member.getId());
			}
			System.out.println("회원추가 뷰어");
			request.setAttribute("pageNo", request.getParameter("pageNo"));
			request.setAttribute("ids", ids);
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/MemberAdd.jsp");
		}
		

		return forward;

	}
}