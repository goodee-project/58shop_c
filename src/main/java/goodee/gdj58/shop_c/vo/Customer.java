package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerNickname;
	private String customerPostcode; // 우편번호
	private String customerAddress;
	private String customerPhone;
	private String customerRank; // 등급 ('일반','브론즈','실버','골드')
	private String customerEmail;
	private int customerPay; // 페이 보유 금액
	private int customerPoint; // 보유 포인트
	private String customerBirth; // 생년월일 (19990101)
	private String customerGender; // '남', '여'
	private String createdate;
	private String updatedate;
	private String customerEmailMarketingAccept; // 이메일 마케팅 수신여부 ('동의','미동의')
	private String customerInfoAgree; // 개인정보 동의 ('동의','미동의')
	private String customerLastLoginDate; // 마지막 로그인 일자
}
