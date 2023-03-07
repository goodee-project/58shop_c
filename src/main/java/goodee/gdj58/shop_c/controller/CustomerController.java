package goodee.gdj58.shop_c.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 회원가입 액션
	@PostMapping("/signup")
	public String insertCustomer(HttpSession session, Customer customer) {
		customerService.insertCustomer(customer);
		return "redirect:/login";
	}
	
	
	// 회원가입 폼
	@GetMapping("/signup")
	public String insertCustomer(HttpSession session) {
		Customer loginCustomer=(Customer)session.getAttribute("loginCustomer");
		if(loginCustomer != null) { // 로그인 된 상태
			return "redirect:/home";
		}
		return "customer/insertCustomer";
	}
	
	// 로그아웃 액션
	@GetMapping("/customer/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	// 로그인 액션
	@PostMapping("/login")
	public String loginCustomer(HttpSession session, Customer customer) {
		Customer loginCustomer=customerService.login(customer);
		log.debug("\u001B[32m"+"CustomerController: "+loginCustomer);
		session.setAttribute("loginCustomer", loginCustomer); // 세션에 로그인 정보 저장
		return "test";
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public String loginCustomer(HttpSession session) {
		Customer loginCustomer=(Customer)session.getAttribute("loginCustomer");
		if(loginCustomer != null) { // 로그인 된 상태
			return "redirect:/home";
		}
		return "customer/login";
	}
}
