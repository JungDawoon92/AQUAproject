package admin.item.action;


import java.sql.Date;
import java.time.LocalDate;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.item.db.ItemBIZ;
import admin.item.db.ItemVO;
import aqua.module.Action;
import aqua.module.ActionForward;
import aqua.module.AdminCheck;
import aqua.module.Encoding;


public class ItemAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = new ActionForward();
		ItemBIZ itembiz = ItemBIZ.getInstance();
		ItemVO item = new ItemVO();
		Encoding enc = new Encoding();
		boolean result = false;
		
		try {
			AdminCheck admin = new AdminCheck();
			if(admin.adminCheck(request, forward) == true) {
				int currentPageNo = 1;
				if (request.getParameter("pages") != null)
		            currentPageNo = Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", currentPageNo);
				
				//System.out.println("debug" + forward.getPath());
				String uploadPath = request.getServletContext().getRealPath("/img");
				int size = 20 * 1024 * 1024; // 10mb
				//System.out.println("debug" + uploadPath);
				String origfilename = "";
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
				Enumeration<?> files = multi.getFileNames();
				String file = (String)files.nextElement();
	
				origfilename = multi.getOriginalFileName(file);
				
				Date strDate = Date.valueOf(multi.getParameter("st_date"));
				Date endDate = Date.valueOf(multi.getParameter("ed_date"));
				
				int compare = strDate.compareTo(endDate);
				if(compare <= 0 ) {
					item.setCateg(enc.encoding(multi.getParameter("categ")));
					item.setI_name(enc.encoding(multi.getParameter("i_name")));
					item.setContent(enc.encoding(multi.getParameter("content")));
					item.setCnt(Integer.parseInt(multi.getParameter("tot")));
					item.setTot(Integer.parseInt(multi.getParameter("tot")));
					item.setPrice(Integer.parseInt(multi.getParameter("price")));
					item.setImg(origfilename);
					item.setSt_date(strDate);
					item.setEd_date(endDate);
					item.setUp_date(Date.valueOf(LocalDate.now()));
					System.out.println("------");
					System.out.println(item.getI_name());
					result = itembiz.itemInsert(item);	
					
					if(result == false) {
						String dataInsertError = "trueError";
						request.setAttribute("dataInsertError", dataInsertError);
						
						forward.setRedirect(false);
						forward.setPath("./admin/itemAdmin/ItemAddAdmin.jsp");
						return forward;
					}
					
					request.setAttribute("item", item);		
				}
				else {
					String dateInputError = "trueError";
					request.setAttribute("dateInputError", dateInputError);
					
					forward.setRedirect(false);
					forward.setPath("./admin/itemAdmin/ItemAddAdmin.jsp");
					return forward;
				}
			}
			else 
				return forward;
		}
		catch(Exception e){ e.printStackTrace(); }
		
		forward.setRedirect(true);
		forward.setPath("./ItemListAdmin.adx");
		return forward;
	}
}