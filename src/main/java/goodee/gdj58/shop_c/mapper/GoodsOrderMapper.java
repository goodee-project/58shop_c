package goodee.gdj58.shop_c.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface GoodsOrderMapper {
	List<Map<String, Object>> selectOrdersList(Map<String, Object> paramMap);
	
}
