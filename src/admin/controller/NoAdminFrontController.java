package admin.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.notice.action.AdminNoAddAction;
import admin.notice.action.AdminNoDeleteAction;
import admin.notice.action.AdminNoDetailAction;
import admin.notice.action.AdminNoFileDownloadAction;
import admin.notice.action.AdminNoListAction;
import admin.notice.action.AdminNoModifyAction;
import admin.notice.action.AdminNoModifySee;
import aqua.module.Action;
import aqua.module.ActionForward;


public class NoAdminFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		System.out.println();
	
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/AdminNoAddAction.adn")) {
			action = new AdminNoAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoWriteAction.adn")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_notice/noticewrite.jsp");

		} else if (command.equals("/AdminNoDeleteAction.adn")) {
			action = new AdminNoDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoList.adn")) {
			action = new AdminNoListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoDetailAction.adn")) {
			action = new AdminNoDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoModifySee.adn")) {
			action = new AdminNoModifySee();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoModifyAction.adn")) {
			action = new AdminNoModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/AdminNoFileDownloadAction.adn")) {
			action = new AdminNoFileDownloadAction();
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
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
