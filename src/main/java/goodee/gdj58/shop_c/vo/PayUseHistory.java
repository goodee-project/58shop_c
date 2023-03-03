package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class PayUseHistory { // 페이 사용 내역
	private int payUseHistoryNo;
	private int payUseHistoryCategory; // '탈퇴','쇼핑구매','예약구매'
	private int payUseHistoryContent; // null or 주문번호 or 예약번호
	private String customerId;
	private int price;
	private String createdate;
}
