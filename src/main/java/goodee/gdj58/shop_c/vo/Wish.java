package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Wish { // 찜
	private int wishNo;
	private int goodsNo;
	private String customerId;
	private String wishState; // 찜 상태  Y:찜 N:찜 취소
	private String updatedate;
	private String createdate;
}
