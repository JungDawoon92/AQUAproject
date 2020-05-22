package admin.book.db;

import java.util.List;
import java.util.Map;

public interface BookDAO {
	public List<Map<String, Object>> bookPageList(int startNo, int recordsPerPage);
	public List<BookVO> bookList();
	public int getBookListCount();
	public BookVO bookInfo(int no);
	public int insert(BookVO book);
	public int bookUpdate(BookVO book);
	public int bookDelete(int no);
}
