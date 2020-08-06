package client.qna.db;


import java.util.List;

import client.qna.db.QnaBoardBean;

public interface QnaBoardDAO {

	public List<QnaBoardBean> getQnaAllBoardList();
	public List<QnaBoardBean> getBoardList(int page);
	public List<QnaBoardBean> getQBoardList(int page);
	public List<QnaBoardBean> getRBoardList(int q1, int q2);
	public int getListCount();
	public int boardInsert(QnaBoardBean board);
	public QnaBoardBean getDetail(int num);
	public int boardReply(QnaBoardBean board);
	public boolean boardModify(QnaBoardBean board);
	public boolean boardDelete(int num);
	public boolean boardAllDelete(int num);
	public List<QnaBoardBean> getAllList();
	public int getAllListCount();
	public QnaBoardBean getReplyDetail(int num);
	public List<QnaBoardBean> getQnaIndexBoardList();  
	
}
