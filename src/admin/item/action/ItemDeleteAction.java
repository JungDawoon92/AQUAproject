package admin.item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.item.db.ItemBIZ;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;
import aqua.module.Paging;


public class ItemDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		boolean result = false;
		int pages = 1;
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				result = itembiz.itemDelete(Integer.parseInt(request.getParameter("no")));
				if (result == false) {
					String dataDeleteError = "trueError";
					request.setAttribute("dataDeleteError", dataDeleteError);
				}	
				
				pages = itembiz.getItemListCount();
				pages = (int)Math.ceil((double)pages / 10);
				if(Integer.parseInt(request.getParameter("pages")) <= pages)
					pages = Integer.parseInt(request.getParameter("pages"));
			}
			else
				return forward;
		}
		catch(Exception e) { e.printStackTrace(); }
		
		forward.setRedirect(false);
		forward.setPath("/ItemListAdmin.adx?pages="+pages);
		return forward;
	}
}