package admin.notice.db;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;


import aqua.module.FactoryService;

public class NoticeBiz{
	DataSource ds;
	
	public NoticeBiz() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc_maria");

		} catch (Exception ex) {
			return;
		}
	}

	public int insert(NoticeBean board) {
		SqlSession session = FactoryService.getFactory().openSession();
		int insert = session.insert("Noticeinsert", board);
		session.commit();
		session.close();
		return insert;
	}

	public boolean delete(int num) {
		SqlSession session = FactoryService.getFactory().openSession();
		int result = session.update("Noticedelete", num);
		session.commit();
		session.close();
		if (result > 0) {
			return true;
		}
		return false;
	}

	public NoticeBean detail(int num) {
		NoticeBean board = null;
		SqlSession session = FactoryService.getFactory().openSession();
		board = session.selectOne("Noticedetail", num);
		session.close();
		return board;
	}

	public boolean modify(NoticeBean board) {
		SqlSession session = FactoryService.getFactory().openSession();
		int check = session.update("Noticemodify", board);
		session.commit();
		session.close();
		if (check > 0) {
			return true;
		} else {
			return false;
		}

	}

	public List list(int page) {
		int startrow = (page - 1) * 10;
		List list = null;
		SqlSession session = FactoryService.getFactory().openSession();
		list = session.selectList("Noticelist", startrow);
		session.close();
		return list;
	}

	public int NoticelistCount() {
		int x = 0;
		SqlSession session = FactoryService.getFactory().openSession();
		x = session.selectOne("NoticelistCount");
		session.close();
		return x;
	}

	public List recentnotice() {
		SqlSession session = FactoryService.getFactory().openSession();
		List list = null;
		list = session.selectList("recentnotice");
		session.close();
		return list;
	}
	
	public void Noticereadcount(int num)throws Exception{
		SqlSession session = FactoryService.getFactory().openSession();
		session.update("Noticereadcount",num);
		session.commit();
		session.close();
	}

}
