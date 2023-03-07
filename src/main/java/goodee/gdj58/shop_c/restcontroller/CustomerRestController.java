package goodee.gdj58.shop_c.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_c.service.TotalIdService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class CustomerRestController {
	@Autowired TotalIdService totalIdService;
	
	@GetMapping("/idCheck")
	public String idCheck(@RequestParam(value="customerId") String customerId) {
		return totalIdService.findId(customerId);
	}
}
