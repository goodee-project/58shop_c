package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class RefundHistory { // 환불 내역
	private int goodsOrderNo;
	private String refundHistoryState; // 환불 상태 ('환불신청','환불완료')
	private String refundHistoryReason; // 환불 사유
	private String updatedate;
	private String createdate;
}
