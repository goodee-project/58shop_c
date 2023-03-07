package goodee.gdj58.shop_c.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Customer;

@Mapper
public interface CustomerMapper {
	Customer customerInfo(String customerId); // 회원정보조회
	int insertCustomer(Customer customer); // 회원가입(customer table)
	int lastLoginUpdate(Customer customer); // 마지막 로그인정보 업데이트
	Customer login(Customer customer); // 로그인
}
