package admin.item.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.item.db.ItemBIZ;
import admin.item.db.ItemVO;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;
import aqua.module.Paging;



public class ItemListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		List<ItemVO> itemlist = new ArrayList<ItemVO>();

		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
		        int currentPageNo = 1;        
		
		        if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
		
		
		        Paging paging = new Paging(currentPageNo);
		        
		        //System.out.println("debug >" + paging);
		        int startNo = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
		
		        itemlist = itembiz.itemPageList(startNo , paging.getRecordsPerPage());      
		       
		        //System.out.println("debug >" + itemlist);
		
		        paging.setNumberOfRecords(itembiz.getItemListCount());
		 
		        //System.out.println("debug > " + paging.getNumberOfRecords);
		
		        paging.makePaging();    
		        
		        if (itemlist != null) {
		            request.setAttribute("itemlist", itemlist);
		            request.setAttribute("paging", paging);
		            request.setAttribute("servletPath", "./ItemListAdmin.adx");
		 
		            //System.out.println("debug > " + request.getAttribute("itemList"));
		            //System.out.println("debug > " + request.getAttribute("paging"));
		            //System.out.println("debug > " + request.getAttribute("servletPath"))
		        }
		        else {
		            request.setAttribute("msg", "Error 가 발생했습니다.");   
		            
		            //System.out.println("debug >  msg : "  + request.getAttribute("msg"));
		        }  
			}
			else
				return forward;
		}
		catch (Exception e) { e.printStackTrace(); }
        
		forward.setRedirect(false);
		forward.setPath("./admin/itemAdmin/ItemListAdmin.jsp");
        return forward;
	}
}