package admin.notice.action;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aqua.module.Action;
import aqua.module.ActionForward;



public class AdminNoFileDownloadAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		
		String fileName = request.getParameter("file");
	
		String folder = request.getSession().getServletContext().getRealPath("/UploadFolder");
	
		String filePath = folder + "/" + fileName;
		
		
		try {
			File file = new File(filePath);

			byte b[] = new byte[(int) file.length()];
	
			String encoding = new String(fileName.getBytes("utf-8"), "8859_1");
		
			
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachement;filename="+encoding);
			response.setHeader("Content-disposition", "attachement;filename="+fileName);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			if (file.isFile()) {
				FileInputStream fileInputStream = new FileInputStream(file);
				ServletOutputStream servletOutputStream = response.getOutputStream();
				int readNum = 0;
				while ((readNum = fileInputStream.read(b)) != -1) {
					servletOutputStream.write(b, 0, readNum);
				}
				servletOutputStream.close();
				fileInputStream.close();
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	}
