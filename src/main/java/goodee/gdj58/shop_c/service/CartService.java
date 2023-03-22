package goodee.gdj58.shop_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.CartMapper;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Cart;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class CartService {
	@Autowired private CartMapper cartMapper;
	
	//4-2) 장바구니 총 상품 개수
	public Map<String, Object> cartQuantitySum(String customerId){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cusotmerId", customerId);
		return cartMapper.cartQuantitySum(customerId);
	}
	//4-1) 주문시 cart delete
	public int deleteCartAll(String customerId) {
		return cartMapper.deleteCartAll(customerId);
	}
	
	//4) cart delete
	public int deleteCart(Cart cart) {
		int row = 0;
		log.debug(TeamColor.PURPLE + row + "<- row, deleteCart service");	
		return cartMapper.deleteCart(cart);
	}	
	
	//3) cart update
	public int updateCart(int cartQuantity, int cartNo, String customerId) {

		return cartMapper.updateCart(cartQuantity, cartNo, customerId);
	}
	// 2-2) cartOne (1개의 물품 수량정보만 불러오기)
	public int cartOneQty(Cart cart) {
		return cartMapper.cartOneQty(cart);
	}	
	
	// 2-1) cartlistOne
	public List<Map<String, Object>> cartOne(String customerId, int cartNo){
		Map<String, Object> list = new HashMap<String, Object>();
		list.put("customerId", customerId);
		list.put("cartNo", cartNo);
		return cartMapper.cartOne(customerId, cartNo);
	}
	//2) cart list
	public List<Map<String, Object>> cartList(String customerId){
		log.debug(TeamColor.PURPLE + customerId + "<- customerId, cartList");		
		return cartMapper.cartList(customerId);
	}
	
	//1-1) cart 중복체크
	public boolean cartListCk(Cart cart) {
		return cartMapper.cartListCk(cart);
	}
	
	//1) cart insert	
	public int insertCart(Cart cart) {
		return cartMapper.insertCart(cart);
	}
}
