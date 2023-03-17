package goodee.gdj58.shop_c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoodsOrderController {
	@GetMapping("/order/order")
	public String order() {
		return "order/order";
	}
	
}
