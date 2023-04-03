package goodee.gdj58.shop_c.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.OrderSheetMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class OrderSheetService {
	@Autowired OrderSheetMapper orderSheetMapper;
	
	public List<Map<String, Object>> selectTotalOrder(String customerId) {
		return orderSheetMapper.selectTotalOrder(customerId);
	}
}
