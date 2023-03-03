package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class DocumentOutput { // 문서 출력 이력
	private int documentOutputNo;
	private String companyId;
	private String documentTitle; // 문서 파일 이름
	private String createdate;
}
