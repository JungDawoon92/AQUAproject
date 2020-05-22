package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.book.action.BookAddAction;
import admin.book.action.BookDeleteAction;
import admin.book.action.BookDetailAction;
import admin.book.action.BookListAction;
import admin.book.action.BookModifyAction;
import aqua.module.Action;
import aqua.module.ActionForward;

public class BookAdminFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		System.out.println("bookAdmin");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("debug >>" + RequestURI);
		System.out.println("debug >>" + command);
		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/indexAdmin.adx"))
		{
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/itemAdmin/indexAdmin.jsp");
		}
		else if (command.equals("/BookListAdmin.ady"))
		{
			action = new BookListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/BookAddAdmin.ady"))
		{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/bookAdmin/BookAddAdmin.jsp");
		}
		else if (command.equals("/BookAddAction.ady"))
		{
			action = new BookAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/BookDetailAdmin.ady"))
		{
			action = new BookDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/BookModifyAdmin.ady"))
		{
			action = new BookDetailAction();
			try {
				forward = action.execute(request, response);
				forward.setPath("./admin/bookAdmin/BookModifyAdmin.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/BookModifyAction.ady"))
		{
			action = new BookModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/BookDeleteAction.ady"))
		{
			action = new BookDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		if (forward != null)
		{
			if (forward.isRedirect())
			{
				response.sendRedirect(forward.getPath());
			} 
			else
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("get1");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doProcess(request, response);
	}
}