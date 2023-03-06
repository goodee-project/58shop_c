package goodee.gdj58.shop_c.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.vo.Customer;

@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 회원가입
	@GetMapping("/signup")
	public String insertCustomer() {
		return "customer/insertCustomer";
	}
	
	// 로그아웃 액션
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "test";
	}
	
	// 로그인 액션
	@PostMapping("/login")
	public String loginCustomer(HttpSession session, Customer customer) {
		Customer loginCustomer=customerService.login(customer);
		session.setAttribute("loginCustomer", loginCustomer); // 세션에 로그인 정보 저장
		return "test";
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public String loginCustomer() {
		return "customer/login";
	}
}
