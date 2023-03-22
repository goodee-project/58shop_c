package goodee.gdj58.shop_c.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_c.service.CartService;
import goodee.gdj58.shop_c.service.CustomerService;
import goodee.gdj58.shop_c.service.GoodsOrderService;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Cart;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CartController {
	
	@Autowired CartService cartService;
	@Autowired CustomerService customerService;
	@Autowired GoodsOrderService orderService;

	//4) cart delete
	@SuppressWarnings("unchecked")
	@GetMapping("/deleteCart")
	public String deleteCart(Model model, HttpSession session  
							, @RequestParam(value = "cartNo") int cartNo 
							) {
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		log.debug(TeamColor.PURPLE + loginCustomer + "<- loginCustomer, deleteCart controller");
		// System.out.println(request.getParameter("goodsCode"));
		
		// 로그인되어있을 시
		if(loginCustomer != null) {
			Cart cart = new Cart();
			cart.setCartNo(cartNo);
			cart.setCustomerId(loginCustomer.getCustomerId());
			
			//this.cartService = new CartService();
			int row = cartService.deleteCart(cart);
			log.debug(TeamColor.PURPLE + row + "<- row, deleteCart controller");
			Map<String, Object> list = cartService.cartQuantitySum(loginCustomer.getCustomerId());
			session.setAttribute("list", list);
			log.debug(TeamColor.PURPLE + list + "<- list, deleteCart controller");
			
			// 결과
			if(row == 1) {
				System.out.println("삭제성공");	
				log.debug(TeamColor.PURPLE + row + "<- row, 삭제성공");
			} else {
				System.out.println("삭제실패");
				log.debug(TeamColor.PURPLE + row + "<- row, 삭제실패");
			}
			
		} else {
			// 비회원 장바구니 삭제하기
			List<Map<String, Object>> cart1 = null;
			if(session.getAttribute("cart") != null) {
				cart1 = (List<Map<String, Object>>)session.getAttribute("cart");
				for(Map<String,Object> c : cart1) {
					int thisCartNo = Integer.parseInt(String.valueOf(c.get("cartNo")));
					//System.out.println("확인할 상품코드 : "+thisCartNo+" / 삭제할 상품코드 : "+cartNo);
					log.debug(TeamColor.PURPLE + thisCartNo + "<- thisCartNo, 확인할 상품코드");
					log.debug(TeamColor.PURPLE + cartNo + "<- cartNo, 삭제할 상품코드");
					if(thisCartNo==cartNo) {
						cart1.remove(c);
						System.out.println("==> 코드 일치, 품목 삭제 성공");
						log.debug(TeamColor.PURPLE + cartNo + "<- thisCartNo==cartNo, 코드 일치, 품목 삭제 성공");
						break;
					} else {
						System.out.println("==> 코드 불일치, 변경값없음");
						log.debug(TeamColor.PURPLE + cartNo + "<- thisCartNo==cartNo, 코드 불일치, 변경값없음");
					}
				}
				session.setAttribute("cart", cart1);
			}
		}
		//response.sendRedirect(request.getContextPath()+"/CartList");
		return "cart/cartList";
	}		

	
	
	//3) cart update 
	@SuppressWarnings("unchecked")
	@GetMapping("/updateCart")
	public String updateCart(Model model, HttpSession session, HttpServletRequest request) {	

			Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
			log.debug(TeamColor.PURPLE + loginCustomer + "<- loginCustomer, updateCart");
			//System.out.println(loginCustomer.getCustomerId());
			
			// 로그인시 db cart 목록 출력
			if(loginCustomer != null) { 
				//response.sendRedirect(request.getContextPath()+"/Home");
				//this.cartService = new CartService();
				List<Map<String, Object>> list = cartService.cartList(loginCustomer.getCustomerId());
				request.setAttribute("list", list);
				log.debug(TeamColor.PURPLE + list + "<- list, updateCart");
			} else {			
				List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("cart");
				request.getSession().setAttribute("list", list);
				log.debug(TeamColor.PURPLE + list + "<- list, updateCart");
			}
			return "/updateCart";
		}		
		
	@SuppressWarnings("unchecked")
	@PostMapping("/updateCart")
	public String updateCart(Model model, HttpSession session
							, @RequestParam(value = "cartNo") int cartNo 
							//, @RequestParam(value = "goodsOptionNo") int goodsOptionNo
							, @RequestParam(value = "cartQuantity") int cartQuantity) {
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		int row = 0;
		log.debug(TeamColor.PURPLE + row + "<- row, updateCart 컨트롤러 post 진입");

		
		// 1) 로그인 -> cart 수정
		if(loginCustomer != null) {
			// 파라미터값 받아오기
			log.debug(TeamColor.PURPLE + cartNo + "<- cartNo, updateCart");
			//log.debug(TeamColor.PURPLE + goodsOptionNo + "<- goodsOptionNo, updateCart");
			log.debug(TeamColor.PURPLE + cartQuantity + "<- cartQuantity, updateCart");
			//System.out.println("cartQtt : "+request.getParameter("cartQuantity"));
			//System.out.println("goodsCode : "+request.getParameter("goodsCode"));

			// 수량수정 service
			String customerId = loginCustomer.getCustomerId();
			//this.cartService = new CartService();
			row = cartService.updateCart(cartQuantity, cartNo, customerId);
			log.debug(TeamColor.PURPLE + row + "<- row, updateCart");
			
			// 결과
			if(row != 1) {
				System.out.println("수정실패");
			}
		} else {
			// 2) 비로그인 -> session cart 수정
			System.out.println("---비회원 장바구니상품수량변경---");
			
			List<Map<String, Object>> cart = (List<Map<String, Object>>)session.getAttribute("list");
			for(Map<String,Object> c : cart) {
				int thisCartNo = Integer.parseInt(String.valueOf(c.get("cartNo")));
				System.out.println("확인할 상품코드 : "+thisCartNo+" / 변경할 상품코드 : "+cartNo);
				if(thisCartNo == cartNo) {
					c.put("cartQuantity", cartQuantity);
					System.out.println("코드 일치, 수량변경완료 --> "+c.get("cartQuantity"));
				} else {
					System.out.println("코드 불일치, 변경값없음");
				}
			}
			System.out.println("----------------------");
			session.setAttribute("cart", cart); // 로그인시, 불러오기 위한 cart
			// session.setAttribute("list", cart); // 장바구니 view에서 불러오기 위한 cart
		}
		//response.sendRedirect(request.getContextPath()+"/CartList");
		return "/cart/cartList"; 
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
			//System.out.println("[로그인상태]");
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
			Map<String, Object> list = cartService.cartQuantitySum(customerId);
			model.addAttribute("list", list);
			log.debug(TeamColor.PURPLE + list + "<- list, insertCart");

		}
		return "cart/cartList";
			
}
			
}
