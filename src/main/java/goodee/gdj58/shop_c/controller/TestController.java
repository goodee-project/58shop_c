package goodee.gdj58.shop_c.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.shop_c.service.TestService;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@GetMapping("/test")
	public String getTest() {
		
		
		List<Test> test = testService.getTest();
		
		log.info(TeamColor.PURPLE + test.toString() + " <-- test.toString()");
		
		return "test";
		
	}

}
