package goodee.gdj58.shop_c.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import goodee.gdj58.shop_c.service.ChatService;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {
	@Autowired
	private final ChatService chatService;	
	
	// 채팅 목록 조회
	@GetMapping("/login/chat")
	public ModelAndView rooms(HttpSession session) {
		ModelAndView mv = new ModelAndView("customer/chat");
		Customer customer = (Customer) session.getAttribute("loginCustomer");
		String customerId = customer.getCustomerId();
		
		log.debug("\u001B[44m" + customer + "loginCustomer");
		System.out.println("\u001B[44m" + customer + "loginCustomer");
		

		session.setAttribute("login", customer.getCustomerId());
		mv.addObject("chattingRoomName", customer.getCustomerId());
		mv.addObject("chatList", chatService.getChattingList(customerId));
		log.debug("\u001B[44m" + chatService.getChattingList(customerId) + "chatList");
		
		return mv;
	}
}