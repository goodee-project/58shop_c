package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class CustomerAddress {
	private int customerAddressNo;
	private String customerId;
	private String customerAddress;
	private String customerAddressName; // 주소지 별명
	private int customerAddressLevel; // 가중치 (기본주소 구별)
	private String updatedate;
	private String createdate;
}
