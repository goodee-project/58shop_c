package goodee.gdj58.shop_c.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.GoodsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	
	// 특정업체 상품상세페이지 보기
	@GetMapping("/goods/goodsOneCompany")
	public String selectGoodsOneCompany(@RequestParam(value="goodsNo", defaultValue="0") int goodsNo
										, @RequestParam(value="companyId", defaultValue="") String companyId
										, Model model) {
		if(goodsNo == 0 || companyId.equals("")) { // parameter값이 제대로 들어오지 않았을 때 다시 상품리스트로 보내기
			return "redirect:/goods/goodsCompany";
		}
		Map<String, Object> selectGoodsOneCompany=new HashMap<String, Object>();
		selectGoodsOneCompany=goodsService.selectGoodsOneCompany(goodsNo, companyId);
		model.addAttribute("goodsOne", selectGoodsOneCompany);
		return "goods/goodsOneCompany";
	}
	
	// 특정업체 상품보기
	@GetMapping("/goods/goodsCompany")
	public String selectGoodsCompany(@RequestParam(value="companyId", defaultValue="") String companyId
									, @RequestParam(value="searchword", required=false) String searchword 
									, @RequestParam(value="keyword", required=false) String keyword
									, Model model) {
		List<Map<String, Object>> selectGoodsCompany=new ArrayList<Map<String, Object>>();
		
		if(searchword == null) { // 검색어가 없을 때
			searchword="";
		}
		if(keyword == null) { // 목록출력 조건값이 없을 때, 기본값은 신상품순
			keyword="new";
		}
		
		selectGoodsCompany=goodsService.selectGoodsCompany(keyword, companyId, searchword);
		model.addAttribute("companyId", companyId);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchword", searchword);
		model.addAttribute("selectGoodsCompany", selectGoodsCompany);
		return "goods/goodsCompany";
	}
	
	// 상품옵션 조회
	@GetMapping("/goods/goodsOne")
	public String selectGoodsOne(@RequestParam(value="goodsNo", defaultValue="0") int goodsNo
									, Model model) {
		if(goodsNo == 0) { // parameter값이 제대로 넘어오지 않았을 때
			return "redirect:/goods/category";
		}
		
		List<Map<String, Object>> selectGoodsOption=new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> selectGoodsOne=new ArrayList<Map<String, Object>>();
		selectGoodsOption=goodsService.selectGoodsOption(goodsNo);
		selectGoodsOne=goodsService.selectGoodsOne(goodsNo);
		model.addAttribute("goodsOption", selectGoodsOption);
		model.addAttribute("goodsOne", selectGoodsOne);
		return "goods/goodsOne";
	}
	
	// 카테고리 상품 조회
	@GetMapping("/goods/category")
	public String selectGoodsCategory(@RequestParam(value="typeNo", defaultValue="0") int typeNo
									, @RequestParam(value="keyword", required=false) String keyword
									, @RequestParam(value="searchword", required=false) String searchword
									, Model model) {
		if(typeNo == 0) { // parameter값이 제대로 넘어오지 않았을 때
			return "redirect:/main";
		}
		
		if(searchword == null) { // 검색어가 없을 때
			searchword="";
		}
		if(keyword == null) { // 목록출력 조건값이 없을 때, 기본값은 신상품순
			keyword="new";
		}
		List<Map<String, Object>> selectGoodsCategory=new ArrayList<Map<String, Object>>(); 
		List<Map<String, Object>> selectGoodsCategoryName=new ArrayList<Map<String, Object>>(); 
		selectGoodsCategory=goodsService.selectGoodsCategory(typeNo, keyword, searchword); // 카테고리 상품 조회
		selectGoodsCategoryName=goodsService.selectGoodsCategoryName(typeNo); // 카테고리 이름 조회

		model.addAttribute("typeNo", typeNo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchword", searchword);
		model.addAttribute("selectGoodsCategory", selectGoodsCategory);
		model.addAttribute("categoryName", selectGoodsCategoryName);
		return "goods/goodsCategory";
	}
}
