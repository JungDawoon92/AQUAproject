package aqua.module;

public class Encoding {
	public String encoding(String content) {
		String str = content;
		try {
			str = str.replaceAll("<", "&lt");
			str = str.replaceAll(">", "&gt");
			str = str.replaceAll("\"", "&#34");
			str = str.replaceAll("\'", "&#039");
			str = str.replaceAll("\r\n", "<br>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
}
