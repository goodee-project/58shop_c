package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class TotalUsePay { // 예약(방문완료)과 쇼핑몰(구매완료)에서 사용한 금액을 합산한 테이블
	private String customerId;
	private int usePay;
}
