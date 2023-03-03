package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class PaySaveHistory { // 페이 충전 내역
	private int paySaveHistoryNo;
	private String paySaveHistoryCategory; // '충전','쇼핑환불','예약환불'
	private int paySaveHistoryContent; // null or 주문번호 or 예약번호
	private String customerId;
	private int price;
	private String createdate;
}
