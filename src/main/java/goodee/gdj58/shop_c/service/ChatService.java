package goodee.gdj58.shop_c.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.ChatMapper;
import goodee.gdj58.shop_c.vo.Chatting;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ChatService {
	@Autowired
	private ChatMapper chatMapper;
	
	// 채팅방 개설
	public int addChattingRoom(String chattingRoomName) {
		return chatMapper.insertChattingRoom(chattingRoomName);
	}
	
	// 채팅방 조회
	public List<Map<String, Object>> findAllRooms(){
		//List<ChattingRoom> result = new ArrayList<>(chattingRoomMap.values());
		
		List<Map<String, Object>> ChattingRooms = chatMapper.selectChattingRoomList();
		log.debug("\u001B[44m" + ChattingRooms + "모든 채팅방 보여주기");
		//Collections.reverse(result); // create_date DESC
		
		return ChattingRooms;
	}
	
	// 메세지 보내기
	public int addChattingMsg(Chatting message) {
		return chatMapper.insertChattingMsg(message);
	}
	
	// 메세지 불러오기
	public List<Map<String, Object>> getChattingList(String chattingRoomName) {
		List<Map<String, Object>> messages = chatMapper.selectChattingList(chattingRoomName);
		
		return messages;
	}
}