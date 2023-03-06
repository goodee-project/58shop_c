package goodee.gdj58.shop_c.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Customer;

@Mapper
public interface CustomerMapper {
	Customer selectCustomerInfo(String customerId); // 회원정보조회
	Customer login(Customer customer); // 로그인
}
