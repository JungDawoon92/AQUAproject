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


public class ItemModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
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
				
				String uploadPath = request.getServletContext().getRealPath("/img");
				int size = 20 * 1024 * 1024; // 10mb
	
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
				Enumeration<?> files = multi.getFileNames();
				String file = (String)files.nextElement();
				String origfilename = multi.getOriginalFileName(file);
				Date strDate = Date.valueOf(multi.getParameter("st_date"));
				Date endDate = Date.valueOf(multi.getParameter("ed_date"));
				
				int compare = strDate.compareTo(endDate);
				if(compare <= 0 )
				{
					item.setNo(Integer.parseInt(multi.getParameter("no")));
					item.setI_name(enc.encoding(multi.getParameter("i_name")));
					item.setContent(enc.encoding(multi.getParameter("content")));
					item.setCnt(Integer.parseInt(multi.getParameter("cnt")));
					item.setTot(Integer.parseInt(multi.getParameter("tot")));
					item.setPrice(Integer.parseInt(multi.getParameter("price")));
					item.setCateg(enc.encoding(multi.getParameter("categ")));
					item.setImg(origfilename);
					item.setSt_date(strDate);
					item.setEd_date(endDate);
					item.setUp_date(Date.valueOf(LocalDate.now()));
					
					result = itembiz.itemUpdate(item);	
					
					if(result == false) {
						String dataUpdateError = "trueError";
						request.setAttribute("dataUpdateError", dataUpdateError);
						
						forward.setRedirect(false);
						forward.setPath("/ItemModifyAdmin.adx?no=" + multi.getParameter("no"));
						return forward;
					}
					
					item = itembiz.itemInfo(Integer.parseInt(multi.getParameter("no")));
					request.setAttribute("item", item);		
				}
				else
				{
					String dateInputError = "trueError";
					request.setAttribute("dateInputError", dateInputError);
					
					forward.setRedirect(false);
					forward.setPath("/ItemModifyAdmin.adx?no=" + multi.getParameter("no"));
					return forward;
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