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


public class AdminNoAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("adminid");
		NoticeBiz boarddao = new NoticeBiz();
		NoticeBean board = new NoticeBean();
		ActionForward forward = new ActionForward();
		String uploadPath = request.getServletContext().getRealPath("/boardupload");

		int fileSize = 5 * 1024 * 1024;

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "utf-8",
					new DefaultFileRenamePolicy());
			String fileName = "";
			Enumeration<String> names = multi.getFileNames();
			if(names.hasMoreElements())
			{
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
			}
		
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile(fileName);

			int result = boarddao.insert(board);
	
			if (result > 0) {

				forward.setRedirect(true);
				forward.setPath("./AdminNoList.adn");
			} else {

				return null;
			}
			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}