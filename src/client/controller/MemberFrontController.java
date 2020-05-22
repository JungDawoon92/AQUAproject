package client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.member.action.MemberJoinAction;
import client.member.action.MemberJoinView;
import client.member.action.MemberLeaveAction;
import client.member.action.MemberLeaveCheckView;
import client.member.action.MemberLeaveView;
import client.member.action.MemberLoginAction;
import client.member.action.MemberLogoutAction;
import client.member.action.MemberModifyAction;
import client.member.action.MemberModifyView;
import client.member.action.MemberViewAction;

public class MemberFrontController extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.print("member");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/client/member/loginForm.jsp");
		
		} else if (command.equals("/Index.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/index.jsp");
			
		} else if (command.equals("/MemberJoin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/client/member/joinForm.jsp");
		
		} else if (command.equals("/MemberView.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/client/member/member_info.jsp");
			
		} else if (command.equals("/MemberLeave.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/client/member/member_leave.jsp");
			
		} else if (command.equals("/MemberCheck.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/client/member/member_check.jsp");
			
		} else if (command.equals("/MemberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if (command.equals("/MemberJoinView.me")) {
			action = new MemberJoinView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberViewAction.me")) {
			action = new MemberViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if (command.equals("/MemberModifyView.me")) {
			action = new MemberModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberModifyAction.me")) {
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberCheckView.me")) {
			action = new MemberLeaveCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberLeaveView.me")) {
			action = new MemberLeaveView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberLeaveAction.me")) {
			action = new MemberLeaveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}