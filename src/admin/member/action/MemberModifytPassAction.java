package admin.member.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberModifytPassAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		String ids = (String) session.getAttribute("adminid");
		String uid = request.getParameter("id");
		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pass"));
		if(ids.equals("admin") && !ids.equals("null")) {
			Map<String, Object> member = new HashMap<>();
				member.put("id", request.getParameter("id"));
				member.put("pass", request.getParameter("pass"));
			int result = MemberBiz.updatepass(member);
			if(result ==1 ) {
				if(request.getParameter("pageNo")!=null) {
					forward.setPath("MemberViewAction.ad?id="+request.getParameter("id")+"&pageNo="+(String)request.getParameter("pageNo"));
				}
				if(request.getParameter("pageNoN")!=null) {
					forward.setPath("MemberViewAction.ad?id="+request.getParameter("id")+"&pageNoN="+(String)request.getParameter("pageNoN"));
				}
				forward.setRedirect(false);
				
			}else {
				forward.setRedirect(false);
				forward.setPath("./admin/loginAdmin/member_list.ad");
			}
		} else {
			forward.setRedirect(true);
			forward.setPath("loginfromM.jsp");
		}
			return forward;	
	}
}
