package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface agriMapper {

	List<agriDataVO> agriList();

	List<agriDataVO> agriResult();


//	List<agriDataVO> agriDate();

}
