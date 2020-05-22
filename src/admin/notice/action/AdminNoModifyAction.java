package admin.notice.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.notice.db.NoticeBean;
import admin.notice.db.NoticeBiz;
import aqua.module.Action;
import aqua.module.ActionForward;


public class AdminNoModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		NoticeBiz boarddao = new NoticeBiz();
		NoticeBean board = new NoticeBean();

		int fileSize = 5 * 1024 * 1024;
		String uploadPath = request.getServletContext().getRealPath("/UploadFolder");

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "utf-8",
					new DefaultFileRenamePolicy());

			int num = Integer.parseInt(multi.getParameter("num"));
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String prevFile = multi.getParameter("prevFile");

			board.setNum(num);
			board.setSubject(subject);
			board.setContent(content);
			Enumeration<String> fileNames = multi.getFileNames();
			if (fileNames.hasMoreElements()) {
				String fileName = fileNames.nextElement();
				String updateFile = multi.getFilesystemName(fileName);
				if (updateFile == null) {
					board.setFile(prevFile);
				} else {
					board.setFile(updateFile);
				}
				
			}
			
			boolean result = boarddao.modify(board);
		
			result = boarddao.modify(board);
			if(result){
				forward.setRedirect(true); 
				forward.setPath("./AdminNoList.adn");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}
}