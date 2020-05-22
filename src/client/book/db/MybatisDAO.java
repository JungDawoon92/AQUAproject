package client.book.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("client/mapping/SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			throw new RuntimeException("SqlSessionFactory instance." + e, e);
		} 
	}
	public static int cntItem() {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession();
		cnt = session.selectOne("cntItem");
		session.close();
		return cnt;
	}
	public static List<Item> itemList(Filter filter) {
		List<Item> list = null;
		if(filter.getCateg().equals("all")) {
			filter.setCateg("%");
		}
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("itemList", filter);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public static Item itemInfo(int no) {
		Item item = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			item = (Item) session.selectOne("itemInfo", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return item;
	}
	public static List<Booked> bookedList(String ref_id) {
		List<Booked> bookedList = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			bookedList = session.selectList("bookedList", ref_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return bookedList;
	}
	public static List<Booked> lastBookedList(String ref_id) {
		List<Booked> lastBookedList = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			lastBookedList = session.selectList("lastBookedList", ref_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return lastBookedList;
	}
	public static void bookIns(Book book) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("bookIns",book);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public static void itemCntDown(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("itemCntDown", no);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public static void itemCntUp(Book book) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("itemCntUp", book);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public static void bookDel(int pno) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("bookDel", pno);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public static int cntBookId(String ref_id) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession();
		cnt = session.selectOne("cntBookId", ref_id);
		session.close();
		return cnt;
	}
	public static Book bookInfo(int pno) {
		Book book = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			book = (Book) session.selectOne("bookInfo", pno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return book;
	}
	public static void updateItem(Item item) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("updateItem", item);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public static void updateBook(Book book) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("updateBook", book);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
