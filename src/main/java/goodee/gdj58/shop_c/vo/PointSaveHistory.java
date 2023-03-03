package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class PointSaveHistory { // 포인트 적립 이력
	private int pointSaveHistoryNo;
	private String pointSaveHistoryCategory; // '이벤트','쇼핑리뷰','예약리뷰','쇼핑환불','예약환불'
	private int pointSaveHistoryContent; // null or 쇼핑리뷰번호 or 예약리뷰번호 or 쇼핑환불번호 or 예약환불번호
	private String customerId;
	private int point;
	private String createdate;
}
