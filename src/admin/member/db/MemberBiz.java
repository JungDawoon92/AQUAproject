package admin.member.db;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class MemberBiz {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		sqlSessionFactory =new SqlSessionFactoryBuilder().build(reader);
		reader.close();			
		} catch (Exception e) {
			throw new RuntimeException("SqlSessionFactory instance." + e, e);
		}
	}
	
	private static MemberBiz dao = new MemberBiz();
	
	public static MemberBiz getInstance() {
		return dao;
	}
	public static List<MemberBean> list() throws SQLException{
		List<MemberBean> list=null;
		SqlSession session = sqlSessionFactory.openSession();
			list = session.selectList("list"); 
			session.close();
		return list;	
	}
	
	
	public static MemberBean Detail(String id) throws SQLException {
		MemberBean bean = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			bean = (MemberBean) session.selectOne("memberDetail",id);
		} catch (Exception e) {	}
		finally {if(session!=null) session.close();	}
		return bean;
	}
	public static List<MemberBean> search(String id) throws SQLException{
		List<MemberBean> list=null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("memberSearch", id); 
		} catch (Exception e) {}
		finally {if(session!=null) 	session.close(); }
		return list;		
	}
	
	public static String searchid(String name) throws SQLException{
		String ids = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			ids = session.selectOne("memberSearchid", name); 
		} catch (Exception e) {}
		finally {if(session!=null) 	session.close(); }
		return ids;		
	}
	
	public static int delete(String id) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.delete("memberDelete", id);
		session.commit();
		session.close();
		return result;
	}
	public static int insert(MemberBean member) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.insert("memberInsert", member);
		session.commit();
		session.close();
		return result;
	}
	
	
	public static int update(MemberBean member) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.update("memberUpdate", member);
		session.commit();
		session.close();
		return result;
	}
	public static int updatepass(MemberBean member) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.update("adminpassmodi", member);
		if(result == 1 ) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

}
