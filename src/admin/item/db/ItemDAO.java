package admin.item.db;

import java.util.List;


public interface ItemDAO {
	public List<ItemVO> itemPageList(int begin, int end);
	public List<ItemVO> itemList();
	public int getItemListCount();
	public ItemVO itemInfo(int no);
	public boolean itemInsert(ItemVO item);
	public boolean itemUpdate(ItemVO item);
	public boolean itemDelete(int no);
}
