package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data	
public class QuestionCustomerCompany { // 업체-고객 문의
	private int questionCustomerCompanyNo;
	private String customerId;
	private String companyId;
	private String questionCustomerCompanyCategory; // '배송문의','상품문의','환불문의','기타'
	private String questionCustomerCompanyTitle;
	private String questionCustomerCompanyContent;
	private String updatedate;
	private String createdate;
}
