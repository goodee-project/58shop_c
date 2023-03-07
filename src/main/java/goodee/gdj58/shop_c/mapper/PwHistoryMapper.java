package goodee.gdj58.shop_c.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.PwHistory;

@Mapper
public interface PwHistoryMapper {
	int insertNewPwHistory(PwHistory pwHistory); // 비밀번호 이력 추가
}
