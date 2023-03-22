package goodee.gdj58.shop_c.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Cart;

@Mapper                              
public interface CartMapper {


	Map<String, Object> cartQuantitySum(String customerId); // 4-2) 장바구니 총 상품 개수
	int deleteCartAll(String customerId); // 4-1) 주문시 cart delete
	int deleteCart(Cart cart); // 4) cart delete
	int updateCart(int cartQuantity, int cartNo, String customerId); // 3) cart update
	int cartOneQty(Cart cart); // 2-2) cartOne (1개의 물품 수량정보만 불러오기)
	List<Map<String, Object>> cartOne(String customerId, int cartNo); // 2-1) cartlistOne
	List<Map<String, Object>> cartList(String customerId); // 2) cart list
	boolean cartListCk(Cart cart); // 1-1) cart 중복체크
	int insertCart(Cart cart); // 1) cart insert	
	
	
	
	
	
	
	
	
	
}
