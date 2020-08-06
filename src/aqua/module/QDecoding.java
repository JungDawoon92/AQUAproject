package aqua.module;

public class QDecoding {
	public String decoding(String content) {
		String str = content;
		
		try {
			str = str.replaceAll("&amp;", "&");
			str = str.replaceAll("&lt", "<");
			str = str.replaceAll("&gt", ">");
			str = str.replaceAll("<br>", "\r\n");
			str = str.replaceAll("&nbsp"," ");
			str = str.replaceAll("&#34", "\\\\\"");
			str = str.replaceAll("&#039", "\\\\\"");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
}
