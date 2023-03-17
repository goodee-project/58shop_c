package goodee.gdj58.shop_c.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.GoodsMapper;
import goodee.gdj58.shop_c.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	
	public List<Map<String, Object>> selectGoodsCategoryName(int typeNo) {
		List<Map<String, Object>> resultMap=new ArrayList<Map<String, Object>>();
		resultMap=goodsMapper.selectGoodsCategoryName(typeNo);
		if(!resultMap.isEmpty()) {
			log.debug(TeamColor.GREEN+"GoodsService: 카테고리 이름조회 성공");
		}
		
		// Mapper에서 넘어온 값이 null값이면 공백값 넣기
		for(Map<String, Object> map: resultMap) {
			String content=(String)map.get("typeContent");
			if(content == null) {
				map.put("typeContent", "");
			}
			String parent=(String)map.get("parent");
			if(parent == null) {
				map.put("parent", "");
			}
		}
		return resultMap;
	}
	
	public List<Map<String, Object>> selectGoodsCategory(int typeNo, String keyword, String searchword) {
		if(keyword == null || keyword.equals("")) {
			keyword="new";
		}

		Map<String, Object> param=new HashMap<String, Object>();
		param.put("keyword", keyword);
		param.put("typeNo", typeNo);
		param.put("searchword", searchword);
		
		List<Map<String, Object>> resultMap=new ArrayList<Map<String, Object>>();
		resultMap=goodsMapper.selectGoodsCategory(param);
		if(!resultMap.isEmpty()) {
			log.debug(TeamColor.GREEN+"GoodsService: 카테고리 조회 성공");
		}
		
		return resultMap; 
	}
	
}
