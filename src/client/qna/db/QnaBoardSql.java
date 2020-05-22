package client.qna.db;


import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.qna.db.QnaBoardBean;

public class QnaBoardSql implements QnaBoardDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			throw new RuntimeException("SqlMapClient instance." + e, e);
		}
	}
	
	public List<QnaBoardBean> getQnaAllBoardList(){
		SqlSession session = sqlSessionFactory.openSession();
		List<QnaBoardBean> list = null;
		list = session.selectList("getQnaAllBoardList");
		session.close();
		return list;
		
	}

	public List<QnaBoardBean> getBoardList(int page) {
		int startrow = (page - 1) * 10;
		List<QnaBoardBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("getQnaBoardList", startrow);
		session.close();
		return list;
	}
	
	public List<QnaBoardBean> getQBoardList(int page) {
		int startrow = (page - 1) * 10;
		List<QnaBoardBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("getQBoardList", startrow);
		session.close();
		return list;
	}
	
	public List<QnaBoardBean> getRBoardList(int q1, int q2) {
		
		HashMap<String,Integer> map = new HashMap();
		map.put("q1", q1);
		map.put("q2", q2);
		
		List<QnaBoardBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("getRBoardList",map);
		session.close();
		return list;
	}
	
	public int getListCount() {
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		count = session.selectOne("QnaListCount");
		session.close();
		return count;
	}

	public int boardInsert(QnaBoardBean board) {
		SqlSession session = sqlSessionFactory.openSession();
		int check = 0;
		try {
			check = session.insert("Qnainsert", board);
			
		} catch (Exception e) {
			System.out.println("boardInsert 에서 예외 : " + e.getMessage());
		}
		if(check > 0 ) {
			session.commit();
		} else {
			session.rollback();
			session.close();
			return check;
		}
		board = session.selectOne("getQnaBoard");
		try {
			check = session.update("QnaUpdate_ref",board);
			
		} catch (Exception e) {
			System.out.println("boardInsert2에서 예외 : " + e.getMessage());
		}
		
		if(check > 0) {
			session.commit();
			check = session.selectOne("Qnamax_num",board);
		} else {
			session.rollback();
		}
		session.close();
		return check;

	}

	public QnaBoardBean getDetail(int num) {
		QnaBoardBean board = null;
		SqlSession session = sqlSessionFactory.openSession();
		board = session.selectOne("getQnaDetail", num);
		session.close();
		return board;
	}

	public int boardReply(QnaBoardBean board) {
		SqlSession session = sqlSessionFactory.openSession();
		int check = 0;
		int num1 = 0;
		try {
			check = session.insert("QnainsertReply", board);
			
		} catch (Exception e) {
			System.out.println("boardReply 에서 예외 : " + e.getMessage());
		}
		if(check > 0 ) {
			session.commit();
		} else {
			session.rollback();
			session.close();
			return check;
		}
		
		try {
			check = session.update("QnaUpdateChe",board);
			
		} catch (Exception e) {
			System.out.println("boardReply2에서 예외 : " + e.getMessage());
		}
		
		if(check > 0) {
			session.commit();
			num1 = session.selectOne("Qnamax_num");
		} else {
			session.rollback();
			return check;
		}
		session.close();
		return num1;
	}

	public boolean boardModify(QnaBoardBean board) {

		SqlSession session = sqlSessionFactory.openSession();
		int check = 0;
		try {
			check = session.update("Qnamodify", board);
		} catch (Exception e) {
			System.out.println("boardModify에서 예외 " + e.getMessage());
		}
		
		
		if(check > 0) {
			session.commit();
			session.close();
			return true;
		} else {
			session.rollback();
			session.close();
			return false;
		}
		
	}

	public boolean boardDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("Qnadelete", num);
		} catch (Exception e) {
			System.out.println("boardDelete에서 예외 : " + e.getMessage());
		}
		
		QnaBoardBean board = session.selectOne("getQnaDetail",num);
		if(board.getRE_LEV() == 1) {
			session.delete("QnaReplyDelete",num);
			num = board.getRE_REF();
			try {
				result = session.update("QnaReplyDeleteUpdate",num);
			} catch (Exception e) {
				System.out.println("boardDelete2에서 예외 : " + e.getMessage());
			}
			
		}
	
		if(result > 0) {
			session.commit();
			session.close();
			return true;
		}
		session.rollback();
		session.close();
		return false;
	}

	public List<QnaBoardBean> getAllList() {
		List<QnaBoardBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("getQnaAllBoardList");
		session.close();
		return list;

	}
	
	public int getAllListCount() {

		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		count = session.selectOne("QnaAllListCount");
		session.close();
		return count;
	};
}
