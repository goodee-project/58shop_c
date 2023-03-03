package goodee.gdj58.shop_c.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_c.vo.Test;

@Mapper
public interface TestMapper {

	List<Test> selectTest();
	
	int insertTest();
	
	
}
