package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class ReviewRecommendation { // 리뷰 공감
	private int reviewRecommendationNo;
	private int reviewNo;
	private String customerId;
	private String reviewRecommendationState; // Y:리뷰공감 N:공감 취소
	private String updatedate;
	private String createdate;
}
