package client.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;
import client.qna.action.MemberQnaBoardAddAction;
import client.qna.action.MemberQnaBoardDeleteAction;
import client.qna.action.MemberQnaBoardDetailAction;
import client.qna.action.MemberQnaBoardListAction;
import client.qna.action.MemberQnaBoardModifyAction;
import client.qna.action.MemberQnaBoardModifyView;

public class QnaBoardFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QnA_client");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		System.out.println("debug >>" + command);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userid");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println(time1 + "// 사용자: " + id + "님이 " + command + "로 접속");
		
		if (command.equals("/QnABoardList.qa")) {
			action = new MemberQnaBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} 
		
		else if (command.equals("/QnABoardWrite.qa")) {
			forward = new ActionForward();
			forward.setRedirect(false);

			if (id != null) {
				forward.setPath("/client/qna/qna_board_write.jsp");
			} else {
				forward.setRedirect(true);
				forward.setPath("./login.me");
			}
		}

		else if (command.equals("/QnABoardAddAction.qa")) {
			action = new MemberQnaBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardDetailAction.qa")) {
			action = new MemberQnaBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardModify.qa")) {
			action = new MemberQnaBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardModifyAction.qa")) {
			action = new MemberQnaBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnABoardDeleteAction.qa")) {
			action = new MemberQnaBoardDeleteAction();
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