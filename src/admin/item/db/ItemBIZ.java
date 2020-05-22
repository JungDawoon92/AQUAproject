package admin.item.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;




public class ItemBIZ {
	private static SqlSessionFactory sqlSessionFactory;
	private static ItemBIZ biz = new ItemBIZ();
	
	public static ItemBIZ getInstance() {
		return biz;
	}

	private ItemBIZ() {}

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
	
	public List<ItemVO> itemPageList(int startNo, int recordsPerPage)
	{
			List<ItemVO> list = null;
			Map<String, Integer> map = new HashMap<String, Integer>();
			SqlSession session = sqlSessionFactory.openSession();
			map.put("startNo", startNo);
			map.put("recordsPerPage", recordsPerPage);
		try { list = session.selectList("itemPageList", map); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return list;
	}
	
	public List<ItemVO> itemList()
	{
		List<ItemVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("itemList");
		try { list = session.selectList("itemList"); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return list;
	}
	
	public int getItemListCount() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		int count = 0;
		try { count = session.selectOne("itemListCount"); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return count;
	}
	
	public ItemVO itemInfo(int num)
	{
		SqlSession session = sqlSessionFactory.openSession();
		ItemVO itemVO = null;
		try { itemVO = session.selectOne("itemInfo", num); }
		catch (Exception e) { e.printStackTrace(); }
		finally { session.close(); }
		
		return itemVO;
	}

	public boolean itemInsert(ItemVO item)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();	
		try { 
			result = session.insert("itemInsert", item); 
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
	
	public boolean itemUpdate(ItemVO item)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try { 
			result = session.update("itemUpdate", item);
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
	
	public boolean itemDelete(int num)
	{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try { 
			result = session.delete("itemDelete", num);
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
