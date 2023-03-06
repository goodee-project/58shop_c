package goodee.gdj58.shop_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_c.mapper.CustomerMapper;

@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	
}
