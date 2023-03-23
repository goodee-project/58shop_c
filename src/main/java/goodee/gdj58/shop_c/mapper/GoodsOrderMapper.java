package goodee.gdj58.shop_c.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface GoodsOrderMapper {
	List<Map<String, Object>> selectOrdersList(Map<String, Object> paramMap);
	
	// 주문서 주문상태 취소로 변경
	int cUpdateOrderSheetStateCancel(HashMap<String, Object> paramMap);
	
	// 주문서 company_id, customer_address_no 저장
	HashMap<String, Object> cSelectCompanyIdCustomerAddress(HashMap<String, Object> paramMap);
	
	// 주문 중 결제완료인 goods_option_no, quantity 저장
	ArrayList<HashMap<String, Object>> cSelectOptionNoQuantityPrice(HashMap<String, Object> paramMap);
	
	// 해당 주문 주문상태 취소로 변경
	int cUpdateOrderStateCancel(HashMap<String, Object> paramMap);
	
	// 사용 총 포인트가 0보다 크다면 point_save 이력 추가
	int cInsertPointSaveHistory(HashMap<String, Object> paramMap);
	
	// 주문에 사용한 총 포인트
	int cSelectSumPointOrderCancel(HashMap<String, Object> paramMap);
	
	// 주문서 가격(결제 가격) total_use_pay 복구
	int cUpdateTotalUsePayRewind(HashMap<String, Object> paramMap);
	
	// 주문서 가격(결제 가격) pay_save 이력 추가
	int cInsertPaySaveHistory(HashMap<String, Object> paramMap);
	
	// cancel_history 주문 이력 추가
	int cInsertCancelHistory(HashMap<String, Object> paramMap);
	
	// 결제 완료 된 주문 count
	int cSelectCountOrderPayment(HashMap<String, Object> paramMap);
	
	
	
	
	
}
