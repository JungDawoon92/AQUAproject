package aqua.module;

public class Decoding {
	public String decoding(String content) {
		String str = content;
		
		try {
			str = str.replaceAll("<br>", "\\\\n");
			str = str.replaceAll("&lt", "<");
			str = str.replaceAll("&gt", ">");
			str = str.replaceAll("&#34", "\\\\\"");
			str = str.replaceAll("&#039", "\\\\\"");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
}
