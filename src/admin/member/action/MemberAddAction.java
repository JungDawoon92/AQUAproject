package admin.member.action;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;




public class MemberAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");	
		String email = request.getParameter("email1");
		Map<String, Object> param = new HashMap<>();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		
		if(id.equals("admin") && !id.equals("null")) {
			param.put("id", request.getParameter("id"));
			param.put("pass", request.getParameter("pass"));
			param.put("name", request.getParameter("name"));
			param.put("addr", request.getParameter("addr"));
			param.put("birthday", java.sql.Date.valueOf(request.getParameter("birthday")));
			param.put("phone", request.getParameter("phone"));
			param.put("email", email);
			param.put("gen", request.getParameter("gen"));
			MemberBiz.insert(param);
			request.setAttribute("pageNo", request.getParameter("pageNo"));
			forward.setRedirect(false);
			forward.setPath("member_list.ad");
		} else {
			forward.setRedirect(true);
			forward.setPath("./admin/loginAdmin/loginfromM.jsp");
		}
			
			return forward;	
	}
}