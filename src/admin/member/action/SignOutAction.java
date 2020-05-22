package admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;

public class SignOutAction implements Action {
		public ActionForward execute(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ActionForward forward = new ActionForward();
			
			HttpSession session = request.getSession();
			
			session.invalidate();
			System.out.println("세션초기화");
			forward.setPath("loginformM.ad");
			forward.setRedirect(true);
			return forward;
		}
}
