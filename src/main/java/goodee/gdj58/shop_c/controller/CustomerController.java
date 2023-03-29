package goodee.gdj58.shop_c.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	
	/* 마이페이지 ------------------------------------------------------------------------------------*/
	
	@GetMapping("/login/mypageMain")
	public String mypageMain(HttpSession session) {
		return "customer/mypageMain";
	}
	
	
	/* 회원가입 -------------------------------------------------------------------------------------*/
	
	// 회원가입 액션
	@PostMapping("/customer/signup")
	public String insertCustomer(HttpSession session, Customer customer) {
		int row=customerService.insertCustomer(customer);
		if(row == 1) {
			log.debug(TeamColor.GREEN+"CustomerController: 회원가입성공");
		}
		return "redirect:/login";
	}
	
	// 회원가입 폼
	@GetMapping("/customer/signup")
	public String insertCustomer(HttpSession session, Model model) {
		final String signupSiteKey="6LdO2uEkAAAAAN2mVTdIBzZg44L4k4AOuSXtWooz"; // 리캡차 사이트키

		model.addAttribute("signupSiteKey", signupSiteKey);
		return "customer/insertCustomer";
	}
	
	
	/* 로그인 --------------------------------------------------------------------------------------*/
	
	// 로그아웃 액션
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
		//return "redirect:http://3.34.241.220/58platform/integrationPage";
	}
	
	// 로그인 액션
	@PostMapping("/customer/login")
	public String loginCustomer(HttpSession session, Customer customer, Model model) {
		Customer loginCustomer=customerService.login(customer);
		int failCount=0; // 로그인 시도 횟수를 저장할 변수
		String loginId=customer.getCustomerId(); // 로그인 시도한 아이디
		HashMap<String, Object> loginMap=(HashMap<String, Object>)session.getAttribute("loginFail");
		String failId="";
		if(loginMap != null) {
			failId=(String)loginMap.get("loginId"); // 세션에 저장된 로그인에 실패한 아이디
		}
		if(loginMap == null || failId == null) { // 세션에 저장된 로그인시도 정보가 없을 때
			failCount=0;
		} else if(loginMap != null) {
			if(loginId.equals(failId)) {
				failCount=(int)loginMap.get("failCount");
			} else {
				failCount=0;
			}
		}
		if(loginCustomer == null) { // 로그인 실패 시
			String loginFailMsg="아이디와 비밀번호를 확인해주세요.";
			++failCount;
			
			// 로그인 실패 정보 묶기
			HashMap<String, Object> loginFail=new HashMap<String, Object>();
			loginFail.put("loginId", loginId);
			loginFail.put("failCount", failCount);
			
			log.debug(TeamColor.GREEN+"failCount: "+failCount);
			session.setAttribute("loginFail", loginFail);
			model.addAttribute("loginFailMsg", loginFailMsg);
			return "customer/login";
		} else {
			session.removeAttribute("loginFail");
		}
		log.debug(TeamColor.GREEN+"CustomerController: "+loginCustomer);
		session.setAttribute("loginCustomer", loginCustomer); // 세션에 로그인 정보 저장
		return "redirect:/main";
	}
	
	// 로그인 폼
	@GetMapping("/customer/login")
	public String loginCustomer(HttpSession session, Model model) {
		final String loginSiteKey="6Ld2OyklAAAAAKVkv4RNU_U26dK-LvHqph0-DfZe"; // 리캡차 사이트키
		
		model.addAttribute("loginSiteKey", loginSiteKey);
		return "customer/login";
		//return "redirect:http://3.34.241.220/58platform/integrationPage";
	}
}
