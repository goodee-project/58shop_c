package goodee.gdj58.shop_c.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.TestMapper;
import goodee.gdj58.shop_c.vo.Test;


@Service
@Transactional
public class TestService {

	@Autowired
	private TestMapper testMapper;
	
	public List<Test> getTest() {
		
		return testMapper.selectTest();
		
	}
	
	
	public int setTest() {
		
		return testMapper.insertTest();
		
	}
	
	
}