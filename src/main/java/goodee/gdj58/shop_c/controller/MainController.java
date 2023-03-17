package goodee.gdj58.shop_c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	// 로그인 폼
	@GetMapping("/main")
	public String main() {
		return "customer/main";
	}
}
