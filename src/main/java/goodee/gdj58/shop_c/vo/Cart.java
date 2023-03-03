package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Cart {
	private int cartNo;
	private int goodsOptionNo;
	private String customerId;
	private int cartQuantity;
	private String updatedate;
	private String createdate;
}
