package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.qna.action.AdminQnaBoardDeleteAction;
import admin.qna.action.AdminQnaBoardDetailAction;
import admin.qna.action.AdminQnaBoardList;
import admin.qna.action.AdminQnaBoardModifyAction;
import admin.qna.action.AdminQnaBoardModifyView;
import admin.qna.action.AdminQnaBoardMultiDeleteAction;
import admin.qna.action.AdminQnaBoardReplyAction;
import admin.qna.action.AdminQnaBoardReplyView;
import aqua.module.Action;
import aqua.module.ActionForward;


public class QnaAdminFrontController extends HttpServlet implements javax.servlet.Servlet {

	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		
		if(command.equals("/QnABoardList.adq")) {
			action = new AdminQnaBoardList();
			try {
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/QnABoardDetailAction.adq")) {
			action = new AdminQnaBoardDetailAction();
			try {
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/QnABoardDeleteAction.adq")) {
			action = new AdminQnaBoardDeleteAction();
			try {
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/QnABoardMultiDelete.adq")) {
			action = new AdminQnaBoardMultiDeleteAction();
			try {
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/QnABoardReplyView.adq")) {
			action = new AdminQnaBoardReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardReplyAction.adq")) {
			action = new AdminQnaBoardReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/QnABoardModify.adq")) {
			action = new AdminQnaBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardModifyAction.adq")) {
			action = new AdminQnaBoardModifyAction();
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
