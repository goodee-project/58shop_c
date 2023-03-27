package goodee.gdj58.shop_c.restcontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_c.service.TotalIdService;
import goodee.gdj58.shop_c.service.recaptchaService;
import goodee.gdj58.shop_c.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class CustomerRestController {
	@Autowired TotalIdService totalIdService;
	@Autowired recaptchaService signupService;
	
	/* 로그인 --------------------------------------------------------------------------------------*/
	
	// 구글 recaptcha
	@PostMapping("/login/validation")
    public String loginRecaptcha(@RequestParam(value="recaptcha") String recaptcha
    							, HttpServletRequest request){
    	String resultStr="";
		String gRecaptchaResponse=recaptcha;
    	try {
    		if(signupService.loginRecaptcha(gRecaptchaResponse)) {
    			resultStr="YES";
    		} else {
    			resultStr="NO";
    		} 
    	} catch(Exception e) {
			e.printStackTrace();
			resultStr="error";
		}
    	return resultStr;
    }
	
	/* 회원가입 -------------------------------------------------------------------------------------*/
	
	// 구글 recaptcha
    @PostMapping("/signup/validation")
    public String signupRecaptcha(@RequestParam(value="token", defaultValue="") String token){
    	log.debug(TeamColor.GREEN+"CustomerRestController token: "+token);
    	return signupService.signupRecaptcha(token);
    }
    
	@GetMapping("/idCheck")
	public String idCheck(@RequestParam(value="customerId", defaultValue="") String customerId) {
		return totalIdService.findId(customerId);
	}
}
