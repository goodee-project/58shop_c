package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class QuestionPlatformCompany { // 플랫폼-업체 문의
	private int questionPlatformCompanyNo;
	private String companyId;
	private String questionPlatformCompanyTitle;
	private String questionPlatformCompanyContent;
	private String createdate;
}
