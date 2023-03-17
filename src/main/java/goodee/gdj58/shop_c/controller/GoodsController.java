package goodee.gdj58.shop_c.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.GoodsService;
import goodee.gdj58.shop_c.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	
	// 카테고리 상품 조회
	@GetMapping("/goods/category")
	public String selectGoodsCategory(@RequestParam(value="typeNo") int typeNo
									, @RequestParam(value="keyword") String keyword
									, @RequestParam(value="searchword") String searchword
									, Model model) {
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
