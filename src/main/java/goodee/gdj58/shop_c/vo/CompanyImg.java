package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class CompanyImg {
	private String companyId;
	private String companyImgSaveName; // 업체 이미지 파일 이름
	private String companyImgOriginName; // 업체 이미지 원본 파일 이름
	private String compnayImgType; // 이미지 타입
	private Long companyImgSize; // 파일 용량
	private String createdate;
}
