package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Report { // 신고
	private int reportNo;
	private int orderSheetNo; // 주문서
	private String reportContent; // 신고 내용
	private String createdate;
}
