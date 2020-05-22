package admin.member.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.db.MemberBiz;
import aqua.module.Action;
import aqua.module.ActionForward;

public class MemberModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");	
		System.out.println(request.getParameter("id"));
		String pageNo = request.getParameter("pageNo");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String addr = request.getParameter("addr");
		java.sql.Date date = java.sql.Date.valueOf(request.getParameter("birthday"));
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		System.out.println(id + pass + addr + date + phone + email);		
		
		Map<String, Object> param = new HashMap<>();
			param.put("id", id);
			param.put("pass", pass);
			param.put("addr", addr);
			param.put("birthday", date);
			param.put("phone", phone);
			param.put("email", email);
			param.put("gen", request.getParameter("gen"));
			int result = MemberBiz.update(param);
			System.out.println(result);
			if(result==0) {
				String a = "0";
				request.setAttribute("result", a);
			}else {
				String b = "1";
				request.setAttribute("result", b);
			}
			
			
			System.out.println("통과");
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("id", request.getParameter("id"));
			forward.setRedirect(false);
			forward.setPath("MemberViewAction.ad");
			return forward;	
	}
}
