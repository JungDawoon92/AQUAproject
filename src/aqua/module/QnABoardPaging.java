package aqua.module;

public class QnABoardPaging {
	
		private int pageNo;
		private int listcount;
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	
		public QnABoardPaging(int pageNo,int listcount) {
			if(pageNo < 1) {
				pageNo = 1;
			}
			this.pageNo = pageNo;
			this.listcount = listcount;
		}

		public QnABoardPaging() {
			super();
		}
		
		public int currentRange() {
			int totalPages = totalPage();
			if(this.pageNo > totalPages) {
					this.pageNo = totalPages;
			}
			int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE); 
			return currentRange;
		}
		
		public int beginPage() {
			int currentRange = currentRange();
			int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
			return beginPage;
		}
		
		public int totalPage() {
			int totalPages = (int) Math.ceil((double) listcount / ROW_PER_PAGE);
			return totalPages;
		}
		
		public int totalRange() {
			
			int totalPage =  totalPage();
			int totalRanges = (int) Math.ceil((double) totalPage / PAGE_PER_PAGE); // 전체 Range 갯수
			return totalRanges;
		}
		
		public int endPage() {
			int totalRanges = totalRange(); // 전체 Range 갯수
			int totalPages = totalPage();
			int currentRange = currentRange(); //요청된 pageNo의 현재 range			
			int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
			if (currentRange == totalRanges)
				endPage = totalPages; // currentRange가 맨 마지막 range인 경우
			return endPage;
		}
		
		public int prevPage() {
			int prevPage = 0;
			int currentRange = currentRange();
			if (currentRange != 1)
				prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
			return prevPage;
		}
		
		public int nextPage() {
			int nextPage = 0;
			int currentRange = currentRange();
			int totalRanges = totalRange();
			if (currentRange != totalRanges)
				nextPage = currentRange * PAGE_PER_PAGE + 1;
			return nextPage;
		}
		
}
