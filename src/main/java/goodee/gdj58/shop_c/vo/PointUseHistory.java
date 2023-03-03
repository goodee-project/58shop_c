package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class PointUseHistory { // 포인트 사용 내역
	private int pointUseHistoryNo;
	private String pointUseHistoryCategory; // '쇼핑구매','예약구매'
	private int pointUseHistoryContent; // 주문번호 or 예약번호
	private String customerId;
	private int point;
	private String createdtae;
}
