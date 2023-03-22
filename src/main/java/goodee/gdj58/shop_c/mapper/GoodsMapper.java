package goodee.gdj58.shop_c.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper {
	public List<Map<String, Object>> selectGoodsCompany(String comapanyId); // 특정업체 상품만 보기(업체스토어)
	public List<Map<String, Object>> selectGoodsOne(int goodsNo); // 개별상품정보 출력
	public List<Map<String, Object>> selectGoodsOption(int goodsNo); // 상품 옵션 출력 
	public List<Map<String, Object>> selectGoodsCategoryName(int typeNo); // 카테고리 이름 출력
	public List<Map<String, Object>> selectGoodsCategory(Map<String, Object> param);
}
