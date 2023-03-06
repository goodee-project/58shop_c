package goodee.gdj58.shop_c.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.CustomerMapper;
import goodee.gdj58.shop_c.vo.Customer;

@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	
	public Customer login(Customer customer) { // 로그인
		return customerMapper.login(customer);
	}
}