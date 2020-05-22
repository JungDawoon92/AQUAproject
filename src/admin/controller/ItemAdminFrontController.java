package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.item.action.ItemAddAction;
import admin.item.action.ItemDeleteAction;
import admin.item.action.ItemDetailAction;
import admin.item.action.ItemListAction;
import admin.item.action.ItemModifyAction;
import aqua.module.Action;
import aqua.module.ActionForward;

public class ItemAdminFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		System.out.print("itemAdmin");
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
			forward.setPath("./admin/indexAdmin.jsp");
		}
		else if (command.equals("/ItemListAdmin.adx"))
		{
			action = new ItemListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ItemAddAdmin.adx"))
		{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/itemAdmin/ItemAddAdmin.jsp");
		}
		else if (command.equals("/ItemAddAction.adx"))
		{
			action = new ItemAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ItemDetailAdmin.adx"))
		{
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ItemModifyAdmin.adx"))
		{
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
				forward.setPath("./admin/itemAdmin/ItemModifyAdmin.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ItemModifyAction.adx"))
		{
			action = new ItemModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/ItemDeleteAction.adx"))
		{
			action = new ItemDeleteAction();
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