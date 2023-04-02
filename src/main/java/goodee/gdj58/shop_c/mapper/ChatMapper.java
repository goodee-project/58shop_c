package goodee.gdj58.shop_c.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Chatting;

@Mapper
public interface ChatMapper {
	// 채팅방 생성하기
	int insertChattingRoom(String chattingRoomName);
	
	// 채팅방 불러오기
	List<Map<String, Object>> selectChattingRoomList();
	
	// 메세지 보내기
	int insertChattingMsg(Chatting message);
	
	// 메세지 불러오기
	List<Map<String, Object>> selectChattingList(String chattingRoomName);

}
