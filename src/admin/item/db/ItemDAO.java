package admin.item.db;

import java.util.List;


public interface ItemDAO {
	public List<ItemVO> itemPageList(int begin, int end);
	public List<ItemVO> itemList();
	public int itemListCount();
	public ItemVO itemInfo(int no);
	public int itemInsert(ItemVO item);
	public int itemUpdate(ItemVO item);
	public int itemDelete(int no);
}
