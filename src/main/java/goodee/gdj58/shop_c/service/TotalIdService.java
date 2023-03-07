package goodee.gdj58.shop_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.TotalIdMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TotalIdService {
	@Autowired TotalIdMapper totalIdMapper;
	
	// 중복아이디검사
	public String findId(String customerId) {
		String result="YES";
		String id=totalIdMapper.findId(customerId);
		log.debug("\u001B[32m"+"TotalIdService findId: "+id);
		if(id != null) { // 사용중인 아이디
			result="NO";
		}
		log.debug("\u001B[32m"+"TotalIdService : "+result);
		return result;
	}
}