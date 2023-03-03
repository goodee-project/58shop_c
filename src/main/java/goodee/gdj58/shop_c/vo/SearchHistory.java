package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class SearchHistory { // 검색 이력
	private int searchHistoryNo;
	private String customerId; // 비회원 : null
	private String searchHistoryWord; // 검색어
	private String createdate;
}
