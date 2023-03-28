package goodee.gdj58.shop_c.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.GoodsOrderService;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GoodsOrderController {
	
	@Autowired
	private GoodsOrderService goodsOrderService;
	
	@GetMapping("/order/order")
	public String order() {
		return "order/order";
	}
	
	
	// 주문 폼 Get
	@GetMapping("/customer/order/orderForm")
	public String orderForm(HttpSession session, Model model
								, @RequestParam(value = "goodsOptionNo", required = false) Integer goodsOptionNo
								, @RequestParam(value = "cartQuantity", required = false) Integer goodsOrderQuantity) {
		
		Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
		
		// 주문자 정보(주문자 이름, 이메일, 연락처)
		HashMap<String, Object> cusMap = goodsOrderService.ofSelectCustomer(loginCustomer.getCustomerId());
		
		ArrayList<HashMap<String, Object>> orderInfoList = goodsOrderService.ofSelectGoodsOrderInfoList(goodsOptionNo, goodsOrderQuantity, loginCustomer.getCustomerId());
		
		
		
		
		
		model.addAttribute("cusMap", cusMap);
		
		model.addAttribute("orderInfoList", orderInfoList);
		
		return "order/orderForm";
		
	}
	
	
	
	
	// 주문 취소 Get
	@GetMapping("/customer/orderCancel")
	public String orderCancel(HttpSession session
									, @RequestParam("orderSheetNo") int orderSheetNo
									, @RequestParam("goodsOrderNo") int goodsOrderNo) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("customerId", ((Customer) session.getAttribute("loginCustomer")).getCustomerId());
		hm.put("orderSheetNo", orderSheetNo);
		hm.put("goodsOrderNo", goodsOrderNo);
		
		goodsOrderService.goodsOrderCancel(hm);
		
		
		return "redirect:/내주문내역";
		
	}
	
	
	
	
	
	
	
	
	
	
}
