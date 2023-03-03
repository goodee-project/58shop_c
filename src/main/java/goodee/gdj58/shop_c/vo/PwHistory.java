package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class PwHistory { // 비밀번호 변경 이력
	private int pwHistoryNo;
	private String id;
	private String password;
	private String createdate;
}
