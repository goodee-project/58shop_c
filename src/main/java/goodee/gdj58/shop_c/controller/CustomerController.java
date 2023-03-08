package goodee.gdj58.shop_c.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.service.SignupService;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	
	public static final String SECRET_KEY = "6LdO2uEkAAAAAA4cwUEVZ35tj_MnOlcgZLutOHg9";
    public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
	
	@Autowired CustomerService customerService;
	@Autowired SignupService signupService;
	@Autowired RestTemplateBuilder builder;
	
    @PostMapping("/validation")
    public @ResponseBody String ajax(String token){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("secret", SECRET_KEY);
        map.add("response", token);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

        ResponseEntity<String> response = builder.build().postForEntity( SITE_VERIFY_URL, request , String.class );

        return response.getBody();
    }
	
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
