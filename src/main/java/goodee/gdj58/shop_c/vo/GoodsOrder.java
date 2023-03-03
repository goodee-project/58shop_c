package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class GoodsOrder { // 주문상품 목록
	private int goodsOrderNo;
	private int orderSheetNo; // 주문서 번호
	private int goodsOptionNo; // 상품(옵션)번호
	private int goodsOrderQuantity; // 주문 수량
	private int goodsOrderPrice; // 주문 가격
	private int goodsOrderUsePoint; // 사용한 포인트
	private String goodsOrderState; // 결제 상태 ('결제완료','취소','배송준비','배송중','배송완료','구매확정','환불신청','환불완료')
	private String createdate;
}
