package goodee.gdj58.shop_c.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TotalIdMapper {
	String findId(String customerId); // 회원가입 시 중복아이디 검사
	int insertTotalId(String customerId); // 회원가입(total_id table)
}
