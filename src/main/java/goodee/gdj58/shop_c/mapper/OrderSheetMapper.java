package goodee.gdj58.shop_c.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderSheetMapper {
	public List<Map<String, Object>> selectTotalOrder(String customerId); // 주문서목록 
}
