package admin.book.db;

import java.util.List;
import java.util.Map;

public interface BookDAO {
	public List<Map<String, Object>> bookPageList(int startNo, int recordsPerPage);
	public List<BookVO> bookList();
	public int getBookListCount();
	public Map<String, Object> bookInfo(int no);
	public boolean bookInsert(BookVO book);
	public boolean bookUpdate(Map<String, Object> map);
	public boolean bookDelete(int no);
}
