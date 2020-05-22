package admin.member.db;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	 public List<MemberBean> list();
	 public List<MemberBean> search(String id);
	 public int insert(Map map);
	 public void searchid(String id);
	 public int delete (String id);
	 public int update(Map map);
	 public int updatepass(Map map);
 }
