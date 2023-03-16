package goodee.gdj58.shop_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.GoodsMapper;

@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	
	public List<Map<String, Object>> selectGoodsCategory(int typeNo, String keyword) {
		if(keyword == null || keyword.equals("")) {
			keyword="new";
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("keyword", keyword);
		param.put("typeNo", typeNo);
		
		return goodsMapper.selectGoodsCategory(param); 
	}
	
}
