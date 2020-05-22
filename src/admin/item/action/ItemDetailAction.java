package admin.item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.item.db.ItemBIZ;
import admin.item.db.ItemVO;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;
import aqua.module.Decoding;


public class ItemDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		ItemVO item = new ItemVO();
		Decoding deco = new Decoding();
		
		int currentPageNo = 1;
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", currentPageNo);
				
				if(request.getParameter("no") == null) {
					String dateInputError = "trueError";
					request.setAttribute("dateInputError", dateInputError);
					
					forward.setRedirect(false);
					forward.setPath("./admin/itemAdmin/ItemListAdmin.jsp");
					return forward;
				}
				else {
					item = itembiz.itemInfo(Integer.parseInt(request.getParameter("no")));

					if(item == null) {
						String selectError = "trueError";
						request.setAttribute("selectError", selectError);
						
						forward.setRedirect(false);
						forward.setPath("./admin/itemAdmin/ItemListAdmin.jsp");
						return forward;
					}
					String RequestURI = request.getRequestURI();
					String contextPath = request.getContextPath();
					String command = RequestURI.substring(contextPath.length());
					
					if(command.equals("/ItemModifyAdmin.adx")) {
						item.setI_name(deco.decoding(item.getI_name()));
						item.setContent(deco.decoding(item.getContent()));
					}
					else {
						item.setI_name(item.getI_name());
						item.setContent(item.getContent());
					}

					request.setAttribute("item", item);
				}
			}
			else
				return forward;
		}
		catch (Exception e) { e.printStackTrace(); }
		
		forward.setRedirect(false);
		forward.setPath("./admin/itemAdmin/ItemDetailAdmin.jsp");
		return forward;
	}
}