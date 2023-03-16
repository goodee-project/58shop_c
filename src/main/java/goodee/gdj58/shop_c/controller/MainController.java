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
public class MainController {
	@Autowired GoodsService goodsService;
	
	// 카테고리 상품 조회
	@GetMapping("/goods/category")
	public String selectGoodsCategory(@RequestParam(value="typeNo") int typeNo
									, @RequestParam(value="keyword") String keyword
									, Model model) {
		List<Map<String, Object>> selectGoodsCategory=new ArrayList<Map<String, Object>>();
		selectGoodsCategory=goodsService.selectGoodsCategory(typeNo, keyword);
		if(!selectGoodsCategory.isEmpty()) {
			log.debug(TeamColor.GREEN+"MainController: 카테고리 조회 성공");
		}
		model.addAttribute("typeNo", typeNo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("selectGoodsCategory", selectGoodsCategory);
		return "goods/goodsCategory";
	}
	
	// 로그인 폼
	@GetMapping("/main")
	public String main() {
		return "customer/main";
	}
}
