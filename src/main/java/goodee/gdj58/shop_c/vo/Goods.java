package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Goods {
	private int goodsNo;
	private String companyId;
	private int typeNo; // 카테고리
	private String goodsName;
	private int goodsPrice;
	private String goodsActive; // 활성화 여부(강제로 보이거나 안보이도록) Y, N 
	private int goodsLevel; // 가중치 (인기 상품 끌어올리기)
	private String updatedate;
	private String createdate;
}
