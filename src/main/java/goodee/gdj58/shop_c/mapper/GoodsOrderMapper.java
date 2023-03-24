package goodee.gdj58.shop_c.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface GoodsOrderMapper {
	List<Map<String, Object>> selectOrdersList(Map<String, Object> paramMap);
	
	// ====================== 주문 취소 시작 ======================
	
	// 결제 완료 된 주문 count
	int cSelectCountOrderPayment(HashMap<String, Object> paramMap);
	
	// cancel_history 주문 이력 추가
	int cInsertCancelHistory(HashMap<String, Object> paramMap);
	
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
