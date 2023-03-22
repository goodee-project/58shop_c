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
	
	// 특정 업체 상품만 보기(업체스토어)
	public List<Map<String, Object>> selectGoodsCompany(String companyId) {
		List<Map<String, Object>> resultMap=new ArrayList<Map<String, Object>>();
		resultMap=goodsMapper.selectGoodsCompany(companyId);
		if(!resultMap.isEmpty()) {
			log.debug(TeamColor.GREEN+"GoodsService: 특정업체 상품목록 모아보기 성공");
		}
		return resultMap;
	}
	
	
	// 상품 상세정보
	public List<Map<String, Object>> selectGoodsOne(int goodsNo) {
		List<Map<String, Object>> resultMap=new ArrayList<Map<String, Object>>();
		resultMap=goodsMapper.selectGoodsOne(goodsNo);
		if(!resultMap.isEmpty()) {
			log.debug(TeamColor.GREEN+"GoodsService: 상품정보 조회 성공");
		}
		return resultMap;
	}
	
	// 상품 옵션
	public List<Map<String, Object>> selectGoodsOption(int goodsNo) {
		List<Map<String, Object>> resultMap=new ArrayList<Map<String, Object>>();
		resultMap=goodsMapper.selectGoodsOption(goodsNo);
		if(!resultMap.isEmpty()) {
			log.debug(TeamColor.GREEN+"GoodsService: 상품옵션 조회 성공");
		}
		return resultMap;
	}

	// 상품 카테고리 이름
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
	
	// 상품 카테고리 상품목록(검색결과 포함)
	public List<Map<String, Object>> selectGoodsCategory(int typeNo, String keyword, String searchword) {
		if(keyword == null || keyword.equals("")) { // 검색어가 없을 때 기본값은 신제품순
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
