package goodee.gdj58.shop_c.restcontroller;

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
	@Autowired recaptchaService recaptchaService;
	
	/* 로그인 --------------------------------------------------------------------------------------*/
	
	// 구글 recaptcha
	@PostMapping("/customer/loginValidation")
    public boolean loginRecaptcha(@RequestParam(value="recaptcha") String recaptcha){
    	boolean resultStr=false;
		String gRecaptchaResponse=recaptcha;
		log.debug(TeamColor.GREEN+gRecaptchaResponse);
    	try {
    		if(recaptchaService.loginRecaptcha(gRecaptchaResponse)) {
    			resultStr=true;
    		} else {
    			resultStr=false;
    		} 
    	} catch(Exception e) {
			e.printStackTrace();
			resultStr=false;
		}
    	return resultStr;
    }
	
	/* 회원가입 -------------------------------------------------------------------------------------*/

	// 구글 recaptcha
    @PostMapping("/customer/signupValidation")
    public String signupRecaptcha(@RequestParam(value="token", defaultValue="") String token){
    	log.debug(TeamColor.GREEN+"CustomerRestController token: "+token);
    	return recaptchaService.signupRecaptcha(token);
    }

	@GetMapping("/idCheck")
	public String idCheck(@RequestParam(value="customerId", defaultValue="") String customerId) {
		return totalIdService.findId(customerId);
	}
}
