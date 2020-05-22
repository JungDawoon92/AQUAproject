package admin.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.action.MemberAddAction;
import admin.member.action.MemberAddViewAction;
import admin.member.action.MemberDeleteAction;
import admin.member.action.MemberListAction;
import admin.member.action.MemberLoginAction;
import admin.member.action.MemberModifyAction;
import admin.member.action.MemberModifyViewAction;
import admin.member.action.MemberModifytPassAction;
import admin.member.action.MemberModifytPassView;
import admin.member.action.MemberViewAction;
import admin.member.action.SearchListAction;
import admin.member.action.SignOutAction;
import aqua.module.Action;
import aqua.module.ActionForward;



public class ManagerFrontController extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("접속");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		System.out.println("debug >>" + RequestURI);
		System.out.println("debug >>" + command);
		if (command.equals("/loginformM.ad")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/loginAdmin/loginformM.jsp");
		} else if (command.equals("/member_list.ad")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/MemberAdd.ad")) {
			action = new MemberAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/MemberAddView.ad")) {
			action = new MemberAddViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/loginAction.ad")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MemberViewAction.ad")) {
			action = new MemberViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if (command.equals("/MemberModifyView.ad")) {
			action = new MemberModifyViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/memberModify.ad")) {
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/Memberdelete.ad")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/Membersearch.ad")) {
			action = new SearchListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if (command.equals("/Sign_out.ad")) {
			action = new SignOutAction();
			try {
			    forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if (command.equals("/PassModify.ad")) {
			action = new MemberModifytPassView();
			try {
			    forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		} else if(command.equals("/memberpassmodi.ad")) {
			action = new MemberModifytPassAction();
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