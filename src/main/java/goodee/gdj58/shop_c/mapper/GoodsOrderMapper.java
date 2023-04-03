package goodee.gdj58.shop_c.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Cart;
import goodee.gdj58.shop_c.vo.Customer;


@Mapper
public interface GoodsOrderMapper {
	List<Map<String, Object>> selectOrdersList(Map<String, Object> paramMap);
	
	// ====================== 주문 폼 시작 ======================
	// 메서드 앞 of는 주문 폼 구분하기 위해 붙임
	
	// 주문자 정보(주문자 이름, 이메일, 연락처)
	HashMap<String, Object> ofSelectCustomer(String customerId);
	
	// 상품 한 종류 주문 상품 정보
	// 이미지, 상품명, 회사명, 가격, 옵션 내용
	// 여러 주문일 때는 반복문 돌릴 예정
	HashMap<String, Object> ofSelectGoodsOrderInfoOne(int goodsOptionNo);
	
	// 장바구니에서 option_no, 수량 가져오기
	ArrayList<Cart> ofSelectCart(String customerId);
	
	
	// ====================== 주문 폼 끝 ======================
	
	
	
	
	
	
	
	
	// ====================== 주문 시작 ======================
	// 메서드 앞 o는 주문 구분하기 위해 붙임
	
	// 한 회사 한 종류의 상품 시작
	
	// goodsOptionNo로 company_id, goods_price 추출
	HashMap<String, Object> oSelectGoodsInfo(int goodsOptionNo);

	// order_total 생성 후 order_total_no 추출
	int oInsertOrderTotal(HashMap<String, Object> paramMap);
	
	// 주문서 생성
	int oInsertOrderSheet(HashMap<String, Object> paramMap);
	
	// 주문 생성
	int oInsertGoodsOrder(HashMap<String, Object> paramMap);
	
	// 주문서 가격 수정
	int oUpdateOrderSheetPrice(int orderSheetNo);
	
	// 주문한 수량 재고 차감
	int oUpdateOrderQuantity(HashMap<String, Object> paramMap);
	
	// 한 회사 한 종류의 상품 끝
	
	
	
	
	// 장바구니 담긴 상품들 주문
	
	// 장바구니의 companyId, optionNo, orderQuantity 리스트 추출
	ArrayList<HashMap<String, Object>> oSelectCartInfoList();
		
	// 하나 or 여러 회사의 여러 종류의 상품 끝
	


	
	// 결제한 총 페이
	int oSelectUsePay(int orderTotalNo);
	
	
	
	
	
	
	// ====================== 주문 끝 ======================
	
	
	
	
	
	
	
	
	
	
	// ====================== 주문 취소 시작 ======================
	// 메서드 앞 c는 취소 구분하기 위해 붙임. 
	
	// cancel_history 주문 이력 추가
	int cInsertCancelHistory(HashMap<String, Object> paramMap);
	
	// 취소할 주문의 option_no, option_quantity 가져오기
	HashMap<String, Object> cSelectCancelOptionNoQuantity(HashMap<String, Object> paramMap);
	
	// 취소한 주문의 옵션 수량 만큼 goods_option 테이블 재고 복구
	int cUpdateGoodsOptionQuantityRewind(HashMap<String, Object> cancelOptionMap);
	
	// 주문 취소로 인해 복구한 재고 이력 남기기
	int cInsertStockHistory(HashMap<String, Object> cancelOptionMap);
	
	// 취소 전 결제 했었던 주문서 가격
	int cSelectOrderSheetPrice(HashMap<String, Object> paramMap);
	
	// 주문서 가격(결제 가격) pay_save 이력 추가
	int cInsertPaySaveHistory(HashMap<String, Object> paramMap);
	
	// 주문서 가격(결제 가격) total_use_pay 복구
	int cUpdateTotalUsePayRewind(HashMap<String, Object> paramMap);
	
	// customer 테이블 pay 환급
	int cUpdateCustomerPayRewind(HashMap<String, Object> paramMap);
	
	// 주문에 사용한 총 포인트
	int cSelectSumPointOrderCancel(HashMap<String, Object> paramMap);
	
	// 사용 총 포인트가 0보다 크다면 point_save 이력 추가
	int cInsertPointSaveHistory(HashMap<String, Object> paramMap);
	
	// 사용 총 포인트가 0보다 크다면 customer 테이블 point 환급
	int cUpdateCustomerPointRewind(HashMap<String, Object> paramMap);
	
	// 결제 완료 된 주문 count
	int cSelectCountOrderPayment(HashMap<String, Object> paramMap);
	
	// 해당 주문 주문상태 취소로 변경
	int cUpdateOrderStateCancel(HashMap<String, Object> paramMap);
	
	// 주문 중 결제완료인 goods_option_no, quantity, price 저장
	ArrayList<HashMap<String, Object>> cSelectOptionNoQuantityPrice(HashMap<String, Object> paramMap);
	
	// 주문서 company_id, customer_address_no 저장
	HashMap<String, Object> cSelectCompanyIdCustomerAddress(HashMap<String, Object> paramMap);
	
	// 주문서 주문상태 취소로 변경
	int cUpdateOrderSheetStateCancel(HashMap<String, Object> paramMap);
	
	// 나머지 모든 주문들 주문상태 취소로 변경
	int cUpdateGoodsOrderStateCancel(HashMap<String, Object> paramMap);
	
	
	
	
	// 새로운 주문서 생성 후 no 추출
	int cInsertNewOrderSheet(HashMap<String, Object> newSheetMap);
	
	// 취소한 주문 제외하고 나머지 주문들 재구매(서비스에서 반복문 돌림)
	int cInsertNewGoodsOrder(HashMap<String, Object> option);
	
	// 새로운 주문서 총 가격(등급 할인만 적용)
	int	cSelectNewOrderSheetPrice(HashMap<String, Object> newSheetMap);
	
	// 새로운 주문서 가격 수정
	int cUpdateNewOrderSheetPrice(HashMap<String, Object> newSheetMap);
	
	// pay_use_history 이력 추가
	int cInsertPayUseHistory(HashMap<String, Object> newSheetMap);
	
	// customer 테이블 새 주문서 가격으로 pay 차감
	int cUpdateCustomerPayBuy(HashMap<String, Object> newSheetMap);
	
	// total_use_pay 재구매 내용 적용
	int cUpdateTotalUsePayBuy(HashMap<String, Object> newSheetMap);
	
	
	// ====================== 주문 취소 끝 ======================
	
	
	
	
	
}
