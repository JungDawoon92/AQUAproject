package client.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.book.db.Booked;
import client.book.db.MybatisDAO;
import client.member.db.MemberDAO;

public class MemberLeaveAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		boolean result = false;
		
		String id = (String) session.getAttribute("userid");
		System.out.println(id+"탈퇴 액션");
		List<Booked> bookedList = MybatisDAO.bookedList(id);
		int haveBookedSize = bookedList.size(); 
		System.out.println(haveBookedSize+"예약 수");
		
		if(haveBookedSize == 0) {
			System.out.println(id+"회원 탈퇴");
			if (id == null) {
				forward.setRedirect(true);
				forward.setPath("./MemberLogin.me");
				return forward;
			}
			if(id != null) {
				result = true;
				MemberDAO.leaveMember(id);
			}
			if (result == false) {
				return null;
			}
			
			session.removeAttribute("userid");
			session.invalidate();
			
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약된 상품이 있어 탈퇴 하실 수 없습니다. \\n예약 취소 후 탈퇴해 주십시오.');");
			out.println("location.href='./MemberViewAction.me';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		forward.setRedirect(true);
		forward.setPath("./MemberLogin.me");
		return forward;
	}
}