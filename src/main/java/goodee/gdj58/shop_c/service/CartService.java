package goodee.gdj58.shop_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.CartMapper;
import goodee.gdj58.shop_c.vo.Cart;

@Service
@Transactional
public class CartService {
	@Autowired private CartMapper cartMapper;
	
	//구매완료시 장바구니상품 삭제
	public int removeCartById(String customerId) {
		return cartMapper.deleteCartById(customerId);
	}
	
	//장바구니 상품 삭제버튼
	public int removeCartOne(Cart cart) {
		return cartMapper.deleteCartOne(cart);		
	}
	
	
	//장바구니 수량 수정
	public int modifyCartQuantity(Cart cart) {
		return cartMapper.modifyCartQuantity(cart);
	}
	
	
	//현재 장바구니에 있는 상품일시 수량 +
	public int modifyCartQuantityBySum(Cart cart) {
		return cartMapper.modifyCartQuantityBySum(cart);		
	}
	
	
	
	//현재 장바구니에 있는 상품인지 확인
	public int getCartOneCk(Cart cart) {
		return cartMapper.selectCartOneCk(cart);		
	}

	//cartQuantity 합계
	public HashMap<String, Object> getCartQuantitySum(String cusomerId){
		return cartMapper.selectCartQuantitySum(cusomerId);		
	}

	//cartList 합계
	public HashMap<String, Object> getCartListSumByCart(String cusomerId){
		return cartMapper.selectCartListSumByCart(cusomerId);
	}
	
	//장바구니 추가
	public int addCart(Cart cart) {
		return cartMapper.insertCart(cart);
	}
		
	//장바구니
	public List<Map<String, Object>> selectCartList(String cusomerId){
		return cartMapper.selectCartList(cusomerId);
	}
}
