package goodee.gdj58.shop_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.CustomerMapper;
import goodee.gdj58.shop_c.mapper.PwHistoryMapper;
import goodee.gdj58.shop_c.mapper.TotalIdMapper;
import goodee.gdj58.shop_c.vo.Customer;
import goodee.gdj58.shop_c.vo.PwHistory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	@Autowired private TotalIdMapper totalIdMapper;
	@Autowired private PwHistoryMapper pwHistoryMapper;
	// 회원가입
	public int insertCustomer(Customer customer) {
		
		PwHistory pwHistory=new PwHistory();
		pwHistory.setId(customer.getCustomerId());
		pwHistory.setPassword(customer.getCustomerPw());
		
		int result=customerMapper.insertCustomer(customer);
		if(result == 1) { // 가입 성공 시 total_id table에 정보 입력
			int totalIdRow=totalIdMapper.insertTotalId(customer.getCustomerId());
			int pwHistoryRow=pwHistoryMapper.insertNewPwHistory(pwHistory);
			if(totalIdRow == 1 && pwHistoryRow == 1) {
				log.debug("\u001B[32m"+"CustomerService: 회원가입완료");
			}
		}
		return result;
	}
	
	// 로그인
	public Customer login(Customer customer) {
		Customer loginCustomer=customerMapper.login(customer);
		if(loginCustomer != null) { // 로그인 성공 시 마지막 로그인정보 업데이트
			int row=customerMapper.lastLoginUpdate(customer);
			if(row == 1) {
				log.debug("\u001B[32m"+"CustomerService: 로그인성공");
			}
		}
		return loginCustomer;
	}
}