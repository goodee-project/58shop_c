package goodee.gdj58.shop_c.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.GoodsOrderMapper;
import goodee.gdj58.shop_c.util.TeamColor;
import goodee.gdj58.shop_c.vo.Cart;
import goodee.gdj58.shop_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class GoodsOrderService {
	
	@Autowired
	private GoodsOrderMapper goodsOrderMapper;
	
	
	// ================ 주문 폼 시작 ================
	
	// 주문자 정보(주문자 이름, 이메일, 연락처)
	public HashMap<String, Object> ofSelectCustomer(String customerId) {
		
		return goodsOrderMapper.ofSelectCustomer(customerId);
		
	}
	
	// 주문 페이지의 주문 상품 정보
	// 이미지, 상품명, 회사명, 가격, 옵션 내용
	// 여러 주문일 때는 반복문 돌릴 예정
	public ArrayList<HashMap<String, Object>> ofSelectGoodsOrderInfoList(Integer goodsOptionNo, Integer goodsOrderQuantity
																			, String customerId) {
		
		ArrayList<HashMap<String, Object>> goodsOrderInfoList = new ArrayList<HashMap<String, Object>>();
		
		if(goodsOptionNo != null && goodsOrderQuantity != null) {
			
			HashMap<String, Object> map = goodsOrderMapper.ofSelectGoodsOrderInfoOne(goodsOptionNo.intValue());
			
			map.put("goodsOrderQuantity", goodsOrderQuantity.intValue());
			
			goodsOrderInfoList.add(map);
			
			
		} else {
			
			ArrayList<Cart> cartList = goodsOrderMapper.ofSelectCart(customerId);
			
			for(Cart cart : cartList) {
				
				HashMap<String, Object> hm = goodsOrderMapper.ofSelectGoodsOrderInfoOne(cart.getGoodsOptionNo());

				hm.put("goodsOrderQuantity", cart.getCartQuantity());
				
				goodsOrderInfoList.add(hm);
				
			}
			
			
		}
		
		
		return goodsOrderInfoList;
		
	}
	
	
	// ================ 주문 폼 끝 ================

	
	
	
	
	/*
		주문 하기








	*/	
	
	public int goodsOrder(Integer goodsOptionNo, Integer goodsOrderQuantity
							, int goodsOrderUsePoint, String customerId, int customerAddressNo) {
		
		int resultRow = 0;
		log.info(TeamColor.CYAN + "12312332sdsdsd");
		
		// 주문서, 주문 생성 과정
		if(goodsOptionNo != null && goodsOrderQuantity != null) {
			// 한 회사의 상품 한 종류 일 때 
			
			
			// goodsOptionNo로 company_id, goods_price 추출
			HashMap<String, Object> goodsMap = goodsOrderMapper.oSelectGoodsInfo(goodsOptionNo.intValue());
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			int goodsOrderPrice = ((int) goodsMap.get("goodsPrice")) * goodsOrderQuantity.intValue();
			
			paramMap.put("goodsOptionNo", goodsOptionNo.intValue());
			paramMap.put("goodsOrderQuantity", goodsOrderQuantity.intValue());
			paramMap.put("goodsOrderPrice", goodsOrderPrice);
			paramMap.put("goodsOrderUsePoint", goodsOrderUsePoint);
			paramMap.put("customerId", customerId);
			paramMap.put("companyId", (String) goodsMap.get("companyId"));
			paramMap.put("customerAddressNo", customerAddressNo);

			
			// order_total 생성
			goodsOrderMapper.oInsertOrderTotal(paramMap);
			
			// 주문서 생성
			goodsOrderMapper.oInsertOrderSheet(paramMap);
			
			// 주문 생성
			goodsOrderMapper.oInsertGoodsOrder(paramMap);
			
			
			
			
			
			
		} else {
			// 장바구니 담긴 상품들 주문
			
			ArrayList<Integer> orderSheetNoList = new ArrayList<Integer>();
			
			// 장바구니의 companyId, optionNo, orderQuantity 리스트 추출
			ArrayList<HashMap<String, Object>> cartInfoList = goodsOrderMapper.oSelectCartInfoList();
			
			HashMap<String, Object> sheetMap = new HashMap<String, Object>();

			// order_total 생성
			goodsOrderMapper.oInsertOrderTotal(sheetMap);
			
			// 주문서 생성 시작
			for(int i=0; i<cartInfoList.size(); i+=1) {
				
				boolean check1 = true;
				boolean check2 = true;
				
				
				sheetMap.put("customerId", customerId);
				sheetMap.put("customerAddressNo", customerAddressNo);
				sheetMap.put("companyId", (String) cartInfoList.get(i).get("companyId"));
				
				if(i == 0) {
					
					goodsOrderMapper.oInsertOrderSheet(sheetMap);
					
					log.info(TeamColor.CYAN + (Integer) sheetMap.get("orderSheetNo") + " <-- orderSheetNo");
					
					orderSheetNoList.add((Integer) sheetMap.get("orderSheetNo"));
					
				} else {
					
					for(int j=0; j<i; j+=1) {
						
						if(((String) cartInfoList.get(i).get("companyId")).equals((String) cartInfoList.get(j).get("companyId"))) {
							
							if(check1) {
								
								orderSheetNoList.add(orderSheetNoList.get(j));
								
								check1 = false;
								
								check2 = false;
							}
							
						}
						
					}
					
					if(check2) {
						
						goodsOrderMapper.oInsertOrderSheet(sheetMap);
						
						orderSheetNoList.add((Integer) sheetMap.get("orderSheetNo"));
						
					}
					
				}
				
			}
			
			log.info(TeamColor.CYAN + orderSheetNoList.toString() + " <-- orderSheetNoList");
			
			// 주문서 생성 끝
			
			
			
			// 주문 생성 시작
			for(int i=0; i<cartInfoList.size(); i+=1) {
				
				int goodsOrderPrice = (int) cartInfoList.get(i).get("goodsPrice") * (int) cartInfoList.get(i).get("goodsOrderQuantity");
				
				cartInfoList.get(i).put("orderSheetNo", orderSheetNoList.get(i).intValue());
				cartInfoList.get(i).put("goodsOrderPrice", goodsOrderPrice);
				
				// 처음 주문에 포인트 적용
				if(i == 0) {
					
					cartInfoList.get(i).put("goodsOrderUsePoint", goodsOrderUsePoint);
					
				} else {
					
					cartInfoList.get(i).put("goodsOrderUsePoint", 0);
					
				}
				
				goodsOrderMapper.oInsertGoodsOrder(cartInfoList.get(i));
				
			}
			
			// 주문 생성 끝
			
			
			
			
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		return resultRow;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
		주문 취소
		-> 페이, 포인트 환급 후 주문서(sheet), 주문 취소
		-> 취소한 항목 제외하고 새 주문서, 새 주문 생성
		-> 새 주문, 주문서는 등급할인만 적용(포인트는 환급후 미적용)
		
		
		=================================================================
		
		
		[주문 취소 과정]
		
			cancel_history 주문 이력 추가
			
			취소할 주문의 option_no, option_quantity 가져오기
			
			취소한 주문의 옵션 수량 만큼 goods_option 테이블 재고 복구
			
			주문 취소로 인해 복구한 재고 이력 남기기
			
			취소 전 결제 했었던 주문서 가격
			
			주문서 가격(결제 가격) pay_save 이력 추가
			
			주문서 가격(결제 가격) total_use_pay 복구
			
			customer 테이블 pay 환급 
			
			주문들 포인트 sum이 0보다 크다면 
				point_save 이력 추가
				customer 테이블 point 환급
		
		=================================================================
		
			if(count > 1)	count : 주문 취소하기 전 결제 완료 상태인 주문 갯수
			
				해당 주문 주문상태 취소 변경
				
				주문 중 결제완료인 goods_option_no, quantity, price 저장
				
				주문서 company_id, customer_address_no 저장
				
				주문서 주문서상태 취소 변경
				
				나머지 모든 주문들 주문상태 취소로 변경
				
				
				
				
				[취소 항목 제외하고 재구매 과정]
				
				새 주문서 생성
				
				새 주문 생성
				
				새 주문서 가격 수정(등급 할인 적용)(포인트는 미적용)
				
				pay_use_history 이력 추가
				
				customer 테이블 새 주문서 가격으로 pay 차감
				
				total_use_pay 재구매 내용 적용
		
		=================================================================
		
			else if(count = 1) (삭제후 재구매 안함)
		
				주문서 주문서상태 취소 변경
				
				나머지 모든 주문들 주문상태 취소로 변경


	 */
	
	public int goodsOrderCancel(HashMap<String, Object> paramMap) {
		
		int resultRow = 0;
		
		// ================ 주문 취소 시작 ================
		
		// cancel_history 주문 이력 추가
		goodsOrderMapper.cInsertCancelHistory(paramMap);
		
		// 취소할 주문의 option_no, option_quantity 가져오기
		HashMap<String, Object> cancelOptionMap = goodsOrderMapper.cSelectCancelOptionNoQuantity(paramMap);
		
		// 취소한 주문의 옵션 수량 만큼 goods_option 테이블 재고 복구
		goodsOrderMapper.cUpdateGoodsOptionQuantityRewind(cancelOptionMap);
		
		// 주문 취소로 인해 복구한 재고 이력 남기기
		goodsOrderMapper.cInsertStockHistory(cancelOptionMap);
		
		// 취소 전 결제 했었던 주문서 가격
		int orderSheetPrice = goodsOrderMapper.cSelectOrderSheetPrice(paramMap);
		
		// paramMap 에 orderSheetPrice 추가
		paramMap.put("orderSheetPrice", orderSheetPrice);
		
		// 주문서 가격(결제 가격) pay_save 이력 추가
		goodsOrderMapper.cInsertPaySaveHistory(paramMap);
		
		// 주문서 가격(결제 가격) total_use_pay 복구
		goodsOrderMapper.cUpdateTotalUsePayRewind(paramMap);
		
		// customer 테이블 pay 환급
		goodsOrderMapper.cUpdateCustomerPayRewind(paramMap);
		
		// 주문에 사용한 총 포인트
		int point = goodsOrderMapper.cSelectSumPointOrderCancel(paramMap);
		
		log.info(TeamColor.CYAN + point + " <-- point, orderCancel");
		
		if(point > 0) {
			// 주문에 사용한 포인트가 있다면
			
			// paramMap에 포인트 저장
			paramMap.put("point", point);
			
			// 사용 총 포인트가 0보다 크다면 point_save 이력 추가
			goodsOrderMapper.cInsertPointSaveHistory(paramMap);
			
			// 사용 총 포인트가 0보다 크다면 customer 테이블 point 환급
			goodsOrderMapper.cUpdateCustomerPointRewind(paramMap);
			
		}
		
		
		
		// =================================================================
		
		// 주문 취소하기 전 결제 완료 상태인 주문 갯수
		int count = goodsOrderMapper.cSelectCountOrderPayment(paramMap);
		
		if(count > 1) {
			// 취소 후 결제 완료 주문이 하나라도 남는 경우
			
			// 해당 주문 주문상태 취소로 변경
			goodsOrderMapper.cUpdateOrderStateCancel(paramMap);
			
			// 주문 중 결제완료인 goods_option_no, quantity, price 저장
			ArrayList<HashMap<String, Object>> optionList = goodsOrderMapper.cSelectOptionNoQuantityPrice(paramMap);
			
			log.info(TeamColor.CYAN + optionList.toString() + " <-- optionList.toString()");
			
			
			// 주문서 company_id, customer_address_no 저장
			HashMap<String, Object> newSheetMap = goodsOrderMapper.cSelectCompanyIdCustomerAddress(paramMap);
			
			// customerId 저장
			newSheetMap.put("customerId", (String) paramMap.get("customerId"));
			
			log.info(TeamColor.CYAN + newSheetMap.get("companyId") + " <-- sheetHashMap companyId");
			log.info(TeamColor.CYAN + newSheetMap.get("customerAddressNo") + " <-- sheetHashMap customerAddressNo");
			
			// 주문서 주문상태 취소로 변경
			goodsOrderMapper.cUpdateOrderSheetStateCancel(paramMap);
			
			// 나머지 모든 주문들 주문상태 취소로 변경
			goodsOrderMapper.cUpdateGoodsOrderStateCancel(paramMap);
			
			
			
			// ================ 취소 항목 제외 재주문 시작 ================
			
			
			
			// 새로운 주문서 생성(새 주문서 가격은 0) 후 order_sheet_no 추출
			goodsOrderMapper.cInsertNewOrderSheet(newSheetMap);
			
			log.info(TeamColor.CYAN + newSheetMap.get("newOrderSheetNo") + " <-- newOrderSheetNo");

			// 취소한 주문 제외하고 나머지 주문들 재구매(서비스에서 반복문 돌림)
			for(HashMap<String, Object> option : optionList) {
				
				// newOrderSheet 저장
				option.put("newOrderSheetNo", (int) newSheetMap.get("newOrderSheetNo"));
				
				// 나머지 주문들 생성
				goodsOrderMapper.cInsertNewGoodsOrder(option);
				
			}
			
			// 새로운 주문서 총 가격(등급 할인만 적용)
			int newOrderSheetPrice = goodsOrderMapper.cSelectNewOrderSheetPrice(newSheetMap);
			
			log.info(TeamColor.CYAN + newOrderSheetPrice + " <-- newOrderSheetPrice");
			
			// newSheetMap 에 newOrderSheetPrice 추가
			newSheetMap.put("newOrderSheetPrice", newOrderSheetPrice);
			
			log.info(TeamColor.CYAN + newSheetMap.toString() + " <-- newSheetMap.toString()");
			
			// 새로운 주문서 가격 수정
			goodsOrderMapper.cUpdateNewOrderSheetPrice(newSheetMap);
			
			// pay_use_history 이력 추가
			goodsOrderMapper.cInsertPayUseHistory(newSheetMap);
			
			// customer 테이블 새 주문서 가격으로 pay 차감
			goodsOrderMapper.cUpdateCustomerPayBuy(newSheetMap);
			
			// total_use_pay 재구매 내용 적용
			goodsOrderMapper.cUpdateTotalUsePayBuy(newSheetMap);
			
			
			
			// ================ 취소 항목 제외 재주문 끝 ================
			
			resultRow = 1;
			
		} else if(count == 1) {
			
			// 주문서 주문상태 취소로 변경
			goodsOrderMapper.cUpdateOrderSheetStateCancel(paramMap);
			
			// 나머지 모든 주문들 주문상태 취소로 변경
			goodsOrderMapper.cUpdateGoodsOrderStateCancel(paramMap);
			
			resultRow = 1;
			
		}
		
		
		
		
		
		return resultRow;
		
	}
	

}
