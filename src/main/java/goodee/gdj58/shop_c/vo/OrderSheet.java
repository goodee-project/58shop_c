package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class OrderSheet { // 주문서
	private int orderSheetNo;
	private int orderTotalNo; // 여러 업체의 주문서를 묶은 통합주문서
	private String companyId;
	private int customerAddressNo; // 배송지 번호
	private String customerId;
	private String orderSheetState; // 주문 상태 ('결제완료','취소','배송준비','배송중','배송완료','구매확정','환불신청','환불완료')
	private String orderSheetWaybill; // 운송장 번호
	private int orderSheetPrice; // 주문서 결제금액
	private String createdate;
}
