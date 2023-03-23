package goodee.gdj58.shop_c.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.GoodsOrderMapper;
import goodee.gdj58.shop_c.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class GoodsOrderService {
	
	@Autowired
	private GoodsOrderMapper goodsOrderMapper;
	
	// 주문 취소
	/*
		주문 취소
		-> 페이, 포인트 환급 후 주문서(sheet) 취소
		-> 취소한 항목 제외하고 다시 구매
		
		=================================================================
		
		count > 1
		
		주문 전체 취소
		
		
		cancel_history 주문 이력 추가
		
		주문서 가격(결제 가격) pay_save 이력 추가
		
		주문서 가격(결제 가격) total_use_pay 복구
		
		랭크 변한다면 수정 -> 스케줄러?
		
		주문들 포인트 sum이 0보다 크다면 point_save 이력 추가
		
		해당 주문 주문상태 취소 변경
		
		주문 중 결제완료인 goods_option_no, quantity 저장
		
		주문서 company_id, customer_address_no 저장
		
		주문서 주문서상태 취소 변경
		
		
		
		
		새로 주문
		
		
		주문서 생성
		
		주문 생성
		
		주문서 가격 수정(등급 할인 적용)(포인트는 미적용)
		
		pay_use 이력 추가
		
		total_use_pay 결제 내용 추가
		
		=================================================================
		
		count = 1 이면 (삭제후 재구매 안함)
		
		cancel_history 주문 이력 추가
		
		주문서 가격(결제 가격) pay_save 이력 추가
		
		주문서 가격(결제 가격) total_use_pay 복구
		
		랭크 변한다면 수정 -> 스케줄러?
		
		주문들 포인트 sum이 0보다 크다면 point_save 이력 추가
		
		해당 주문 주문상태 취소 변경
		
		주문서 주문서상태 취소 변경


	 */
	
	public int goodsOrderCancel(HashMap<String, Object> paramMap) {
		
		int resultRow = 0;
		
		
		
		// 주문 취소하기 전 결제 완료 상태인 주문 갯수
		int count = goodsOrderMapper.cSelectCountOrderPayment(paramMap);
		
		if(count > 1) {
			// 취소 후 결제 완료 주문이 하나라도 남는 경우

			
			// ================ 주문 전체 취소 시작 ================
			
			
			// cancel_history 주문 이력 추가
			goodsOrderMapper.cInsertCancelHistory(paramMap);
			
			// 주문서 가격(결제 가격) pay_save 이력 추가
			goodsOrderMapper.cInsertPaySaveHistory(paramMap);
			
			// 주문서 가격(결제 가격) total_use_pay 복구
			goodsOrderMapper.cUpdateTotalUsePayRewind(paramMap);
			
			// 주문에 사용한 총 포인트
			int point = goodsOrderMapper.cSelectSumPointOrderCancel(paramMap);
			
			log.info(TeamColor.CYAN + point + " <-- point, orderCancel");
			
			if(point > 0) {
				
				// 사용 총 포인트가 0보다 크다면 point_save 이력 추가
				paramMap.put("point", point);
				goodsOrderMapper.cInsertPointSaveHistory(paramMap);
				
				
			}
			
			// 해당 주문 주문상태 취소로 변경
			goodsOrderMapper.cUpdateOrderStateCancel(paramMap);
			
			
			// 주문 중 결제완료인 goods_option_no, quantity 저장
			ArrayList<HashMap<String, Object>> optionList = goodsOrderMapper.cSelectOptionNoQuantityPrice(paramMap);
			
			log.info(TeamColor.CYAN + optionList.toString() + " <-- optionList.toString()");
			
			
			// 주문서 company_id, customer_address_no 저장
			HashMap<String, Object> sheetHashMap = goodsOrderMapper.cSelectCompanyIdCustomerAddress(paramMap);
			
			log.info(TeamColor.CYAN + sheetHashMap.get("companyId") + " <-- sheetHashMap companyId");
			log.info(TeamColor.CYAN + sheetHashMap.get("customerAddressNo") + " <-- sheetHashMap customerAddressNo");
			
			// 주문서 주문상태 취소로 변경
			goodsOrderMapper.cUpdateOrderSheetStateCancel(paramMap);
			
			
			
			
			// ================ 주문 전체 취소 끝 ================
			
			
			
			// ================ 취소 제외 재주문 시작 ================
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			// ================ 취소 제외 재주문 끝 ================
			
			
			
		} else {
			
			
			
			
		}
		
		
		
		
		
		return resultRow;
		
	}
	

}
