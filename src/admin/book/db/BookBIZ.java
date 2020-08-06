package admin.book.db;


import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BookBIZ implements BookDAO {
	private static SqlSessionFactory sqlSessionFactory;
	private static BookBIZ biz = new BookBIZ();
	
	public static BookBIZ getInstance() {
		return biz;
	}

	private BookBIZ() {}

	static
	{
		try
		{
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}
		catch(IOException e) 
		{ throw new RuntimeException("SqlMapClient instance." +e, e); }
	}
	
	public List<Map<String, Object>> bookPageList(int startNo, int recordsPerPage)
	{
		List<Map<String, Object>> list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		SqlSession session = sqlSessionFactory.openSession();
		map.put("startNo", startNo);
		map.put("recordsPerPage", recordsPerPage);
		try { list = session.selectList("bookPageList", map); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return list;
	}
	
	public List<BookVO> bookList()
	{
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try { list = session.selectList("bookList"); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return list;
	}
	
	public int getBookListCount(){
		
		SqlSession session = sqlSessionFactory.openSession();
		int count = 0;
		try { count = session.selectOne("bookListCount"); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return count;
	}
	
	public Map<String, Object> bookInfo(int pno)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = null;
		try { map = session.selectOne("bookInfo", pno); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return map;
	}
	
	public boolean bookInsert(BookVO book)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try { 
			result = session.insert("bookInsert", book);
			if(result != 0) { 
				session.commit();
				session.close();
				return true;
			}
			else { 
				session.rollback(); 
				session.close();
				return true;
			}
		}
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		return false;
	}
	
	public boolean bookUpdate(Map<String, Object> map)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try { 
			result = session.update("bookUpdate", map);
			if(result != 0) { 
				session.commit();
				session.close();
				return true;
			}
			else { 
				session.rollback(); 
				session.close();
				return true;
			}
		}
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return false;
	}
	
	public boolean bookDelete(int num)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try { 
			result = session.delete("bookDelete", num);
			if(result != 0) { 
				session.commit();
				session.close();
				return true;
			}
			else { 
				session.rollback(); 
				session.close();
				return true;
			}
		}
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return false;	
	}
}
