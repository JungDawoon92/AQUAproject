package aqua.module;

public class QEncoding {
	public String encoding(String content) {
		String str = content;
		
		try {
			str = str.replaceAll("&", "&amp;");
			str = str.replaceAll("<","&lt" );
			str = str.replaceAll(">","&gt" );
			str = str.replaceAll("\r\n","<br>");
			str = str.replaceAll(" ", "&nbsp");
			str = str.replaceAll("\\\\\"","&#34" );
			str = str.replaceAll("\\\\\"","&#039" );
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
}
