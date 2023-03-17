package goodee.gdj58.shop_c.controller;


import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.CartService;
import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.service.OrderService;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Cart;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CartController {
	
	@Autowired CartService cartService;
	@Autowired CustomerService customerService;
	@Autowired OrderService orderService;

	//3) cart update 
	@GetMapping("/updateCart")
	public String updateCart() {
		return "cart/cartList";
	}
	
	
	
	// 2) cart list
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session, HttpServletRequest request) {

		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		log.debug(TeamColor.PURPLE + loginCustomer + "<- loginCustomer, cartList");
		
		// 로그인시 db cart 목록 출력
		if(loginCustomer != null) { 
			//response.sendRedirect(request.getContextPath()+"/Home");
			//this.cartService = new CartService();
			List<Map<String, Object>> list = cartService.cartList(loginCustomer.getCustomerId());
			log.debug(TeamColor.PURPLE + list + "<- list, cartList");
			System.out.println("장바구니에 담긴 상품 개수 : "+list.size());
			model.addAttribute("list", list);
		} else {
			// 비회원일 시, 세션에 저장된 cart 목록 출력
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("cart");
			request.getSession().setAttribute("list", list);
			log.debug(TeamColor.PURPLE + list + "<- 비회원list, cartList");
			System.out.println("비회원 list : "+list);
		}
		
		if(request.getParameter("notLogin") != null) {
			model.addAttribute("notLogin", request.getParameter("notLogin"));
		}
		
		return "/cart/cartList";
				

	}
	
	// 1) cart insert	
	@GetMapping("/insertCart")
	public String insertCart(Model model, HttpSession session
							, @RequestParam(value = "cartNo") int cartNo 
							, @RequestParam(value = "goodsOptionNo") int goodsOptionNo
							, @RequestParam(value = "cartQuantity") int cartQuantity) {
	
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		int row = 0;
		log.debug(TeamColor.PURPLE + loginCustomer + "<- loginCustomer, insertCart");
		log.debug(TeamColor.PURPLE + cartNo + "<- cartNo, insertCart");
		log.debug(TeamColor.PURPLE + goodsOptionNo + "<- goodsOptionNo, insertCart");
		log.debug(TeamColor.PURPLE + cartQuantity + "<- cartQuantity, insertCart");
		System.out.println("[insertCart진입]");
		
		// 파라미터값 받아오기
		//int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		//int goodsOptionNo = Integer.parseInt(request.getParameter("goodsOptionNo"));
		//int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		// System.out.println(request.getParameter("goodsCode"));
		// System.out.println(request.getParameter("cartQuantity"));
		
		// 1) 로그인 -> cart 추가
		if(loginCustomer != null) {
			String customerId = loginCustomer.getCustomerId();
			log.debug(TeamColor.PURPLE + customerId + "<- customerId, insertCart");
			System.out.println("[로그인상태]");
			Cart cart = new Cart();
			cart.setCartNo(cartNo);
			cart.setGoodsOptionNo(goodsOptionNo);
			cart.setCustomerId(customerId);
			cart.setCartQuantity(cartQuantity);
			this.cartService = new CartService();
			
			// cart내에 중복체크 (이미 장바구니 담긴 상품일시, 상품수량 추가)
			boolean cartListCk = cartService.cartListCk(cart);
			if(cartListCk) {
				log.debug(TeamColor.PURPLE + cartListCk + "<- (1)중복된 상품이 존재하여 수량만 추가합니다");						
				//System.out.println("(1)중복된 상품이 존재하여 수량만 추가합니다");
				// 수량업데이트 service진행
				int newCartQtt = cartQuantity + cart.getCartQuantity();
				log.debug(TeamColor.PURPLE + cart.getGoodsOptionNo() + "<- (2)변경 할 상품코드");				
				log.debug(TeamColor.PURPLE + cart.getCartQuantity() + "<- (3)변경 전 상품수량");				
				log.debug(TeamColor.PURPLE + newCartQtt + "<- (4)변경 후 상품수량");				
				//System.out.println("(2)변경 할 상품코드 : "+cart.getGoodsOptionNo());
				//System.out.println("(3)변경 전 상품수량 : "+cart.getCartQuantity());
				//System.out.println("(4)변경 후 상품수량 : "+newCartQtt);
				int updateCart = cartService.updateCart(cartQuantity, cartNo, customerId);
				if(updateCart == 1) {
					System.out.println("(5)수량 추가 완료!");
				}
			} else {
				System.out.println("(1)새롭게 추가된 장바구니상품입니다");
				row = cartService.insertCart(cart);
				if(row != 1) {
					System.out.println("장바구니 담기 실패");
				}
			}
			Map<String, Object> list = cartService.getCartQuantitySum(customerId);

			model.addAttribute("list", list);

		}
		return "cart/cartList";
			
}
			
}
