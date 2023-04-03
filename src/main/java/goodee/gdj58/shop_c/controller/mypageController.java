package goodee.gdj58.shop_c.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.shop_c.service.OrderSheetService;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class mypageController {
	@Autowired OrderSheetService orderSheetService;
	
	/* ----------------------------
	 			주문서목록
	 ------------------------------*/
	@GetMapping("/login/mypage")
	public String mypageMain(HttpSession session, Model model) {
		Customer loginCustomer=(Customer)session.getAttribute("loginCustomer");
		String customerId=loginCustomer.getCustomerId();
		List<Map<String, Object>> selectTotalOrder=new ArrayList<Map<String, Object>>();
		selectTotalOrder=orderSheetService.selectTotalOrder(customerId);
		model.addAttribute("selectTotalOrder", selectTotalOrder);
		return "customer/mypageMain";
	}
}
