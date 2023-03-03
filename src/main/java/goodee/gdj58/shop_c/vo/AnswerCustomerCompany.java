package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class AnswerCustomerCompany { // 업체-고객 답변
	private int answerCustomerCompanyNo;
	private int questionCustomerCompanyNo;
	private String answerCustomerCompanyContent;
	private String createdate;
}
