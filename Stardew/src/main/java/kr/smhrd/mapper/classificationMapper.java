package kr.smhrd.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface classificationMapper {

	List<classificationVO> appleList(String mb_id);

	List<classificationVO> appleListKind(classificationVO vo);

	List<classificationVO> appleListSummary(classificationVO vo);

	List<classificationVO> applelistMachine(classificationVO vo);

	List<classificationVO> daterange(classificationVO vo);

	List<chartVO> livedata(classificationVO vo);

	
	
	
}
