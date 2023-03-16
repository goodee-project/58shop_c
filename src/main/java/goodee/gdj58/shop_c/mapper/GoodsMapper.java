package goodee.gdj58.shop_c.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper {
	public List<Map<String, Object>> selectGoodsCategory(Map<String, Object> param);
}
