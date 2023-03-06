package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Report { // 신고
	private int reportNo;
	private String reportCategory; // '예약', '쇼핑'
	private int reportContent; // 예약 or 주문 번호
	private String reportMemo;
	private String createdate;
}
