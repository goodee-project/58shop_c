package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Company {
	private String companyId;
	private String companyPw;
	private String companyRegistrationNumber; // 사업자 등록번호
	private String companyName;
	private String companyCeo; // 대표자 명
	private String companyPhone;
	private String companyEmail;
	private String companyAddress;
	private String companyBank; // 은행
	private String companyAccount; // 계좌
	private String companyEmailMarketing; // 이메일 마케팅 수신여부
	private String typeContent; // 업종 카테고리
	private String updatedate;
	private String createdate;
}
