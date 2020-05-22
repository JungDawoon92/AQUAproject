package client.notice.action;

public class IndexEncode {
	public String encoding(String content) {
			content.replace("&", "&amp;");
			content.replace("<", "&lt;");
			content.replace(">", "&gt;");
		return content;
	}
}
