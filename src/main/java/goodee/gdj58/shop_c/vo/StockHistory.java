package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class StockHistory { // 재고이력
	private int stockHistoryNo;
	private int goodsOptionNo;
	private int stockHistoryQuantity; // 수량
	private String stockHistoryState; // '입고','출고'
	private String stockHistoryMemo; // 메모
	private String createdate;
}
