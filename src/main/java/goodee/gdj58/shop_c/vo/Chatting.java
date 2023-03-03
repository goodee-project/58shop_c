package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Chatting { // 채팅
	private int chattingNo;
	private String chattingToId; // 받는 사람
	private String chattingFromId; // 보내는 사람
	private String chattingContent;
	private String createdate;
}	
