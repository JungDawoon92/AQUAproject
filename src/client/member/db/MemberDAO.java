package client.member.db;

import java.io.Reader;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader =
					Resources.getResourceAsReader("client/mapping/SqlMapConfig.xml");
			sqlSessionFactory =
					new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e) {
			throw new RuntimeException("SqlMapClient instance" + e, e);
		}
	}
	public static  MemberBean isMember(String id){
		MemberBean member = null;
		SqlSession session = sqlSessionFactory.openSession();
		member = (MemberBean) session.selectOne("isMember", id);
		session.close();
		return member;
	}
	
	public static List<MemberBean> idMember(){
		List<MemberBean> member = null;
		SqlSession session = sqlSessionFactory.openSession();
		member = session.selectList("idMember");
		session.close();
		return member;
	}
	
	public static MemberBean getDetailMember(String id){
		MemberBean member = null;
		SqlSession session = sqlSessionFactory.openSession();
		member = session.selectOne("getDetailMember", id);
		session.close();
		return member;
	}
	
	public static void joinMember(MemberBean member){
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("joinMember", member);
		session.commit();
		session.close();
	}
	
	public static void updateMember(MemberBean member){
		SqlSession session = sqlSessionFactory.openSession();
		session.update("updateMember", member);
		session.commit();
		session.close();
	}
	
	public static void leaveMember(String id){
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("leaveMember", id);
		session.commit();
		session.close();
	}
}
