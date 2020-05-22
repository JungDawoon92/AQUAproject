package client.book.db;

import java.util.List;

public interface BookDAO {
	public int cntItem();
	public List<Item> itemList(Filter filter);
	public Item itemInfo(int no);
	public List<Booked> bookedList(String ref_id);
	public List<Booked> lastBookedList(String ref_id);
	public void bookIns(Book book);
	public void itemCntDown(int no);
	public void itemCntUp(Book book);
	public void bookDel(int pno);
	public int cntBookId(String ref_id);
	public Book bookInfo(int pno);
	public void updateItem(Item item);
	public void updatebook(Book book);
}
