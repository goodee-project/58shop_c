package goodee.gdj58.shop_c.vo;

import lombok.Data;

@Data
public class Chatting { // 채팅
	private int chattingNo;
	private String chattingRoomName;
	private String fromId;
	private String chattingMemo;
	private String createdate;
}	
