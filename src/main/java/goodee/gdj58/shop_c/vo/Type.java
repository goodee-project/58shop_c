package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Type {
	private int typeNo;
	private String typeContent;
	private int parentNo; // 부모 번호
	private int groupNo; // 그룹 번호
	private int sequence; // 그룹 내 순서
	private int depth; // 들여쓰기 단계
	private String createdate;
}
