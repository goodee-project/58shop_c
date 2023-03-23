package goodee.gdj58.shop_c.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.GoodsOrderService;
import goodee.gdj58.shop_c.vo.Customer;

@Controller
public class GoodsOrderController {
	
	@Autowired
	private GoodsOrderService goodsOrderService;
	
	@GetMapping("/order/order")
	public String order() {
		return "order/order";
	}
	
	
	// 주문 취소 Get
	@GetMapping("/customer/orderCancel")
	public String orderWithdraw(HttpSession session
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
