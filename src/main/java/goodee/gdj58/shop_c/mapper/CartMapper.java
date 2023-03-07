package goodee.gdj58.shop_c.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Cart;

@Mapper                              
public interface CartMapper {
	 
	int deleteCartById(String customerId); //구매완료시 장바구니상품 삭제
	int deleteCartOne(Cart cart); //장바구니 상품 삭제버튼
	int modifyCartQuantity(Cart cart); //장바구니 수량 수정
	int modifyCartQuantityBySum(Cart cart); //현재 장바구니에 있는 상품일시 수량 +
	int selectCartOneCk(Cart cart); //현재 장바구니에 있는 상품인지 확인 
	HashMap<String, Object> selectCartQuantitySum(String cusomerId); //cartQuantity 합계
	HashMap<String, Object> selectCartListSumByCart(String cusomerId); //cartList 합계
	int insertCart(Cart cart); //장바구니 추가
	List<Map<String, Object>> selectCartList(String cusomerId); //장바구니
}
