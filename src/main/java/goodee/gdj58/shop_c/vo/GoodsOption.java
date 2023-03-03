package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class GoodsOption { 
	private int goodsOptionNo; 
	private int goodsNo;
	private String goodsOptionContent; // 상품 옵션 내용
	private int goodsOptionQuantity; // 상품 옵션 수량
	private String updatedate;
	private String createdate;

}
